program WZPR99;

uses
  Forms,
  main in 'main.pas' {Form1},
  customer_search in 'customer_search.pas' {Form_customer},
  product_search in 'product_search.pas' {Form_product},
  prodcode_search in 'prodcode_search.pas' {Form_prodcode},
  rej_search in 'rej_search.pas' {Form_rej},
  reject_day in 'reject_day.pas' {Form2},
  reject_month in 'reject_month.pas' {Form3},
  reject_rejectcode in 'reject_rejectcode.pas' {Form5},
  reject_prodcode in 'reject_prodcode.pas' {Form6},
  reject_custcode in 'reject_custcode.pas' {Form7},
  reject_product in 'reject_product.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MRBÍË»õÈ±ÏÝ»ã×Ü²éÑ¯';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
