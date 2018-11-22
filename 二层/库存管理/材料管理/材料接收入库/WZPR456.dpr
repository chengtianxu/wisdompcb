program WZPR456;

uses
  Forms,
  main in 'main.pas' {Form1},
  data_module in 'data_module.pas' {dm: TDataModule},
  ADED_RECE in 'ADED_RECE.pas' {Form2},
  received_search in 'received_search.pas' {Form3},
  po_search in 'po_search.pas' {Form_posearch},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  supplier_search in 'supplier_search.pas' {Form_supp},
  direct_ware in 'direct_ware.pas' {Form4},
  inv_search in 'inv_search.pas' {form_inv},
  diretc_intlist in 'diretc_intlist.pas' {Form5},
  curr_search in 'curr_search.pas' {form_curr},
  Unit_search in 'Unit_search.pas' {form_unit},
  invtin_report in 'invtin_report.pas' {Form_report},
  mul_report in 'mul_report.pas' {Form_mulreport},
  misc_report in 'misc_report.pas' {Form_miscreport},
  Frm_remark_u in 'Frm_remark_u.pas' {Frm_remark},
  vmidein in 'vmidein.pas' {Form6},
  stocksearch in 'stocksearch.pas' {Form8},
  putout in 'putout.pas' {Form_output},
  vmipo in 'vmipo.pas' {Form9},
  Add176 in 'Add176.pas' {frmAdd176},
  Add176_Item in 'Add176_Item.pas' {frmAdd176_Item},
  BzReport in 'BzReport.pas' {Form_BzReport},
  direct_zxint in 'direct_zxint.pas' {Form7},
  direct_zxlist in 'direct_zxlist.pas' {Form10},
  Pas_report_zxcard in 'Pas_report_zxcard.pas' {frm_report_zx};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '按采购订单接收材料入仓';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrm_report_zx, frm_report_zx);
  Application.Run;
end.
