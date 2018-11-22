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
    ADOQuery2Expr1: TStringField;
    ADOQuery2Expr2: TFloatField;
    ADOQuery2quan_alloc: TBCDField;
    ADOQuery2remark: TStringField;
    ADOQuery2FLOW_NO: TIntegerField;
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
    ADOQuery1number: TStringField;
    ADOQuery1DATE: TDateTimeField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1EMPL_PTR: TIntegerField;
    ADOQuery1ConfMan: TStringField;
    ADO6: TADOQuery;
    ADO6USER_FULL_NAME: TStringField;
    ADO6RKEY: TAutoIncField;
    ADOQuery1chinesename: TWideStringField;
    ADOQuery1employeecode: TWideStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
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
