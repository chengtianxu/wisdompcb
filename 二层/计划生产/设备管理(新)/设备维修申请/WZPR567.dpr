program WZPR567;

uses
  Forms,
  Main in 'Main.pas' {frm_Main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  AddMaintenance in 'AddMaintenance.pas' {frm_AddMaintenance},
  employee in 'employee.pas' {Frm_employee},
  formGetUserRights in 'formGetUserRights.pas' {frmGetUserRights},
  Frm_YS_u in 'Frm_YS_u.pas' {Frm_YS},
  Complaint in 'Complaint.pas' {frm_Complaint},
  Recordt in 'Recordt.pas' {frm_Recordt};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '…Ë±∏Œ¨–ﬁ…Í«Î';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
