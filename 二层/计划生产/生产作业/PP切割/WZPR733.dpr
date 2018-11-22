program WZPR733;

uses
  Forms,
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  formResetUsername in '..\..\..\Comm(D7)\formResetUsername.pas' {frmResetUsername},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights},
  MC in '..\..\..\Comm(D7)\MC.pas' {MC_f},
  PpCutting in 'PpCutting.pas' {PpCutting_frm},
  PpCutting5_unt in 'PpCutting5_unt.pas' {PpCutting5_frm},
  PpCutting_1 in 'PpCutting_1.pas' {PpCutting_1_frm},
  PpCutting_2_unt in 'PpCutting_2_unt.pas' {PpCutting_2_frm},
  PpCutting3_unt in 'PpCutting3_unt.pas' {PpCutting3_frm},
  PpCutting4_unt in 'PpCutting4_unt.pas' {PpCutting4_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := 'PPÇÐ¸î';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TPpCutting_frm, PpCutting_frm);
  Application.Run;
end.
