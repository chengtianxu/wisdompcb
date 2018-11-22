program cash_ca;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  defin_wage in 'defin_wage.pas' {Form2},
  sql_condition in 'sql_condition.pas' {Form3},
  prod_search in 'prod_search.pas' {Form_prodcode},
  location_search in 'location_search.pas' {Form_lo},
  customer_search in 'customer_search.pas' {Form_Customer},
  warehouse_search in 'warehouse_search.pas' {Form_wh};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品出货工资计算';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
