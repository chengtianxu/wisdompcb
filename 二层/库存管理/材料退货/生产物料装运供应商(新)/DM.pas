unit DM;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  TF_DM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS22: TADODataSet;
    DS22: TDataSource;
    ADS22RKEY: TAutoIncField;
    ADS22SOURCE_PTR: TIntegerField;
    ADS22INVENTORY_PTR: TIntegerField;
    ADS22INV_PART_NUMBER: TStringField;
    ADS22INV_PART_DESCRIPTION: TStringField;
    ADS22CODE: TStringField;
    ADS22SUPPLIER_NAME: TStringField;
    ADS22CONTACT_NAME_1: TStringField;
    ADS22BILLING_ADDRESS_1: TStringField;
    ADS22ship_DATE: TDateTimeField;
    ADS22PRICE: TBCDField;
    ADS22WAREHOUSE_CODE: TStringField;
    ADS22WAREHOUSE_NAME: TStringField;
    ADS22QUAN_TO_BE_SHIPPED: TBCDField;
    ADS22QUAN_RETURNED: TBCDField;
    ADS22BARCODE_ID: TStringField;
    ADS22TTYPE: TSmallintField;
    ADS22QUANTITY: TFloatField;
    ADS22UNIT_NAME: TStringField;
    ADS22rohs: TStringField;
    ADS22SUPPLIER2: TStringField;
    ADS22QUAN_ON_HAND: TBCDField;
    ADS22INVT_PTR: TIntegerField;
    ADS22REJ_PTR: TIntegerField;
    ADS22INV_TRAN_PTR: TIntegerField;
    ADS22TDATE: TDateTimeField;
    ADS22QUAN_REJD: TFloatField;
    ADS22FLAG: TStringField;
    ADS22REFERENCE_NUMBER: TStringField;
    ADS22v_state: TStringField;
    ADS22EMPL_CODE: TStringField;
    ADS22reject_description: TStringField;
    ADS22EMPL_CODE_1: TStringField;
    ADS22EMPL_PTR: TIntegerField;
    ADS22USER_PTR: TIntegerField;
    ADS22ename: TStringField;
    ADS22uname: TStringField;
    aqtmp1: TADOQuery;
    AQTmp: TADOQuery;
    ADS22TRAN_DATE: TDateTimeField;
    ADS22SHIPPING_METHOD: TWideStringField;
    ADOQuery1: TADOQuery;
    ADO96: TADOQuery;
    ADO96RKEY: TAutoIncField;
    ADO96INVT_PTR: TIntegerField;
    ADO96REJ_PTR: TIntegerField;
    ADO96INV_TRAN_PTR: TIntegerField;
    ADO96EMPL_PTR: TIntegerField;
    ADO96USER_PTR: TIntegerField;
    ADO96TDATE: TDateTimeField;
    ADO96QUAN_REJD: TFloatField;
    ADO96FLAG: TStringField;
    ADO96REFERENCE_NUMBER: TStringField;
    ADO96status: TWordField;
    ADO96reject_description: TStringField;
    ADO96user_full_name: TStringField;
    DS2: TDataSource;
    ADS22rkey5: TAutoIncField;
    ADS22rkey56: TAutoIncField;
    ADS22key17: TAutoIncField;
    ADS22rkey76: TAutoIncField;
    ADS22rkey96: TAutoIncField;
    ADO210: TADOQuery;
    ADO210RKEY: TAutoIncField;
    ADO210INVT_PTR: TIntegerField;
    ADO210PO_LINK_PTR: TIntegerField;
    ADO210D0022_PTR: TIntegerField;
    ADO210D0235_PTR: TIntegerField;
    ADO210QUANTITY: TFloatField;
    ADO210TDATE: TDateTimeField;
    ADO210DEBIT_MEMO_PTR: TIntegerField;
    ADO210empl_ptr: TIntegerField;
    ADO210type: TWordField;
    ADO96_1: TADOQuery;
    aq0493: TADOQuery;
    aq0493Company_Name: TStringField;
    aq0493Company_Name2: TStringField;
    aq0493Company_Name3: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    ADOQ11: TADOQuery;
    ADOQ11NOTE_PAD_LINE_1: TStringField;
    ADOQ11NOTE_PAD_LINE_2: TStringField;
    ADOQ11NOTE_PAD_LINE_3: TStringField;
    ADOQ11NOTE_PAD_LINE_4: TStringField;
    ADODS1: TADODataSet;
    ADODS1QUANTITY: TFloatField;
    ADODS1SHIPPING_METHOD: TStringField;
    ADODS1RKEY: TAutoIncField;
    ADODS1INV_PART_NUMBER: TStringField;
    ADODS1INV_PART_DESCRIPTION: TStringField;
    ADODS1EMPLOYEE_NAME: TStringField;
    ADODS1TRAN_DATE: TDateTimeField;
    ADODS1REFERENCE_NUMBER: TStringField;
    ADODS1rece_quan: TFloatField;
    ADODS1TDATE: TDateTimeField;
    ADODS1tax_2: TBCDField;
    ADODS1ABBR_NAME: TStringField;
    ADODS1CONTACT_NAME_1: TStringField;
    ADODS1BILLING_ADDRESS_1: TStringField;
    ADODS1CODE: TStringField;
    ADODS1rkey95: TAutoIncField;
    ADODS1QUAN_ORD: TFloatField;
    ADODS1no_tax_price: TBCDField;
    ADODS1price: TBCDField;
    ADODS1SUPPLIER_NAME: TStringField;
    ADODS1tax_amount: TFloatField;
    ADODS1no_tax_amount: TFloatField;
    ADODS1UNIT_NAME: TStringField;
    ADODS1CONVERSION_FACTOR: TFloatField;
    ADODS1PO_NUMBER: TStringField;
    ADODS1PO_DATE: TDateTimeField;
    ADODS1TTYPE: TSmallintField;
    ADODS1CURR_NAME: TStringField;
    ADODS1exch_rate: TBCDField;
    ADS22tax_amount: TFloatField;
    ADS22TAX_2: TBCDField;
    ADS22exch_rate: TBCDField;
    ADS22rkey1: TAutoIncField;
    ADS22CURR_CODE: TStringField;
    ADS22CURR_NAME: TStringField;
    ADS22t_price: TBCDField;
    ADS22PO_NUMBER: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DM: TF_DM;

implementation

{$R *.dfm}

end.
