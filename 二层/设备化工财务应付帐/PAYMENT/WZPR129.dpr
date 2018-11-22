program WZPR129;

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
  supp_prepay in 'supp_prepay.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '付款业务处理';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
