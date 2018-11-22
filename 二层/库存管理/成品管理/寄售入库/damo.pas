unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS153: TADODataSet;
    DataSource1: TDataSource;
    ADS153MANU_PART_NUMBER: TStringField;
    ADS153MANU_PART_DESC: TStringField;
    ADS153ANALYSIS_CODE_2: TStringField;
    ADS153CUST_CODE: TStringField;
    ADS153ABBR_NAME: TStringField;
    ADS153PO_NUMBER: TStringField;
    ADS153MFG_DATE: TDateTimeField;
    ADS153delivery_no: TStringField;
    ADS153EMPLOYEE_NAME: TStringField;
    ADS153TAX_RATE: TBCDField;
    ADS153CURR_NAME: TStringField;
    ADS153EXCH_RATE: TBCDField;
    ADS153REMARK: TStringField;
    ADS153QUANTITY: TIntegerField;
    ADS153QTY_ON_HAND: TIntegerField;
    ADS153rkey: TIntegerField;
    ADS153price: TFloatField;
    ADOQuery1: TADOQuery;
    ADS153CUSTOMER_NAME: TStringField;
    ADS153CUSTOMER_PTR: TIntegerField;
    ADS153CUSTPART_PTR: TIntegerField;
    ADS153CURRENCY_PTR: TIntegerField;
    ADS153CURR_CODE: TStringField;
    ADS153SALES_ORDER: TStringField;
    ADS153unit_sq: TFloatField;
    ADS153inArea: TFloatField;
    ADS153SHIP_PTR: TIntegerField;
    ADS153PROD_CODE: TStringField;
    ADS153PRODUCT_NAME: TStringField;
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
