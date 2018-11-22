program WZPR570_XH;

uses
  Forms,
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasMain in 'PasMain.pas' {frmMain},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasModify in 'PasModify.pas' {frmModify},
  PasSelect in 'PasSelect.pas' {frmSelect},
  PasQReq in 'PasQReq.pas' {frmQRep},
  PasReport in 'PasReport.pas' {frmReport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序物料消耗统计';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
