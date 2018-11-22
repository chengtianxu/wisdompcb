program WZCX270;

uses
  Forms,
  main in 'main.pas' {Form1},
  inventory in 'inventory.pas' {Form2},
  outsql in 'outsql.pas' {Form3},
  invt_quan in 'invt_quan.pas' {Form4},
  invt_report in 'invt_report.pas' {Form_report},
  invtransfer in 'invtransfer.pas' {Form5},
  rec_total in 'rec_total.pas' {Form6},
  put_total in 'put_total.pas' {Form7},
  rece_put_stock in 'rece_put_stock.pas' {Form_date},
  receputstock_total in 'receputstock_total.pas' {Form8},
  inv_minxi in 'inv_minxi.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ê¾×½ø³ö´æ²éÑ¯';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
