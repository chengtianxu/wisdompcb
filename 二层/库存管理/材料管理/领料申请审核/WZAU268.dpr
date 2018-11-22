program WZAU268;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  AuthInfo_U in 'AuthInfo_U.pas' {AuthInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'π§–Ú¡Ï¡œ…Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAuthInfo, AuthInfo);
  Application.Run;
end.
