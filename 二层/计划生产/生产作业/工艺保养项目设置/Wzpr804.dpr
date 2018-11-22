program Wzpr804;

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
  MainItem in 'MainItem.pas' {MainItem_f},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '工艺保养项目设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainItem_f, MainItem_f);
  Application.Run;
end.
