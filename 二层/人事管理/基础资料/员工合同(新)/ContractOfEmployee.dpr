program ContractOfEmployee;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasAddEdit in 'PasAddEdit.pas' {frmAddEdit},
  PasYear in 'PasYear.pas' {frmYear},
  PasManager in 'PasManager.pas' {frmManager};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工合同';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
