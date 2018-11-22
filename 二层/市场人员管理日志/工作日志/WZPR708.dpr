program WZPR708;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uGZRZ in 'uGZRZ.pas' {frmGZRZ},
  uEMPInfo in 'uEMPInfo.pas' {frmEMPINFO},
  uXSMB in 'uXSMB.pas' {frmXSMB},
  uDDJF in 'uDDJF.pas' {frmDDJF},
  uCostomer in 'uCostomer.pas' {frmCostomer},
  uKHTS in 'uKHTS.pas' {frmKHTS},
  uCPInfo in 'uCPInfo.pas' {frmCPInfo},
  uYWYXZ in 'uYWYXZ.pas' {frmYWYXZ},
  uCondition in 'uCondition.pas' {frmCondition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '市场部工作日志';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
