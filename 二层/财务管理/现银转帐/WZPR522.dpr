program WZPR522;

{%ToDo 'WZPR522.todo'}

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  transfer in 'transfer.pas' {Form2},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  BankSearch in 'BankSearch.pas' {FrmBankSearch},
  curr_search in 'curr_search.pas' {form_curr},
  employee_search in 'employee_search.pas' {Form_employee},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  AcctSearch in 'AcctSearch.pas' {Form_Acct};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '现金(银行)转帐处理';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
