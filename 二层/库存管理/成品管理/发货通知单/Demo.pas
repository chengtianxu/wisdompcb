unit Demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO530: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADO64: TADOQuery;
    ADOQuery1: TADOQuery;
    ADO529: TADOQuery;
    ADO529RKEY: TAutoIncField;
    ADO529shipadvice_no: TStringField;
    ADO529SHIP_ADDR_PTR: TIntegerField;
    ADO529empl_ptr: TIntegerField;
    ADO529ATTN: TStringField;
    ADO529ATTN1: TStringField;
    ADO529ATTN_CC: TStringField;
    ADO529ADV_FROM: TStringField;
    ADO529ADV_FROM_CC: TStringField;
    ADO529SHIP_FROM: TStringField;
    ADO529TO_PORT: TStringField;
    ADO529FAX_NO: TStringField;
    ADO529SHIP_TO_PHONE: TStringField;
    ADO529FAX_TO: TStringField;
    ADO529TDATE: TDateTimeField;
    ADO529MAWB_NO: TStringField;
    ADO529HAWB_NO: TStringField;
    ADO529FLIGHT_NO: TStringField;
    ADO529DEPA_DATE: TDateTimeField;
    ADO529TSTATUS: TWordField;
    ADO529sstatus: TStringField;
    ADO529cust_code: TStringField;
    ADO529customer_name: TStringField;
    ADO529APPLY_IN_TRANSIT: TWordField;
    ADO529location: TStringField;
    ADO529SHIP_TO_CONTACT: TStringField;
    ADO529cod_flag: TStringField;
    ADO529employee_name: TStringField;
    ADO529SHIP_TO_FAX: TStringField;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    AQR530: TADOQuery;
    AQR530rkey529_ptr: TIntegerField;
    AQR530rkey64_PTR: TIntegerField;
    AQR530cartons_no: TIntegerField;
    AQR530weight: TBCDField;
    AQR530reference_number: TStringField;
    AQR530remark1: TStringField;
    AQR530remark2: TStringField;
    AQR530remark3: TStringField;
    AQR530remark4: TStringField;
    QRY64: TADOQuery;
    QRY64RKEY: TAutoIncField;
    QRY64SO_PTR: TIntegerField;
    QRY64packing_list_ptr: TIntegerField;
    QRY64rkey529_ptr: TIntegerField;
    QRY64PACKING_SLIP_FLAG: TStringField;
    QRY64DATE_SHIPPED: TDateTimeField;
    QRY64SALES_ORDER: TStringField;
    QRY64PO_NUMBER: TStringField;
    QRY64PO_DATE: TDateTimeField;
    QRY64EMPLOYEE_NAME: TStringField;
    QRY64QUAN_SHIPPED: TIntegerField;
    QRY64ovsh_qty: TIntegerField;
    QRY64FOB: TStringField;
    QRY64REFERENCE_NUMBER: TStringField;
    QRY64MANU_PART_NUMBER: TStringField;
    QRY64MANU_PART_DESC: TStringField;
    QRY64weigth: TBCDField;
    QRY64assigntype: TStringField;
    ADO530rkey529_ptr: TIntegerField;
    ADO530rkey64_PTR: TIntegerField;
    ADO530cartons_no: TIntegerField;
    ADO530weight: TBCDField;
    ADO530reference_number: TStringField;
    ADO530remark1: TStringField;
    ADO530remark2: TStringField;
    ADO530remark3: TStringField;
    ADO530remark4: TStringField;
    ADO530rkey: TAutoIncField;
    ADO530rkey529: TIntegerField;
    ADO530SHIPMENT_NO: TSmallintField;
    ADO530sales_order: TStringField;
    ADO530manu_part_number: TStringField;
    ADO530delivery_no: TStringField;
    ADS529: TADOQuery;
    ADS529RKEY: TAutoIncField;
    ADS529shipadvice_no: TStringField;
    ADS529SHIP_ADDR_PTR: TIntegerField;
    ADS529empl_ptr: TIntegerField;
    ADS529ATTN: TStringField;
    ADS529ATTN1: TStringField;
    ADS529ATTN_CC: TStringField;
    ADS529ADV_FROM: TStringField;
    ADS529ADV_FROM_CC: TStringField;
    ADS529SHIP_FROM: TStringField;
    ADS529TO_PORT: TStringField;
    ADS529FAX_NO: TStringField;
    ADS529SHIP_TO_PHONE: TStringField;
    ADS529FAX_TO: TStringField;
    ADS529TDATE: TDateTimeField;
    ADS529MAWB_NO: TStringField;
    ADS529HAWB_NO: TStringField;
    ADS529FLIGHT_NO: TStringField;
    ADS529DEPA_DATE: TDateTimeField;
    ADS529TSTATUS: TWordField;
    ADS529sstatus: TStringField;
    ADS529cust_code: TStringField;
    ADS529customer_name: TStringField;
    ADS529APPLY_IN_TRANSIT: TWordField;
    ADS529location: TStringField;
    ADS529SHIP_TO_CONTACT: TStringField;
    ADS529cod_flag: TStringField;
    ADS529employee_name: TStringField;
    ADS529SHIP_TO_FAX: TStringField;
    DataSource3: TDataSource;
    ADO530PART_PRICE: TFloatField;
    ADO530weigth: TBCDField;
    ADO530QUAN_SHIPPED: TIntegerField;
    ADO64SALES_ORDER: TStringField;
    ADO64COMMISION_ON_TOOLING: TStringField;
    ADO64SCH_DATE: TDateTimeField;
    ADO64ITEM_NBR: TStringField;
    ADO64COD_FLAG: TStringField;
    ADO64rkey60: TIntegerField;
    ADO64PARTS_ORDERED: TFloatField;
    ADO64PARTS_SHIPPED: TFloatField;
    ADO64PARTS_RETURNED: TFloatField;
    ADO64SHIPPING_METHOD: TStringField;
    ADO64CURRENCY_PTR: TIntegerField;
    ADO64PART_PRICE: TFloatField;
    ADO64STATUS: TWordField;
    ADO64fob: TStringField;
    ADO64REFERENCE_NUMBER: TStringField;
    ADO64CUST_SHIP_ADDR_PTR: TIntegerField;
    ADO64CUSTOMER_PTR: TIntegerField;
    ADO64PURCHASE_ORDER_PTR: TIntegerField;
    ADO64CUST_PART_PTR: TIntegerField;
    ADO64rkey15: TIntegerField;
    ADO64WAREHOUSE_CODE: TStringField;
    ADO64abbr_name: TStringField;
    ADO64MANU_PART_NUMBER: TStringField;
    ADO64MANU_PART_DESC: TStringField;
    ADO64ANALYSIS_CODE_2: TStringField;
    ADO64CUST_CODE: TStringField;
    ADO64CUSTOMER_NAME: TStringField;
    ADO64DO_SMOOTHING: TWordField;
    ADO64INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADO64CUSTOMER_TYPE: TIntegerField;
    ADO64SHIPMENT_NO: TSmallintField;
    ADO64QUAN_SHIPPED: TIntegerField;
    ADO64DATE_ASSIGN: TDateTimeField;
    ADO64ovsh_discount: TBCDField;
    ADO64DATE_SHIPPED: TDateTimeField;
    ADO64PACKING_SLIP_FLAG: TStringField;
    ADO64total_case: TFloatField;
    ADO64rkey64: TIntegerField;
    ADO64packing_list_ptr: TIntegerField;
    ADO64weigth: TBCDField;
    ADO64assigntype: TStringField;
    ADO64SHIP_TO_ADDRESS_1: TStringField;
    ADO64SHIP_TO_CONTACT: TStringField;
    ADO64ZIP: TStringField;
    ADO64SHIP_TO_PHONE: TStringField;
    ADO64LOCATION: TStringField;
    ADO64STATE: TStringField;
    ADO64rkey12: TIntegerField;
    ADO64LOCNAME_FOR_FORM: TStringField;
    ADO64MISC_BARCODE_LABLE: TStringField;
    ADO64SHP_ADDR1_FOR_FORM: TStringField;
    ADO64COFC_FORMAT_FILENAME: TStringField;
    ADO64S3_BARCODE_LABLE: TStringField;
    ADO64S4_BARCODE_LABLE: TStringField;
    ADO64PACKGE_BARCODE_LABLE: TStringField;
    ADO64OPEN_SOS: TSmallintField;
    ADO64PO_DATE: TDateTimeField;
    ADO64PO_NUMBER: TStringField;
    ADO64CURR_CODE: TStringField;
    ADO64CURR_NAME: TStringField;
    ADO64EMPLOYEE_NAME: TStringField;
    ADS529rkey10: TAutoIncField;
    ADO529rkey10: TAutoIncField;
    QRY64rkey15: TIntegerField;
    AQ530: TADOQuery;
    AQ530rkey529_ptr: TIntegerField;
    AQ530rkey64_PTR: TIntegerField;
    AQ530cartons_no: TIntegerField;
    AQ530weight: TBCDField;
    AQ530reference_number: TStringField;
    AQ530remark1: TStringField;
    AQ530remark2: TStringField;
    AQ530remark3: TStringField;
    AQ530remark4: TStringField;
    AQ64: TADOQuery;
    QRY64ANALYSIS_CODE_2: TStringField;
    ADO530total_case: TFloatField;
    ADO530DATE_ASSIGN: TDateTimeField;
    ADS529IntegerField: TIntegerField;
    ADS529IntegerField2: TIntegerField;
    ADS529Field: TFloatField;
    ADS529FloatField: TFloatField;
    ADS529FloatField2: TFloatField;
    QRY64cartons_no: TIntegerField;
    ADO64cartons_no: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADO530quan_declare: TIntegerField;
    ADO64rkey529_ptr: TIntegerField;
    ADO64DSDesigner: TIntegerField;
    AQ530quan_declare: TIntegerField;
    QRY64DSDesigner: TIntegerField;
    QRY64quan_declare: TIntegerField;
    AQR530quan_declare: TIntegerField;
    ADO530pcs_weight: TBCDField;
    ADO530manu_part_desc: TStringField;
    ADO530ANALYSIS_CODE_2: TStringField;
    ADO530ANALYSIS_CODE_5: TStringField;
    AQ64RKEY: TAutoIncField;
    AQ64SO_PTR: TIntegerField;
    AQ64packing_list_ptr: TIntegerField;
    AQ64rkey529_ptr: TIntegerField;
    AQ64PACKING_SLIP_FLAG: TStringField;
    AQ64DATE_SHIPPED: TDateTimeField;
    AQ64QUAN_SHIPPED: TIntegerField;
    AQ64cartons_no: TIntegerField;
    AQ64ovsh_qty: TIntegerField;
    AQ64weigth: TBCDField;
    AQ64report_unit_value1: TBCDField;
    AQ64reference_number: TStringField;
    procedure ADS529CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADS529CalcFields(DataSet: TDataSet);
