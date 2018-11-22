program wzprFJFY;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '反结转成本费用';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
