program EP201;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_Enter_u in 'Frm_Enter_u.pas' {Frm_Enter},
  Frm_back_u in 'Frm_back_u.pas' {Frm_back},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品入仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
