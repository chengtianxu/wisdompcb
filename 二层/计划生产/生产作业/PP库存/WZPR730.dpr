program WZPR730;

uses
  Forms,
  base in '..\..\..\Comm(D7)\base.pas' {Base_f},
  Toolbar in '..\..\..\Comm(D7)\Toolbar.pas' {Toolbar_f},
  SingleDataSet in '..\..\..\Comm(D7)\SingleDataSet.pas' {SingleDataSet_f},
  MC in '..\..\..\Comm(D7)\MC.pas' {MC_f},
  PP_Qty_u in 'PP_Qty_u.pas' {PP_Qty_f},
  PP_Qty1_unt in 'PP_Qty1_unt.pas' {PP_Qty1_frm},
  LogWriteform in '..\..\..\Comm(D7)\LogWriteform.pas' {LogWritefrm},
  DM_f in '..\..\..\Comm(D7)\DM_f.pas' {DM: TDataModule},
  PublicFile in '..\..\..\Comm(D7)\PublicFile.pas',
  formGetUserRights in '..\..\..\Comm(D7)\formGetUserRights.pas' {frmGetUserRights},
  ColsDisplaySet_unt in '..\..\..\Comm(D7)\ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  Findcds_unt in '..\..\..\Comm(D7)\Findcds_unt.pas' {Findcds_frm},
  SelectedDate_unt in '..\..\..\Comm(D7)\SelectedDate_unt.pas' {SelectedDate_frm},
  formSelectMultiItem in '..\..\..\Comm(D7)\formSelectMultiItem.pas' {frmSelectMultiItem};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := 'PPø‚¥Ê≤È—Ø';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TPP_Qty_f, PP_Qty_f);
  Application.Run;
end.
