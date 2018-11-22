program wzpr805;

uses
  Forms,
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasMain in 'PasMain.pas' {frmMain},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow},
  PasModify in 'PasModify.pas' {frmModify},
  PasAddFile in 'PasAddFile.pas' {frmAddFile},
  PasTmpTo in 'PasTmpTo.pas' {frmTmpTo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商环保测试报告';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
