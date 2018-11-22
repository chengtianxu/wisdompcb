program WZPR811;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  MaintenanceCycleSetting in 'MaintenanceCycleSetting.pas' {Frm_MaintenanceCycleSetting},
  MaintenanceCycle in 'MaintenanceCycle.pas' {Frm_MaintenanceCycle},
  MainCyclDefinition in 'MainCyclDefinition.pas' {frm_MainCyclDefinition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '保养周期设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
