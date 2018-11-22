program WISDOMPCB;

uses
  Forms,
  main in 'main.pas' {Form_main},
  damo in 'damo.pas' {DM: TDataModule},
  LogIn in 'LogIn.pas' {frmLogin},
  md5 in 'md5.pas',
  ChgPass in 'ChgPass.pas' {FrmChgPass},
  App_List in 'App_List.pas' {frmApp_List},
  onlineuser in 'onlineuser.pas' {Form_onlineuser},
  hintdialog in 'hintdialog.pas' {form_dialog},
  sort_information in 'sort_information.pas' {Form_information},
  addinfo in 'addinfo.pas' {Form_addinfo},
  selectuser in 'selectuser.pas' {Form_selectuser},
  logininformation in 'logininformation.pas' {Form_logininformation};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ó¡ÖÇERP';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
