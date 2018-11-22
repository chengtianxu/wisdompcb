program WZPR274;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  auth_info in 'auth_info.pas' {Form_authinfo},
  quote_detail in 'quote_detail.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '±®º€µ•…Û∫À';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
