program WZPR327;

uses
  Forms,
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasMain in 'PasMain.pas' {frmMain},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasModify in 'PasModify.pas' {frmModify},
  PasNumber in 'PasNumber.pas' {frmNumber},
  PasChang in 'PasChang.pas' {frmChang},
  PasDepartChang in 'PasDepartChang.pas' {frmDepartChang};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产变更';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
