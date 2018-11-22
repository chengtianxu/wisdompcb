program QuotePriceEff;

{$R 'CallerResource.res' 'CallerResource.rc'}

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {frmCondition},
  Detail in 'Detail.pas' {frmDetail},
  SetItem in 'SetItem.pas' {frmSetItem},
  Reports in 'Reports.pas' {frmReports},
  RptCondition in 'RptCondition.pas' {frmRptCondition},
  CtwObjectDebugger in 'CtwObjectDebugger.pas' {CantObjDebForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报价时效管理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
