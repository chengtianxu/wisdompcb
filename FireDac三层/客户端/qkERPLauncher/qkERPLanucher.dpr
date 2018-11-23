program qkERPLanucher;

uses
  Vcl.Forms,
  qkERPLauncherFrm in 'qkERPLauncherFrm.pas' {frmERPLauncher};

{$R *.res}

begin
{$IFDEF DEBUG}
  //ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmERPLauncher, frmERPLauncher);
  Application.Run;
end.
