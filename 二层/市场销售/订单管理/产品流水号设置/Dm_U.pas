unit Dm_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    AQ81: TADOQuery;
    DS81: TDataSource;
    AQ81rkey: TAutoIncField;
    AQ81layers: TWordField;
    AQ81sufchar: TStringField;
    AQTmp: TADOQuery;
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
