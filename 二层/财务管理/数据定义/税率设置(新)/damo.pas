unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ds189: TADODataSet;
    ds189RKEY: TAutoIncField;
    ds189STATE_ID: TStringField;
    ds189STATE_TAX: TBCDField;
    ds189NAME: TStringField;
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
