unit dmcon;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsMenuList: TADODataSet;
    adsTmp: TADODataSet;
    ADODate: TADOStoredProc;
    ADOData0073: TADOStoredProc;
    ADOData0073rkey: TAutoIncField;
    ADOData0073USER_LOGIN_NAME: TStringField;
    ADOData0073USER_FULL_NAME: TStringField;
    ADOData0073USER_ID: TStringField;
    ADOData0073USER_PASSWORD: TStringField;
    ADOData0073EMPLOYEE_PTR: TIntegerField;
    ADOData0073NETWORK_ID: TStringField;
    ADOData0073COMPUTER: TStringField;
    ADOData0073LOGIN_IN_TIME: TDateTimeField;
    ADO0419c: TADOStoredProc;
    ADO0074: TADOQuery;
    qry419: TADOQuery;
    qryTmp: TADOQuery;
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
