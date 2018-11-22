unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO95: TADOQuery;
    ADO210: TADOQuery;
    aq0493: TADOQuery;
    ADO22: TADOStoredProc;
    ADO22rkey: TAutoIncField;
    ADO22source_ptr: TIntegerField;
    ADO22inventory_ptr: TIntegerField;
    ADO22inv_part_number: TStringField;
    ADO22inv_part_description: TStringField;
    ADO22code: TStringField;
    ADO22supplier_name: TStringField;
    ADO22CONTACT_NAME_1: TStringField;
    ADO22BILLING_ADDRESS_1: TStringField;
    ADO22BILLING_ADDRESS_2: TStringField;
    ADO22BILLING_ADDRESS_3: TStringField;
    ADO22warehouse_code: TStringField;
    ADO22warehouse_name: TStringField;
    ADO22quan_to_be_shipped: TFloatField;
    ADO22quan_returned: TFloatField;
    ADO22quantity: TFloatField;
    ADO2211: TADOStoredProc;
    ADO22price: TFloatField;
    DataSource2: TDataSource;
    ADOStoredProc1: TADOStoredProc;
    ADOStoredProc1QUANTITY: TFloatField;
    ADOStoredProc1SHIPPING_METHOD: TStringField;
    ADOStoredProc1INV_PART_NUMBER: TStringField;
    ADOStoredProc1INV_PART_DESCRIPTION: TStringField;
    ADOStoredProc1EMPLOYEE_NAME: TStringField;
    ADOStoredProc1PRICE: TFloatField;
    ADOStoredProc1tran_date: TDateTimeField;
    ADOStoredProc1REFERENCE_NUMBER: TStringField;
    ADOStoredProc1rece_quan: TFloatField;
    ADOStoredProc1TDATE: TDateTimeField;
    ADOStoredProc1ABBR_NAME: TStringField;
    ADOStoredProc1CONTACT_NAME_1: TStringField;
    ADOStoredProc1BILLING_ADDRESS_1: TStringField;
    ADOStoredProc1QUAN_ORD: TFloatField;
    ADOStoredProc1SUPPLIER_NAME: TStringField;
    ADOStoredProc1UNIT_NAME: TStringField;
    ADOStoredProc1conversion_factor: TFloatField;
    ADOStoredProc1PO_NUMBER: TStringField;
    ADOStoredProc1PO_DATE: TDateTimeField;
    ADOStoredProc1TTYPE: TSmallintField;
    ADOStoredProc1p_price: TFloatField;
    ADOStoredProc1rkey: TIntegerField;
    ADOStoredProc1code: TStringField;
    aq0493Company_Name: TStringField;
    aq0493Company_Name2: TStringField;
    aq0493Company_Name3: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    ADO2211NOTE_PAD_LINE_1: TStringField;
    ADO2211NOTE_PAD_LINE_2: TStringField;
    ADO2211NOTE_PAD_LINE_3: TStringField;
    ADO2211NOTE_PAD_LINE_4: TStringField;
    ADOStoredProc1rkey95: TIntegerField;
    ADO22ship_date: TDateTimeField;
    ADO22ttype: TWordField;
    ADO22barcode_id: TStringField;
    ADOStoredProc1CURR_NAME: TStringField;
    ADOStoredProc1TAX_2: TBCDField;
    ADOStoredProc1EXCHANGE_RATE: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
