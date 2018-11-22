program EP089;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  Frm_New_u in 'Frm_New_u.PAS' {Frm_New},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  update_stdcost in 'update_stdcost.pas' {Form5},
  damo in 'DAMO.PAS' {DM: TDataModule},
  inv_serach in 'inv_serach.pas' {form_inv},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  note_information in 'note_information.pas' {Form6},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  account_search in 'account_search.pas' {Form_account},
  empl_search in 'empl_search.pas' {form_empl},
  loca_search in 'loca_search.pas' {Form_lo},
  note_search in 'note_search.pas' {form_note},
  supplier_search in 'supplier_search.pas' {Form_supp},
  Unit_search in 'Unit_search.pas' {form_unit},
  Frm_MatType_u in 'Frm_MatType_u.pas' {Frm_MatType},
  update_maxstock in 'update_maxstock.pas' {frm_updatemaxstock},
  maxstock in 'maxstock.pas' {frm_maxstock};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²ÄÁÏ±àÂë';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
