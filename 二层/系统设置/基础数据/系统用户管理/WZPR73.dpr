program WZPR73;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  adeduser in 'adeduser.pas' {Form2},
  usergroup in 'usergroup.pas' {Form_group};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '系统用户管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
