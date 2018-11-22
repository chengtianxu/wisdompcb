program WZPR184;

uses
  Forms,
  MAINMenu in 'MAINMenu.pas' {MainForm},
  Report2 in 'Report2.pas' {Frmreport2},
  mater_Report in 'mater_Report.pas' {FrmReport},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Report1 in 'Report1.pas' {Frmreport1},
  report3 in 'report3.pas' {Frmreport3},
  report4 in 'report4.pas' {Frmreport4},
  report5 in 'report5.pas' {FrmReport5},
  report6 in 'report6.pas' {Frmreport6},
  report7 in 'report7.pas' {Frmreport7},
  report8 in 'report8.pas' {Frmreport8},
  report9 in 'report9.pas' {Frmreport9},
  report10 in 'report10.pas' {Frmreport10},
  Report11 in 'Report11.pas' {FrmReport11},
  Report12 in 'Report12.pas' {FrmReport12},
  Report13 in 'Report13.pas' {FrmReport13},
  Report14 in 'Report14.pas' {FrmReport14},
  Report15 in 'Report15.pas' {FrmReport15},
  Report16 in 'Report16.pas' {FrmReport16},
  desi_report in 'desi_report.pas' {Form14},
  desi_reportmic in 'desi_reportmic.pas' {Form15},
  desi_o_report in 'desi_o_report.pas' {Form17},
  desi_o_reportmic in 'desi_o_reportmic.pas' {Form18},
  sales_order in 'sales_order.pas' {Form1},
  Mreport in 'Mreport.pas' {Form_Mreport},
  t_report in 't_report.pas' {Form_trp},
  report_comein in 'report_comein.pas' {F_partin_report},
  report_mrb in 'report_mrb.pas' {Form_report},
  much_so in 'much_so.pas' {Form3},
  customer_info in 'customer_info.pas' {Form4},
  shipadvice_report in 'shipadvice_report.pas' {Form_shipadvice};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
