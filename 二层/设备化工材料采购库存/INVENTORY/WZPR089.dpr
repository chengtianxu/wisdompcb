program WZPR089;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  update_inv in 'update_inv.pas' {Form2},
  damo in 'DAMO.PAS' {DM: TDataModule},
  device_inv in 'device_inv.pas' {Form3},
  inv_serach in 'inv_serach.pas' {form_inv},
  empl_search in 'empl_search.pas' {form_empl},
  Unit_search in 'Unit_search.pas' {form_unit},
  supplier_search in 'supplier_search.pas' {Form_supp},
  note_search in 'note_search.pas' {form_note},
  account_search in 'account_search.pas' {Form_account},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  loca_search in 'loca_search.pas' {Form_lo},
  new_inv in 'new_inv.pas' {Form4},
  update_stdcost in 'update_stdcost.pas' {Form5},
  about in 'about.pas' {AboutBox},
  note_information in 'note_information.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
