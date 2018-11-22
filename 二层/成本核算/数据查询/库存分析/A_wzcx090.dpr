program A_wzcx090;

uses
  Forms,
  main in 'main.pas' {Form1},
  Unit_wip in 'Unit_wip.pas' {Form_wip},
  Unit_report0 in 'Unit_report0.pas' {Form_report0},
  Unit_progress in 'Unit_progress.pas' {Form_progress},
  Unit_fg in 'Unit_fg.pas' {Form_fg},
  Unit_mat in 'Unit_mat.pas' {Form_mat},
  Unit_online in 'Unit_online.pas' {Form_online},
  Unit_report2 in 'Unit_report2.pas' {Form_report2},
  Unit_report3 in 'Unit_report3.pas' {Form_report3},
  Unit_report4 in 'Unit_report4.pas' {Form_report4},
  Unit_lot in 'Unit_lot.pas' {Form_lot},
  Unit_lotmb1 in 'Unit_lotmb1.pas' {Form_lotmb1},
  Unit_lotmb2 in 'Unit_lotmb2.pas' {Form_lotmb2},
  Unit_lotmb3 in 'Unit_lotmb3.pas' {Form_lotmb3},
  damo in 'damo.pas' {dm: TDataModule},
  lining_cost in 'lining_cost.pas' {Form_lining},
  Frm_InOut_u in 'Frm_InOut_u.pas' {Frm_InOut},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  unit_changepcs in 'unit_changepcs.pas' {frmChangePcsPrice};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿â´æ·ÖÎö';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
