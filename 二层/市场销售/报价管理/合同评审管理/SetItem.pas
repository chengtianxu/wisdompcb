unit SetItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, DBCtrls, StdCtrls, Buttons, ComCtrls;

type
  TfrmSetItem = class(TForm)
    pnlAll: TPanel;
    pnlRight: TPanel;
    btnAppend: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    pnlTop: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    pcBase: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure ViewData(OP: Byte);
    procedure pcBaseChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetItem: TfrmSetItem;

implementation

uses damo, EditItem;

{$R *.dfm}

procedure TfrmSetItem.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetItem.btnRefreshClick(Sender: TObject);
var
  i:integer;
  j:Variant;
begin
  if pcBase.ActivePage=TabSheet1 then
  begin
    if dm.aqSetItem.IsEmpty then Exit;
    i:= dm.aqSetItemRKEY.AsInteger;
    dm.aqSetItem.Close;
    dm.aqSetItem.Open;
    dm.aqSetItem.Locate('rkey',i,[]);
  end
  else
  begin
    if dm.aqEngStr.IsEmpty then Exit;
    j:= VarArrayOf([dm.aqEngStrBoardType.AsInteger,dm.aqEngStrLayer.AsInteger]);
    dm.aqEngStr.Close;
    dm.aqEngStr.Open;
    dm.aqEngStr.Locate('BoardType;Layer',j,[]);
  end;
end;

procedure TfrmSetItem.btnAppendClick(Sender: TObject);
begin
  ViewData(1);
end;

procedure TfrmSetItem.btnEditClick(Sender: TObject);
begin
  ViewData(2);
end;

procedure TfrmSetItem.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dm.ADOConn.BeginTrans;
  try
    dm.aqTmp.Close;
    dm.aqTmp.SQL.Text:= 'delete from Data0170 where rkey=' + dm.aqSetItemRKEY.AsString;
    dm.aqTmp.ExecSQL;
    dm.ADOConn.CommitTrans;
    ShowMessage('删除数据成功!');
    btnRefreshClick(nil);
  except
    dm.ADOConn.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmSetItem.ViewData(OP: Byte);
var
  rkey:integer;
begin
  rkey:= dm.aqSetItemRKEY.Value;
  frmEditItem:= TfrmEditItem.Create(Application);
  try
    if OP = 1 then
    begin
      dm.aqSetItem.Append;
      with frmEditItem do
      begin
        with dm.aqTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select IsNull(Max(SEQ_NO),0)+1 As Max_No From Data0170');
          Open;
          if RecordCount = 0 then dm.aqSetItem.FieldByName('SEQ_NO').Value := 1
          else
            dm.aqSetItem.FieldByName('SEQ_NO').Value:= dm.aqTmp.FieldByName('Max_No').Value;
        end;
      end;
    end
    else
      dm.aqSetItem.Edit;
    if frmEditItem.ShowModal = mrok then
      btnRefreshClick(nil)
    else
    begin
      dm.aqSetItem.Locate('rkey',rkey,[]);
      dm.aqSetItem.Cancel;
    end;
  finally
    frmEditItem.free;
  end;
end;

procedure TfrmSetItem.pcBaseChange(Sender: TObject);
begin
  if pcBase.ActivePage=TabSheet1 then
  begin
    pnlRight.Visible:= True;
    if not dm.aqSetItem.Active then
    begin
      dm.aqSetItem.Close;
      dm.aqSetItem.Open;
    end;
  end
  else
  begin
    pnlRight.Visible:= False;
    if not dm.aqEngStr.Active then
    begin
      dm.aqEngStr.Close;
      dm.aqEngStr.Open;
    end;
  end;
end;

end.
