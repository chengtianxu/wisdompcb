program WZPR712;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uXSZJ in 'uXSZJ.pas' {frmXSZJ},
  uEMPInfo in 'uEMPInfo.pas' {frmEMPINFO},
  uXSMB in 'uXSMB.pas' {frmXSMB},
  uKFKH in 'uKFKH.pas' {frmKFKH},
  uCostomer in 'uCostomer.pas' {frmCostomer},
  uSKJH in 'uSKJH.pas' {frmSKJH},
  uCondition in 'uCondition.pas' {frmCondition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售总结';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
