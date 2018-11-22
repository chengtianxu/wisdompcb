program wzau206;

uses
  Forms,
  frmmain_u in 'frmmain_u.pas' {frm_main},
  auth_info in 'auth_info.pas' {Form_authinfo},
  damo in 'damo.pas' {DM: TDataModule},
  ufrm_detail in 'ufrm_detail.pas' {frm_detail},
  common in 'common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单在线返工审核';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