begin
 with dm.ADOQuery1 do
 begin
   Close;
   SQL.Clear;
   SQL.Add('select sum(data0530.quan_declare* Data0064.PART_PRICE) AS total_case,');
   SQL.Add('sum(data0530.quan_declare*data0064.REPORT_UNIT_VALUE1*0.001) as weigth,');
   SQL.Add('sum(Data0530.cartons_no) as total_cartons,sum(Data0530.weight) as mweight,sum(Data0530.quan_declare) as total_quan from Data0530');
   SQL.Add('inner join data0064 on');
   SQL.Add('data0530.rkey64_ptr=data0064.rkey');
   SQL.Add('where data0530.rkey529_ptr='+dm.ADS529RKEY.AsString);
   Open;
 end;
 if not dm.ADOQuery1.IsEmpty then
 begin
   dm.ADS529IntegerField.Value:=dm.ADOQuery1.FieldValues['total_quan'];
   dm.ADS529IntegerField2.Value:=dm.ADOQuery1.FieldValues['total_cartons'];;
   dm.ADS529Field.Value:=dm.ADOQuery1.FieldValues['total_case'];
   dm.ADS529FloatField.Value:=dm.ADOQuery1.FieldValues['weigth'];
   dm.ADS529FloatField2.Value:=dm.ADOQuery1.FieldValues['mweight'];
 end;
end;



end.
