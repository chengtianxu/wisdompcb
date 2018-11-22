unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADS567: TADODataSet;
    ADS842: TADODataSet;
    DataSource2: TDataSource;
    ADS567FaultName: TStringField;
    ADS567stdDate: TBCDField;
    ADS567DEPT_CODE: TStringField;
    ADS567FASSET_CODE: TStringField;
    ADS567FASSET_NAME: TStringField;
    ADS567FASSET_DESC: TStringField;
    ADS567D417_Location: TStringField;
    ADS567D417_D840_ptr: TIntegerField;
    ADS567EMPL_CODE: TStringField;
    ADS567EMPLOYEE_NAME: TStringField;
    ADS567warehouse_code: TStringField;
    ADS567abbr_name: TStringField;
    ADS567V_stat: TStringField;
    ADS567disposal_emplcode: TStringField;
    ADS567disposal_emplname: TStringField;
    ADS567completion_emplcode: TStringField;
    ADS567completion_emplname: TStringField;
    ADS567validate_emplname: TStringField;
    ADS567tslr: TStringField;
    ADS567Location: TStringField;
    ADS567RKEY: TAutoIncField;
    ADS567NUMBER: TStringField;
    ADS567STATUS: TWordField;
    ADS567DEPT_PTR: TIntegerField;
    ADS567FASSET_PTR: TIntegerField;
    ADS567PLACE: TStringField;
    ADS567equipment_grade: TStringField;
    ADS567failure_grade: TStringField;
    ADS567failure_degree: TStringField;
    ADS567EMPL_PTR: TIntegerField;
    ADS567ent_date: TDateTimeField;
    ADS567referring_date: TDateTimeField;
    ADS567CONTACT_NAME: TStringField;
    ADS567CONTACT_PHONE: TStringField;
    ADS567failure_circs: TStringField;
    ADS567disposal_emplptr: TIntegerField;
    ADS567disposal_date: TDateTimeField;
    ADS567maintain_text: TStringField;
    ADS567maintain_empl: TStringField;
    ADS567complete_date: TDateTimeField;
    ADS567validate_emplptr: TIntegerField;
    ADS567validate_date: TDateTimeField;
    ADS567validate_appraise: TStringField;
    ADS567fail_type: TStringField;
    ADS567WHOUSE_PTR: TIntegerField;
    ADS567suspended_reason: TWideStringField;
    ADS567stoppage_time: TDateTimeField;
    ADS567recovery_time: TDateTimeField;
    ADS567completion_emplptr: TIntegerField;
    ADS567stop_house: TBCDField;
    ADS567maintain_house: TBCDField;
    ADS567validate_Description: TStringField;
    ADS567D846_ptr: TIntegerField;
    ADS567Staff_Sum_house: TBCDField;
    ADS567D840_ptr: TIntegerField;
    ADS567D073_ptr: TIntegerField;
    ADS842rkey: TAutoIncField;
    ADS842Work_ptr: TIntegerField;
    ADS842WorkDate: TDateTimeField;
    ADS842BeginTime: TDateTimeField;
    ADS842EndTime: TDateTimeField;
    ADS842TimeCons: TBCDField;
    ADS842TimeRest: TBCDField;
    ADS842Empl_ptr: TIntegerField;
    ADS842Status: TIntegerField;
    ADS842WorkTime: TBCDField;
    ADS842Remark: TStringField;
    ADS842DayShift: TWordField;
    ADS842EMPL_CODE: TStringField;
    ADS842EMPLOYEE_NAME: TStringField;
    ADS842MainexecStat: TStringField;
    ADS567GZSJ: TBCDField;
    ADS567EquiType: TStringField;
    ADS567DEPT_NAME: TStringField;
    tmp: TADOQuery;
    ADS468: TADODataSet;
    DataSource3: TDataSource;
    ADS468number: TStringField;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_PART_DESCRIPTION: TStringField;
    ADS468unit_name: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    ADOQuery1: TADOQuery;
    QryResultTime: TADOQuery;
    ADS567failure_dat: TDateTimeField;
    procedure ADS567AfterScroll(DataSet: TDataSet);
    procedure ADS842AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main,common;

{$R *.dfm}

procedure TDM.ADS567AfterScroll(DataSet: TDataSet);
begin
  if ADS567STATUS.Value=2 then
  begin
    frm_main.BtnAdd.Enabled := True;
    ADS842.Open;
    if  ADS842MainexecStat.Value = '执行中' then
    begin
      if StrToInt(vprev) in [1,2,3] then
        frm_main.BtnEdit.Enabled := False
      else
        frm_main.BtnEdit.Enabled := True;
      frm_main.Btndelete.Enabled := True;
      frm_main.BtnPersonEnd.Enabled := True;
    end
    else
    begin
      frm_main.BtnEdit.Enabled := False;
      frm_main.Btndelete.Enabled := False;
      frm_main.BtnPersonEnd.Enabled := False;
    end;
  end
  else
  begin
    frm_main.BtnAdd.Enabled := False;
    frm_main.BtnEdit.Enabled := False;
    frm_main.Btndelete.Enabled := False;
    frm_main.BtnPersonEnd.Enabled := False;
  end;
  if DM.ADS567STATUS.Value=2 then
  begin
    frm_main.Cbb_fail_type.Enabled :=True;
    frm_main.Memo_maintain_text.Enabled :=True;
    frm_main.Edt_maintain_empl.Enabled :=True;
  end
  else
  begin
    frm_main.Cbb_fail_type.Enabled := False;
    frm_main.Memo_maintain_text.Enabled := False;
    frm_main.Edt_maintain_empl.Enabled := False;
  end;
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS567.RecNo)+
    '/总记录数:'+ IntToStr(DM.ADS567.RecordCount);
end;

procedure TDM.ADS842AfterScroll(DataSet: TDataSet);
begin
  if (ADS842MainexecStat.Value = '执行中') and (ADS567STATUS.Value=2) then
  begin
    if StrToInt(vprev) in [1,2,3] then
      frm_main.BtnEdit.Enabled := False
    else
      frm_main.BtnEdit.Enabled := True;
    frm_main.Btndelete.Enabled := True;
    frm_main.BtnPersonEnd.Enabled := True;
  end
  else
  begin
    frm_main.BtnEdit.Enabled := False;
    frm_main.Btndelete.Enabled := False;
    frm_main.BtnPersonEnd.Enabled := False;
  end;
end;

end.
