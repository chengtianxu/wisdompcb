program A_wzpr300;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.PAS' {Frm_main},
  DM_u in 'DM_u.PAS' {DM: TDataModule},
  Frm_Edit_u in 'Frm_Edit_u.PAS' {Frm_Edit},
  Frm_EdtDetail_u in 'Frm_EdtDetail_u.pas' {Frm_EdtDetail},
  Frm_AudInf_u in 'Frm_AudInf_u.pas' {Frm_AudInf},
  Frm_recv_u in 'Frm_recv_u.pas' {Frm_recv},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_Auth_u in 'Frm_Auth_u.pas' {Frm_Auth},
  inv_search in 'inv_search.pas' {form_inv};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外发加工申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
