program WZAU306;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.PAS' {Frm_main},
  DM_u in 'DM_u.PAS' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序外发退货审核';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
