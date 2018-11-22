program EP051;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_note_u in 'Frm_note_u.pas' {Frm_note},
  Frm_DetailEdit_u in 'Frm_DetailEdit_u.pas' {Frm_DetailEdit},
  Frm_Matstock_u in 'Frm_Matstock_u.pas' {Frm_Matstock},
  Frm_DetailEdit1_u in 'Frm_DetailEdit1_u.pas' {Frm_DetailEdit1},
  Frm_authInfo_u in 'Frm_authInfo_u.pas' {Frm_authInfo},
  Frm_recInf_u in 'Frm_recInf_u.pas' {Frm_recInf},
  Frm_MatZT_u in 'Frm_MatZT_u.pas' {Frm_MatZT},
  Frm_Auth_u in 'Frm_Auth_u.pas' {Frm_Auth},
  historypr in 'historypr.pas' {Frm_historypr},
  Frm_report in 'Frm_report.pas' {Form_Report},
  supplier in 'supplier.pas' {frm_supplier};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '«Îπ∫µ•π‹¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
