program A_ep307;

uses
  Forms,
  main in 'main.pas' {Form1},
  schmodify in 'schmodify.pas' {Form4},
  viewlog in 'viewlog.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '入仓计划查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
