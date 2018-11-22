program WZCP451;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  employee_search in 'employee_search.pas' {Form_employee},
  select_calculate in 'select_calculate.pas' {Form2},
  select_period in 'select_period.pas' {Form_period},
  status_bar in 'status_bar.pas' {Form3},
  Unit_expense in 'Unit_expense.pas' {Form_expense},
  Unit_unfinished in 'Unit_unfinished.pas' {Form_unfinished};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成本核算处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
