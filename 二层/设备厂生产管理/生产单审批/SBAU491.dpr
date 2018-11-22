program SBAU491;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {Form_condition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Éú²úµ¥ÉóºË';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
