program WZMICX0025;

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
  pcb_cutting in 'pcb_cutting.pas' {FrmPCBCut},
  PNL_Aarray_Rectangle_OnePNL_Unit1 in 'PNL_Aarray_Rectangle_OnePNL_Unit1.pas',
  PNL_Aarray_Rectangle_TwoPNL_Unit1 in 'PNL_Aarray_Rectangle_TwoPNL_Unit1.pas',
  route_flow in 'route_flow.pas' {Form_route},
  iesmodel_search in 'iesmodel_search.pas' {Form_iesmodel},
  flowpara_edit in 'flowpara_edit.pas' {Form_flowpara},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  parameter_search in 'parameter_search.pas' {Form_parameter},
  PickEngNote in 'PickEngNote.pas' {frmPickEngNote},
  layer_frame in 'layer_frame.pas' {Form_layer},
  stepnumber_search in 'stepnumber_search.pas' {Form_stepnumber},
  layersdata_select in 'layersdata_select.pas' {Form_layersdata},
  product_search in 'product_search.pas' {Form_product},
  reportselect in 'reportselect.pas' {Form_reportselect},
  report_data in 'report_data.pas' {Form_report},
  note_information in 'note_information.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²úÆ·MI²éÑ¯';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
