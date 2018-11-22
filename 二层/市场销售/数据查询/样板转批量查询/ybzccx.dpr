program ybzccx;

uses
  Forms,
  main in 'main.pas' {mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '样品转量产率查询';
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
