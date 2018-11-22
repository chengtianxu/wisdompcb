program WZPR_129;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  BankSearch in 'BankSearch.pas' {FrmBankSearch},
  supplier_search in 'supplier_search.pas' {Form_inex},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  curr_search in 'curr_search.pas' {form_empl},
  income_payment in 'income_payment.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '内部费用支出';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
