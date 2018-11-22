program WZPr268_WLG;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_detailEdt_u in 'Frm_detailEdt_u.pas' {Frm_detailEdt},
  Frm_Out_u in 'Frm_Out_u.pas' {Frm_out},
  Frm_authInfo_u in 'Frm_authInfo_u.pas' {Frm_authInfo},
  Frm_Auth_u in 'Frm_Auth_u.pas' {Frm_Auth},
  Frm_Prod in 'Frm_Prod.pas' {Prod_Form},
  URep in 'URep.pas' {Report_Frm},
  VMIForm in 'VMIForm.pas' {UVMIForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '部门领料申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
