program IQC70;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  invt_iqc in 'invt_iqc.pas' {Form_invt_iqc};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿¥¡œºÏ≤È(IQC)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
