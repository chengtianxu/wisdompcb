unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Menus, Grids, DBGridEh, ADODB,
  OleServer, Excel2000,ComObj, ComCtrls, DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ADOConnection1: TADOConnection;
    ADS58: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    BitBtn6: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    ADS58MANU_PART_NUMBER: TStringField;
    ADS58date_sailing: TDateTimeField;
    ADS58CUSTOMER_NAME: TStringField;
    ADS58delivery_no: TStringField;
    ADS58PO_NUMBER: TStringField;
    ADS58MANU_PART_DESC: TStringField;
    ADS58ANALYSIS_CODE_2: TStringField;
    ADS58PARTS_ORDERED: TFloatField;
    ADS58PARTS_SHIPPED: TFloatField;
    ADS58QUAN_SHIPPED: TIntegerField;
    ADS58part_price: TFloatField;
    ADS58sump_price: TFloatField;
    ADS58tprice: TBCDField;
    ADS58sumprice: TFloatField;
    ADS58SHIPMENT_NO: TSmallintField;
    dtp1: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    ADS58cust_code: TStringField;
    ADS58ABBR_NAME: TStringField;
    fltfldADS58sq: TFloatField;
    ADS58product_name: TStringField;
    intgrfldADS58rkey: TIntegerField;
    dbgrd1: TDBGrid;
    qry1: TADOQuery;
    qry1cust_code: TStringField;
    btn1: TBitBtn;
    ADS58xingshi: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses common, condition;
{$R *.dfm}

procedure CopyToExcel(Args: array of const);
var  iCount, jCount: Integer;  XLApp: Variant;  Sheet: Variant;  I: Integer;begin  Screen.Cursor := crHourGlass;  if not VarIsEmpty(XLApp) then  begin    XLApp.DisplayAlerts := False;    XLApp.Quit;    VarClear(XLApp);  end;  try    XLApp := CreateOleObject('Excel.Application');  except    Screen.Cursor := crDefault;    Exit;end;  XLApp.WorkBooks.Add;  XLApp.SheetsInNewWorkbook := High(Args) + 1;  for I := Low(Args) to High(Args) do  begin    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBGrid(Args[I].VObject).Name;    Sheet := XLApp.Workbooks[1].WorkSheets[TDBGrid(Args[I].VObject).Name];    if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then    begin      Screen.Cursor := crDefault;      Exit;    end;      TDBGrid(Args[I].VObject).DataSource.DataSet.first;    for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do      Sheet.Cells[1, iCount + 1] :=      TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption;      jCount := 1;    while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do    begin      for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count -1 do        Sheet.Cells[jCount + 1, iCount + 1] :=        TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;        Inc(jCount);        TDBGrid(Args[I].VObject).DataSource.DataSet.Next;    end;          XlApp.Visible := True;end;  Screen.Cursor := crDefault;end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(self.ADOConnection1) then
  begin
    showmsg('程序启动失败，请与管理员联系！',1);
    application.Terminate;
  end;  
  self.caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure tform1.item_click(sender:TObject);
var i:byte;
begin
 (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
 if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
 else begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(self.ADS58.CommandText);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
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
  sheet.cells[2,1]:='对账时间从:'+datetimetostr(ads58.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(ads58.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  self.ADS58.Close;
  Self.ADS58.Parameters[0].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
  Self.ADS58.Parameters[1].Value:= DateToStr( dtp2.Date)+' 23:59:59' ;
  Self.ADS58.Parameters[2].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
  Self.ADS58.Parameters[3].Value:= DateToStr( dtp2.Date)+' 23:59:59' ;
  self.ADS58.Open;

end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADS58.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   ADS58.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
{ if trim(Edit1.text)<>'' then
   ADs58.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ADs58.filter := '';   }
 if trim(Edit1.text)<>'' then
   ADs58.Filter := ' CUSTOMER_NAME like ''%'+trim(edit1.text)+'%'''

 else ADs58.filter := '';

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  self.ADS58.Close;
  Self.ADS58.Parameters[0].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
  Self.ADS58.Parameters[1].Value:= DateToStr( dtp2.Date)+' 23:59:59' ;
  Self.ADS58.Parameters[2].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
  Self.ADS58.Parameters[3].Value:= DateToStr( dtp2.Date)+' 23:59:59' ;
  self.ADS58.Open;

end;

procedure TForm1.btn1Click(Sender: TObject);
begin
    qry1.close;
    qry1.Parameters[0].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
    qry1.Parameters[1].Value:= DateToStr(dtp2.Date)+' 23:59:59' ;
    qry1.Parameters[2].Value:= DateToStr(dtp1.Date)+' 00:00:00' ;
    qry1.Parameters[3].Value:= DateToStr(dtp2.Date)+' 23:59:59' ;
    qry1.open;
    qry1.first;

    while not qry1.Eof do
    begin
     Self.ADS58.filter:=' cust_code = '''+qry1.fieldbyname('cust_code').Asstring+'''';
      Self.ADS58.filtered:= True;
      copytoexcel([dbgrd1]) ;
      qry1.next;

    end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
 dbgrd1.hide;

end;

end.
