program A_EP032;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'DAMO.PAS' {dm: TDataModule},
  addsa_order in 'addsa_order.pas' {Form2},
  cust_search in 'cust_search.pas' {Frm_Cust},
  part_search in 'part_search.pas' {FrmCustPart},
  purchase_search in 'purchase_search.pas' {Form_po},
  shipmethod in 'shipmethod.pas' {shipmethod_form},
  address_search in 'address_search.pas' {Form_address},
  append_so in 'append_so.pas' {Form3},
  soprice_sea in 'soprice_sea.pas' {Form4},
  edit_rep in 'edit_rep.pas' {Form5},
  rep_search in 'rep_search.pas' {rep_form},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {note_form},
  multi_so in 'multi_so.pas' {Form6},
  conf_note in 'conf_note.pas' {Form7},
  edit_so in 'edit_so.pas' {Form8},
  deptauth_info in 'deptauth_info.pas' {Form_deptinfo},
  so_report in 'so_report.pas' {Form_report},
  curr_search in 'curr_search.pas' {curr_form},
  note_information in 'note_information.pas' {Form11},
  Mreport in 'Mreport.pas' {Form_Mreport},
  quote_price in 'quote_price.pas' {Form12},
  waif_supp in 'waif_supp.pas' {F_supp},
  much_report in 'much_report.pas' {Form13},
  term in 'term.pas' {Form_condition},
  employee_search in 'employee_search.pas' {Form_employee},
  FindContract in 'FindContract.pas' {frmFindContract},
  ViewCredit in 'ViewCredit.pas' {frmViewCredit},
  AllOldVersion in 'AllOldVersion.pas' {frmAllOldVersion},
  FindBook in 'FindBook.pas' {Form_FindBook},
  AllBook in 'AllBook.pas' {Form_AllBook},
  SCPO_reports in 'SCPO_reports.pas' {frmSCPOrpt},
  PasShowStock in 'PasShowStock.pas' {frmShowStock};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'œ˙ €∂©µ•';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
