program ep219;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户特别要求';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
