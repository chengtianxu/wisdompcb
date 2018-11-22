program WZPr570;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_EdtXh_u in 'Frm_EdtXh_u.pas' {Frm_EdtXh},
  Frm_WFIn_u in 'Frm_WFIn_u.pas' {Frm_WFIn},
  Frm_GXCL_u in 'Frm_GXCL_u.pas' {Frm_GXCL},
  Frm_Edt_u in 'Frm_Edt_u.pas' {Frm_Edt},
  Frm_ParaUpdate_u in 'Frm_ParaUpdate_u.pas' {Frm_ParaUpdate},
  Frm_DlgRd_u in 'Frm_DlgRd_u.pas' {Frm_DlgRd};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序物料消耗及产值统计';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
