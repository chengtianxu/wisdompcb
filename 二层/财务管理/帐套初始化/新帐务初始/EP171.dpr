program EP171;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '财务初始数据';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
