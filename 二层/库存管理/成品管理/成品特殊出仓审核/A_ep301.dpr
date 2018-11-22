program A_ep301;

uses
  Forms,
  main in 'main.pas' {Form1},
  main_one in 'main_one.pas' {Form4},
  t_report in 't_report.pas' {Form_trp},
  PasQuery in 'PasQuery.pas' {frmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ãÿ ‚≥ˆ≤÷…Û∫À';
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
