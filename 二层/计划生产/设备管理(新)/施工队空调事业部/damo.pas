unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS835: TADODataSet;
    ADS837: TADODataSet;
    tmp: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS835DeptName: TStringField;
    ADS835WorkName: TStringField;
    ADS835un_Applican: TStringField;
    ADS835un_RespPeop: TStringField;
    ADS835MainExecStat: TStringField;
    ADS835un_AdmiPeop: TStringField;
    ADS835un_AccePeop: TStringField;
    ADS835rkey: TIntegerField;
    ADS835WorkOrder: TStringField;
    ADS835Dept_ptr: TIntegerField;
    ADS835Work_ptr: TIntegerField;
    ADS835WorkExpl: TStringField;
    ADS835ForeTime: TBCDField;
    ADS835Applican: TIntegerField;
    ADS835Status: TIntegerField;
    ADS835RespPeop: TIntegerField;
    ADS835AdmiTime: TDateTimeField;
    ADS835AdmiPeop: TIntegerField;
    ADS835CompTime: TDateTimeField;
    ADS835ActuCons: TBCDField;
    ADS835Efficien: TBCDField;
    ADS835AcceTime: TDateTimeField;
    ADS835AccePeop: TIntegerField;
    ADS835Remark: TStringField;
    ADS837EMPL_CODE: TStringField;
    ADS837EMPLOYEE_NAME: TStringField;
    ADS837MainExecStat: TStringField;
    ADS837rkey: TIntegerField;
    ADS837Work_ptr: TIntegerField;
    ADS837WorkDate: TDateTimeField;
    ADS837BeginTime: TDateTimeField;
    ADS837EndTime: TDateTimeField;
    ADS837TimeCons: TBCDField;
    ADS837TimeRest: TBCDField;
    ADS837Empl_ptr: TIntegerField;
    ADS837Status: TIntegerField;
    ADS837WorkTime: TBCDField;
    ADS837Remark: TStringField;
    ADOQuery1: TADOQuery;
    QryResultTime: TADOQuery;
    procedure ADS835CalcFields(DataSet: TDataSet);
    procedure ADS835AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main,common;

{$R *.dfm}

procedure TDM.ADS835CalcFields(DataSet: TDataSet);
begin
  with ADS835  do
  if (FieldByName('ForeTime').Value>0) and (FieldByName('ActuCons').Value>0) then
  begin
    FieldByName('Efficien').Value:=FieldByName('ForeTime').Value/FieldByName('ActuCons').Value;
  end;
end;

procedure TDM.ADS835AfterScroll(DataSet: TDataSet);
begin
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS835.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS835.RecordCount);
  if DM.ADS835MainExecStat.Value ='待执行' then
  begin
    Frm_Main.cbb_DeptName.Enabled := True;
    Frm_Main.Cbb_WorkName.Enabled := True;
    Frm_Main.Mem_Remark.Enabled := False;
    Frm_Main.Mem_WorkExpl.Enabled := True;
    Frm_Main.Edt_ForeTime.Enabled := True;

    Frm_Main.DBDTE_AdmiTime.Enabled := False;
    Frm_Main.DBDTE_CompTime.Enabled := False;
  end;

  if DM.ADS835MainExecStat.Value ='执行中' then
  begin
    Frm_Main.Mem_WorkExpl.Enabled := True;
    Frm_Main.Edt_ForeTime.Enabled := True;
    Frm_Main.Mem_Remark.Enabled := True;
    Frm_Main.DBDTE_AdmiTime.Enabled := False;
    Frm_Main.DBDTE_CompTime.Enabled := False;
    Frm_Main.cbb_DeptName.Enabled := False;
    Frm_Main.Cbb_WorkName.Enabled := False;
  end;

  if DM.ADS835MainExecStat.Value ='待验收' then
  begin
    Frm_Main.cbb_DeptName.Enabled := False;
    Frm_Main.Cbb_WorkName.Enabled := False;
    Frm_Main.Mem_Remark.Enabled := False;
    Frm_Main.Mem_WorkExpl.Enabled := False;

    Frm_Main.Edt_ForeTime.Enabled := True;
    if StrToInt(vprev)=4 then
    begin
      Frm_Main.DBDTE_AdmiTime.Enabled := True;
      Frm_Main.DBDTE_CompTime.Enabled := True;
    end
    else
    begin
      Frm_Main.DBDTE_AdmiTime.Enabled := False;
      Frm_Main.DBDTE_CompTime.Enabled := False;
    end;
  end;
  if (DM.ADS835MainExecStat.Value ='已验收') and (StrToInt(vprev)=4) then
  begin
    Frm_Main.cbb_DeptName.Enabled := False;
    Frm_Main.Cbb_WorkName.Enabled := False;
    Frm_Main.Mem_Remark.Enabled := False;
    Frm_Main.Mem_WorkExpl.Enabled := False;

    Frm_Main.Edt_ForeTime.Enabled := False;
    if StrToInt(vprev)=4 then
    begin
      Frm_Main.DBDTE_AdmiTime.Enabled := True;
      Frm_Main.DBDTE_CompTime.Enabled := True;
    end
    else
    begin
      Frm_Main.DBDTE_AdmiTime.Enabled := False;
      Frm_Main.DBDTE_CompTime.Enabled := False;
    end;
  end;

end;

end.
