program OEESet;

uses
  Forms,
  UDM in 'UDM.pas' {DM: TDataModule},
  UMain in 'UMain.pas' {FrmMain},
  UDetail in 'UDetail.pas' {FrmDetail},
  UMachineDetail in 'UMachineDetail.pas' {FrmMachineDetail},
  UPDetail in 'UPDetail.pas' {FrmPDetail},
  USelProcess in 'USelProcess.pas' {FrmSelProcess};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ºﬁ∂Ø¬ …Ë÷√';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
