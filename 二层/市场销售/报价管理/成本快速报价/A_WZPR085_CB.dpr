program A_WZPR085_CB;
{$R 'CallerResource.res' 'CallerResource.rc'}
uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  term in 'term.pas' {Form_condition},
  baseprice_search in 'baseprice_search.pas' {Form_baseprice},
  quote_detail in 'quote_detail.pas' {Form2},
  curr_search in 'curr_search.pas' {form_curr},
  prodcode_search in 'prodcode_search.pas' {form_prodcode},
  rep_search in 'rep_search.pas' {form_rep},
  employee_search in 'employee_search.pas' {Form_employee},
  authflow_search in 'authflow_search.pas' {Form_authflow},
  quoteinvt_search in 'quoteinvt_search.pas' {Form_quoteinvt},
  customer_search in 'customer_search.pas' {Form_customer},
  product_search in 'product_search.pas' {Form_product},
  layer_frame in 'layer_frame.pas' {Form_layer},
  technics_search in 'technics_search.pas' {Form_technics},
  auth_info in 'auth_info.pas' {Form_authinfo},
  quote_overdue in 'quote_overdue.pas' {Form_overdue},
  quote_report in 'quote_report.pas' {Form_report},
  layersdata_select in 'layersdata_select.pas' {Form_layersdata},
  Draw_Picture_Unit in 'Draw_Picture_Unit.pas',
  spell2 in 'spell2.pas',
  Spell in 'Spell.pas',
  uModifyType in 'uModifyType.pas' {frmModifyType};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成本快速报价';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
