unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOqry: TADOQuery;
    ds1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cds1: TClientDataSet;
    qry_adupro: TADOQuery;
    tmp: TADOQuery;
    ADOqryselected: TBooleanField;
    ADOqrydepartmentname: TStringField;
    ADOqryemployeecode: TStringField;
    ADOqrychinesename: TStringField;
    ADOqryreqtime: TDateTimeField;
    ADOqryreqperson: TStringField;
    ADOqryreqinfo: TStringField;
    ADOqryDSDesigner: TStringField;
    ADOqryDSDesigner2: TStringField;
    ADOqrydealperson: TWideStringField;
    ADOqrydealtime: TDateTimeField;
    ADOqryreq_starttime: TDateTimeField;
    ADOqryreq_endtime: TDateTimeField;
    ADOqryreq_cardtime: TDateTimeField;
    ADOqryzbhour: TBCDField;
    ADOqryjbhour: TBCDField;
    ADOqryaskforleaverk: TIntegerField;
    ADOqryrkey: TAutoIncField;
    ADOqryemployeeid: TIntegerField;
    ADOqryreqstate: TIntegerField;
    ADOqryreqtype: TIntegerField;
    cds1selected: TBooleanField;
    cds1departmentname: TStringField;
    cds1employeecode: TStringField;
    cds1chinesename: TStringField;
    cds1reqtime: TDateTimeField;
    cds1reqperson: TStringField;
    cds1reqinfo: TStringField;
    cds1CDSDesigner: TStringField;
    cds1CDSDesigner2: TStringField;
    cds1dealperson: TWideStringField;
    cds1dealtime: TDateTimeField;
    cds1req_starttime: TDateTimeField;
    cds1req_endtime: TDateTimeField;
    cds1req_cardtime: TDateTimeField;
    cds1zbhour: TBCDField;
    cds1jbhour: TBCDField;
    cds1askforleaverk: TIntegerField;
    cds1rkey: TAutoIncField;
    cds1employeeid: TIntegerField;
    cds1reqstate: TIntegerField;
    cds1reqtype: TIntegerField;
    qry1: TADOQuery;
    ds2: TDataSource;
    qry1employeecode: TWideStringField;
    qry1chinesename: TWideStringField;
    qry1departmentname: TWideStringField;
    qry1total: TIntegerField;
    qry1ChaoCount: TIntegerField;
    qry1Pays: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
