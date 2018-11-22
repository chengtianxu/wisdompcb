program A_WZPR116;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  customer_search in 'customer_search.pas' {Form_customer},
  curr_search in 'curr_search.pas' {form_curr},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  untread_memo in 'untread_memo.pas' {Form2},
  noreturen_memo in 'noreturen_memo.pas' {Form3},
  invoice_search in 'invoice_search.pas' {Form_rma},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  rma_search in 'rma_search.pas' {Form_custrma},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  Frm_QrySum_u in 'Frm_QrySum_u.pas' {Frm_QrySum},
  edit_memo in 'edit_memo.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户贷项备忘';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
