unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    DataSource1: TDataSource;
    adoTmp: TADOQuery;
    adoMainemployeecode: TWideStringField;
    adoMainemployeeid: TIntegerField;
    adoMainchinesename: TWideStringField;
    adoMaincardno_dec: TStringField;
    adoMainbegin_time: TDateTimeField;
    adoMainend_time: TDateTimeField;
    adoMainoper_person: TIntegerField;
    adoMainoper_date: TDateTimeField;
    adoMainstatus: TIntegerField;
    adoMainrkey: TAutoIncField;
    adoMainEMPLOYEE_NAME: TStringField;
    adoMainmsgstatus: TStringField;
    adoTime: TADOQuery;
    adoInsert: TADOQuery;
    adoMainICCardno: TWideStringField;
    adoMaindepartmentname: TWideStringField;
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
