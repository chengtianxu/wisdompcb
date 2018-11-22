program WZPR327;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_Edit_u in 'Frm_Edit_u.pas' {Frm_Edit},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree},
  Frm_origVal_u in 'Frm_origVal_u.pas' {Frm_origVal},
  Frm_DeprDept_u in 'Frm_DeprDept_u.pas' {Frm_DeprDept};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产变更';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
