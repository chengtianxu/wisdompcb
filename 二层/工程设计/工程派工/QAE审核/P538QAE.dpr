program P538QAE;

uses
  Forms,
  pasProject in 'pasProject.pas' {frmProject},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasSetFieldName in 'pasSetFieldName.pas' {frmSetFieldName},
  pasMemo in 'pasMemo.pas' {FrmMemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'π§≥Ã≈…π§QAE…Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmProject, frmProject);
  Application.CreateForm(TFrmMemo, FrmMemo);
  Application.Run;
end.
