program A_EP013F;

uses
  Forms,
  main in 'main.pas' {frmMain},
  DM in 'DM.pas' {dmcon: TDataModule},
  WO_Count in 'WO_Count.pas' {frmWO_Count},
  Pswd_Set in 'Pswd_Set.pas' {frmPswd_Set},
  Dlg_WO_Qty in 'Dlg_WO_Qty.pas' {frmDlg_WO_Qty},
  report_data in 'report_data.pas' {Form_report},
  Pick_WorkShop in 'Pick_WorkShop.pas' {frmPick_WorkShop},
  auto_deploy in 'auto_deploy.pas' {Form_auto_deploy},
  Unit1 in 'Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单条码过数';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
