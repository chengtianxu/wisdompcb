program wzpr079;

uses
  Forms,
  Datamodule in 'Datamodule.pas' {DM: TDataModule},
  Main in 'Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ω·’À';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
