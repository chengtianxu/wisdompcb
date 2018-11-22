program WZPR846;

uses
  Forms,
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  form_EquiMainAnal in 'form_EquiMainAnal.pas' {frm_EquiMainAnal},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '设备管理重要信息分析';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_EquiMainAnal, frm_EquiMainAnal);
  Application.Run;
end.
