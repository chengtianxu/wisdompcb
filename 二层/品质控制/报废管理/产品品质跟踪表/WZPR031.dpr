program WZPR031;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  demo in 'demo.pas' {DM: TDataModule},
  quality_trace in 'quality_trace.pas' {Form2},
  Condition in 'Condition.pas' {Form3},
  customer in 'customer.pas' {Form_customer},
  employee in 'employee.pas' {Form_employee},
  prodcode in 'prodcode.pas' {Form_prodcode},
  frm_ProcedureReport1 in 'frm_ProcedureReport1.pas' {frm_ProcedureReport},
  ProductMix in 'ProductMix.pas' {Frm_ProductMix};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '样品生产品质数据库';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
