program Bedroom_equipment_record;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  detail_u in 'detail_u.pas' {detail_form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Àﬁ…·≥≠±Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
