program WZCP274;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  auth_info in 'auth_info.pas' {Form_authinfo},
  AddFrm in 'AddFrm.pas' {FrmAdd},
  PartNumberPrice in 'PartNumberPrice.pas' {FrmNumberPrice};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '±®º€µ•…Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
