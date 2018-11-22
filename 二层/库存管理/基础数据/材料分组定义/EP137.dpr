program EP137;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  edit_group in 'edit_group.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²ÄÁÏ·Ö×é';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
