unit datamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Database1: TDatabase;
    ADOData0073: TADOStoredProc;
    ADO0419a: TADOStoredProc;
    ADO0419b: TADOStoredProc;
    ADO0419c: TADOStoredProc;
    ADO0508: TADOStoredProc;
    ADO0419e: TADOStoredProc;
    ADO0014: TADOStoredProc;
    ADODate: TADOStoredProc;
    ADOUsers: TADOStoredProc;
    ADO0073: TADOStoredProc;
    ADOUserList: TADOStoredProc;
    ADOUser: TADOQuery;
    ADO0014A: TADOStoredProc;
    ADO0074: TADOQuery;
    ADOData0074: TADOQuery;
    ADOData0073rkey: TAutoIncField;
    ADOData0073USER_LOGIN_NAME: TStringField;
    ADOData0073USER_FULL_NAME: TStringField;
    ADOData0073USER_ID: TStringField;
    ADOData0073USER_PASSWORD: TStringField;
    ADOData0073EMPLOYEE_PTR: TIntegerField;
    ADOData0073NETWORK_ID: TStringField;
    ADOData0073COMPUTER: TStringField;
    ADOData0073LOGIN_IN_TIME: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

end.
