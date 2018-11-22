unit Add176;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TfrmAdd176 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnRefresh: TBitBtn;
    btnExit: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure ViewData(OP: Byte);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd176: TfrmAdd176;

implementation

uses data_module, Add176_Item;

{$R *.dfm}

procedure TfrmAdd176.btnAddClick(Sender: TObject);
begin
  ViewData(1);
end;

procedure TfrmAdd176.btnEditClick(Sender: TObject);
begin
  ViewData(2);
end;

procedure TfrmAdd176.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dm.ADOConnection1.BeginTrans;
  try
    dm.ADOtemp.Close;
    dm.ADOtemp.SQL.Text:= 'delete from Data0176 where rkey=' + dm.at176rkey.AsString;
    dm.ADOtemp.ExecSQL;
    dm.ADOConnection1.CommitTrans;
    ShowMessage('删除数据成功!');
    btnRefreshClick(nil);
  except
    dm.ADOConnection1.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmAdd176.ViewData(OP: Byte);
var
  rkey:integer;
begin
  rkey:= dm.at176rkey.Value;
  frmAdd176_Item:= TfrmAdd176_Item.Create(Application);
  try
    if OP = 1 then
    begin
      dm.at176.Append;
      frmAdd176_Item.caption:= '新增';
    end
    else
    begin
      dm.at176.Edit;
      frmAdd176_Item.caption:= '编辑';
    end;
    if frmAdd176_Item.ShowModal = mrok then
      btnRefreshClick(nil)
    else
    begin
      dm.at176.Locate('rkey',rkey,[]);
      dm.at176.Cancel;
    end;
  finally
    frmAdd176_Item.free;
  end;
end;

procedure TfrmAdd176.btnRefreshClick(Sender: TObject);
var
  i:integer;
begin
  if dm.at176.IsEmpty then Exit;
  i:= dm.at176rkey.AsInteger;
  dm.at176.Close;
  dm.at176.Open;
  dm.at176.Locate('rkey',i,[]);
end;

procedure TfrmAdd176.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
