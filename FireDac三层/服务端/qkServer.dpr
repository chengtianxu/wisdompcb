program qkServer;

uses
  Vcl.Forms,
  UIServer in 'UIServer.pas' {frmServerUI},
  Container in 'Container.pas' {dmContainer: TDataModule},
  Method in 'Method.pas';

{$R *.res}

begin
//{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
//{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmContainer, dmContainer);
  Application.CreateForm(TfrmServerUI, frmServerUI);
  Application.Run;
end.
