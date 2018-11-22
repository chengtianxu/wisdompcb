program WZPR203;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  Demo in 'Demo.pas' {DM: TDataModule},
  Detail in 'Detail.pas' {Frm_Detail},
  WorkOder in 'WorkOder.pas' {Frm_WorkOder},
  Unusual in 'Unusual.pas' {Frm_Unusual},
  UnDetail in 'UnDetail.pas' {Frm_UnDetail},
  DeptCode in 'DeptCode.pas' {Frm_DeptCode},
  part_search in 'part_search.pas' {FrmCustPart},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  Deptcheck in 'DeptCheck.pas' {Frm_DeptCheck},
  QuerySet in 'QuerySet.pas' {Form_Condition},
  auth_info in 'auth_info.pas' {Form_authinfo},
  Frm_Report in 'Frm_Report.pas' {Form_Report},
  UDepname in 'UDepname.pas' {Frm_depname};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单在线返工申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.CreateForm(TFrm_depname, Frm_depname);
  Application.Run;
end.
