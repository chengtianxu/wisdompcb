program EP007;

uses
  Forms,
  main in 'main.pas' {Form_main},
  damo in 'damo.pas' {DM: TDataModule},
  budget in 'budget.pas' {Form_budget},
  QrySet in 'QrySet.pas' {qry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '增值税税率表';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(Tqry, qry);
  Application.Run;
end.
