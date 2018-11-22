program EP139;

uses
  Forms,
  main in 'main.pas' {Form1},
  editcountry in 'editcountry.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '国家或地区';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
