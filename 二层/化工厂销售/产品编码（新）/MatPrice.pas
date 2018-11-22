unit MatPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, Menus, StdCtrls, Buttons, DB, ComObj;

type
  TfrmMatPrice = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnExportDtl: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnExportDtlClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
  private
    PreColumn1,PreColumn2: TColumnEh;
    field_name1,field_name2:string;
  public
    procedure init;
  end;

var
  frmMatPrice: TfrmMatPrice;

implementation

uses DM_u, common, MatPriceEdt;

{$R *.dfm}

procedure TfrmMatPrice.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMatPrice.btnRefreshClick(Sender: TObject);
var
  rkey140: Integer;
begin
  rkey140:= dm.aqCP140rkey.Value;
  dm.aqCP140.Close;
  dm.aqCP140.Open;
  if rkey140>0 then dm.aqCP140.Locate('rkey',rkey140,[]);
end;

procedure TfrmMatPrice.btnExportClick(Sender: TObject);
begin
  if not DM.aqCP148.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh2,DM.aqCP140part_name.AsString);
end;

procedure TfrmMatPrice.btnExportDtlClick(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
  b:boolean;
begin
  if DM.aqCP140.IsEmpty then exit;
  DM.aqCP140.DisableControls;
  DM.aqCP148.DisableControls;
  DM.aqCP140.First;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  while not DM.aqCP140.Eof do
  begin
    if DM.aqCP140status.AsInteger<>1 then
    begin
      DM.aqCP140.Next;
      continue;
    end;
    if b then
      Sheet:= XLApp.Sheets.Add
    else begin
      b:= true;
      Sheet:= XLApp.WorkBooks[1].WorkSheets[1];
    end;
    Sheet.name:=DM.aqCP140part_name.AsString;
    DM.aqCP148.first;
    v_cloumn := 0;
    for iCount := 0 to DBGridEh2.Columns.Count - 1 do
      if DBGridEh2.Columns.Items[iCount].Visible then
        Sheet.Cells[1, iCount + 1 - v_cloumn] :=DBGridEh2.Columns[iCount].Title.Caption
      else
        inc(v_cloumn);

    jCount := 1;
    while not DM.aqCP148.Eof do
    begin
      v_cloumn := 0;
      for iCount := 0 to DBGridEh2.Columns.Count - 1 do
        if DBGridEh2.Columns[iCount].Visible = true then
        begin
          if DBGridEh2.Columns[iCount].Field.DataType=ftString then
            Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] := DBGridEh2.Columns[iCount].Field.AsString;
        end else
          inc(v_cloumn);
      Inc(jCount);
      DM.aqCP148.Next;
    end;
    DM.aqCP140.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;  
  DM.aqCP140.EnableControls;
  DM.aqCP148.EnableControls;
end;

procedure TfrmMatPrice.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:= (vprev='2') or (vprev='4');
  N2.Enabled:= not DM.aqCP140.IsEmpty and N1.Enabled and (DM.aqCP140status.Value=0);
  N3.Enabled:= N2.Enabled;

  N5.Enabled:= not DM.aqCP140.IsEmpty and (vprev='4') and (DM.aqCP140status.Value=0);
  N6.Enabled:= not DM.aqCP140.IsEmpty and (vprev='4') and (DM.aqCP140status.Value=1);
  N8.Enabled:= N2.Enabled;
end;

procedure TfrmMatPrice.Edit1Change(Sender: TObject);
var
  DBGridEh: TDBGridEh;
  field_name: string;
begin
  if (Sender as TEdit).Name = 'Edit1' then
  begin
    DBGridEh:= DBGridEh1;
    field_name:= field_name1;
  end
  else
  begin
    DBGridEh:= DBGridEh2;
    field_name:= field_name2;
  end;
  if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger] then
  begin
    if trim((Sender as TEdit).Text) <> '' then
    begin
      if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftString, ftWideString] then
        DBGridEh.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim((Sender as TEdit).text) + '%'')'
      else if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftSmallint, ftInteger] then
        DBGridEh.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef((Sender as TEdit).text,0))+')';
    end
    else
      DBGridEh.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmMatPrice.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.aqCP140.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.aqCP140.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name1 <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name1 := column.FieldName ;
    edit1.SetFocus;
    PreColumn1.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TfrmMatPrice.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.aqCP148.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.aqCP148.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name2 <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edit2.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
    Edit1Change(Edit2);
  end else
    edit2.SetFocus;
end;

procedure TfrmMatPrice.init;
begin
  field_name1:= DBGridEh1.Columns[0].FieldName;
  PreColumn1:= DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color:= clred;

  field_name2:= DBGridEh2.Columns[0].FieldName;
  PreColumn2:= DBGridEh2.Columns[0];
  DBGridEh2.Columns[0].Title.Color:= clred;

  DM.aqCP140.Close;
  DM.aqCP140.Parameters[0].Value:= DM.D08RKEY.Value;
  DM.aqCP140.Open;
end;

procedure TfrmMatPrice.N1Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
  0,1:
  begin
    frmMatPriceEdt:= TfrmMatPriceEdt.Create(nil);
    try
      if TMenuItem(Sender).Tag = 0 then
        frmMatPriceEdt.Caption:= frmMatPriceEdt.Caption+'-新增'
      else
        frmMatPriceEdt.Caption:= frmMatPriceEdt.Caption+'-编辑';
      frmMatPriceEdt.Ftag:= TMenuItem(Sender).Tag;
      frmMatPriceEdt.init(Label4.Caption);
      if frmMatPriceEdt.ShowModal = mrok then
      begin
        Edit1.Text:='';
        Edit2.Text:='';
      end;
    finally
      frmMatPriceEdt.Free;
    end;
  end;
  2:begin  //删除
      if DM.aqCP140status.Value = 1 then
      begin
        ShowMessage('此材料报价已审核,不允许删除!');
        Exit;
      end
      else if MessageBox(Handle,'确定删除此材料报价吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES then
      begin
        try
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='delete from WZCP0140 where rkey='+DM.aqCP140rkey.AsString;
          DM.Tmp.ExecSQL;
        except
          on E: Exception do
          begin
            ShowMessage('删除材料报价失败:'+E.Message);
          end;
        end;
      end;
    end;
  3:begin  //审核
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select getdate() as NowDateTime';
      DM.Tmp.Open;
      try
        DM.ADOCon.BeginTrans;
        DM.aqCP140.Edit;
        DM.aqCP140status.Value:=1;
        DM.aqCP140user_ptr.Value:=strtoint(user_ptr);
        DM.aqCP140auth_date.Value:=DM.Tmp.Fields[0].AsDateTime;
        DM.aqCP140.UpdateBatch();
        DM.ADOCon.CommitTrans;
      except
        on E: Exception do
        begin
          DM.ADOCon.RollbackTrans;
          showmessage('数据保存发生错误:'+E.Message);
        end;
      end;
    end;
  4:begin  //反审核
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update WZCP0140 set status=0,user_ptr=null,auth_date=null where status=1 and rkey='+DM.aqCP140rkey.AsString;
      if DM.Tmp.ExecSQL<>1 then showmessage('数据状态发生变化,反审核失败');
    end;
  5:begin  //作废
      try
        DM.ADOCon.BeginTrans;
        dm.aqCP140.Edit;
        dm.aqCP140status.Value:=2;
        dm.aqCP140.UpdateBatch();
        DM.ADOCon.CommitTrans;
      except
        on E: Exception do
        begin
          DM.ADOCon.RollbackTrans;
          ShowMessage('作废失败:'+E.Message);
        end;
      end;
    end;
  end;
  btnRefreshClick(nil);
end;

end.
