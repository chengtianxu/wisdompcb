program A_EP124;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  customer_search in 'customer_search.pas' {FrmCustSearch},
  custpart_search in 'custpart_search.pas' {FrmCustPart},
  edad_fg in 'EDAD_FG.PAS' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  location_search in 'location_search.pas' {Form_lo},
  main_one in 'main_one.pas' {F_main},
  damo in 'damo.pas' {DM: TDataModule},
  rma_search in 'rma_search.pas' {Form3},
  sales_search in 'sales_search.pas' {Form4},
  report_comein in 'report_comein.pas' {F_partin_report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品特殊入仓处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_main, F_main);
  Application.Run;
end.
