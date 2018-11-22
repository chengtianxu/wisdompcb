program Bedroom_equipment_record;

uses
  Forms,
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasMain in 'PasMain.pas' {frmMain},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasModify in 'PasModify.pas' {frmModyfy},
  PasImport in 'PasImport.pas' {frmImport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Àﬁ…·≥≠±Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
