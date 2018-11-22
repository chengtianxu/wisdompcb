program JSCX;

uses
  Forms,
  main in 'main.pas' {Form1},
  part_in in 'part_in.pas' {Form2},
  part_out in 'part_out.pas' {Form3},
  part_quantity in 'part_quantity.pas' {Form4},
  partin_report in 'partin_report.pas' {Form_report},
  warehouse_mixi in 'warehouse_mixi.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ºƒ €≤È—Ø';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
