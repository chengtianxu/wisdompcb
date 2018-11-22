program WZSB70_2;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∂©µ•»∑»œ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
