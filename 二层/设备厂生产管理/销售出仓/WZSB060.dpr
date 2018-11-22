program WZSB060;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_detailEdt_u in 'Frm_detailEdt_u.pas' {Frm_detailEdt},
  address_search in 'address_search.pas' {Form_address},
  Frm_Out_u in 'Frm_Out_u.pas' {Frm_out},
  Frm_salesOrder_u in 'Frm_salesOrder_u.pas' {Frm_salesOrder};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÏúÊÛ³ö¿â';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
