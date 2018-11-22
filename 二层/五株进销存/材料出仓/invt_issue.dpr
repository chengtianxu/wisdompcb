program invt_issue;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  delete_detail in 'delete_detail.pas' {Form3},
  Frm_report in 'Frm_report.pas' {report_issue},
  mulreport in 'mulreport.pas' {Form_mulreport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²ÄÁÏ³ö¿â';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
