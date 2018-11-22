program WZPR809;

uses
  Forms,
  WorkLog in 'WorkLog.pas' {WorkLog_f},
  DM_unt in '..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '工作日志';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TWorkLog_f, WorkLog_f);
  Application.Run;
end.
