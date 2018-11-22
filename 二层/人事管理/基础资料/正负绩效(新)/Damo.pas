unit Damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry2: TADOQuery;
    ds2: TDataSource;
    qrytemp: TADOQuery;
    ds3: TDataSource;
    qry3: TADOQuery;
    qry1s: TADOQuery;
    ds1s: TDataSource;
    updatemistake: TADOQuery;
    qry1employeecode: TWideStringField;
    qry1chinesename: TWideStringField;
    qry1departmentname: TWideStringField;
    qry1ondutytime: TDateTimeField;
    qry1departmentcode: TWideStringField;
    qry1item: TWideStringField;
    atncfldqry1rkey: TAutoIncField;
    intgrfldqry1employeeid: TIntegerField;
    intgrfldqry1type: TIntegerField;
    data0362qry1money: TFloatField;
    intgrfldqry1flag: TIntegerField;
    qry1effectdate: TDateTimeField;
    qry1remark: TWideStringField;
    qry1item2: TWideStringField;
    intgrfldqry1RType: TIntegerField;
    dtmfldqry1ModiDate: TDateTimeField;
    intgrfldqry1ModiMan: TIntegerField;
    strngfldqry1user_full_name: TStringField;
    qry1PNo: TStringField;
    qry1srkey: TAutoIncField;
    qry1semployeecode: TWideStringField;
    qry1schinesename: TWideStringField;
    qry1sdepartmentname: TWideStringField;
    qry1sDSDesigner: TFloatField;
    qry1sDSDesigner2: TIntegerField;
    qry1sDSDesigner3: TFloatField;
    qry1sDSDesigner4: TIntegerField;
    qry1sDSDesigner5: TFloatField;
    qry1sDSDesigner6: TIntegerField;
    qry1sDSDesigner7: TFloatField;
    qry1sDSDesigner8: TIntegerField;
    qry1sDSDesigner9: TFloatField;
    qry1sitem: TWideStringField;
    qry1sDSDesigner10: TFloatField;
    qry1sDSDesigner11: TIntegerField;
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
