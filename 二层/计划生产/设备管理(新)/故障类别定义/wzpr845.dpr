program wzpr845;

uses
  Forms,
  main in 'main.pas' {Frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  FaultTypeSet in 'FaultTypeSet.pas' {frm_FaultTypeSet},
  FaultName in 'FaultName.pas' {frm_FaultName};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '故障类别定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
