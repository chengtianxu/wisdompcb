unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    ADOQuery4employeecode: TWideStringField;
    ADOQuery4chinesename: TWideStringField;
    ADOQuery4checkdate: TDateTimeField;
    ADOQuery4resttype: TIntegerField;
    ADOQuery4ondutytime1: TDateTimeField;
    ADOQuery4offdutytime1: TDateTimeField;
    ADOQuery4ondutytime2: TDateTimeField;
    ADOQuery4offdutytime2: TDateTimeField;
    ADOQuery4ondutytime3: TDateTimeField;
    ADOQuery4offdutytime3: TDateTimeField;
    ADOQuery4ytnote: TWideStringField;
    ADOQuery4rwt: TFloatField;
    ADOQuery4rot: TFloatField;
    ADOQuery4sumct: TFloatField;
    ADOQuery4sumzt: TFloatField;
    ADOQuery4sumkt: TFloatField;
    ADOQuery4departmentname: TStringField;
    ADOQuery4_copy: TADOQuery;
    ADOQuery5: TADOQuery;
    qry_checkperson: TADOQuery;
    ADOQuery6: TADOQuery;
    qrytmp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
{ADOQuery2是给导入排班用的，ADOQuery3是给导入工时修改用的}

end.
