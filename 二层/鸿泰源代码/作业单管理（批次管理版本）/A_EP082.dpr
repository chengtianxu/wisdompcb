program A_EP082;

uses
  Forms,
  main_082 in 'main_082.pas' {frmMain_082},
  Half_Finished_Prod_Deploy in 'Half_Finished_Prod_Deploy.pas' {frmHalf_Finished_Prod_Deploy},
  Dm in 'Dm.pas' {Dmcon: TDataModule},
  DeployWO in 'DeployWO.pas' {frmDeployWO},
  Dlg_Chng_Qty in 'Dlg_Chng_Qty.pas' {frmDlg_Chng_Qty},
  WO_Release in 'WO_Release.pas' {frmWO_Release},
  WOCtrl in 'WOCtrl.pas' {frmWOCtrl},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  WO_INFO in 'WO_INFO.pas' {frmWO_INFO},
  Route_Param in 'Route_Param.pas' {FrmRoutParam},
  Dlg_WO_Pause_Note in 'Dlg_WO_Pause_Note.pas' {frmDlg_WO_Pause_Note},
  Dlg_WO_Flow_Chng in 'Dlg_WO_Flow_Chng.pas' {frmDlg_WO_Flow_Chng},
  Dlg_WO_Split in 'Dlg_WO_Split.pas' {frmDlg_WO_Split},
  report_data in 'report_data.pas' {Form_report},
  mul_report in 'mul_report.pas' {Form_mulreport},
  Dlg_Single_Print in 'Dlg_Single_Print.pas' {frmDlg_Single_Print},
  Unit1 in 'Unit1.pas',
  Frm_WoCancel_u in 'Frm_WoCancel_u.pas' {Frm_WoCancel},
  equipment_report in 'equipment_report.pas' {Form_equipmentreport},
  Frm_FacSel_u in 'Frm_FacSel_u.pas' {Frm_FacSel};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单管理';
  Application.CreateForm(TDmcon, Dmcon);
  Application.CreateForm(TfrmMain_082, frmMain_082);
  Application.Run;
end.
