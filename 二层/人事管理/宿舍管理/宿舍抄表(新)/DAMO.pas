unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    adoTmp: TADOQuery;
    adoTime: TADOQuery;
    DataSource1: TDataSource;
    adoMainrkey: TIntegerField;
    adoMainR_code: TStringField;
    adoMainR_name: TWideStringField;
    adoMainrecord_date: TDateTimeField;
    adoMainrecord_number: TBCDField;
    adoMaintype: TStringField;
    adoMainoperator: TIntegerField;
    adoMainoper_time: TDateTimeField;
    adoMainremark: TWideStringField;
    adoMainischecked: TBooleanField;
    adoMainEMPLOYEE_NAME: TStringField;
    adoMainstrtype: TStringField;
    adoMainchecked: TStringField;
    adoMainroomid: TIntegerField;
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
