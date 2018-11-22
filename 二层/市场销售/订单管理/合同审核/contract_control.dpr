program contract_control;

uses
  Forms,
  frm_main_u in 'frm_main_u.pas' {frm_main},
  demo in 'demo.pas' {dm: TDataModule},
  frm_edit_u in 'frm_edit_u.pas' {Frm_Edit},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  frm_check_u in 'frm_check_u.pas' {Frm_check},
  frm_report_u in 'frm_report_u.pas' {Form_report},
  u_frmbusinessprocess in 'u_frmbusinessprocess.pas' {frmbusinessprocess},
  u_frmcpedit in 'u_frmcpedit.pas' {frm_cpedit},
  PasAuthentic in 'PasAuthentic.pas' {Form1};

{$R *.res}

begin
{
  Application.Initialize;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(Tdm, dm);
  Application.Run;  }
  Application.Initialize;
  Application.Title := '∫œÕ¨…Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TForm_report, Form_report);
  Application.Run;
end.
