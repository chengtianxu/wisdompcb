unit PackSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Menus,ComObj, Excel2000;

type
  TForm_PackSelect = class(TForm)
    Label4: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    DataSource1: TDataSource;
    ADS64: TADOQuery;
    ADS64SALES_ORDER: TStringField;
    ADS64COMMISION_ON_TOOLING: TStringField;
    ADS64SCH_DATE: TDateTimeField;
    ADS64ITEM_NBR: TStringField;
    ADS64COD_FLAG: TStringField;
    ADS64rkey60: TIntegerField;
    ADS64PARTS_ORDERED: TFloatField;
    ADS64PARTS_SHIPPED: TFloatField;
    ADS64PARTS_RETURNED: TFloatField;
    ADS64SHIPPING_METHOD: TStringField;
    ADS64CURRENCY_PTR: TIntegerField;
    ADS64PART_PRICE: TFloatField;
    ADS64STATUS: TWordField;
    ADS64fob: TStringField;
    ADS64REFERENCE_NUMBER: TStringField;
    ADS64CUST_SHIP_ADDR_PTR: TIntegerField;
    ADS64CUSTOMER_PTR: TIntegerField;
    ADS64PURCHASE_ORDER_PTR: TIntegerField;
    ADS64CUST_PART_PTR: TIntegerField;
    ADS64rkey15: TIntegerField;
    ADS64WAREHOUSE_CODE: TStringField;
    ADS64abbr_name: TStringField;
    ADS64MANU_PART_NUMBER: TStringField;
    ADS64MANU_PART_DESC: TStringField;
    ADS64ANALYSIS_CODE_2: TStringField;
    ADS64CUST_CODE: TStringField;
    ADS64CUSTOMER_NAME: TStringField;
    ADS64DO_SMOOTHING: TWordField;
    ADS64INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADS64CUSTOMER_TYPE: TIntegerField;
    ADS64SHIPMENT_NO: TSmallintField;
    ADS64QUAN_SHIPPED: TIntegerField;
    ADS64DATE_ASSIGN: TDateTimeField;
    ADS64ovsh_discount: TBCDField;
    ADS64DATE_SHIPPED: TDateTimeField;
    ADS64PACKING_SLIP_FLAG: TStringField;
    ADS64total_case: TFloatField;
    ADS64rkey64: TIntegerField;
    ADS64packing_list_ptr: TIntegerField;
    ADS64weigth: TBCDField;
    ADS64assigntype: TStringField;
    ADS64SHIP_TO_ADDRESS_1: TStringField;
    ADS64SHIP_TO_CONTACT: TStringField;
    ADS64ZIP: TStringField;
    ADS64SHIP_TO_PHONE: TStringField;
    ADS64LOCATION: TStringField;
    ADS64STATE: TStringField;
    ADS64rkey12: TIntegerField;
    ADS64LOCNAME_FOR_FORM: TStringField;
    ADS64MISC_BARCODE_LABLE: TStringField;
    ADS64SHP_ADDR1_FOR_FORM: TStringField;
    ADS64COFC_FORMAT_FILENAME: TStringField;
    ADS64S3_BARCODE_LABLE: TStringField;
    ADS64S4_BARCODE_LABLE: TStringField;
    ADS64PACKGE_BARCODE_LABLE: TStringField;
    ADS64OPEN_SOS: TSmallintField;
    ADS64PO_DATE: TDateTimeField;
    ADS64PO_NUMBER: TStringField;
    ADS64CURR_CODE: TStringField;
    ADS64CURR_NAME: TStringField;
    ADS64EMPLOYEE_NAME: TStringField;
    ADS64cartons_no: TIntegerField;
    ADS64rkey529_ptr: TIntegerField;
    ADS64DSDesigner: TIntegerField;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    ADS64name10: TStringField;
    ADS64delivery_no: TStringField;
    ADS64DSDesigner2: TFloatField;
    ADS64ORIG_CUSTOMER: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_PackSelect: TForm_PackSelect;

implementation

uses Demo,common;

{$R *.dfm}

procedure TForm_PackSelect.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_PackSelect.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_PackSelect.FormCreate(Sender: TObject);
begin
  dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
  dtpk1.Date := dtpk2.Date;
  field_name := 'cust_code';
end;

procedure TForm_PackSelect.dtpk1Exit(Sender: TObject);
begin
 ADS64.Close;
 ADS64.Parameters[0].Value := dtpk1.Date;
 ADS64.Parameters[1].Value := dtpk2.Date+1;
 ADS64.Prepared;
 ADS64.Open;
end;

procedure TForm_PackSelect.BitBtn4Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_PackSelect.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADS64.SQL.Text);
end;

procedure TForm_PackSelect.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ADS64.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_PackSelect.item_click(Sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm_PackSelect.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=self.item_click;
   self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm_PackSelect.BitBtn5Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_PackSelect.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  ADS64.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
 else
  ADS64.Filter := '';
end;

procedure TForm_PackSelect.BitBtn2Click(Sender: TObject);
begin
 Edit1.Text:='';
 Edit1.SetFocus;
end;

end.
