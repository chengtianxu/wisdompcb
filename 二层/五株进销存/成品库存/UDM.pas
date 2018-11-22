unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOStock1: TADOQuery;
    DataSource1: TDataSource;
    ADOTmp1: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    ADO05: TADOQuery;
    ADOproduct_stock: TADOQuery;
    ADOTmp2: TADOQuery;
    ADOproduct_stockrkey: TAutoIncField;
    ADOproduct_stockMANU_PART_NUMBER: TStringField;
    ADOproduct_stockMANU_PART_DESC: TStringField;
    ADOproduct_stockANALYSIS_CODE_2: TStringField;
    ADOproduct_stockPROD_CODE: TStringField;
    ADOproduct_stockLAYERS: TWordField;
    ADOproduct_stockPRODUCT_NAME: TStringField;
    ADOproduct_stockCUST_CODE: TStringField;
    ADOproduct_stockABBR_NAME: TStringField;
    ADOproduct_stockquantity: TIntegerField;
    ADOproduct_stockunit_sq: TFloatField;
    ADOproduct_stockstock_area: TBCDField;
    ADOproduct_stockpcs_weight: TFloatField;
    ADOproduct_stockstock_weight: TBCDField;
    ADOproduct_stockLOCATION: TStringField;
    ADOproduct_stockstock_date: TDateTimeField;
    ADOproduct_stockemployee_name: TStringField;
    ADOStock1rkey: TAutoIncField;
    ADOStock1MANU_PART_NUMBER: TStringField;
    ADOStock1MANU_PART_DESC: TStringField;
    ADOStock1ANALYSIS_CODE_2: TStringField;
    ADOStock1PROD_CODE: TStringField;
    ADOStock1LAYERS: TWordField;
    ADOStock1PRODUCT_NAME: TStringField;
    ADOStock1CUST_CODE: TStringField;
    ADOStock1ABBR_NAME: TStringField;
    ADOStock1quantity: TIntegerField;
    ADOStock1unit_sq: TFloatField;
    ADOStock1stock_area: TBCDField;
    ADOStock1pcs_weight: TFloatField;
    ADOStock1stock_weight: TBCDField;
    ADOStock1LOCATION: TStringField;
    ADOStock1stock_date: TDateTimeField;
    ADOStock1employee_name: TStringField;
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
