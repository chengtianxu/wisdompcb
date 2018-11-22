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
    ADODataSet2flag: TStringField;
    ADODataSet2dy: TIntegerField;
    ADODataSet2DSDesigner: TIntegerField;
    ADODataSet2DSDesigner2: TIntegerField;
    ADODataSet2DSDesigner3: TIntegerField;
    ADODataSet2ChineseName: TWideStringField;
    ADODataSet2employeeid: TIntegerField;
    ADODataSet2out1: TWideStringField;
    ADODataSet2in1: TWideStringField;
    ADODataSet2in2: TWideStringField;
    ADODataSet2out2: TWideStringField;
    ADODataSet2in3: TWideStringField;
    ADODataSet2out3: TWideStringField;
    ADODataSet2in4: TWideStringField;
    ADODataSet2out4: TWideStringField;
    ADODataSet2DepartmentName: TWideStringField;
    ADODataSet2EmployeeCode: TWideStringField;
    ADODataSet2outdutytime: TDateTimeField;
    ADODataSet2ClassName: TWideStringField;
    ADODataSet2CheckDate: TDateTimeField;
    ADODataSet2SumCN: TFloatField;
    ADODataSet2SumCT: TFloatField;
    ADODataSet2SumZN: TFloatField;
    ADODataSet2SumZT: TFloatField;
    ADODataSet2SumKN: TFloatField;
    ADODataSet2sumkt: TFloatField;
    ADODataSet2SumWN: TFloatField;
    ADODataSet2SumWT: TFloatField;
    ADODataSet2SumJN: TFloatField;
    ADODataSet2SumJT: TFloatField;
    ADODataSet2SumEN: TFloatField;
    ADODataSet2SumET: TFloatField;
    ADODataSet2SumLN: TFloatField;
    ADODataSet2SumLT: TFloatField;
    ADODataSet2YTnote: TWideStringField;
    ADODataSet2ClassGroupID: TIntegerField;
    ADODataSet2RestType: TIntegerField;
    ADODataSet2OWT: TFloatField;
    ADODataSet2SWT: TFloatField;
    ADODataSet2NCN: TIntegerField;
    ADODataSet2RWT: TFloatField;
    ADODataSet2ROT: TFloatField;
    ADODataSet2RWTROT: TFloatField;
    ADODataSet2work1: TFloatField;
    ADODataSet2work2: TFloatField;
    ADODataSet2work3: TFloatField;
    ADODataSet2work4: TFloatField;
    ADODataSet2work10: TFloatField;
    ADODataSet2restday: TFloatField;
    ADODataSet2workday: TFloatField;
    ADODataSet2qj: TIntegerField;
    ADODataSet2position_item: TWideStringField;
    ADODataSet1employeecode: TWideStringField;
    ADODataSet1chinesename: TWideStringField;
    ADODataSet1departmentname: TWideStringField;
    ADODataSet1item: TWideStringField;
    ADODataSet1ondutytime: TDateTimeField;
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
