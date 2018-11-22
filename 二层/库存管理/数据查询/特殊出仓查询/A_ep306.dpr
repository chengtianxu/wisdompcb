program A_ep306;

uses
  Forms,
  main in 'main.pas' {Form1},
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ãÿ ‚≥ˆ≤÷≤È—Ø';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmQuery, FrmQuery);
  Application.Run;
end.
