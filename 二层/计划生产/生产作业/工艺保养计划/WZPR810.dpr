program WZPR810;

uses
  Forms,
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  MC in '..\..\..\Comm(D7)\MC.pas' {MC_f},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights},
  MultiDataSet in '..\..\..\Comm(D7)\MultiDataSet.pas' {MultiDataSet_f},
  MainPlan1 in 'MainPlan1.pas' {MainPlan1_f},
  formSelectMultiItem in '..\..\..\Comm(D7)\formSelectMultiItem.pas' {frmSelectMultiItem},
  MainPlan in 'MainPlan.pas' {MainPlan_f},
  formInputDlg in '..\..\..\Comm(D7)\formInputDlg.pas' {frmInputDlg},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  SelectItem_unt in '..\..\..\Comm(D7)\SelectItem_unt.pas' {SelectItem_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '工艺保养计划';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainPlan_f, MainPlan_f);
  Application.Run;
end.
