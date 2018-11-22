program A_EP031;

uses
  Forms,
  main in 'main.pas' {Form1},
  add_ship in 'add_ship.pas' {Form2},
  damo in 'damo.pas' {DM: TDataModule},
  note_search in 'note_search.pas' {note_form},
  note in 'NOTE.PAS' {edit_note},
  shipaddress in 'shipaddress.pas' {Form_address},
  shipmeoth in 'shipmeoth.pas' {form_shipmethod},
  conf_note in 'conf_note.pas' {Form7},
  Unit_search in 'Unit_search.pas' {form_unitcode},
  pack_list in 'pack_list.pas' {Form4},
  add_packlist in 'add_packlist.pas' {Form5},
  customer_search in 'customer_search.pas' {FrmCustSearch},
  list_report in 'list_report.pas' {Form6},
  packlist_report in 'packlist_report.pas' {Form9},
  mul_report in 'mul_report.pas' {Form_mulreport},
  assign_split in 'assign_split.pas' {Form11},
  wo_split in 'wo_split.pas' {Form12},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装箱单管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
