unit PackDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Menus,ComObj, Excel2000;

type
  TForm_PackDetail = class(TForm)
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DataSource1: TDataSource;
    ADS64: TADOQuery;
    PopupMenu1: TPopupMenu;
    ADS64SO_PTR: TIntegerField;
    ADS64ENT_EMPL_PTR: TIntegerField;
    ADS64ENT_CSI_USER_PTR: TIntegerField;
    ADS64packing_list_ptr: TIntegerField;
    ADS64DATE_ASSIGN: TDateTimeField;
    ADS64DATE_SHIPPED: TDateTimeField;
    ADS64PACKING_SLIP_FLAG: TStringField;
    ADS64SHIPMENT_NO: TSmallintField;
    ADS64QUAN_SHIPPED: TIntegerField;
    ADS64QUAN_CREDITED: TIntegerField;
    ADS64RMA_PTR: TIntegerField;
    ADS64part_price: TFloatField;
    ADS64rush_charge: TBCDField;
    ADS64prod_tax_flag: TStringField;
    ADS64tool_tax_flag: TStringField;
    ADS64discount: TBCDField;
    ADS64TAX_2: TBCDField;
    ADS64ovsh_qty: TIntegerField;
    ADS64ovsh_discount: TBCDField;
    ADS64reg_tax_fixed_unused: TWordField;
    ADS64REMARK: TStringField;
    ADS64assign_type: TWordField;
    ADS64REPORT_UNIT_VALUE1: TBCDField;
    ADS64cust_decl: TStringField;
    ADS64GLPTR_STATUS: TBooleanField;
    ADS64GL_HEADER_PTR2: TIntegerField;
    ADS64GLPTR_STAUTS2: TBooleanField;
    ADS64rkey529_ptr: TIntegerField;
    ADS64cartons_no: TIntegerField;
    ADS64shipadvice_no: TStringField;
    ADS64SHIP_ADDR_PTR: TIntegerField;
    ADS64empl_ptr: TIntegerField;
    ADS64ATTN: TStringField;
    ADS64ATTN1: TStringField;
    ADS64ATTN_CC: TStringField;
    ADS64ADV_FROM: TStringField;
    ADS64ADV_FROM_CC: TStringField;
    ADS64SHIP_FROM: TStringField;
    ADS64TO_PORT: TStringField;
    ADS64FAX_NO: TStringField;
    ADS64SHIP_TO_PHONE: TStringField;
    ADS64FAX_TO: TStringField;
    ADS64TDATE: TDateTimeField;
    ADS64MAWB_NO: TStringField;
    ADS64HAWB_NO: TStringField;
    ADS64FLIGHT_NO: TStringField;
    ADS64DEPA_DATE: TDateTimeField;
    ADS64TSTATUS: TWordField;
    ADS64rkey64_PTR: TIntegerField;
    ADS64weight: TBCDField;
    ADS64reference_number: TStringField;
    ADS64remark1: TStringField;
    ADS64remark2: TStringField;
    ADS64remark3: TStringField;
    ADS64remark4: TStringField;
    ADS64quan_declare: TIntegerField;
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
    ADS64STATUS: TWordField;
    ADS64fob: TStringField;
    ADS64REFERENCE_NUMBER_1: TStringField;
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
    ADS64name10: TStringField;
    ADS64delivery_no: TStringField;
    ADS64total_case: TFloatField;
    ADS64SHIP_TO_ADDRESS_1: TStringField;
    ADS64SHIP_TO_CONTACT: TStringField;
    ADS64ZIP: TStringField;
    ADS64SHIP_TO_PHONE_1: TStringField;
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
    ADS64total_amount: TBCDField;
    ADS64nweight: TBCDField;
    ADS64DSDesigner: TStringField;
    ADS64date_sailing: TDateTimeField;
    ADS64DSDesigner2: TBCDField;
    ADS64ORIG_CUSTOMER: TStringField;
    ADS64layers: TWordField;
    ADS64product_name: TStringField;
    ADS64DSDesigner3: TFloatField;
    ADS64DSDesigner4: TBCDField;
    ADS64names: TMemoField;
    ADS64EXCH_RATE: TFloatField;
    ADS64part_price_60: TFloatField;
    ADS64total_rmb: TFloatField;
    ADS64DSDesigner5: TBCDField;
    ADS64rkey64: TAutoIncField;
    procedure BitBtn1Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ADS64namesGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADS64DSDesignerChange(Sender: TField);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_PackDetail: TForm_PackDetail;

implementation

uses Demo,common;

{$R *.dfm}
procedure TForm_PackDetail.CopyDbDataToExcel(Args:array of const);
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

procedure TForm_PackDetail.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm_PackDetail.FormCreate(Sender: TObject);
begin
 dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
 dtpk1.Date := dtpk2.Date;
 field_name := 'shipadvice_no'
end;

procedure TForm_PackDetail.BitBtn4Click(Sender: TObject);
begin
  CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_PackDetail.BitBtn5Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_PackDetail.item_click(Sender:TObject);
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

procedure TForm_PackDetail.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADS64.SQL.Text);
end;

procedure TForm_PackDetail.DBGrid1TitleClick(Column: TColumn);
begin
 if column.FieldName<>field_name then //(column.ReadOnly) and (
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ADS64.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_PackDetail.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  ADS64.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
 else
  ADS64.Filter := '';
end;

procedure TForm_PackDetail.BitBtn2Click(Sender: TObject);
begin
 Edit1.Text:='';
 Edit1.SetFocus;
end;

procedure TForm_PackDetail.dtpk1Exit(Sender: TObject);
begin
 ADS64.Close;
 ADS64.Parameters[0].Value := dtpk1.Date;
 ADS64.Parameters[1].Value := dtpk2.Date;
 ADS64.Prepared;
 ADS64.Open;
end;

procedure TForm_PackDetail.FormActivate(Sender: TObject);
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



procedure TForm_PackDetail.ADS64namesGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := Copy(ADS64names.AsString, 1, 50);
end;

procedure TForm_PackDetail.ADS64DSDesignerChange(Sender: TField);
begin
 with dm.ADOQuery1 do  //530的报关单号字段与64表的cust_decl字段同步
 begin
  Close;
  sql.Text:='update data0064 set cust_decl='+quotedstr(ADS64DSDesigner.NewValue)+
            ' where rkey='+ads64rkey64.asstring;
  ExecSQL;
 end;
end;

end.
