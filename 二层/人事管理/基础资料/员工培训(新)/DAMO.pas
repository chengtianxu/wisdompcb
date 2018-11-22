unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    DataSource1: TDataSource;
    adoMainrkey: TIntegerField;
    adoMainemployeeid: TIntegerField;
    adoMainemployeecode: TWideStringField;
    adoMainchinesename: TWideStringField;
    adoMaindepartmentname: TWideStringField;
    adoMainTrain_NO: TStringField;
    adoMainTrain_topics: TWideStringField;
    adoMainstartdate: TDateTimeField;
    adoMainstarttime: TStringField;
    adoMainenddate: TDateTimeField;
    adoMainendtime: TStringField;
    adoMainTrain_time: TFloatField;
    adoMainTeacher: TWideStringField;
    adoMainTrain_place: TWideStringField;
    adoMainTrain_grade: TWideStringField;
    adoMainTrain_result: TWideStringField;
    adoMainTrain_content: TWideStringField;
    adoMainTrain_status: TIntegerField;
    adoMaintype_ptr: TIntegerField;
    adoMainitem: TWideStringField;
    adoMainptr_flag: TBooleanField;
    adoMaintrain_feels: TBCDField;
    adoMaineffective_date: TDateTimeField;
    adoMainfeels_payed: TBooleanField;
    adoMainoprator_ptr: TIntegerField;
    adoMainoprate_time: TDateTimeField;
    adoMainemployee_name: TStringField;
    adoMainstatus: TStringField;
    adoMainflag: TStringField;
    adoTmp: TADOQuery;
    adoTime: TADOQuery;
    adoMainpayed: TStringField;
    adoLoadData: TADODataSet;
    DataSource2: TDataSource;
    adoLoadDataselected: TBooleanField;
    adoLoadDatadevip: TWideStringField;
    adoLoadDatadevid: TWideStringField;
    adoLoadDatadevtime: TDateTimeField;
    adoLoadDatanote: TStringField;
    dspLoadData: TDataSetProvider;
    cdsLoadData: TClientDataSet;
    cdsLoadDataselected: TBooleanField;
    cdsLoadDatadevip: TWideStringField;
    cdsLoadDatadevid: TWideStringField;
    cdsLoadDatadevtime: TDateTimeField;
    cdsLoadDatanote: TStringField;
    adoLoadDataconnctstatus: TStringField;
    cdsLoadDataconnctstatus: TStringField;
    adoSelTime: TADODataSet;
    DataSource3: TDataSource;
    adoSelTimerkey: TAutoIncField;
    adoSelTimeemployeecode: TWideStringField;
    adoSelTimechinesename: TWideStringField;
    adoSelTimedepartmentname: TWideStringField;
    adoSelTimecard_datetime: TDateTimeField;
    adoSelTimecard_date: TWideStringField;
    adoSelTimecard_time: TWideStringField;
    adoSelTimeposition_item: TWideStringField;
    adoSelTimeemployeeid: TIntegerField;
    adoTmp2: TADOQuery;
    adoMainondutytime: TDateTimeField;
    adoMainactually_feels: TBCDField;
    adoMainpositionname: TWideStringField;
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
