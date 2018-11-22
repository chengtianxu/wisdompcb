program WZPR_CMP;

uses
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '物料标识码比对';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
