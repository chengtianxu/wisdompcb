program WZPR273;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  term in 'term.pas' {Form_condition},
  employee_search in 'employee_search.pas' {Form_employee},
  customer_search in 'customer_search.pas' {Form_customer},
  Append_ecn in 'Append_ecn.pas' {Form2},
  product_search in 'product_search.pas' {Form_product},
  prod_search in 'prod_search.pas' {Form_prodcode},
  edit_ecn in 'edit_ecn.pas' {Form3},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  ECN_report in 'ECN_report.pas' {Form_report},
  layersdata_select in 'layersdata_select.pas' {Form_layersdata};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ECN工程更改';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
