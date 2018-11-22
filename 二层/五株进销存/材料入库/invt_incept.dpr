program invt_incept;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  delete_detail in 'delete_detail.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤ƒ¡œ»Îø‚';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TFrm_detail, Frm_detail);
  Application.Run;
end.
