program WZCX56;

uses
  Forms,
  pasOnlineQuery in 'pasOnlineQuery.pas' {FrmOnlineQuery},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  PasDispatchSMS in 'PasDispatchSMS.pas' {FrmDispatchSMS},
  PasPublic in 'PasPublic.pas',
  PasStepPause in 'PasStepPause.pas' {frmStepPause},
  PasBatchPause in 'PasBatchPause.pas' {FrmBatchPause},
  Pick_Item_Single in 'Pick_Item_Single.pas',
  PasAllPause in 'PasAllPause.pas' {FrmAllPause},
  PasCollect in 'PasCollect.pas' {FrmCollect},
  pasSetFieldName in 'pasSetFieldName.pas' {frmSetFieldName},
  PasDM in 'PasDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  if GetTimeStory = ts_12 then {如果为 12 小时制则显示为 24 小时制}
     SetTimeStory(ts_24);
//  else                         {//如果为 24 小时制则显示为 12 小时制}
//     SetTimeStory(ts_12);
  Application.Title := '在制品在线派工查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmOnlineQuery, FrmOnlineQuery);
  Application.CreateForm(TFrmQuery, FrmQuery);
  Application.Run;
end.
