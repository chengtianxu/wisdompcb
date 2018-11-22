program doorlist;

uses
  Forms,
  main_u in 'main_u.pas' {frm_main},
  show_progress_u in 'show_progress_u.pas',
  doorlist_u in 'doorlist_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '门禁名单同步';
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
