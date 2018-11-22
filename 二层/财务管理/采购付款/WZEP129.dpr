program WZEP129;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  payment_invoice in 'payment_invoice.pas' {Form2},
  BankSearch in 'BankSearch.pas' {FrmBankSearch},
  supplier_search in 'supplier_search.pas' {Form_supp},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  curr_search in 'curr_search.pas' {form_curr},
  mature_invoice in 'mature_invoice.pas' {Form3},
  supp_prepay in 'supp_prepay.pas' {Form4},
  term in 'term.pas' {Form_condition},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  employee_search in 'employee_search.pas' {Form_employee},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  invoice_search in 'invoice_search.pas' {Form_invoice};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '付款业务处理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
