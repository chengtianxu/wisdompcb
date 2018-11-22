program WZAU567;

uses
  Forms,
  damo in 'damo.pas' {DM: TDataModule},
  form_See in 'form_See.pas' {frm_See},
  formInputDlg in 'formInputDlg.pas' {frmInputDlg},
  formMain2 in 'formMain2.pas' {frmMain2},
  formPause in 'formPause.pas' {frmPause},
  formResetUsername in 'formResetUsername.pas' {frmResetUsername},
  main in 'main.pas' {Form1},
  return in 'return.pas' {Form_Return},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem},
  unusual_cate in 'unusual_cate.pas' {Frm_unusual_cate},
  form_msg in 'form_msg.pas' {frm_msg},
  ColsDisplaySet_unt in 'ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  PublicFunc in 'PublicFunc.pas';

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '设备维修受理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
