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
    ADOInv_Stock: TADOQuery;
    ADOInv_Stockrkey: TAutoIncField;
    ADOInv_StockINV_PART_NUMBER: TStringField;
    ADOInv_StockINV_NAME: TStringField;
    ADOInv_StockINV_DESCRIPTION: TStringField;
    ADOInv_StockGROUP_DESC: TStringField;
    ADOInv_StockUNIT_NAME: TStringField;
    ADOInv_Stockquantity: TBCDField;
    ADOInv_StockLOCATION: TStringField;
    ADOInv_Stockstock_area: TFloatField;
    ADOInv_Stockstock_weight: TWideStringField;
    ADOInv_Stockstock_date: TDateTimeField;
    ADOInv_Stockemployee_name: TStringField;
    ADOStock1rkey: TAutoIncField;
    ADOStock1INV_PART_NUMBER: TStringField;
    ADOStock1INV_NAME: TStringField;
    ADOStock1INV_DESCRIPTION: TStringField;
    ADOStock1GROUP_DESC: TStringField;
    ADOStock1UNIT_NAME: TStringField;
    ADOStock1quantity: TBCDField;
    ADOStock1LOCATION: TStringField;
    ADOStock1stock_area: TFloatField;
    ADOStock1stock_weight: TWideStringField;
    ADOStock1stock_date: TDateTimeField;
    ADOStock1employee_name: TStringField;
    ADOTmp2: TADOQuery;
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
