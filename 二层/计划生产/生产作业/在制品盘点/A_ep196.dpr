program A_ep196;

uses
  Forms,
  main in 'main.pas' {Form1},
  demo in 'demo.pas' {DM: TDataModule},
  wip_code in 'wip_code.pas' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  rej_search in 'rej_search.pas' {Form_rej},
  employee_search in 'employee_search.pas' {Form_Employee},
  put_wip in 'put_wip.pas' {Form3},
  insert_wo in 'insert_wo.pas' {Form4},
  part_search in 'part_search.pas' {Form5},
  wo_search in 'wo_search.pas' {Form6},
  dept_search in 'dept_search.pas' {Form7},
  form_report in 'form_report.pas' {Form8},
  divergent in 'divergent.pas' {Form9},
  help in 'help.pas' {AboutBox},
  wipwo_search in 'wipwo_search.pas' {Form10},
  wip_divergent in 'wip_divergent.pas' {Form11},
  searchgroup in 'searchgroup.pas' {Form_group};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '在线产品盘点';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
