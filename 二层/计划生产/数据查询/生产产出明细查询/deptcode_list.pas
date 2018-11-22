unit deptcode_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,
   Excel2000,OleServer,ComObj;
type
  TForm4 = class(TForm)
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1WORK_ORDER_NUMBER: TStringField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1PANELS: TIntegerField;
    ADOQuery1OUTTIME: TDateTimeField;
    ADOQuery1CUT_NO: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1SO_NO: TStringField;
    ADOQuery1dept_code1: TStringField;
    ADOQuery1dept_name1: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1total_sqft: TFloatField;
    ADOQuery1total_sq: TFloatField;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    ADOQuery1PARTS_PER_PANEL: TFloatField;
    ADOQuery1pnl_size: TStringField;
    ADOQuery1step_no: TSmallintField;
    ADOQuery1C_WTYPE: TStringField;
    ADOQuery1dept_code2: TStringField;
    ADOQuery1dept_name2: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1ABBR_NAME_1: TStringField;
    ADOQuery1ACTION_REF: TStringField;
    ADOQuery1PARAMETER_VALUE: TStringField;
    ADOQuery1INTIME: TDateTimeField;
    ADOQuery1ENT_DATETIME: TDateTimeField;
    ADOQuery1SCH_COMPL_DATE: TDateTimeField;
    ADOQuery1panel_ln: TFloatField;
    ADOQuery1panel_wd: TFloatField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    ADOQuery1d34Rkey: TIntegerField;
    ADOQuery1PROD_STATUS: TSmallintField;
    ADOQuery1SAMPLE_NR: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1DSDesigner2: TFloatField;
    ADOQuery1CPJS: TStringField;
    ADOQuery1ModernDate34: TDateTimeField;
    ADOQuery1DataValues: TFloatField;
    ADOQuery1FLOW_NO: TSmallintField;
    ADOQuery1YS: TStringField;
    ADOQuery1PRIORITY_name: TStringField;
    Edit1: TEdit;
    Label5: TLabel;
    Button2: TButton;
    ADOQuery1QTY_PROD2: TIntegerField;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    procedure item_click(sender :TObject);
  public
    { Public declarations }
    FList: TStringList;
    procedure getkuanshu;
  end;

var
  Form4: TForm4;
  ListShow,ListDEPT: TList; //存列表

implementation

uses main,common, PasCollect, PasCollect_2, PasCollectPZ;

{$R *.dfm}
procedure tform4.getkuanshu;
begin
  FList.Clear;
  ADOQuery1.DisableControls;
  try
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      if FList.IndexOf(ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString) = -1 then
        FList.Add(ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString);
      ADOQuery1.Next;
    end;
  finally
    ADOQuery1.EnableControls;
  end;
  Label7.Caption := IntToStr(FList.Count);
end;

procedure tform4.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adoquery1.close;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if dbgrideh1.DataSource.DataSet.IsEmpty then exit;
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
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name :=Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[Caption];
  dbgrideh1.DataSource.DataSet.DisableControls;
  dbgrideh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrideh1.Columns.Count - 1 do
    if dbgrideh1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrideh1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrideh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrideh1.Columns.Count - 1 do
      if dbgrideh1.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrideh1.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrideh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
end;

