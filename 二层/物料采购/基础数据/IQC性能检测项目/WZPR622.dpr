program WZPR622;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  DEMO in 'DEMO.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasCycle in 'PasCycle.pas' {frmCycle},
  PasCycleAdd in 'PasCycleAdd.pas' {frmDes},
  PasModify in 'PasModify.pas' {frmDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'IQC性能检测项目';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
