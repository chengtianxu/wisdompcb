program WZPR457;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  putoutinvt_dept in 'putoutinvt_dept.pas' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  Prod_Resource in 'Prod_Resource.pas' {form_dept},
  customer_search in 'customer_search.pas' {Form_employee},
  stockinvt_search in 'stockinvt_search.pas' {Form_stocksearch},
  purout_invt in 'purout_invt.pas' {Form_putout},
  putoutmisc_dept in 'putoutmisc_dept.pas' {Form3},
  stockmisc_search in 'stockmisc_search.pas' {Form_miscstock},
  putoutinvt_inspect in 'putoutinvt_inspect.pas' {Form4},
  putout_bill in 'putout_bill.pas' {Form5},
  return_invtstock in 'return_invtstock.pas' {Form_returninvt},
  putourinvt_report in 'putourinvt_report.pas' {Form_putoutintreport},
  putoutmiscreport in 'putoutmiscreport.pas' {Form_putoutmiscreport},
  putoutinvt_quota in 'putoutinvt_quota.pas' {Form6},
  stockinvt_quotasearch in 'stockinvt_quotasearch.pas' {Form7},
  duanxin in 'duanxin.pas' {Form_duanxin},
  putoutinvt_linliao in 'putoutinvt_linliao.pas' {Form8},
  putoutinvt_faliao in 'putoutinvt_faliao.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '材料发放及退仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
