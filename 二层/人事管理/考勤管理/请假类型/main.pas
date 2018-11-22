unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    bitExit: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bitExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure fun(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses dmo, AddLeaveType, common;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  Self.Caption:=Application.Title;
  DM.ADODetail.Open;
  DM.ADOAskForLeave.Open;
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_Main.bitExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  fun(nil);
  Form_AddLeaveType.ComboBox1.ItemIndex:=0;
  DM.ADOAskForLeave.Append;
  if Form_AddLeaveType.ShowModal=mrok then
  begin
    DM.ADOAskForLeave.Close;
    DM.ADOAskForLeave.Open;
    Edit1.Text:='';
    DM.ADOAskForLeave.RecNo:=Form_AddLeaveType.i;
  end
  else
    Form_AddLeaveType.Free;
end;

procedure TForm_Main.fun(Sender: TObject);
begin
  Form_AddLeaveType:=TForm_AddLeaveType.Create(Application);
  Form_AddLeaveType.ComboBox1.Items.Clear;
  DM.ADODetail.Close;
  DM.ADODetail.Parameters[0].Value:='';
  DM.ADODetail.Open;
  DM.ADODetail.DisableControls;
  DM.ADODetail.First;
  while not DM.ADODetail.Eof do
  begin
    Form_AddLeaveType.ComboBox1.Items.Add(DM.ADODetailitem.Value);
    dm.ADODetail.Next;
  end;
  DM.ADODetail.EnableControls;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  fun(nil);
  Form_AddLeaveType.ComboBox1.ItemIndex:=Form_AddLeaveType.ComboBox1.Items.IndexOf(DM.ADOAskForLeaveitem.Value);
  Form_AddLeaveType.Memo1.Lines.Text:=DM.ADOAskForLeaveremark.Value;
  if DM.ADOAskForLeaveworktime_calculation.Text='False' then
    Form_AddLeaveType.CheckBox1.Checked:=False
  else
    Form_AddLeaveType.CheckBox1.Checked:=True;
  dm.ADOAskForLeave.Edit;
  if Form_AddLeaveType.ShowModal=mrok then
  begin
    dm.ADOAskForLeave.Close;
    dm.ADOAskForLeave.Open;
    Edit1.Text:='';
    dm.ADOAskForLeave.RecNo:=Form_AddLeaveType.i;
  end
  else
    Form_AddLeaveType.Free;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
  DM.ADOAskLeaveRegister.Close;
  DM.ADOAskLeaveRegister.Parameters[0].Value:=DM.ADOAskForLeaverkey.Value;
  DM.ADOAskLeaveRegister.Open;
  if DM.ADOAskLeaveRegisterrowsCount.Value>=1 then
  begin
    ShowMessage('此类型已被使用，不能删除');
    Exit;
  end;
  if MessageBox(Handle,'数据一旦删除无法恢复，确定要删除？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)<>6 then
    Exit;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('delete askforleave where rkey='+DM.ADOAskForLeaverkey.Text);
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADOAskForLeave.Close;
    DM.ADOAskForLeave.Open;
    DM.ADOAskForLeave.RecNo:=DM.ADOAskForLeave.RecordCount;
  except
    DM.ADOConn.RollbackTrans;
  end;
end;
procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
    begin
      Column.Title.SortMarker:=smDownEh;
      DM.ADOAskForLeave.IndexFieldNames:=Column.FieldName+' DESC';
    end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOAskForLeave.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    if column.Title.Caption<>'精度' then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clbtnface;
      Column.Title.Color:=clRed;
    end
    else
    begin
      preColumn.Title.Color:=clBtnFace;

    end;
    preColumn:=Column;
    Edit1.Text:='';
    Edit1.SetFocus;
  end
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADOAskForLeave.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADOAskForLeave.Filter:='';
end;
procedure TForm_Main.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.ADOAskForLeave.Free;
  DM.ADODetail.Free;
  DM.ADOConn.Free;
end;

end.
