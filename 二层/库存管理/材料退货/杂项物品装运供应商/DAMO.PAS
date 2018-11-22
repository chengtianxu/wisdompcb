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
    aq0493: TADOQuery;
    ADO2211: TADOStoredProc;
    DataSource2: TDataSource;
    ADO235: TADOQuery;
    ADO235DESCRIPTION: TStringField;
    ADO235GUI_GE: TStringField;
    ADO235quan_to_ship: TFloatField;
    ADO235ABBR_NAME: TStringField;
    ADO235CODE: TStringField;
    ADO235SUPPLIER_NAME: TStringField;
    ADO235PO_NUMBER: TStringField;
    ADO235UNIT_NAME: TStringField;
    ADO235UNIT_PRICE: TFloatField;
    ADO235QUAN_ORD: TFloatField;
    ADO235QUANTITY_RECEIVED: TFloatField;
    ADO235quan_returned: TFloatField;
    ADO235DEL_DATE: TDateTimeField;
    ADO235QUAN_RECD: TFloatField;
    ADO235QUAN_RETN: TFloatField;
    ADO235DESCRIPTION2: TStringField;
    ADO235rkey: TAutoIncField;
    ADO235BILLING_ADDRESS_1: TStringField;
    ADO235SUPPIER_CONTACT: TStringField;
    ADO235QUAN_ON_HAND: TFloatField;
    ADOQuery2: TADOQuery;
    ADOQuery2EMPLOYEE_NAME: TStringField;
    ADOQuery2TRAN_DATE: TDateTimeField;
    ADOQuery2QUANTITY: TFloatField;
    ADOQuery2DESCRIPTION: TStringField;
    ADOQuery2GUI_GE: TStringField;
    ADOQuery2DESCRIPTION2: TStringField;
    ADOQuery2UNIT_PRICE: TFloatField;
    ADOQuery2QUAN_RECD: TFloatField;
    ADOQuery2QUAN_ON_HAND: TFloatField;
    ADOQuery2PO_NUMBER: TStringField;
    ADOQuery2DEL_DATE: TDateTimeField;
    ADOQuery2UNIT_NAME: TStringField;
    ADOQuery2SUPPIER_CONTACT: TStringField;
    ADOQuery2CODE: TStringField;
    ADOQuery2SUPPLIER_NAME: TStringField;
    ADOQuery2ABBR_NAME: TStringField;
    ADOQuery2BILLING_ADDRESS_1: TStringField;
    ADOQuery2CONTACT_NAME_1: TStringField;
    ADOQuery2rkey: TIntegerField;
    ADOQuery2SHIPPING_METHOD: TStringField;
    ADOQuery2REFERENCE_NUMBER: TStringField;
    ADOQuery2QUAN_ORD: TFloatField;
    ADOQuery2QUANTITY_RECEIVED: TFloatField;
    ADO235state_tax: TBCDField;
    ADOQuery2state_tax: TBCDField;
    ADOQuery2CREATE_DATE: TDateTimeField;
    ADOQuery2GRN_NUMBER: TStringField;
    ADOQuery2DELIVER_NUMBER: TStringField;
    ADO235GRN_NUMBER: TStringField;
    ADO235DELIVER_NUMBER: TStringField;
    ADO235CREATE_DATE: TDateTimeField;
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
    ADO235D0072_PTR: TIntegerField;
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
