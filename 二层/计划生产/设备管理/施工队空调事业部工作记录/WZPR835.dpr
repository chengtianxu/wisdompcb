program WZPR835;

uses
  Forms,
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  MC in '..\..\..\Comm(D7)\MC.pas' {MC_f},
  formWorkRecord in 'formWorkRecord.pas' {frmWorkRecord},
  formInputDlg in '..\..\..\Comm(D7)\formInputDlg.pas' {frmInputDlg},
  formWorkRecord01 in 'formWorkRecord01.pas' {frmWorkRecord01},
  formWorkRecord03 in 'formWorkRecord03.pas' {frmWorkRecord03},
  formWorkRecord05 in 'formWorkRecord05.pas' {frmWorkRecord05},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  SelectItem_unt in '..\..\..\Comm(D7)\SelectItem_unt.pas' {SelectItem_frm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '施工队空调事业部工作记录';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmWorkRecord, frmWorkRecord);
  Application.Run;
end.
