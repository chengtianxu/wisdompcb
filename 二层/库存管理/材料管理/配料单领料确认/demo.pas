unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery4nld: TStringField;
    ADOQuery4zdrrgh: TStringField;
    ADOQuery4zdrrxm: TStringField;
    ADOQuery4nldsqrr: TStringField;
    ADOQuery4nldsqgh: TStringField;
    ADOQuery4Pman_ptr: TIntegerField;
    ADOQuery4ConfMan: TStringField;
    ADOQuery5: TADOQuery;
    ADOQuery5ICCardno: TWideStringField;
    ADOQuery5employeecode: TWideStringField;
    ADOQuery5chinesename: TWideStringField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1CUT_NO: TStringField;
    ADOQuery1ConfMan: TWideStringField;
    ADOQuery2CUT_NO: TStringField;
    ADOQuery2DEPT_NAME: TStringField;
    Ado6: TADOQuery;
    Ado6user_full_name: TStringField;
    Ado6rkey: TAutoIncField;
    ADOQuery2QUAN_BOM: TFloatField;
    ADOQuery2QUAN_ISSUED: TFloatField;
    ADOQuery2remark: TStringField;
    ADOQuery1chinesename: TWideStringField;
    ADOQuery1employeecode: TWideStringField;
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
