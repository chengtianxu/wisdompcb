program WZPR391;

uses
  Forms,
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasMain in 'PasMain.pas' {frmMain},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow},
  PasModify in 'PasModify.pas' {frmModify},
  PasPOSel in 'PasPOSel.pas' {frmPOSel},
  PasMeasure in 'PasMeasure.pas' {frmMeasure},
  PasReport in 'PasReport.pas' {frmReporter},
  PasDesign in 'PasDesign.pas' {frmDesign},
  PasTypeAdd in 'PasTypeAdd.pas' {frmTypeAdd},
  PasSelect in 'PasSelect.pas' {frmSelect},
  PasReason in 'PasReason.pas' {frmReason},
  PasQReq in 'PasQReq.pas' {frmQRep},
  PasData in 'PasData.pas' {frmReport},
  PasBadRecord in 'PasBadRecord.pas' {frmBadRecord},
  PasBadDetail in 'PasBadDetail.pas' {frmBadDetail},
  PasCode in 'PasCode.pas' {frmCode},
  qrcode in 'qrcode.pas',
  PasMulCode in 'PasMulCode.pas' {frmMulCode};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'IQC¼ì²â±¨¸æ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
