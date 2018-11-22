unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1departmentname: TWideStringField;
    qry1employeecode: TWideStringField;
    qry1chinesename: TWideStringField;
    qry1position_item: TWideStringField;
    qry1workyear: TWideStringField;
    qry1rkey: TIntegerField;
    qry1departmentid: TIntegerField;
    qry1ondutytime: TDateTimeField;
    qry1begindate: TDateTimeField;
    qry1workage: TIntegerField;
    qry1position: TIntegerField;
    qry1circle: TIntegerField;
    qry1position_keeptime: TIntegerField;
    qry1position_keeptime_char: TWideStringField;
    qry1extra_month: TIntegerField;
    qry1remain_month: TIntegerField;
    qry1month_left: TIntegerField;
    qry1extra_remark: TWideStringField;
    ADOTEMP: TADOQuery;
    qry2: TADOQuery;
    ds2: TDataSource;
    qry2departmentname: TWideStringField;
    qry2employeecode: TWideStringField;
    qry2chinesename: TWideStringField;
    qry2item: TWideStringField;
    qry2employee_name: TStringField;
    qry2rkey: TAutoIncField;
    qry2employeeid: TIntegerField;
    qry2departmentid: TIntegerField;
    qry2Positionid: TIntegerField;
    qry2startdate: TDateTimeField;
    qry2circle: TIntegerField;
    qry2extra_month: TIntegerField;
    qry2enddate: TDateTimeField;
    qry2oper_0005: TIntegerField;
    qry2operate_date: TDateTimeField;
    qry2extra_remark: TWideStringField;
    qry2visible: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  op_people: Integer;  //操作员ID
  //people_department:Integer; //操作员部门
  people_right:integer; //操作员权限

implementation

{$R *.dfm}

end.
