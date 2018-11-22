unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADS567: TADODataSet;
    ADS567RKEY: TIntegerField;
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
    ADS567maintain_empl: TStringField;
    ADS567maintain_text: TStringField;
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
    ADS567DEPT_CODE: TStringField;
    ADS567DEPT_NAME: TStringField;
    ADS567FASSET_CODE: TStringField;
    ADS567FASSET_NAME: TStringField;
    ADS567FASSET_DESC: TStringField;
    ADS567EMPL_CODE: TStringField;
    ADS567EMPLOYEE_NAME: TStringField;
    ADS567warehouse_code: TStringField;
    ADS567ABBR_NAME: TStringField;
    ADS567FASSET_TYPE: TStringField;
    ADS567status_c: TStringField;
    ADS567vali_name: TStringField;
    ADS567rkey34: TIntegerField;
    ADS567dispodalMan: TStringField;
    ADS567tslr: TStringField;
    DataSource2: TDataSource;
    ADS568: TADODataSet;
    ADS568rkey: TAutoIncField;
    ADS568failure_ptr: TIntegerField;
    ADS568part_name: TStringField;
    ADS568part_desc: TStringField;
    ADS568quantity: TBCDField;
    ADS568supplier_name: TStringField;
    ADS568amout: TBCDField;
    ADS568remart: TStringField;
    tmp: TADOQuery;
    ADS567failure_dat: TDateTimeField;
    procedure ADS567AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.dfm}

procedure TDM.ADS567AfterScroll(DataSet: TDataSet);
begin
frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS567.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS567.RecordCount);
end;

end.
