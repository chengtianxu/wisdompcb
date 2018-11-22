program employeesalary;

uses
  Forms,
  main_u in 'main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  frm_salarydb_u in 'frm_salarydb_u.pas' {frm_salarydb},
  rpt_model_u in 'rpt_model_u.pas' {frm_rpt_model},
  salary_import_u in 'salary_import_u.pas' {frm_salary_import},
  UQuery in 'UQuery.pas' {Query_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¹¤×Ê¼ÆËã';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(Tfrm_rpt_model, frm_rpt_model);
  Application.CreateForm(Tfrm_salarydb, frm_salarydb);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
