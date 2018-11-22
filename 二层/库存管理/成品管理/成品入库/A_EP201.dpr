program A_EP201;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  IF_Unit2 in 'IF_Unit2.pas' {If_Form2},
  Frm_Loc_u in 'Frm_Loc_u.pas' {Frm_Loc},
  Frm_Rep_u in 'Frm_Rep_u.pas' {Frm_Rep},
  Frm_Enter_u in 'Frm_Enter_u.pas' {Frm_Enter},
  Frm_back_u in 'Frm_back_u.pas' {Frm_back};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品入仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
