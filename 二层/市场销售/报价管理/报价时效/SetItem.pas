unit SetItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, DB, ComCtrls;

type
  TfrmSetItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAppend: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    TabSheet3: TTabSheet;
    DBGridEh3: TDBGridEh;
    procedure btnAppendClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  frmSetItem: TfrmSetItem;

implementation

uses damo, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmSetItem.btnAppendClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if PageControl1.ActivePageIndex=0 then
  begin
    if not(dm.aqSetItem.State in [dsInsert,dsEdit]) then dm.aqSetItem.Append;
  end
  else if PageControl1.ActivePageIndex=1 then
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
    try
      InputVar.Fields := 'USER_LOGIN_NAME/用户代码/251,USER_FULL_NAME/用户名称/251';
      InputVar.Sqlstr :=
        'Select RKEY,USER_LOGIN_NAME,USER_FULL_NAME FROM Data0073';
      InputVar.AdoConn := dm.ADOConn;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        if not(dm.aq244.State in[dsInsert, dsEdit]) then dm.aq244.Append;
        dm.aq244.FieldByName('PTR_73').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
  end
  else
  begin
    if not(dm.aq247.State in [dsInsert,dsEdit]) then dm.aq247.Append;
  end;
end;

procedure TfrmSetItem.btnEditClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if PageControl1.ActivePageIndex=0 then
  begin
    if not(dm.aqSetItem.State in [dsInsert,dsEdit]) then dm.aqSetItem.Edit;
  end
  else if PageControl1.ActivePageIndex=1 then
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
    try
      InputVar.Fields := 'USER_LOGIN_NAME/用户代码/251,USER_FULL_NAME/用户名称/251';
      InputVar.Sqlstr :=
        'Select RKEY,USER_LOGIN_NAME,USER_FULL_NAME FROM Data0073';
      inputvar.InPut_value:=dm.aq244.FieldByName('USER_FULL_NAME').AsString;
      inputvar.KeyField:='USER_FULL_NAME';
      InputVar.AdoConn := dm.ADOConn;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        if not(dm.aq244.State in[dsInsert, dsEdit]) then dm.aq244.Edit;
        dm.aq244.FieldByName('PTR_73').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
  end
  else
  begin
    if not(dm.aq247.State in [dsInsert,dsEdit]) then dm.aq247.Edit;
  end;
end;

procedure TfrmSetItem.btnSaveClick(Sender: TObject);
begin
  try
    if PageControl1.ActivePageIndex=0 then
    begin
      if dm.aqSetItem.State in [dsInsert,dsEdit] then
      begin
        dm.aqSetItem.Post;
        dm.aqSetItem.UpdateBatch();
      end;
    end
    else if PageControl1.ActivePageIndex=1 then
    begin
      if dm.aq244.State in [dsInsert,dsEdit] then
      begin
        dm.aq244.Post;
        dm.aq244.UpdateBatch();
      end;
    end
    else
    begin
      if dm.aq247.State in [dsInsert,dsEdit] then
      begin
        dm.aq247.Post;
        dm.aq247.UpdateBatch();
      end;
    end;
    RefreshData;
    ShowMessage('保存成功');
  except
    ShowMessage('保存失败');
  end;
end;

procedure TfrmSetItem.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dm.ADOConn.BeginTrans;
  try
    dm.aqTmp.Close;
    if PageControl1.ActivePageIndex=0 then
      dm.aqTmp.SQL.Text:= 'Delete from Data0241 where rkey=' + dm.aqSetItemRKEY.AsString
    else if PageControl1.ActivePageIndex=1 then
      dm.aqTmp.SQL.Text:= 'Delete from Data0244 where rkey=' + dm.aq244RKEY.AsString
    else
      dm.aqTmp.SQL.Text:= 'Delete from Data0247 where rkey=' + dm.aq247RKEY.AsString;
    dm.aqTmp.ExecSQL;
    dm.ADOConn.CommitTrans;
    ShowMessage('删除数据成功!');
    RefreshData;
  except
    dm.ADOConn.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmSetItem.RefreshData;
var
  i:integer;
begin
  if PageControl1.ActivePageIndex=0 then
  begin
    if dm.aqSetItem.IsEmpty then Exit;
    i:= dm.aqSetItemRKEY.AsInteger;
    dm.aqSetItem.Close;
    dm.aqSetItem.Open;
    dm.aqSetItem.Locate('rkey',i,[]);
  end
  else if PageControl1.ActivePageIndex=1 then
  begin
    if dm.aq244.IsEmpty then Exit;
    i:= dm.aq244RKEY.AsInteger;
    dm.aq244.Close;
    dm.aq244.Open;
    dm.aq244.Locate('rkey',i,[]);
  end
  else
  begin
    if dm.aq247.IsEmpty then Exit;
    i:= dm.aq247RKEY.AsInteger;
    dm.aq247.Close;
    dm.aq247.Open;
    dm.aq247.Locate('rkey',i,[]);
  end;
end;

end.
