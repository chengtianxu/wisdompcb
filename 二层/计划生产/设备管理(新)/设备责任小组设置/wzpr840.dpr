program wzpr840;

uses
  Forms,
  main in 'main.pas' {Frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  ResponsibilityGroup in 'ResponsibilityGroup.pas' {frm_ResponsilibyGroup},
  EmployeeSet in 'EmployeeSet.pas' {frm_EmployeeSet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备责任小组设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
