program WZCX_R;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产计提折旧信息查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
