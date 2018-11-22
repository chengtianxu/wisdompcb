program upexe_rev;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '更新程序版本';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
