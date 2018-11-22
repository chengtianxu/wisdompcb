program WZCP112;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  customer_search in 'customer_search.pas' {Form_Customer},
  packlist_search in 'packlist_search.pas' {Form_packlist},
  addedit_invoice in 'addedit_invoice.pas' {Form2},
  sale_casepas in 'sale_casepas.pas' {Form3},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  curr_search in 'curr_search.pas' {Form_Curr},
  note in 'NOTE.PAS' {edit_note},
  note_search in 'note_search.pas' {note_form},
  form_tool in 'form_tool.pas' {Form4},
  sotools_search in 'sotools_search.pas' {Form_sotool},
  misc_invoice in 'misc_invoice.pas' {Form5},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  packlist_selectone in 'packlist_selectone.pas' {Form_selectpk};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售应收发票';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
