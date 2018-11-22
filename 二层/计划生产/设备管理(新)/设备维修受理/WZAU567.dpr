program WZAU567;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySetWorkquery in 'QuerySetWorkquery.pas' {frm_QuerySetWorkquery},
  Edit in 'Edit.pas' {frm_Edit},
  formResetUsername in 'formResetUsername.pas' {frmResetUsername},
  formInputDlg in 'formInputDlg.pas' {frmInputDlg},
  unusual_cate in 'unusual_cate.pas' {Frm_unusual_cate},
  TimeQuery in 'TimeQuery.pas' {Frm_TimeQuery},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  Pause in 'Pause.pas' {frm_Pause},
  Recordt in 'Recordt.pas' {frm_Recordt},
  ColsDisplaySet_unt in 'ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  form_msg in 'form_msg.pas' {frm_msg};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备维修受理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.CreateForm(Tfrm_QuerySetWorkquery, frm_QuerySetWorkquery);
  Application.Run;
end.
