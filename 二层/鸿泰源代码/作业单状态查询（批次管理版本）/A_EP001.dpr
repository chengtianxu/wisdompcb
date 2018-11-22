program A_EP001;

uses
  Forms,
  main in 'main.pas' {frmMain},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  WO_INFO in 'WO_INFO.pas' {frmWO_INFO},
  Route_Param in 'Route_Param.pas' {FrmRoutParam},
  report_data in 'report_data.pas' {Form_report},
  Dlg_WO_Split in 'Dlg_WO_Split.pas' {frmDlg_WO_Split},
  uSumQuery in 'uSumQuery.pas' {frmSumQuery},
  ManuPart_WIP in 'ManuPart_WIP.pas' {frmManuPart_WIP},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow},
  ComplainFrm in 'ComplainFrm.pas' {Frm_Complain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单查询';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
