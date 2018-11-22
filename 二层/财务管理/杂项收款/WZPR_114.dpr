program WZPR_114;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  customer_search in 'customer_search.pas' {Form_employee},
  BankSearch in 'BankSearch.pas' {Form_Bank},
  curr_search in 'curr_search.pas' {form_curr},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  supplier_search in 'supplier_search.pas' {Form_inex},
  PayExpense in 'PayExpense.pas' {Form_mic},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '杂项收款业务处理';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
