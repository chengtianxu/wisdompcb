program emp_turn_check;

uses
  Forms,
  frm_main_u in 'frm_main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  frm_edit_u in 'frm_edit_u.pas' {Form_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÂÖ¸Ú¼ì²é';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
