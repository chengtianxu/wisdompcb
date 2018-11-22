program LeaveType;

uses
  Forms,
  main in 'main.pas' {Form_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  AddLeaveType in 'AddLeaveType.pas' {Form_AddLeaveType},
  common in 'D:\vss_lyh\程序公共单位\common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '请假类型';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
