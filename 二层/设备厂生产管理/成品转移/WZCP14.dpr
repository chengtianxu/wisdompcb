program WZCP14;

uses
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品转换';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
