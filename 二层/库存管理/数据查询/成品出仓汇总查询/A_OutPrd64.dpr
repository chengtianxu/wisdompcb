program A_OutPrd64;

uses
  Forms,
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  Pas2DSummary in 'Pas2DSummary.pas' {frm2DSummary};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '出货汇总查询';
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(Tfrm2DSummary, frm2DSummary);
  Application.Run;
end.
