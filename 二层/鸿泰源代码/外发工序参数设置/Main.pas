unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DB;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitRefresh: TBitBtn;
    BitQuit: TBitBtn;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitQuitClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses demo,common, OutParameter;

{$R *.dfm}

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序起动失败请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption := application.Title;
//  dm.ADOConnection1.Open;
//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  DM.ADS34.Close;
  DM.ADS34.Open;
  PreColumn := DBGridEh1.Columns[0];

  dm.ADSWz308.Open;
  
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker = smDownEh then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS34.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker := smDownEh;
    dm.ADS34.IndexFieldNames := Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName <> column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption := column.Title.Caption;
    Edit1.Left := Label1.Left + label1.Width + 2 ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  dbgrideh1.DataSource.DataSet.Filtered := True;
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Main.BitRefreshClick(Sender: TObject);
var
  rkey34:integer;
begin
  rkey34:=DM.ADS34RKEY.Value;
  dm.ADS34.Close;
  dm.ADS34.Prepared;
  dm.ADS34.Open;
  if rkey34>0 then
  dm.ADS34.Locate('rkey',rkey34,[]);

end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_OutParameter := TFrm_OutParameter.Create(Self);
    Frm_OutParameter.Edit1.Text := DM.ADS34DEPT_CODE.AsString;
    Frm_OutParameter.Edit2.Text := DM.ADS34DEPT_NAME.AsString;
    Frm_OutParameter.Rkey34 := DM.ADS34rkey.Value;
    if Frm_OutParameter.ShowModal = mrok then
    begin
      BitRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Frm_OutParameter.Free;
  end

end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS34.CommandText);
end;

procedure TFrm_Main.BitQuitClick(Sender: TObject);
begin
  Close;
  Application.Terminate;
end;

end.
