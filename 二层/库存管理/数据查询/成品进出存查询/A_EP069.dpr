program A_EP069;

uses
  Forms,
  main in 'main.pas' {Form1},
  part_in in 'part_in.pas' {Form2},
  part_out in 'part_out.pas' {Form3},
  part_quantity in 'part_quantity.pas' {Form4},
  partin_report in 'partin_report.pas' {Form_report},
  fgtransfer in 'fgtransfer.pas' {Form5},
  rece_total in 'rece_total.pas' {Form6},
  putout_total in 'putout_total.pas' {Form7},
  rece_put_stock in 'rece_put_stock.pas' {Form_date},
  receputstock_total in 'receputstock_total.pas' {Form8},
  warehouse_mixi in 'warehouse_mixi.pas' {Form9},
  wh_search in 'wh_search.pas' {Form_Wh};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品进出存查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
