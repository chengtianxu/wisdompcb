program WZPR264;

uses
  Forms,
  uUauEmp in 'uUauEmp.pas' {frmAuEmp},
  uDm in 'uDm.pas' {DM: TDataModule},
  uEmp in 'uEmp.pas' {frmEmp},
  uMain in 'uMain.pas' {frmMain},
  uPuau in 'uPuau.pas' {frmPuau};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报价审批流程';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
