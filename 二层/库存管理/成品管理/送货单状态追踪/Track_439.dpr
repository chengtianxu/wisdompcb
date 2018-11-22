program Track_439;

uses
  Forms,
  PasTrackMain in 'PasTrackMain.pas' {frmTrackMain},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  PasExplanation in 'PasExplanation.pas' {frmExplanation};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户送货单状态追踪';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmTrackMain, frmTrackMain);
  Application.CreateForm(TFrmQuery, FrmQuery);
  Application.Run;
end.
