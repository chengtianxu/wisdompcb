program WZSB268;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  URep in 'URep.pas' {Report_Frm},
  UVMIForm in 'UVMIForm.pas' {VMIForm},
  PasWzcp0492 in 'PasWzcp0492.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产领料申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
