unit ApprovalProcessFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB;

type
  TFrm_ApprovalProcess = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    PreColumn: TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ApprovalProcess: TFrm_ApprovalProcess;

implementation

uses damo, ApprovalProcessSetFrm;

{$R *.dfm}

procedure TFrm_ApprovalProcess.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ApprovalProcess.BitBtn2Click(Sender: TObject);
var
  ttype : string;
begin
  ttype := DM.ADS614v_ttype.AsString;
  dm.ADS614.Close;
  dm.ADS614.Prepared;
  dm.ADS614.Open;
  if ttype <> '' then
    DM.ADS614.Locate('v_ttype',ttype,[]);
end;

procedure TFrm_ApprovalProcess.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_ApprovalProcess.N1Click(Sender: TObject);
begin
  try
    Frm_ApprovalProcessSet := TFrm_ApprovalProcessSet.Create(application);
    Frm_ApprovalProcessSet.Status := 0; //新增
    if Frm_ApprovalProcessSet.ShowModal = mrok then
    begin
      dm.ADS614.Close;
      dm.ADS614.Prepared;
      dm.ADS614.Open;
      dm.ADS614.Locate('v_ttype',Frm_ApprovalProcessSet.v_ttype,[]);
      ShowMessage('新增操作成功');
    end;
  finally
    Frm_ApprovalProcessSet.Free;
  end;
end;

procedure TFrm_ApprovalProcess.FormShow(Sender: TObject);
begin
  DM.ADS614.Close;
  DM.ADS614.Open;
  DM.ADS615.Close;
  DM.ADS615.Open;
  PreColumn := DBGridEh1.Columns[0];
end;

procedure TFrm_ApprovalProcess.N2Click(Sender: TObject);
begin
  try
    Frm_ApprovalProcessSet := TFrm_ApprovalProcessSet.Create(Self);
    Frm_ApprovalProcessSet.Status := 1; //编辑
    if Frm_ApprovalProcessSet.ShowModal = mrok then
    begin
//      dm.ADO257.Close;
//      dm.ADO257.Prepared;
//      dm.ADO257.Open;
//      dm.ADO257.Locate('v_ttype',dm.aq257v_ttype.Value,[]);
//      dm.aq257.Close;
      dm.ADS614.Close;
      dm.ADS614.Prepared;
      dm.ADS614.Open;
      dm.ADS614.Locate('v_ttype',Frm_ApprovalProcessSet.v_ttype,[]);
      ShowMessage('编辑操作成功');
    end;
  finally
    Frm_ApprovalProcessSet.Free;
  end;
end;

procedure TFrm_ApprovalProcess.N3Click(Sender: TObject);
begin
  try
    Frm_ApprovalProcessSet := TFrm_ApprovalProcessSet.Create(Self);
    Frm_ApprovalProcessSet.Status := 2; //检查
    if Frm_ApprovalProcessSet.ShowModal = mrok then
  finally
    Frm_ApprovalProcessSet.Free;
  end;
end;

procedure TFrm_ApprovalProcess.N4Click(Sender: TObject);
begin
  if messagedlg('您确定要删除该审批代码?'+dm.ADS614v_ttype.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    try
      dm.ADOConnection1.BeginTrans;
      with DM.ADOQuery1 do
      begin
        close;
        SQL.Clear;
        sql.Add('delete from data0615 where v_ttype='+quotedstr(dm.ADS614v_ttype.Value));
        ExecSQL;
      end;
      with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        SQL.Add('delete from data0614 where v_ttype='+quotedstr(dm.ADS615v_ttype.Value));
        ExecSQL;
      end;
      dm.ADOConnection1.CommitTrans;
      BitBtn2Click(nil);
      ShowMessage('删除操作成功!');
    except
      on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       ShowMessage('该审批流程可能已经在npi新产品导入中使用，不能删除');
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_ApprovalProcess.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS614.CommandText);
end;

procedure TFrm_ApprovalProcess.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS615.CommandText);
end;

procedure TFrm_ApprovalProcess.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker = smDownEh then
  begin
   column.Title.SortMarker := smUpEh;
   dm.ADS614.IndexFieldNames := Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS614.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
end;

end.
