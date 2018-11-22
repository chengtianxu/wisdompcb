program WZSB416;

{%ToDo 'WZSB416.todo'}

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  custpart_search in 'custpart_search.pas' {FrmCustPart},
  edad_fg in 'EDAD_FG.PAS' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  location_search in 'location_search.pas' {Form_lo},
  main_one in 'main_one.pas' {F_main},
  damo in 'damo.pas' {DM: TDataModule},
  sales_search in 'sales_search.pas' {Form_so},
  report_comein in 'report_comein.pas' {F_partin_report},
  so_list in 'so_list.pas' {Form_solist};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品特殊入仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_main, F_main);
  Application.Run;
end.
