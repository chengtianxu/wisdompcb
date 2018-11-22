program A_wip056;

uses
  Forms,
  main in 'main.pas' {Form1},
  term in 'term.pas' {Form4},
  customer_search in 'customer_search.pas' {Form_Customer},
  empl_search in 'empl_search.pas' {form_technics};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '在制品在线时间查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
