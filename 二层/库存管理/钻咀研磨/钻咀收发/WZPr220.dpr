program WZPr220;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_ZZout_u in 'Frm_ZZout_u.pas' {Frm_ZZout},
  Frm_ZZrecv_u in 'Frm_ZZrecv_u.pas' {Frm_ZZrecv},
  Frm_Out_u in 'Frm_Out_u.pas' {Frm_out},
  Frm_detailEdt_u in 'Frm_detailEdt_u.pas' {Frm_detailEdt},
  Frm_RecvDetail_u in 'Frm_RecvDetail_u.pas' {Frm_RecvDetail},
  Frm_Look_u in 'Frm_Look_u.pas' {Frm_Look},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Pas_Dele_u in 'Pas_Dele_u.pas' {Frm_Dele_u};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ê×ìÊÕ·¢';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
