program EP_587;

uses
  Forms,
  PasStepArrange in 'PasStepArrange.pas' {FrmStepArrange},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasStepDate in 'PasStepDate.pas' {frmStepDate},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  PasSetLevel in 'PasSetLevel.pas' {frmSetLevel},
  pasSetFieldName in 'pasSetFieldName.pas' {frmSetFieldName},
  PasUpdateLevel in 'PasUpdateLevel.pas' {frmUpdateLevel},
  WO_INFO in 'WO_INFO.pas' {frmWO_INFO},
  ManuPart_WIP in 'ManuPart_WIP.pas' {frmManuPart_WIP},
  Route_Param in 'Route_Param.pas' {FrmRoutParam},
  PasAllPause in 'PasAllPause.pas' {FrmAllPause},
  PasBatchPause in 'PasBatchPause.pas' {FrmBatchPause},
  PasStepPause in 'PasStepPause.pas' {frmStepPause},
  PasCollect2 in 'PasCollect2.pas' {FrmCollect2},
  PasPowerMX in 'PasPowerMX.pas' {frmPowerMX},
  PasBackMX in 'PasBackMX.pas' {frmBackMX};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '样品在线派工查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmStepArrange, FrmStepArrange);
  Application.CreateForm(TfrmPowerMX, frmPowerMX);
  Application.CreateForm(TfrmBackMX, frmBackMX);
  Application.Run;
end.
