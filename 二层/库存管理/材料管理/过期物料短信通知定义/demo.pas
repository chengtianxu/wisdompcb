unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ads0552: TADODataSet;
    ads0552USER_LOGIN_NAME: TStringField;
    ads0552USER_FULL_NAME: TStringField;
    ads0552GROUP_DESC: TStringField;
    ads0552GROUP_NAME: TStringField;
    ads0552csi_ptr: TIntegerField;
    ads0552GROUP_PTR: TIntegerField;
    ADOQuery1: TADOQuery;
    ads0552PHONE: TStringField;
    ads0552DEPT_NAME: TStringField;
    ads0552FLAG: TStringField;
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