procedure TForm4.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm4.FormShow(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
for i:=1 to dbgrideh1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrideh1.Columns[i-1].Title.Caption;
   if dbgrideh1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   if (strtoint(vprev)<>4) and
      (dbgrideh1.Columns[i-1].Title.Caption='客户简称') then
    item.Enabled:=false;
   self.PopupMenu2.Items.Add(item);
  end;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  getkuanshu;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm4.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if ADOQuery1.Fields[33].AsString<>'' then
  begin
    if (ADOQuery1.Fields[33].AsString='是') then
      DBGridEh1.Canvas.Font.Color := clRed;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  try
    FrmCollect2:=TFrmCollect2.Create(application);
    screen.Cursor:=crAppstart;
    try
      FrmCollect2.ADOQuery1.DisableControls;
      FrmCollect2.ADOQuery1.Close;
      FrmCollect2.ADOQuery1.SQL.Insert(FrmCollect2.ADOQuery1.SQL.Count-2,Form1.sSQL);
      FrmCollect2.ADOQuery1.Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',Form1.dtpk1.Date)+
          formatdatetime('hh:nn:ss',Form1.dtt1.DateTime));
      FrmCollect2.ADOQuery1.Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',Form1.dtpk2.Date)+
          formatdatetime('hh:nn:ss',Form1.dtt2.DateTime));
      FrmCollect2.ADOQuery1.Prepared;
      FrmCollect2.ADOQuery1.open;
      if Trim(Edit1.Text)<>'' then
        FrmCollect2.ADOQuery1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
      else
        FrmCollect2.ADOQuery1.Filter:='';
    finally
      FrmCollect2.ADOQuery1.EnableControls;
    end;
    FrmCollect2.ShowModal;
  finally
    FrmCollect2.Free;
    screen.Cursor:=crDefault;
  end;
//  try
//    FrmCollect:=TFrmCollect.Create(application);
//    screen.Cursor:=crAppstart;
//    try
//      FrmCollect.ADOQuery1.DisableControls;
//      FrmCollect.ADOQuery1.Close;
//      FrmCollect.ADOQuery1.SQL.Insert(FrmCollect.ADOQuery1.SQL.Count-2,Form1.sSQL);
//      FrmCollect.ADOQuery1.Parameters.ParamValues['dtpk1']:=strtodatetime(
//          formatdatetime('yyyy-mm-dd ',Form1.dtpk1.Date)+
//          formatdatetime('hh:nn:ss',Form1.dtt1.DateTime));
//      FrmCollect.ADOQuery1.Parameters.ParamValues['dtpk2']:=strtodatetime(
//          formatdatetime('yyyy-mm-dd ',Form1.dtpk2.Date)+
//          formatdatetime('hh:nn:ss',Form1.dtt2.DateTime));
//      FrmCollect.ADOQuery1.Prepared;
//      FrmCollect.ADOQuery1.open;
//    finally
//      FrmCollect.ADOQuery1.EnableControls;
//    end;
//    FrmCollect.ShowModal;
//  finally
//    FrmCollect.Free;
//    screen.Cursor:=crDefault;
//  end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADOQuery1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    ADOQuery1.Filter:='';
  getkuanshu;
end;

procedure TForm4.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    Label5.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  try
    frmFrmCollectPZ:=TfrmFrmCollectPZ.Create(application);
    screen.Cursor:=crAppstart;
    try
      frmFrmCollectPZ.ADOQuery1.DisableControls;
      frmFrmCollectPZ.ADOQuery1.Close;
      frmFrmCollectPZ.ADOQuery1.SQL.Insert(frmFrmCollectPZ.ADOQuery1.SQL.Count-1,Form1.sSQL);
      frmFrmCollectPZ.ADOQuery1.Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',Form1.dtpk1.Date)+
          formatdatetime('hh:nn:ss',Form1.dtt1.DateTime));
      frmFrmCollectPZ.ADOQuery1.Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',Form1.dtpk2.Date)+
          formatdatetime('hh:nn:ss',Form1.dtt2.DateTime));
      frmFrmCollectPZ.ADOQuery1.Prepared;
//      ShowMessage(frmFrmCollectPZ.ADOQuery1.SQL.Text);
      frmFrmCollectPZ.ADOQuery1.open;
//      if Trim(Edit1.Text)<>'' then
//        frmFrmCollectPZ.ADOQuery1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
//      else
//        frmFrmCollectPZ.ADOQuery1.Filter:='';
    finally
      frmFrmCollectPZ.ADOQuery1.EnableControls;
    end;
    frmFrmCollectPZ.ShowModal;
  finally
    frmFrmCollectPZ.Free;
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FList := TStringList.Create;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

end.
