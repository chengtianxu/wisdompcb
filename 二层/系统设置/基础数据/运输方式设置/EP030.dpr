program EP030;

uses
  Forms,
  main in 'main.pas' {Form1},
  aded_method in 'aded_method.pas' {Form2},
  cust_search in 'cust_search.pas' {Frm_Cust};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装运方法';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
