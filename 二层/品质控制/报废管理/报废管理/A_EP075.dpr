program A_EP075;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  Frm_Edt_u in 'Frm_Edt_u.pas' {Frm_Edt},
  Frm_WkP_u in 'Frm_WkP_u.pas' {Frm_WkP};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '±®∑œπ‹¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
