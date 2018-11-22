unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS698: TADODataSet;
    DataSource1: TDataSource;
    ADS698pack_number: TStringField;
    ADS698EMPLOYEE_NAME: TStringField;
    ADS698v_date: TDateTimeField;
    ADS698v_print: TBooleanField;
    ADS698pack_item: TIntegerField;
    ADS698MANU_PART_NUMBER: TStringField;
    ADS698MANU_PART_DESC: TStringField;
    ADS698ANALYSIS_CODE_2: TStringField;
    ADS698PO_NUMBER: TStringField;
    ADS698code: TStringField;
    ADS698lotno: TStringField;
    ADS698notes: TStringField;
    ADS698qty: TIntegerField;
    ADS698description: TStringField;
    ADS698SALES_ORDER: TStringField;
    ADS698rkey: TIntegerField;
    ADOQuery1: TADOQuery;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ADS698so_ptr: TIntegerField;
    ADS698CUST_CODE: TStringField;
    ADS698ABBR_NAME: TStringField;
    ADS698type: TStringField;
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
