program WorktimeReport;

uses
  Forms,
  main in 'main.pas' {frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  common in 'D:\vss_lyh\程序公共单位\common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '考勤汇总报表';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.Run;
end.
