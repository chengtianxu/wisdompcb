program WZPR579.EXE;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '订单价格分类';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
