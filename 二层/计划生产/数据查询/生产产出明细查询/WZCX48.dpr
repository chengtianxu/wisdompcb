program WZCX48;

uses
  Forms,
  main in 'main.pas' {Form1},
  product in 'product.pas' {Form_product},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  deptgroup in 'deptgroup.pas' {Form2},
  deptcode in 'deptcode.pas' {Form3},
  deptcode_list in 'deptcode_list.pas' {Form4},
  prodcode_search in 'prodcode_search.pas' {Form_prodcode},
  customer_search in 'customer_search.pas' {Form_customer},
  employee_search in 'employee_search.pas' {Form_employee},
  PasCollect in 'PasCollect.pas' {FrmCollect},
  PasCollect_2 in 'PasCollect_2.pas' {FrmCollect2},
  PasCollectPZ in 'PasCollectPZ.pas' {frmFrmCollectPZ},
  PasShowMX in 'PasShowMX.pas' {frmShowMX};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产产出明细查询';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmFrmCollectPZ, frmFrmCollectPZ);
  Application.CreateForm(TfrmShowMX, frmShowMX);
  Application.Run;
end.
