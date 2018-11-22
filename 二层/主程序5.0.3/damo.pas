unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsMenuList: TADODataSet;
    AQ_EXEC: TADOQuery;
    AQ_EXECDESCRIPTION: TStringField;
    AQ_EXECPROGRAME: TStringField;
    AQ_EXECVerNo: TStringField;
    AQ_EXECmanu_ptr: TIntegerField;
    AQ_EXECRKEY: TAutoIncField;
    AQ_EXECUSER_RIGHTS: TSmallintField;
    adsTmp: TADOQuery;
    ADOData0073: TADOQuery;
    ADOData0073RKEY: TAutoIncField;
    ADOData0073USER_LOGIN_NAME: TStringField;
    ADOData0073USER_FULL_NAME: TStringField;
    ADOData0073PASSWORD: TStringField;
    ADOData0073EMPLOYEE_PTR: TIntegerField;
    ADOData0073NETWORK_ID: TStringField;
    ADOData0073COMPUTER: TStringField;
    ADOData0073LOGIN_IN_TIME: TDateTimeField;
    ADS314: TADODataSet;
    DataSource1: TDataSource;
    ADOData0073message_flag: TBooleanField;
    DataSource2: TDataSource;
    ADS314USER_FULL_NAME: TStringField;
    ADS314senddate: TDateTimeField;
    ADS314MESSAGE: TStringField;
    ADS314rkey: TAutoIncField;
    ADS314hread: TStringField;
    ASPSYSUSERLIFE: TADOStoredProc;
    ADOData0073NETWORK_IP: TStringField;
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
