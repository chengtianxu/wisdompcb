program WZPR122;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_CF_u in 'Frm_CF_u.pas' {Frm_CF},
  discount_rate in 'discount_rate.pas' {Form_discountrate},
  Frm_YCB_u in 'Frm_YCB_u.pas' {Frm_YCB};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '业务员提成';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
