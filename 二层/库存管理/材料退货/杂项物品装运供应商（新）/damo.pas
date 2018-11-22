unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS209: TADODataSet;
    DataSource1: TDataSource;
    ADS209goods_name: TStringField;
    ADS209goods_guige: TStringField;
    ADS209goods_type: TStringField;
    ADS209ABBR_NAME: TStringField;
    ADS209quan_to_ship: TFloatField;
    ADS209QUANTITY: TFloatField;
    ADS209UNIT_NAME: TStringField;
    ADS209TDATE: TDateTimeField;
    ADS209Expr1: TStringField;
    ADS209remark: TWideStringField;
    ADS209shipping_method: TWideStringField;
    ADS209tran_date: TDateTimeField;
    ADS209v_state: TStringField;
    ADS209EMPLOYEE_NAME: TStringField;
    ADS209CODE: TStringField;
    ADS209REJECT_DESCRIPTION: TStringField;
    ADS209Rkey: TAutoIncField;
    tmp: TADOQuery;
    ADS209ABBR_NAME_1: TStringField;
    ADS209LOCATION: TStringField;
    ADS209quan_returned: TFloatField;
    ADS209QUAN_RECD: TBCDField;
    ADS209QUAN_RETN: TFloatField;
    ADS209D0072_PTR: TIntegerField;
    ADS209Rkey235: TIntegerField;
    ADS209unit_price: TBCDField;
    ADS209state_tax: TBCDField;
    ADS209CURR_NAME: TStringField;
    ADS209exch_rate: TBCDField;
    ADS209sum_price: TFloatField;
    ADS209PO_NUMBER: TStringField;
    ADS209code23: TStringField;
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
