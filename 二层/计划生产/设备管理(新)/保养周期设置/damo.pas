unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS811: TADODataSet;
    ADS812: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADS811DeviType: TStringField;
    ADS811TypeName: TStringField;
    ADS811TypeDesc: TStringField;
    ADS812MainCycl: TStringField;
    ADS812cycl_duration: TIntegerField;
    ADS812DeviType: TStringField;
    ADS812AdvanceDays: TIntegerField;
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
