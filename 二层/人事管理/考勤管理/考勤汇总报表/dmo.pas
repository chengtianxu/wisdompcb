unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    ADODataSet2: TADODataSet;
    ADODataSet1employeecode: TWideStringField;
    ADODataSet1departmentname: TWideStringField;
    ADODataSet1chinesename: TWideStringField;
    ADODataSet1ondutytime: TDateTimeField;
    ADODataSet1accountname: TWideStringField;
    ADOTMP: TADOQuery;
    ADOTIME: TADOQuery;
    ADODataSet1position_item: TStringField;
    onoffduty_create: TADOQuery;
    employee_list_create: TADOQuery;
    onoffduty_show: TADOQuery;
    onoffdutydata_T: TADOQuery;
    ADODataSet1outdutytime: TDateTimeField;
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
