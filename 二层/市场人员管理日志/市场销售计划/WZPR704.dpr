program WZPR704;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uXSMB in 'uXSMB.pas' {frmXSMB},
  uDM in 'uDM.pas' {DM: TDataModule},
  uEMPInfo in 'uEMPInfo.pas' {frmEMPINFO},
  uZGKH in 'uZGKH.pas' {frmZGKH},
  uCostomer in 'uCostomer.pas' {frmCostomer},
  uKFKH in 'uKFKH.pas' {frmKFKH},
  uSKJH in 'uSKJH.pas' {frmSKJH},
  uCondition in 'uCondition.pas' {frmCondition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '市场部销售计划';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
