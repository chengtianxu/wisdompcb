program WZPR114;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  customer_search in 'customer_search.pas' {Form_Customer},
  standard_bill in 'standard_bill.pas' {Form2},
  BankSearch in 'BankSearch.pas' {Form_Bank},
  curr_search in 'curr_search.pas' {form_curr},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  credit_memo in 'credit_memo.pas' {Form_credit},
  invoice_search in 'invoice_search.pas' {Form_invoice},
  reserve_fund in 'reserve_fund.pas' {Form3},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  account_receivable in 'account_receivable.pas' {Form_receivable},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  manuaprt in 'manuaprt.pas' {Frm_manuaprt},
  AdvanceDetails in 'AdvanceDetails.pas' {Frm_AdvanceDetails},
  receviable_details in 'receviable_details.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '收款业务处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
