unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS193: TADODataSet;
    ADS193RECORD_KEY: TAutoIncField;
    ADS193CODE: TStringField;
    ADS193DESCRIPTION: TStringField;
    ADS193NUMBER_OF_LINES: TSmallintField;
    ADS193SPEC_RKEY: TStringField;
    ADS193THK_NESS: TFloatField;
    ADS193layers_info: TMemoField;
    DataSource1: TDataSource;
    ADS193type: TStringField;
    ADOQuery1: TADOQuery;
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
