program WZEP132;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  debit_bysupp in 'debit_bysupp.pas' {Form2},
  supplier_search in 'supplier_search.pas' {Form_supp},
  curr_search in 'curr_search.pas' {form_curr},
  invt_recept in 'invt_recept.pas' {Form_invtship},
  debit_returen in 'debit_returen.pas' {Form4},
  invt_sendback in 'invt_sendback.pas' {Form_sendback},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  term in 'term.pas' {Form_condition},
  employee_search in 'employee_search.pas' {Form_employee};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商借项备忘';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
