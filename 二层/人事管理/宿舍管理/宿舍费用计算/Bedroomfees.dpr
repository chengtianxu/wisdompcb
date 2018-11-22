program Bedroomfees;

uses
  Forms,
  frm_main_u in 'frm_main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bedroomfees';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
