program EP166;

uses
  Forms,
  main in 'main.pas' {Form1},
  editprice in 'editprice.pas' {Form2},
  accountsearch in 'accountsearch.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工具费用类别';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
