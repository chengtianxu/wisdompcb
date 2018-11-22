program WZPR106;

uses
  Forms,
  uMain in 'uMain.pas' {FMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uProgress in 'uProgress.pas' {FProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '财务报表查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
