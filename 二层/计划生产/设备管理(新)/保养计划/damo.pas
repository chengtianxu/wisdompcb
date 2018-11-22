unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
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
    tmp: TADOQuery;
    ADS848: TADODataSet;
    DataSource2: TDataSource;
    ADS848Rkey: TIntegerField;
    ADS848Work_ptr: TIntegerField;
    ADS848WorkDate: TDateTimeField;
    ADS848BeginTime: TDateTimeField;
    ADS848EndTime: TDateTimeField;
    ADS848TimeRest: TBCDField;
    ADS848Empl_ptr: TIntegerField;
    ADS848Status: TIntegerField;
    ADS848WorkTime: TBCDField;
    ADS848Remark: TStringField;
    ADS848DayShift: TWordField;
    ADS848EMPL_CODE: TStringField;
    ADS848EMPLOYEE_NAME: TStringField;
    ADS848MainexecStat: TStringField;
    ADORead: TADOQuery;
    cmdUpdate: TADOCommand;
    QryResultTime: TADOQuery;
    ADS831Acomplish: TWideStringField;
    ADS847: TADODataSet;
    ADS847DEPT_CODE: TStringField;
    ADS847DEPT_NAME: TStringField;
    ADS847FASSET_CODE: TStringField;
    ADS847FASSET_NAME: TStringField;
    ADS847RKEY: TAutoIncField;
    ADS847D417_ptr: TIntegerField;
    ADS847MainCycl: TStringField;
    ADS847StdTimeCons: TBCDField;
    DataSource3: TDataSource;
    ADS468: TADODataSet;
    ADS468number: TStringField;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_PART_DESCRIPTION: TStringField;
    ADS468unit_name: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    DataSource4: TDataSource;
    ADS821: TADODataSet;
    DS821: TDataSource;
    ADS821INV_PART_NUMBER: TStringField;
    ADS821INV_NAME: TStringField;
    ADS821INV_DESCRIPTION: TStringField;
    ADS821QUAN_ON_HAND: TBCDField;
    ADS821ValidateQuantity: TBCDField;
    ADS821Quantity: TFloatField;
    ADS821IfmustReplace: TBooleanField;
    ADS821ReplaceQuantity: TFloatField;
    ADS821UNIT_NAME: TStringField;
    ADS821USER_FULL_NAME: TStringField;
    ADS821ReplaceDate: TDateTimeField;
    ADS821Rkey: TAutoIncField;
    ADS821Rkey831: TIntegerField;
    ADS821Rkey17: TIntegerField;
    ADS821unit_ptr: TIntegerField;
    ADS821ReplaceRkey73: TIntegerField;
    ADS821NeedReplaceQuantity: TFloatField;
    ADS821NeedReplaceQuantitys: TFloatField;
    ADS821CreateDate: TDateTimeField;
    ADS821FASSET_CODE: TStringField;
    ADS821FASSET_NAME: TStringField;
    ADS821DeviType: TStringField;
    ADS821MainCycl: TStringField;
    ADS821PlanMainDate: TDateTimeField;
    ADS821ABBR_NAME: TStringField;
    ADS821DEPT_NAME: TStringField;
    ds821_old: TDataSource;
    ads821_Old: TADODataSet;
    ads821_OldINV_PART_NUMBER: TStringField;
    ads821_OldINV_NAME: TStringField;
    ads821_OldINV_DESCRIPTION: TStringField;
    ads821_OldQUAN_ON_HAND: TBCDField;
    ads821_OldValidateQuantity: TBCDField;
    ads821_OldQuantity: TFloatField;
    ads821_OldIfmustReplace: TBooleanField;
    ads821_OldReplaceQuantity: TFloatField;
    ads821_OldNeedReplaceQuantity: TFloatField;
    ads821_OldUNIT_NAME: TStringField;
    ads821_OldUSER_FULL_NAME: TStringField;
    ads821_OldReplaceDate: TDateTimeField;
    ads821_OldCreateDate: TDateTimeField;
    ads821_OldRkey: TAutoIncField;
    ads821_OldRkey831: TIntegerField;
    ads821_OldRkey17: TIntegerField;
    ads821_Oldunit_ptr: TIntegerField;
    ads821_OldReplaceRkey73: TIntegerField;
    ads821_OldFASSET_CODE: TStringField;
    ads821_OldFASSET_NAME: TStringField;
    ads821_OldDeviType: TStringField;
    ads821_OldMainCycl: TStringField;
    ads821_OldPlanMainDate: TDateTimeField;
    ads821_OldABBR_NAME: TStringField;
    ads821_OldDEPT_NAME: TStringField;
    ads821_OldNeedReplaceQuantitys: TFloatField;
    procedure ADS831AfterScroll(DataSet: TDataSet);
    procedure ads821_OldCalcFields(DataSet: TDataSet);
    procedure ADS821CalcFields(DataSet: TDataSet);
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

procedure TDM.ads821_OldCalcFields(DataSet: TDataSet);
begin
ads821_Old.FieldByName('NeedReplaceQuantitys').AsFloat := ads821_Old.FieldByName('Quantity').AsFloat - ads821_Old.FieldByName('ReplaceQuantity').AsFloat;
end;

procedure TDM.ADS821CalcFields(DataSet: TDataSet);
begin
ADS821.FieldByName('NeedReplaceQuantitys').AsFloat := ADS821.FieldByName('Quantity').AsFloat - ADS821.FieldByName('ReplaceQuantity').AsFloat;
end;

end.
