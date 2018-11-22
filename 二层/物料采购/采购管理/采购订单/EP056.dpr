program EP056;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  supp_search in 'supp_search.pas' {Form_supp},
  add_po in 'ADD_PO.PAS' {Form2},
  inv_search in 'inv_search.pas' {form_inv},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  account_search in 'account_search.pas' {Form_account},
  supp_price_search in 'supp_price_search.pas' {Form3},
  edit_add_po in 'edit_add_po.pas' {Form4},
  shipmeoth_search in 'shipmeoth_search.pas' {form_shipmethod},
  ssadd_search in 'ssadd_search.pas' {Form_address},
  supplier in 'supplier.pas' {Form6},
  edit_misc in 'edit_misc.pas' {Form7},
  state_tax in 'state_tax.pas' {Form8},
  edit_std_inv in 'edit_std_inv.pas' {Form9},
  Unit_search in 'Unit_search.pas' {form_unit},
  note in 'NOTE.PAS' {edit_note},
  note_search in 'note_search.pas' {form_note},
  edit_misc_po in 'edit_misc_po.pas' {Form10},
  annotation in 'annotation.pas' {Form11},
  PR_search in 'PR_search.pas' {Form_req},
  save_po_number in 'save_po_number.pas' {Form12},
  po_inspection in 'po_inspection.pas' {Form13},
  desi_report in 'desi_report.pas' {Form14},
  desi_reportmic in 'desi_reportmic.pas' {Form15},
  received_info in 'received_info.pas' {Form19},
  auth_info in 'auth_info.pas' {Form_auth_info},
  dpment_search in 'dpment_search.pas' {Form_dept},
  kucun_serach in 'kucun_serach.pas' {Form20},
  qian_huo in 'qian_huo.pas' {Form21},
  mul_report in 'mul_report.pas' {Form_mulreport},
  PO_change in 'PO_change.pas' {Form16},
  zaitu_invt in 'zaitu_invt.pas' {Form_zaitu},
  stdhistory_price in 'stdhistory_price.pas' {Form_stdprice},
  edit_req_date in 'edit_req_date.pas' {frm_edit_req_date},
  Usel in 'Usel.pas' {Form_sel},
  UContractPayDetail in 'UContractPayDetail.pas' {frmCPayDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '采购单管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_sel, Form_sel);
  Application.Run;
end.
