program EP172;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  Getfile in 'Getfile.pas' {FrmGetfile};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '财务报表定义';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
