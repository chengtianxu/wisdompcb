program A_ep109;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  workorder in 'workorder.pas' {Form2},
  note in 'NOTE.PAS' {edit_note},
  note_search in 'note_search.pas' {note_form},
  surcharge in 'surcharge.pas' {Form9},
  detail in 'DETAIL.PAS' {Form8},
  cust_search in 'cust_search.pas' {Form_Custmer},
  partsearch in 'partsearch.pas' {FrmCustPart},
  date_fw in 'date_fw.pas' {Form5},
  purchase_search in 'purchase_search.pas' {Form_po},
  sales_edit in 'sales_edit.pas' {Form12},
  address_search in 'address_search.pas' {Form_address},
  edit_rep in 'EDIT_REP.PAS' {Form_rep},
  rep_search in 'rep_search.pas' {rep_form},
  Search in 'Search.pas' {Frm_Search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售订单更改(计划部)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrm_Search, Frm_Search);
  Application.Run;
end.
