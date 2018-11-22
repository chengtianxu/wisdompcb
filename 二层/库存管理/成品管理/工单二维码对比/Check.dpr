program Check;

uses
  Forms,
  Check2DBar in 'Check2DBar.pas' {Form1},
  history in 'history.pas' {frmHistroy},
  DM in 'DM.pas' {dm1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
