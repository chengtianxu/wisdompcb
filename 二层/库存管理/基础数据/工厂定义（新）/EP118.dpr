program EP118;

uses
  Forms,
  main in 'main.pas' {Form_main},
  damo in 'damo.pas' {DM: TDataModule},
  budget in 'budget.pas' {Form_budget},
  QrySet in 'QrySet.pas' {Qry},
  empl_search in 'empl_search.pas' {FrmEmployeeSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工厂定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TQry, Qry);
  Application.Run;
end.
