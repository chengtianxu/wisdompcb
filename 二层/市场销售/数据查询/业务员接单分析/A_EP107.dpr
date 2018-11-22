program A_EP107;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  collect in 'collect.pas' {Form2},
  sales_customer in 'sales_customer.pas' {Form3},
  DecisionCubeBugWorkaround in 'DecisionCubeBugWorkaround.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售订单汇总查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
