program WZPr268;

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
  URep in 'URep.pas' {Report_Frm},
  UVMIForm in 'UVMIForm.pas' {VMIForm},
  Frm_prod in 'Frm_prod.pas' {Prod_frm};

// UStan in '..\..\..\计划生产\计划投产\工序材料消耗标准\UStan.pas' {StanForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产领料申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
