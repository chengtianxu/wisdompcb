unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    DataSource1: TDataSource;
    adoMaindepartmentname: TWideStringField;
    adoMainemployeecode: TWideStringField;
    adoMainchinesename: TWideStringField;
    adoMainondutytime: TDateTimeField;
    adoMainoutdutytime: TDateTimeField;
    adoMainposition: TWideStringField;
    adoMainonoffduty: TStringField;
    adoMaincode: TWideStringField;
    adoMainproper: TWideStringField;
    adoMainctftype: TStringField;
    adoMainstartdate: TDateTimeField;
    adoMainenddate: TDateTimeField;
    adoMainremark: TWideStringField;
    adoMaininputdate: TDateTimeField;
    adoMainemployee_name: TStringField;
    adoMainrkey: TAutoIncField;
    adoMainstatu: TStringField;
    adoTmp: TADOQuery;
    adoTime: TADOQuery;
    adoWillOut: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    adoOut: TADODataSet;
    adoWillOutemployeecode: TWideStringField;
    adoWillOutchinesename: TWideStringField;
    adoWillOutcode: TWideStringField;
    adoWillOutitem: TWideStringField;
    adoWillOutctftype: TStringField;
    adoWillOutstartdate: TDateTimeField;
    adoWillOutenddate: TDateTimeField;
    adoOutemployeecode: TWideStringField;
    adoOutchinesename: TWideStringField;
    adoOutcode: TWideStringField;
    adoOutitem: TWideStringField;
    adoOutctftype: TStringField;
    adoOutstartdate: TDateTimeField;
    adoOutenddate: TDateTimeField;
    adoMainstatus: TIntegerField;
    adoMainempstatus: TWordField;
    adoMainstations: TWideStringField;
    adoMainstationid: TIntegerField;
    adoWillOutdepartmentName: TWideStringField;
    adoOutdepartmentName: TWideStringField;
    adoMainPAbility: TStringField;
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
