unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DM, DB,
  ADODB, DBGridEh;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    edt1: TEdit;
    pm1: TPopupMenu;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniDele: TMenuItem;
    mniView: TMenuItem;
    mniCopy: TMenuItem;
    qryMainFrm: TADOQuery;
    ds1: TDataSource;
    qryMainFrmRKEY: TAutoIncField;
    qryMainFrmRKEY25: TIntegerField;
    qryMainFrmListNumber: TStringField;
    qryMainFrmHardwareLinkman_PTR: TIntegerField;
    qryMainFrmVersion: TStringField;
    qryMainFrmStatus: TWordField;
    qryMainFrmCreateBy_PTR: TIntegerField;
    qryMainFrmCreateDate: TDateTimeField;
    qryMainFrmAuditBy_PTR: TIntegerField;
    qryMainFrmRemark: TStringField;
    qryMainFrmAuditDate: TDateTimeField;
    qryMainFrmActive: TBooleanField;
    qryMainFrmMANU_PART_NUMBER: TStringField;
    qryMainFrmMANU_PART_DESC: TStringField;
    qryMainFrmCreateUser: TStringField;
    qryMainFrmHardLinkUser: TStringField;
    qryMainFrmAuditUser: TStringField;
    eh1: TDBGridEh;
    pmField: TPopupMenu;
    cbx1: TCheckBox;
    mniN1: TMenuItem;
    mniAudit: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure pm1Popup(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniAuditClick(Sender: TObject);
  private
    { Private declarations }
    vColumn:TColumnEh;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
    FWhere: string;
    FMainSql: string;
    procedure GetData();
  end;

var
  Form1: TForm1;

implementation
uses
  common, DateUtils, StrUtils, QuerySet, EditFrm;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  GetData;
end;

procedure TForm1.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
  ShowMessage(self.qryMainFrm.SQL.Text);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(eh1,'电子料BOM');
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  pmField.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
  item: TMenuItem;
begin
  for i := 0 to eh1.Columns.Count-1 do
    begin
      item := TmenuItem.Create(self);
      item.Caption := eh1.Columns[i].Title.Caption;
      if eh1.Columns[i].Visible then
        item.Checked := true;
      item.OnClick := item_click;
      self.pmField.Items.Add(item);
    end;
  FMainSql := qryMainFrm.SQL.Text;
  GetData;
  vColumn := eh1.Columns[0];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm1.con1) then
  begin
    showmsg('程序起动失败,请联系管理员!', 1);
    application.Terminate;
    exit;
  end;
  self.caption := application.Title;


// rkey73:='1';
// vprev:='4';
// user_ptr := '1284';
 //DM.ADOConnection1.Open;

end;

procedure TForm1.GetData;
var
  Dt: TDateTime;
  d1,d2: TDateTime;
begin
  Dt := dm1.GetSvrTime;
  d1 := IncDay(Dt,-15);
  d2 := IncDay(Dt,1);
  if FWhere = '' then
  begin
    FWhere := ' WHERE CreateDate Between ' + QuotedStr(dm1.DatetimeToStr(d1)) + ' AND ' + QuotedStr(dm1.DatetimeToStr(d2));
  end;

  if not cbx1.Checked then
  begin
    qryMainFrm.Close;
    qryMainFrm.SQL.Text := FMainSql + FWhere + ' and active = 1 ' +' order by data0800.createdate desc';
    qryMainFrm.Open;
  end else
  begin
    qryMainFrm.Close;
    qryMainFrm.SQL.Text := FMainSql + FWhere +' order by data0800.createdate desc';
    qryMainFrm.Open;  
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var i:integer;
    sqlstr:string;

  Dt: TDateTime;
  d1,d2: TDateTime;
begin
  Dt := dm1.GetSvrTime;
  d1 := IncDay(Dt,-15);
  d2 := IncDay(Dt,1);
 try
   if frmQuerySet = nil then
   begin
   frmQuerySet := TfrmQuerySet.Create(Self);
   frmQuerySet.dtp1.DateTime := d1;
   frmQuerySet.dtp2.DateTime := d2;
   end;

  if frmQuerySet.ShowModal = mrOk then
  begin
   for i:=1 to frmQuerySet.sgrid1.RowCount-2 do
   begin
    if frmQuerySet.sgrid1.Cells[2,i]<> '' then
     Sqlstr:=sqlstr+frmQuerySet.sgrid1.Cells[2,i];
   end;
   FWhere := ' WHERE CreateDate Between ' + QuotedStr(dm1.DatetimeToStr(frmQuerySet.dtp1.Date)) + ' AND ' + QuotedStr(dm1.DatetimeToStr(frmQuerySet.dtp2.DateTime)) +
   sqlstr+' ';
    GetData;
  end;
 finally
    //free;
 end;
