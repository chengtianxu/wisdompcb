program EP248;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  orderser_form in 'orderser_form.pas' {Form_orderser},
  locser_form in 'locser_form.pas' {Form_locser},
  supplyser_form in 'supplyser_form.pas' {Form_supplyser},
  peopleser_form in 'peopleser_form.pas' {Form_peopleser},
  proin_form in 'proin_form.pas' {Form_proin},
  proout_form in 'proout_form.pas' {Form_proout},
  pronow_form in 'pronow_form.pas' {Form_pronow},
  deptser_form in 'deptser_form.pas' {Form_deptser},
  zx_report in 'zx_report.pas' {Form_report},
  PasCutoff in 'PasCutoff.pas' {frmCutoff},
  PasQueryCutoff in 'PasQueryCutoff.pas' {frmQueryCutoff},
  ShowCutoff in 'ShowCutoff.pas' {frmShowCutoff},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  Pas_report_zxcard in 'Pas_report_zxcard.pas' {frm_report_zx};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := '杂项物品进出存查询';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrm_report_zx, frm_report_zx);
  Application.Run;
end.
