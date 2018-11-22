program WZPR840;

uses
  Forms,
  form_RespGroup in 'form_RespGroup.pas' {frm_RespGroup},
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '责任小组设置';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(Tfrm_RespGroup, frm_RespGroup);
  Application.Run;
end.
