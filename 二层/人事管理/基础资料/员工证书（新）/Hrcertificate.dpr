program Hrcertificate;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  damo in 'damo.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasAddEdit in 'PasAddEdit.pas' {frmAddEdit},
  PasImport in 'PasImport.pas' {frmImport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工证书';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
