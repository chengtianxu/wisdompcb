unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    tmp: TADOQuery;
    ADORead: TADOQuery;
    cmdUpdate: TADOCommand;
    QryResultTime: TADOQuery;
    ADS468: TADODataSet;
    ADS468number: TStringField;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_PART_DESCRIPTION: TStringField;
    ADS468unit_name: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    DataSource4: TDataSource;
    ADS831: TADODataSet;
    ADS831FASSET_NAME: TStringField;
    ADS831MainExecStat: TStringField;
    ADS831User_Full_Name: TStringField;
    ADS831Impact: TStringField;
    ADS831DEPT_NAME: TStringField;
    ADS831ABBR_NAME: TStringField;
    ADS831equipment_grade: TStringField;
    ADS831LOCATION: TStringField;
    ADS831d840_Location: TStringField;
    ADS831rkey: TAutoIncField;
    ADS831PlanMainDate: TDateTimeField;
    ADS831DeviNumb: TStringField;
    ADS831DeviType: TStringField;
    ADS831MainCycl: TStringField;
    ADS831RKEY832: TIntegerField;
    ADS831StarMainTime: TDateTimeField;
    ADS831ActuCompTime: TDateTimeField;
    ADS831MainImpl: TWideStringField;
    ADS831Remarks: TStringField;
    ADS831TimeCons: TBCDField;
    ADS831MainAcce_UserPtr: TIntegerField;
    ADS831StdTimeCons: TBCDField;
    ADS831Acomplish: TWideStringField;
    procedure ADS831AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ADS831AfterScroll(DataSet: TDataSet);
begin
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS831.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS831.RecordCount);
end;

end.
