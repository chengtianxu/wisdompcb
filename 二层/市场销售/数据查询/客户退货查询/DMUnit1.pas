unit DMUnit1;

//Provider=SQLOLEDB.1;Password=123789;Persist Security Info=True;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=W206

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)                            
    ADOConnection1: TADOConnection;
    wzcx98_1: TADOStoredProc;
    DataSource1: TDataSource;
    wzcx98_1RMA_NUMBER: TStringField;
    wzcx98_1CUST_CODE: TStringField;
    wzcx98_1abbr_name: TStringField;
    wzcx98_1SALES_ORDER: TStringField;
    wzcx98_1QTY_AUTH: TIntegerField;
    wzcx98_1QTY_RECD: TIntegerField;
    wzcx98_1to_be_ship: TFloatField;
    wzcx98_1EMPLOYEE_NAME: TStringField;
    wzcx98_1ABBR_NAME1: TStringField;
    wzcx98_1price: TFloatField;
    wzcx98_1value: TFloatField;
    wzcx98_1ca: TFloatField;
    wzcx98_1CURR_NAME: TStringField;
    wzcx98_1PRODUCT_NAME: TStringField;
    wzcx98_1MANU_PART_DESC: TStringField;
    wzcx98_1MANU_PART_NUMBER: TStringField;
    wzcx98_1MyRMA_STATUS: TStringField;
    wzcx98_1part_price: TFloatField;
    wzcx98_1WAREHOUSE_CODE: TStringField;
    wzcx98_1cw: TBCDField;
    wzcx98_1ANALYSIS_CODE_1: TStringField;
    wzcx98_1ANALYSIS_CODE_2: TStringField;
    wzcx98_1ANALYSIS_CODE_3: TStringField;
    wzcx98_1ANALYSIS_CODE_4: TStringField;
    wzcx98_1ANALYSIS_CODE_5: TStringField;
    wzcx98_1qty_ship: TIntegerField;
    wzcx98_1rma_type: TStringField;
    wzcx98_1RMA_DATE: TDateTimeField;
    wzcx98_1MEMO_NUMBER: TStringField;
    wzcx98_1rma_amount: TFloatField;
    wzcx98_1PO_NUMBER: TStringField;
    wzcx98_1remark: TWideStringField;
  
  private
    { Private declarations }
    rkey06:integer;
    vfind:boolean;

  public
    { Public declarations }

  end;

var
  DM: TDM;

implementation

{$R *.dfm}





end.
