program WZEP_129;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  BankSearch in 'BankSearch.pas' {FrmBankSearch},
  supplier_search in 'supplier_search.pas' {Form_inex},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  curr_search in 'curr_search.pas' {form_empl},
  income_payment in 'income_payment.pas' {Form2},
  term in 'term.pas' {Form_condition},
  curr_search_2 in 'curr_search_2.pas' {form_curr},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  voucher_report in 'voucher_report.pas' {Form_voucherreport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '内部费用支出';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
