program WZPR161;

uses
  Forms,
  main in 'main.pas' {Form1},
  customer_search in 'customer_search.pas' {Form_customer},
  curr_search in 'curr_search.pas' {form_curr};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '应收帐款帐龄查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
