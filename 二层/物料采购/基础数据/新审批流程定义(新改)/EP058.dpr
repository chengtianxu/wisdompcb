program EP058;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Pick_WorkShop in 'Pick_WorkShop.pas' {frmPick_WorkShop};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '审批流程定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TFrm_QrySet, Frm_QrySet);
  Application.Run;
end.
