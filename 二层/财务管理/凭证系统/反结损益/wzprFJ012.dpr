program wzprFJ012;

uses
  Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  Main in 'Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '反结转损益';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TFrmMain, FrmMain);

  Application.Run;
end.
