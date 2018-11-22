program WZCP008;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.PAS' {Frm_main},
  DM_u in 'DM_u.PAS' {DM: TDataModule},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_Edit_u in 'Frm_Edit_u.pas' {Frm_Edit},
  Frm_BOM_u in 'Frm_BOM_u.pas' {Frm_BOM},
  Frm_BOMEdt_u in 'Frm_BOMEdt_u.pas' {Frm_BOMEdt},
  Frm_MatSelect_u in 'Frm_MatSelect_u.pas' {Frm_MatSelect},
  Frm_QryOrder_u in 'Frm_QryOrder_u.pas' {Frm_QryOrder},
  MatPriceEdt in 'MatPriceEdt.pas' {frmMatPriceEdt},
  SendMessage in 'SendMessage.pas' {FrmMessage},
  frm_fatherparts_u in 'frm_fatherparts_u.pas' {frm_fatherparts},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree},
  Frm_New_u in 'Frm_New_u.PAS' {Frm_New},
  Unit_search in 'Unit_search.pas' {form_unit},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  change in 'change.pas' {frm_change},
  Form_SEE_u in 'Form_SEE_u.pas' {Form_SEE},
  UBOMMtrl in 'UBOMMtrl.pas' {frmBOMMtrl},
  UBOMMtrlEdit in 'UBOMMtrlEdit.pas' {frmBOMMtrlEdit},
  USelBOMMtrl in 'USelBOMMtrl.pas' {frmSelMtrls},
  UAllMtrls in 'UAllMtrls.pas' {frmAllMtrls};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¹¤³Ì±àÂë';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
