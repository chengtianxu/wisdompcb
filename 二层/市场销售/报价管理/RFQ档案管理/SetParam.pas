unit SetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh, DB, Menus;

type
  TfrmSetParam = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    btnAppend: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    pmOP: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure btnAppendClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation

uses damo, EditParam;

{$R *.dfm}

procedure TfrmSetParam.btnAppendClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= dm.AQSetParamRKEY.Value;
  dm.AQSetParam.Append;
  frmEditParam:=TfrmEditParam.Create(application);
  try
    with frmEditParam do
    begin
      rgGroupType.ItemIndex:= -1;
      edtParam_ptr.Text:= '';
      edtParamName.Text:= '';
      edtParamDesc.Text:= '';
      edtSeqNO.Text:= '';
      cbMustInput.Checked:= False;
    end;
    if frmEditParam.ShowModal = mrok then
      btnRefreshClick(nil)
    else
    begin
      dm.AQSetParam.Locate('rkey',rkey,[]);
      dm.AQSetParam.Cancel;
    end;
  finally
    frmEditParam.free;
  end;
end;

procedure TfrmSetParam.btnEditClick(Sender: TObject);
var
  rkey:integer;
begin
  if dm.AQSetParam.RecordCount <= 0 then Exit;
  rkey:= dm.AQSetParamRKEY.Value;
  dm.AQSetParam.Edit;
  frmEditParam:= TfrmEditParam.Create(Application);
  try
    with frmEditParam do
    begin
      rgGroupType.ItemIndex:= dm.AQSetParam.FieldByName('Group_Type').AsInteger - 1;
      edtParam_ptr.Text:= dm.AQSetParam.FieldByName('Param_ptr').AsString;
      edtParamName.Text:= dm.AQSetParam.FieldByName('PARAMETER_NAME').AsString;
      edtParamDesc.Text:= dm.AQSetParam.FieldByName('PARAMETER_DESC').AsString;
      edtSeqNO.Text:= dm.AQSetParam.FieldByName('SEQ_NO').AsString;
      if dm.AQSetParam.FieldByName('MustInput').AsInteger = 0 then
        cbMustInput.Checked:= False
      else
        cbMustInput.Checked:= True;
    end;
    if frmEditParam.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      dm.AQSetParam.Locate('rkey',rkey,[]);
  finally
    frmEditParam.free;
  end;
end;

procedure TfrmSetParam.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  DM.ADOConn.BeginTrans;
  try
    DM.temp.Close;
    DM.temp.SQL.Text:= 'delete from Data0164 where rkey=' + DM.AQSetParamRKEY.AsString;
    DM.temp.ExecSQL;
    DM.ADOConn.CommitTrans;
    ShowMessage('删除数据成功!');
    btnRefreshClick(nil);
  except
    DM.ADOConn.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmSetParam.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetParam.btnRefreshClick(Sender: TObject);
var
  i:integer;
begin
  if dm.AQSetParam.IsEmpty then Exit;
  i:= dm.AQSetParamRKEY.AsInteger;
  dm.AQSetParam.Close;
  dm.AQSetParam.Open;
  dm.AQSetParam.Locate('rkey',i,[]);
end;

end.
