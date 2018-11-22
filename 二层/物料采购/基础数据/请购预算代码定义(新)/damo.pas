unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS362: TADODataSet;
    ADS362RKEY: TIntegerField;
    ADS362CODE: TStringField;
    ADS362DESCRIPTION: TStringField;
    ADS362bud_year: TIntegerField;
    ads363: TADODataSet;
    DataSource2: TDataSource;
    ads363USER_FULL_NAME: TStringField;
    ads363USER_LOGIN_NAME: TStringField;
    ads363USER_PTR: TIntegerField;
    ads363BUDGET_PTR: TIntegerField;
    ADOQuery1: TADOQuery;
    ADS362BUDGET_PERIOD_1: TFloatField;
    ADS362BUDGET_PERIOD_2: TFloatField;
    ADS362BUDGET_PERIOD_3: TFloatField;
    ADS362BUDGET_PERIOD_4: TFloatField;
    ADS362BUDGET_PERIOD_5: TFloatField;
    ADS362BUDGET_PERIOD_6: TFloatField;
    ADS362BUDGET_PERIOD_7: TFloatField;
    ADS362BUDGET_PERIOD_8: TFloatField;
    ADS362BUDGET_PERIOD_9: TFloatField;
    ADS362BUDGET_PERIOD_10: TFloatField;
    ADS362BUDGET_PERIOD_11: TFloatField;
    ADS362BUDGET_PERIOD_12: TFloatField;
    ADS362USED_PERIOD_1: TFloatField;
    ADS362USED_PERIOD_2: TFloatField;
    ADS362USED_PERIOD_3: TFloatField;
    ADS362USED_PERIOD_4: TFloatField;
    ADS362USED_PERIOD_5: TFloatField;
    ADS362USED_PERIOD_6: TFloatField;
    ADS362USED_PERIOD_7: TFloatField;
    ADS362USED_PERIOD_8: TFloatField;
    ADS362USED_PERIOD_9: TFloatField;
    ADS362USED_PERIOD_10: TFloatField;
    ADS362USED_PERIOD_11: TFloatField;
    ADS362USED_PERIOD_12: TFloatField;
    ads363ACTIVE_FLAG: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