end;

procedure TForm1.item_click(sender: TObject);
var
  i: byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to eh1.Columns.Count - 1 do
      if eh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        eh1.Columns[i].Visible := true;
        break;
      end;
  end
  else
  begin
    for i := 0 to eh1.Columns.Count - 1 do
    begin
      //ShowMessage(eh1.Columns[i].Title.Caption + ' : '+ (sender as tmenuItem).Caption);
      if eh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        eh1.Columns[i].Visible := false;
        break;
      end;
    end;
  end;
end;

procedure TForm1.edt1Change(Sender: TObject);
begin
  if trim(edt1.text) <> '' then
    qryMainFrm.Filter := vColumn.FieldName + ' like ''%' + trim(edt1.text) + '%'''
  else
    qryMainFrm.filter := '';
end;

procedure TForm1.eh1TitleClick(Column: TColumnEh);
begin
    vcolumn.Title.Color:=clbtnface;
    vcolumn.Title.Color:=clred;
if (Column.Title.Caption <> vcolumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    vcolumn.Title.Color:=clbtnface;
    vColumn := Column;
    vcolumn.Title.Color:=clred;
     lbl1.Caption :=  Column.Title.Caption;
  end;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
   begin
    TCustomADODataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
   end
  else
  if Column.Title.SortMarker = smUpEh then
   begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
   end ;
end;

procedure TForm1.pm1Popup(Sender: TObject);
begin
  mniEdit.Enabled := not qryMainFrm.IsEmpty;
  mniDele.Enabled := not qryMainFrm.IsEmpty;
  mniView.Enabled := not qryMainFrm.IsEmpty;
  mniCopy.Enabled := not qryMainFrm.IsEmpty;
  mniAudit.Enabled := False;

  if qryMainFrm.IsEmpty then exit;

  mniEdit.Enabled := qryMainFrm.FieldByName('status').AsInteger =0;
  mniDele.Enabled := qryMainFrm.FieldByName('status').AsInteger =0;
  mniAudit.Enabled := qryMainFrm.FieldByName('status').AsInteger = 0;
  mniAudit.Visible := vprev = '4';

end;

procedure TForm1.mniNewClick(Sender: TObject);
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  LFrm.GetData(0);
  LFrm.qry800.Edit;
  LFrm.qry800.FieldByName('CreateBy_PTR').AsString := user_ptr ;
  LFrm.edtCreateUser.Text := dm1.GetuserName05(StrToInt(user_ptr));
  LFrm.edtCreateUser.tag := StrToInt(user_ptr);
  LFrm.qry800.FieldByName('CreateDate').AsDateTime := dm1.GetSvrTime;
  LFrm.qry800.FieldByName('active').AsBoolean := True;
  LFrm.qry800.Post;
  try
    LFrm.ShowModal;
    GetData();
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.cbx1Click(Sender: TObject);
begin
  GetData();
end;

procedure TForm1.mniEditClick(Sender: TObject);
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  LFrm.GetData(qryMainFrm.fieldbyname('Rkey').AsInteger);
  LFrm.edtManuPartNumber.Text := qryMainFrm.fieldbyname('MANU_PART_NUMBER').AsString;
  LFrm.edtManuPartNumber.tag := qryMainFrm.fieldbyname('rkey25').AsInteger;
  LFrm.edtCreateUser.Text := qryMainFrm.fieldbyname('CreateUser').AsString;
  LFrm.edtCreateUser.tag := qryMainFrm.fieldbyname('CreateBy_PTR').AsInteger;
  LFrm.edtAuitUser.Text := qryMainFrm.fieldbyname('AuditUser').AsString;
  LFrm.edtAuitUser.tag := qryMainFrm.fieldbyname('AuditBy_PTR').AsInteger;
  LFrm.edtHarLinkPeop.Text := qryMainFrm.fieldbyname('HardLinkUser').AsString;
  LFrm.edtHarLinkPeop.tag := qryMainFrm.fieldbyname('HardwareLinkman_PTR').AsInteger;
  try
    LFrm.ShowModal;
    GetData();
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.mniViewClick(Sender: TObject);

var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  LFrm.GetData(qryMainFrm.fieldbyname('Rkey').AsInteger);
  LFrm.edtManuPartNumber.Text := qryMainFrm.fieldbyname('MANU_PART_NUMBER').AsString;
  LFrm.edtManuPartNumber.tag := qryMainFrm.fieldbyname('rkey25').AsInteger;
  LFrm.edtCreateUser.Text := qryMainFrm.fieldbyname('CreateUser').AsString;
  LFrm.edtCreateUser.tag := qryMainFrm.fieldbyname('CreateBy_PTR').AsInteger;
  LFrm.edtAuitUser.Text := qryMainFrm.fieldbyname('AuditUser').AsString;
  LFrm.edtAuitUser.tag := qryMainFrm.fieldbyname('AuditBy_PTR').AsInteger;
  LFrm.edtHarLinkPeop.Text := qryMainFrm.fieldbyname('HardLinkUser').AsString;
  LFrm.edtHarLinkPeop.tag := qryMainFrm.fieldbyname('HardwareLinkman_PTR').AsInteger;

  LFrm.btnSave.Enabled := False;
  LFrm.eh1.PopupMenu := nil;
  LFrm.eh1.ReadOnly := true;
  LFrm.btn1.Enabled := False;
  LFrm.btn2.Enabled := false;
  LFrm.edtManuPartNumber.ReadOnly := True;
  LFrm.dbedtListNumber.ReadOnly := True;
  lfrm.dbedtVersion.ReadOnly := True;
  LFrm.dbedtRemark.ReadOnly := true;
  try
    LFrm.ShowModal;

  finally
    LFrm.Free;
  end;
end;


procedure TForm1.mniDeleClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除?','提示',MB_YESNO) = IDYEs then
  begin
    dm1.con1.BeginTrans;
    try
    dm1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Add('delete from data0801 where rkey800=' + qryMainFrm.fieldbyname('rkey').AsString);
    dm1.qrytmp.SQL.Add('delete from data0800 where rkey=' + qryMainFrm.fieldbyname('rkey').AsString);
    dm1.qrytmp.ExecSQL;
    dm1.con1.CommitTrans;
    GetData;
    finally
      if dm1.con1.InTransaction then
        dm1.con1.RollbackTrans;
    end;
  end;
end;

procedure TForm1.mniCopyClick(Sender: TObject);
var
  LFrm: TfrmEdit;
  LfrmCopy: TfrmEdit;
  I: Integer;
begin
  LFrm := TfrmEdit.Create(Self);
  LFrm.GetData(0);
  LFrm.edtManuPartNumber.Text := qryMainFrm.fieldbyname('MANU_PART_NUMBER').AsString;
  LFrm.edtManuPartNumber.tag := qryMainFrm.fieldbyname('rkey25').AsInteger;
  LFrm.edtCreateUser.Text := qryMainFrm.fieldbyname('CreateUser').AsString;
  LFrm.edtCreateUser.tag := qryMainFrm.fieldbyname('CreateBy_PTR').AsInteger;
  LFrm.edtAuitUser.Text := qryMainFrm.fieldbyname('AuditUser').AsString;
  LFrm.edtAuitUser.tag := qryMainFrm.fieldbyname('AuditBy_PTR').AsInteger;
  LFrm.edtHarLinkPeop.Text := qryMainFrm.fieldbyname('HardLinkUser').AsString;
  LFrm.edtHarLinkPeop.tag := qryMainFrm.fieldbyname('HardwareLinkman_PTR').AsInteger;

  LfrmCopy := TfrmEdit.Create(Self);
  LfrmCopy.GetData(qryMainFrm.fieldbyname('Rkey').AsInteger);
  LFrm.qry800.Append;
  for I := 0 to LfrmCopy.qry800.FieldCount - 1 do
  begin
    if UpperCase(LFrm.qry800.Fields[I].FieldName) = 'RKEY' then
      Continue;
    LFrm.qry800.Fields[I].Value := LfrmCopy.qry800.Fields[I].Value;
  end;
  lfrm.qry800.Post;

  LfrmCopy.ads801.First;
  while not LfrmCopy.ads801.Eof do
  begin
    LFrm.ads801.Append;
    for I := 0 to LfrmCopy.ads801.FieldCount - 1 do
    begin
      if UpperCase(LFrm.ads801.Fields[i].FieldName) = 'RKEY' then
        Continue;
      if UpperCase(LFrm.ads801.Fields[i].FieldName) = 'RKEY800' then
        Continue;
      lfrm.ads801.Fields[I].Value := LfrmCopy.ads801.Fields[I].Value;
    end;
    LFrm.ads801.Post;
    LfrmCopy.ads801.Next;
  end;
  LfrmCopy.Free;
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (not Column.Field.DataSet.FieldByName('active').AsBoolean) then
  begin
    TDBGridEh(Sender).Canvas.Font.Color := clGrayText;
  end;
  if (Column.Field.DataSet.FieldByName('status').AsInteger = 1) then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clMoneyGreen;
  end;
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  
end;

procedure TForm1.mniAuditClick(Sender: TObject);
begin

  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Text := 'update data0800 set status = 1 where rkey = ' + qryMainFrm.FieldByName('rkey').AsString;
  dm1.qrytmp.ExecSQL;

  qryMainFrm.Edit;
  qryMainFrm.FieldByName('Status').AsInteger := 1;
  qryMainFrm.Post;
end;

end.
