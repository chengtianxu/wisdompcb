program wzcx163;

uses
  Forms,
  main in 'main.pas' {Form_main},
  contion in 'contion.pas' {Form_contion};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Î´¿ªÆ±½ØÊý²éÑ¯';
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_contion, Form_contion);
  Application.Run;
end.
