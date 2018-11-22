program EP087;

uses
  Forms,
  main in 'main.pas' {Form1},
  inventory in 'inventory.pas' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  supplier_search in 'supplier_search.pas' {Form_supp},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  inv_serach in 'inv_serach.pas' {form_inv},
  dpment_search in 'dpment_search.pas' {Form_dept},
  outsql in 'outsql.pas' {Form3},
  invt_quan in 'invt_quan.pas' {Form4},
  location_search in 'location_search.pas' {Form_lo},
  invt_report in 'invt_report.pas' {Form_report},
  invtransfer in 'invtransfer.pas' {Form5},
  Employee_search in 'Employee_search.pas' {FrmEmpl},
  rec_total in 'rec_total.pas' {Form6},
  put_total in 'put_total.pas' {Form7},
  inv_group in 'inv_group.pas' {Form_invgroup},
  rece_put_stock in 'rece_put_stock.pas' {Form_date},
  receputstock_total in 'receputstock_total.pas' {Form8},
  inv_minxi in 'inv_minxi.pas' {Form9},
  BzReport in 'BzReport.pas' {Form_BzReport},
  qrcode in 'qrcode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '材料进出存查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
