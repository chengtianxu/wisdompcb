program EmployeecarMsg;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  common in 'D:\vss_lyh\程序公共单位\common.pas',
  AddAttendance in 'AddAttendance.pas' {Form_AddAttendance},
  StaffList in 'StaffList.pas' {Form_StaffList},
  Search in 'Search.pas' {Form_Search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '考勤发卡退卡';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
