program classgroup;

uses
  Forms,
  frm_main_u in 'frm_main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  frm_detail_u in 'frm_detail_u.pas' {frm_detail},
  frm_emp_choose_u in 'frm_emp_choose_u.pas' {frm_emp_choose},
  frm_dataoperating_u in 'frm_dataoperating_u.pas' {frm_dataoperating},
  TMyThread_u in 'TMyThread_u.pas',
  TMyThread2_u in 'TMyThread2_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '°à×éÉè¶¨';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
