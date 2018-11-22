program WZMI25;
{$R 'CallerResource.res' 'CallerResource.rc'}
uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  product_MIDetail in 'product_MIDetail.pas' {Form2},
  term in 'term.pas' {Form_condition},
  employee_search in 'employee_search.pas' {Form_employee},
  customer_search in 'customer_search.pas' {Form_customer},
  prod_search in 'prod_search.pas' {Form_prodcode},
  Draw_Picture_Unit in 'Draw_Picture_Unit.pas',
  route_flow in 'route_flow.pas' {Form_route},
  iesmodel_search in 'iesmodel_search.pas' {Form_iesmodel},
  flowpara_edit in 'flowpara_edit.pas' {Form_flowpara},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  parameter_search in 'parameter_search.pas' {Form_parameter},
  PickEngNote in 'PickEngNote.pas' {frmPickEngNote},
  layer_frame in 'layer_frame.pas' {Form_layer},
  append_productin in 'append_productin.pas' {Form_append},
  stepnumber_search in 'stepnumber_search.pas' {Form_stepnumber},
  layersdata_select in 'layersdata_select.pas' {Form_layersdata},
  product_search in 'product_search.pas' {Form_product},
  copy_product in 'copy_product.pas' {Form3},
  reportselect in 'reportselect.pas' {Form_reportselect},
  report_data in 'report_data.pas' {Form_report},
  drcacle in 'drcacle.pas' {Form_drcalc},
  FileReadWriteUnitClass in 'FileReadWriteUnitClass.pas',
  PCBCUT in 'PCBCUT.pas' {Frm_PCBCUT},
  spell2 in 'spell2.pas',
  Spell in 'Spell.pas',
  report_data1 in 'report_data1.pas' {Form_report1},
  Genesis_dr in 'Genesis_dr.pas' {Form_Genesis},
  holemanager in 'holemanager.pas' {Form4},
  Unit2 in 'Unit2.pas' {inputform},
  childpart in 'childpart.pas' {Form_childpart},
  quality_trace in 'quality_trace.pas' {Form5},
  MITreeFrm in 'MITreeFrm.pas' {frmMITree},
  SameQryFrm in 'SameQryFrm.pas' {frmSameQry},
  note_information in '..\..\数据查询\产品MI查询\note_information.pas' {Form11},
  FindStemParamFrm in 'FindStemParamFrm.pas' {frmFindStepParam},
  PasType in 'PasType.pas' {frmType},
  DeptFrm in 'DeptFrm.pas' {frmDept},
  pasPress in 'pasPress.pas' {frmPress};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品MI设计';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
