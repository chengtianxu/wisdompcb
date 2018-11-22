program WZCX704;

uses
  Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uCondition in 'uCondition.pas' {frmCondition},
  uSearchDept in 'uSearchDept.pas' {frmSearchDept},
  uEMPInfo in 'uEMPInfo.pas' {frmEMPINFO},
  uDDJF in 'uDDJF.pas' {frmDDJF},
  uGZRZ in 'uGZRZ.pas' {frmGZRZ},
  uKHTS in 'uKHTS.pas' {frmKHTS},
  uShowGZRZ in 'uShowGZRZ.pas' {frmShowGZRZ},
  uYWYXZ in 'uYWYXZ.pas' {frmYWYXZ},
  uZGKH in 'uZGKH.pas' {frmZGKH},
  uShowKFKH in 'uShowKFKH.pas' {frmShowKFKH},
  uShowSKJH in 'uShowSKJH.pas' {frmShowSKJH},
  uShowXSZJ in 'uShowXSZJ.pas' {frmShowXSZJ},
  uXSZJ in 'uXSZJ.pas' {frmXSZJ},
  uShowXSMB in 'uShowXSMB.pas' {frmshowXSMB},
  uXSMB in 'uXSMB.pas' {frmXSMB},
  uSKJH in 'uSKJH.pas' {frmSKJH},
  uKFKH in 'uKFKH.pas' {frmKFKH};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'œ˙ €≤È—Ø';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
