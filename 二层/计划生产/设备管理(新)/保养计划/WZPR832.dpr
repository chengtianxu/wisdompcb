program WZPR832;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  ColsDisplaySet_unt in 'ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  formMultiSelectedItem in 'formMultiSelectedItem.pas' {frmMultiSelectedItem},
  formGetUserRights in 'formGetUserRights.pas' {frmGetUserRights},
  Edit in 'Edit.pas' {frm_Edit},
  form_msg in 'form_msg.pas' {frm_msg},
  formInputDlg in 'formInputDlg.pas' {frmInputDlg},
  Pause in 'Pause.pas' {frm_Pause},
  stdTimeCons in 'stdTimeCons.pas' {frm_stdTimeCons},
  EquipmentTime in 'EquipmentTime.pas' {frm_EquipmentTime},
  TimeQuery in 'TimeQuery.pas' {Frm_TimeQuery},
  IfReplaceFrm in 'IfReplaceFrm.pas' {FrmIfReplace},
  QuerySetWorkquery in 'QuerySetWorkquery.pas' {frm_QuerySetWorkquery},
  QuerySetMaterial in 'QuerySetMaterial.pas' {frmQuerySetMaterial};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '保养计划';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.CreateForm(Tfrm_QuerySetWorkquery, frm_QuerySetWorkquery);
  Application.CreateForm(TfrmQuerySetMaterial, frmQuerySetMaterial);
  Application.Run;
end.
