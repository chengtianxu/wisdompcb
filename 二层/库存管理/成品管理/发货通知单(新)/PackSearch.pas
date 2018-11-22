unit PackSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ComCtrls, ADODB;

type
  TForm_PackSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    BtnBrush: TBitBtn;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    CheckBox1: TCheckBox;
    ads64: TADODataSet;
    ads64SALES_ORDER: TStringField;
    ads64COMMISION_ON_TOOLING: TStringField;
    ads64SCH_DATE: TDateTimeField;
    ads64ITEM_NBR: TStringField;
    ads64COD_FLAG: TStringField;
    ads64rkey60: TIntegerField;
    ads64PARTS_ORDERED: TFloatField;
    ads64PARTS_SHIPPED: TFloatField;
    ads64PARTS_RETURNED: TFloatField;
    ads64SHIPPING_METHOD: TStringField;
    ads64CURRENCY_PTR: TIntegerField;
    ads64PART_PRICE: TFloatField;
    ads64STATUS: TWordField;
    ads64fob: TStringField;
    ads64REFERENCE_NUMBER: TStringField;
    ads64CUST_SHIP_ADDR_PTR: TIntegerField;
    ads64CUSTOMER_PTR: TIntegerField;
    ads64PURCHASE_ORDER_PTR: TIntegerField;
    ads64CUST_PART_PTR: TIntegerField;
    ads64rkey15: TIntegerField;
    ads64WAREHOUSE_CODE: TStringField;
    ads64abbr_name: TStringField;
    ads64MANU_PART_NUMBER: TStringField;
    ads64MANU_PART_DESC: TStringField;
    ads64ANALYSIS_CODE_2: TStringField;
    ads64CUST_CODE: TStringField;
    ads64CUSTOMER_NAME: TStringField;
    ads64DO_SMOOTHING: TWordField;
    ads64INVOICE_NOTE_PAD_PTR: TIntegerField;
    ads64CUSTOMER_TYPE: TIntegerField;
    ads64SHIPMENT_NO: TSmallintField;
    ads64QUAN_SHIPPED: TIntegerField;
    ads64cartons_no: TIntegerField;
    ads64DATE_ASSIGN: TDateTimeField;
    ads64ovsh_discount: TBCDField;
    ads64DATE_SHIPPED: TDateTimeField;
    ads64PACKING_SLIP_FLAG: TStringField;
    ads64total_case: TFloatField;
    ads64rkey64: TIntegerField;
    ads64packing_list_ptr: TIntegerField;
    ads64rkey529_ptr: TIntegerField;
    ads64DSDesigner: TIntegerField;
    ads64weigth: TBCDField;
    ads64assigntype: TStringField;
    ads64SHIP_TO_ADDRESS_1: TStringField;
    ads64SHIP_TO_CONTACT: TStringField;
    ads64ZIP: TStringField;
    ads64SHIP_TO_PHONE: TStringField;
    ads64LOCATION: TStringField;
    ads64STATE: TStringField;
    ads64rkey12: TIntegerField;
    ads64LOCNAME_FOR_FORM: TStringField;
    ads64MISC_BARCODE_LABLE: TStringField;
    ads64SHP_ADDR1_FOR_FORM: TStringField;
    ads64COFC_FORMAT_FILENAME: TStringField;
    ads64S3_BARCODE_LABLE: TStringField;
    ads64S4_BARCODE_LABLE: TStringField;
    ads64PACKGE_BARCODE_LABLE: TStringField;
    ads64OPEN_SOS: TSmallintField;
    ads64PO_DATE: TDateTimeField;
    ads64PO_NUMBER: TStringField;
    ads64CURR_CODE: TStringField;
    ads64CURR_NAME: TStringField;
    ads64EMPLOYEE_NAME: TStringField;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    ads64delivery_no: TStringField;
    ads64cust_decl: TStringField;
    ads64pcs_weight: TBCDField;
    ads64ORIG_CUSTOMER: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    sql_text:string;
  public
    { Public declarations }
  end;

var
  Form_PackSearch: TForm_PackSearch;

implementation

uses Demo, PackList,common;

{$R *.dfm}

procedure TForm_PackSearch.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;


procedure TForm_PackSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(Self.ads64.CommandText);
 if (key=13) and (not self.ads64.IsEmpty) then  button1click(sender);
end;

procedure TForm_PackSearch.DBGrid1TitleClick(Column: TColumn);
begin
  self.ads64.IndexFieldNames:=Column.FieldName;
  if (PreColumn.FieldName<>column.FieldName)and(column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    label2.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_PackSearch.Edit1Change(Sender: TObject);
begin
 DBGrid1.SelectedRows.Clear;
 if trim(Edit1.text)<>'' then
   dbgrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_PackSearch.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1click(sender);
end;

procedure TForm_PackSearch.FormActivate(Sender: TObject);
begin
 PreColumn := DBGrid1.Columns[0];
 sql_text:=self.ads64.CommandText;
end;

procedure TForm_PackSearch.FormCreate(Sender: TObject);
begin
  dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
  dtpk1.Date := dtpk2.Date-1;
end;

procedure TForm_PackSearch.dtpk1Exit(Sender: TObject);
begin
 ads64.Close;
 ads64.Parameters[1].Value := dtpk1.Date;
 ads64.Parameters[2].Value := dtpk2.Date+1;
 ads64.Prepared;
 ads64.Open;
 Button1.Enabled:=not ads64.IsEmpty;
end;

procedure TForm_PackSearch.FormShow(Sender: TObject);
begin
  Button1.Enabled:=not ads64.IsEmpty;
end;

procedure TForm_PackSearch.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads64RKEY64.Value;
  self.ads64.DisableControls;
  ads64.First;
  while not ads64.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads64.Next;
  end;
  self.ads64.EnableControls;
  ads64.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads64RKEY64.Value;
  self.ads64.DisableControls;
  ads64.First;
  while not ads64.Eof do
  begin
   if self.ads64RKEY64.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads64.Next;
  end;
  self.ads64.EnableControls;
  ads64.Locate('rkey',rkey,[]);
 end;
end;

end.
