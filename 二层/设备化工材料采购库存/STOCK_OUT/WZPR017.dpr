program WZPR017;

uses
  Forms,
  MAINMenu in 'MAINMenu.pas' {MainForm},
  Main in 'Main.pas' {FrmMain},
  Prod_Resource in 'Prod_Resource.pas' {FrmProdResource},
  MATLStkDetail in 'MATLStkDetail.pas' {FrmWIPStkDetail},
  warehouse_search in 'warehouse_search.pas' {FrmWhouse},
  inv_serach in 'inv_serach.pas' {FrmInvSearch},
  AssigQty in 'AssigQty.pas' {FrmAssigQty},
  RetnMATL in 'RetnMATL.pas' {FrmRetnMATL},
  RetnMATLAssign in 'RetnMATLAssign.pas' {FrmRetnAssigning},
  AssigQty2 in 'AssigQty2.pas' {FrmAssigQty2},
  Employee_search in 'Employee_search.pas' {FrmEmployeeSearch},
  Main2 in 'Main2.pas' {FrmMain2},
  AssigQty3 in 'AssigQty3.pas' {FrmAssigQty3},
  Main3 in 'Main3.pas' {FrmMain3},
  AssigQty4 in 'AssigQty4.pas' {FrmAssigqty4},
  Barcode_serach in 'Barcode_serach.pas' {FrmBCSearch},
  Main4 in 'Main4.pas' {FrmMain4},
  RetnMATLAssign2 in 'RetnMATLAssign2.pas' {FrmRtnQty2},
  Main6 in 'Main6.pas' {FrmMain6},
  AdjustDeptStock in 'AdjustDeptStock.pas' {FrmAdjustDeptStock},
  Main5 in 'Main5.pas' {FrmMain5},
  Report3 in 'Report3.pas' {FrmReport3},
  Main7 in 'Main7.pas' {FrmMain7},
  Report4 in 'Report4.pas' {FrmReport4},
  Report5 in 'Report5.pas' {FrmReport5},
  Report6 in 'Report6.pas' {FrmReport6},
  Main8 in 'Main8.pas' {FrmMain8},
  Main9 in 'Main9.pas' {FrmMain9},
  inv_serach2 in 'inv_serach2.pas' {FrmInvSearch2},
  AssigQty5 in 'AssigQty5.pas' {FrmAssigQty5},
  AssigQty6 in 'AssigQty6.pas' {FrmAssigQty6},
  Barcode_serach2 in 'Barcode_serach2.pas' {FrmBCSearch2},
  Prod_Resource0 in 'Prod_Resource0.pas' {FrmProdResource0};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
