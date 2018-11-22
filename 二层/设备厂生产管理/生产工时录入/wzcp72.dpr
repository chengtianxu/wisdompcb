program wzcp72;

uses
  Forms,
  DM in 'DM.pas' {damo: TDataModule},
  Main in 'Main.pas' {FrmMain},
  AddMain in 'AddMain.pas' {AddFrmMain},
  QFrm in 'QFrm.pas' {frmQ},
  ProWorkTotal in 'ProWorkTotal.pas' {FrmProWorkTotal},
  WorkdeptInfo in 'WorkdeptInfo.pas' {FrmWorDept},
  WorkEmpInfo in 'WorkEmpInfo.pas' {FrmWorkEmp},
  UpdateWorkHouse in 'UpdateWorkHouse.pas' {FrmUpdateWorkHouse},
  WorkpaceInfo in 'WorkpaceInfo.pas' {FrmWorPace};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产工时录入';
  Application.CreateForm(Tdamo, damo);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TfrmQ, frmQ);
  Application.CreateForm(TFrmWorPace, FrmWorPace);
  Application.Run;
end.
