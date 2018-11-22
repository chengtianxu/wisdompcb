program OnLineProdschedule;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  UQry in 'UQry.pas' {frmQry},
  UUpdatLevel in 'UUpdatLevel.pas' {frmUpdateLevel},
  UPause in 'UPause.pas' {frmPause},
  uWODetail in 'uWODetail.pas' {frmWoDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '在线产品生产计划';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
