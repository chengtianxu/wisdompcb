unit dmo;

interface
uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ds370: TADODataSet;
    ds250: TADODataSet;
    DataSource370: TDataSource;
    DataSource250: TDataSource;
    ds04: TADODataSet;
    ds370CODE: TStringField;
    ds370DESCRIPTION: TStringField;
    ds370CUSTOMER_PTR: TIntegerField;
    ds04SEED_VALUE: TStringField;
    ds04SEED_FLAG: TWordField;
    ds250COUNTRY_CODE: TStringField;
    ds250COUNTRY_NAME: TStringField;
    ds370SCAC_CODE: TStringField;
    ds370VEHICLE: TStringField;
    ds370SHIPPERS_LEAD_TIME: TIntegerField;
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
