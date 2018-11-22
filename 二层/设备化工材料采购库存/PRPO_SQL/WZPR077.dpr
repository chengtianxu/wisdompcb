program WZPR077;

uses
  Forms,
  main in 'main.pas' {Form1},
  supplier_search in 'supplier_search.pas' {Form_supp},
  inv_serach in 'inv_serach.pas' {form_inv},
  dpment_search in 'dpment_search.pas' {Form_dept},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  Employee_search in 'Employee_search.pas' {FrmEmpl},
  standpr in 'standpr.pas' {Form2},
  micpr in 'micpr.pas' {Form3},
  standpo in 'standpo.pas' {Form4},
  empl_search in 'empl_search.pas' {form_employee},
  micpo in 'micpo.pas' {Form5},
  auth_info in 'auth_info.pas' {Form6},
  rece_put_stock in 'rece_put_stock.pas' {Form_date},
  standpo_subtotal in 'standpo_subtotal.pas' {Form7},
  DecisionCubeBugWorkaround in 'DecisionCubeBugWorkaround.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '«Îπ∫≤…π∫≤È—Ø';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
