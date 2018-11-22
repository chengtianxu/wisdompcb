program EP051;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  edit_req in 'EDIT_REQ.PAS' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  auth_search in 'auth_search.pas' {Form_auth},
  budget_search in 'budget_search.pas' {Form_budget},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  addedit_requ in 'addedit_requ.pas' {Form3},
  inv_search in 'inv_search.pas' {form_inv},
  addedit_m in 'addedit_m.pas' {Form4},
  budget_ximu in 'budget_ximu.pas' {Form5},
  Unit_search in 'Unit_search.pas' {form_unit},
  auth_info in 'auth_info.pas' {Form6},
  received in 'received.pas' {Form7},
  kucun_serach in 'kucun_serach.pas' {Form20};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿ªÇë¹ºµ¥';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
