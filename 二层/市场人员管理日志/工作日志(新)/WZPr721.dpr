program WZPr721;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_YS_u in 'Frm_YS_u.pas' {Frm_YS},
  report_data in 'report_data.pas' {Form_report},
  PasVisitQry in 'PasVisitQry.pas' {frmVisitQry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '拜访客户日志';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TfrmVisitQry, frmVisitQry);
  Application.Run;
end.
