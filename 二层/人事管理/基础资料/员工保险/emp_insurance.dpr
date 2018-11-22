program emp_insurance;

uses
  Forms,
  main_u in 'main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  p_add_u in 'p_add_u.pas' {frm_p_add},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem},
  edit_u in 'edit_u.pas' {frm_edit},
  common in 'common\common.pas',
  form_See in 'common\form_See.pas' {frm_See},
  form_SetField in 'common\form_SetField.pas' {frm_SetField},
  UQuery in 'common\UQuery.pas' {Query_Form},
  frm_szimport_u in 'frm_szimport_u.pas' {frm_import_sz};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '‘±π§±£œ’';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
