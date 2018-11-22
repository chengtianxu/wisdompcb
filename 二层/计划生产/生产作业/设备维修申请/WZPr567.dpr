program WZPr567;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_YS_u in 'Frm_YS_u.pas' {Frm_YS},
  employee in 'employee.pas' {Frm_employee},
  form_See in 'form_See.pas' {frm_See},
  formGetUserRights in 'formGetUserRights.pas' {frmGetUserRights};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '…Ë±∏Œ¨–ﬁ…Í«Î';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
