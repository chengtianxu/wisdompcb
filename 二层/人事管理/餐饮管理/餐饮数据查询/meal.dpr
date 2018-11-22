program meal;

uses
  Forms,
  main_u in 'main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  card_add_u in 'card_add_u.pas' {frm_card_add};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
