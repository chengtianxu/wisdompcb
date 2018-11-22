program A_WZCX58;

uses
  Forms,
  main in 'main.pas' {Form1},
  condition in 'condition.pas' {Form_condition},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow},
  InFrm in 'InFrm.pas' {frmIN};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '±¨·ÏÃ÷Ï¸²éÑ¯';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
