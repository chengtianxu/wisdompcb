program qkServer_WinServer;

uses
  Vcl.SvcMgr,
  Container,
  unit1 in 'unit1.pas' {dmqkwinserver: TService};

{$R *.RES}
var
  b: boolean = True;
begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TdmContainer, dmContainer);
  Application.CreateForm(Tdmqkwinserver, dmqkwinserver);
  //unit1.dmqkwinserver.ServiceStart(nil,b);//这句是调试用
  Application.Run;
end.
