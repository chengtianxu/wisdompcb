program A_EP060;

uses
  Forms,
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  frm_subdetail_u in 'frm_subdetail_u.pas' {frm_subdetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '计划准交率查询';
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(Tfrm_subdetail, frm_subdetail);
  Application.Run;
end.
