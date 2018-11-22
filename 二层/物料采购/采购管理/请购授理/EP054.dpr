program EP054;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  edit_req in 'EDIT_REQ.PAS' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  empl_search in 'empl_search.pas' {form_employee},
  auth_search in 'auth_search.pas' {Form_auth},
  budget_search in 'budget_search.pas' {Form_budget},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  addedit_requ in 'addedit_requ.pas' {Form3},
  inv_search in 'inv_search.pas' {form_inv},
  supplier_search in 'supplier_search.pas' {Form_supp},
  addedit_m in 'addedit_m.pas' {Form4},
  budget_ximu in 'budget_ximu.pas' {Form5},
  csi_search in 'csi_search.pas' {Form_csi},
  Unit_search in 'Unit_search.pas' {form_unit},
  auth_info in 'auth_info.pas' {Form6},
  dpment_search in 'dpment_search.pas' {Form_dept},
  received in 'received.pas' {Form7},
  stdhistory_price in 'stdhistory_price.pas' {Form_stdprice},
  michistory_price in 'michistory_price.pas' {Form_micprice},
  curr_search in 'curr_search.pas' {curr_form},
  kucun_serach in 'kucun_serach.pas' {Form20},
  zaitu_invt in 'zaitu_invt.pas' {Form_zaitu},
  Frm_MatZT_u in 'Frm_MatZT_u.pas' {Frm_MatZT},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  uRq_Detail in 'uRq_Detail.pas' {frm_Rqdetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '«Îπ∫µ• ‹¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.
