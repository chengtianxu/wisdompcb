program ep199;

uses
  Forms,
  main in 'main.pas' {Form1},
  cse_search in 'cse_search.pas' {Form_csi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÉóÅúÊÚÈ¨';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
