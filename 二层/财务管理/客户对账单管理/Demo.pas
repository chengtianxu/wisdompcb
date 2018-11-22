unit Demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS236: TADODataSet;
    ADS236VOUCHER: TStringField;
    ADS236ENTERED_DT: TDateTimeField;
    ADS236STATUS: TSmallintField;
    ADS236EMPLOYEE_NAME: TStringField;
    ADS236ENTERED_BY_EMPL_PTR: TIntegerField;
    ADS236CUSTOMER_PTR: TIntegerField;
    ADS236CURRENCY_PTR: TIntegerField;
    ADS236EXCHANGE_RATE: TFloatField;
    ADS236ABBR_NAME: TStringField;
    ADS236CUST_CODE: TStringField;
    ADS236CUSTOMER_NAME: TStringField;
    ADS236v_status: TStringField;
    ADS236CURR_CODE: TStringField;
    ADS236CURR_NAME: TStringField;
    ADO236: TADOQuery;
    ADO236RKEY: TIntegerField;
    ADO236VOUCHER: TStringField;
    ADO236ENTERED_BY_EMPL_PTR: TIntegerField;
    ADO236AUDITED_BY_EMPL_PTR: TIntegerField;
    ADO236ENTERED_DT: TDateTimeField;
    ADO236CUSTOMER_PTR: TIntegerField;
    ADO236CURRENCY_PTR: TIntegerField;
    ADO236STATUS: TSmallintField;
    ADO236EXCHANGE_RATE: TFloatField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADO236BATCH_NUMBER: TStringField;
    ADS236BATCH_NUMBER: TStringField;
    ADO236FYEAR: TIntegerField;
    ADO236PERIOD: TSmallintField;
    ADS236FYEAR: TIntegerField;
    ADS236PERIOD: TSmallintField;
    ADS236TOOL_AMOUNT: TBCDField;
    ADS236OTHERS_AMOUNT: TBCDField;
    ADS236SHIP_AMOUNT: TBCDField;
    ADS236TAX_AMOUNT: TBCDField;
    ADS236RECEIVABLE_AMOUNT: TBCDField;
    ADO236TOOL_AMOUNT: TBCDField;
    ADO236OTHERS_AMOUNT: TBCDField;
    ADO236SHIP_AMOUNT: TBCDField;
    ADO236TAX_AMOUNT: TBCDField;
    ADO236RECEIVABLE_AMOUNT: TBCDField;
    ADS236rkey: TIntegerField;
    ADO237: TADOQuery;
    ADO237rkey: TAutoIncField;
    ADO237rkey236_ptr: TIntegerField;
    ADO237SO_SHP_PTR: TIntegerField;
    ADO237RMA_PTR: TIntegerField;
    ADO237QUANTITY: TIntegerField;
    ADO237DEBIT_PTR: TIntegerField;
    ADO237recon_amount: TBCDField;
    ADO237INVOICE_PTR: TIntegerField;
    ADO237delivery_no: TStringField;
    ADO237date_sailing: TDateTimeField;
    ADO237SALES_ORDER: TStringField;
    ADO237MANU_PART_NUMBER: TStringField;
    ADO237MANU_PART_DESC: TStringField;
    ADO237PO_NUMBER: TStringField;
    ADO237abbr_name: TStringField;
    ADO237PARTS_ALLOC: TFloatField;
    ADO237RUSH_CHARGE: TBCDField;
    ADO237invoice_number: TStringField;
    ADO237TOOLING_CHARGES: TBCDField;
    ADO237ship_tax_amount: TBCDField;
    ADO237ship_amount: TBCDField;
    ADO237FED_TAX_AMOUNT: TBCDField;
    ADO237INVOICE_TOTAL: TBCDField;
    ADO237ch_amount: TFloatField;
    ADO237DSDesigner: TStringField;
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
