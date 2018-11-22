program A_EP023;

uses
  Forms,
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_main_u in 'Frm_main_u.pas' {Frm_main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¶©µ¥Ç÷ÊÆ·ÖÎö';
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
