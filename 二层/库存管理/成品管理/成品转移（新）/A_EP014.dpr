program A_EP014;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '³ÉÆ·×ªÒÆ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
