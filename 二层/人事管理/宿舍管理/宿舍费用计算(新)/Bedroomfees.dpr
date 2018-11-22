program Bedroomfees;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  DEMO in 'DEMO.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Àﬁ…·∑—”√º∆À„';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
