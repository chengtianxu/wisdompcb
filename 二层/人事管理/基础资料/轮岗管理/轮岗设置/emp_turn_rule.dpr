program emp_turn_rule;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÈËÊÂÂÖ¸ÚÉèÖÃ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
