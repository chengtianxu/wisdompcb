program EP057;

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
  supplier_info in 'supplier_info.pas' {Form4},
  michistory_price in 'michistory_price.pas' {Form_micprice},
  stdhistory_price in 'stdhistory_price.pas' {Form_stdprice},
  UToWeiXin in 'UToWeiXin.pas' {frmToWeiXin};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '«Îπ∫µ•…Û≈˙';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
