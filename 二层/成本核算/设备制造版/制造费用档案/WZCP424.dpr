program wzcp424;

uses
  Forms,
  main in 'main.pas' {Form1},
  dmao in 'dmao.pas' {dm: TDataModule},
  Unit_unfinished in 'Unit_unfinished.pas' {Form_unfinished},
  Unit_expense in 'Unit_expense.pas' {Form_expense};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '新制造费用档案';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
