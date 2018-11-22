program WZPR832;

uses
  Forms,
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  MC in '..\..\..\Comm(D7)\MC.pas' {MC_f},
  formPlanMain in 'formPlanMain.pas' {frmPlanMain},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights},
  formMultiSelectedItem in 'formMultiSelectedItem.pas' {frmMultiSelectedItem},
  formInputDlg in '..\..\..\Comm(D7)\formInputDlg.pas' {frmInputDlg},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  formPlanMain02 in 'formPlanMain02.pas' {frmPlanMain02},
  formPlanMain01 in 'formPlanMain01.pas' {frmPlanMain01},
  formPlanMain04 in 'formPlanMain04.pas' {frmPlanMain04},
  formPlanMain05 in 'formPlanMain05.pas' {frmPlanMain05},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  SelectItem_unt in '..\..\..\phComponent\SelectItem_unt.pas' {SelectItem_frm},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  form_msg in 'form_msg.pas' {frm_msg},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '保养计划';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPlanMain, frmPlanMain);
  Application.Run;
end.
