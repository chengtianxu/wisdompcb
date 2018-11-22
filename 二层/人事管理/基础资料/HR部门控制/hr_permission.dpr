program hr_permission;

uses
  Forms,
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  form_DepaRight in 'form_DepaRight.pas' {frm_DepaRight},
  formSelectMultiItem in '..\..\..\Comm(D7)\formSelectMultiItem.pas' {frmSelectMultiItem},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  form_DepaRight2 in 'form_DepaRight2.pas' {frm_DepaRight2},
  form_DepaRight1 in 'form_DepaRight1.pas' {frm_DepaRight1},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HR≤ø√≈øÿ÷∆';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_DepaRight, frm_DepaRight);
  Application.CreateForm(TfrmGetUserRights, frmGetUserRights);
  //  Application.CreateForm(TfrmSelectMultiItem, frmSelectMultiItem);
//  Application.CreateForm(TfrmFindcds, frmFindcds);
  // Application.CreateForm(TfrmMultiSelected, frmMultiSelected);
 // Application.CreateForm(TfrmSelectMultiItem, frmSelectMultiItem);
  Application.Run;
end.
