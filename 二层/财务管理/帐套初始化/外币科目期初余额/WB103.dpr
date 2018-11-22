program WB103;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外币科目期初余额设定';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
