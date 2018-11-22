program WZPR416;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_Out_u in 'Frm_Out_u.pas' {Frm_out};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '÷±Ω”»Îø‚';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
