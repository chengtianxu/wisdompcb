program ERPLauncher;

uses
  Vcl.Forms,
  system.SysUtils,
  windows,
  LoginFrm in 'LoginFrm.pas' {frmLogin} ,
  uLoginFunc in 'uLoginFunc.pas';

{$R *.res}

// ×¢²á
function RegisterDllServer(FileName: string): boolean;
var
  nDllAddr: integer;
  bstr: string;
  ProcAddr: Pointer;
  str: PAnsiChar;
begin
  Result := False;
  if not FileExists(FileName) then
    exit;

  nDllAddr := LoadLibrary(PWideChar(FileName));
  if nDllAddr <> 0 then
  begin
    bstr := 'DllRegisterServer' + chr(0);

    str := PAnsiChar(AnsiString(bstr));
    ProcAddr := GetProcAddress(nDllAddr, str);
    if ProcAddr <> nil then
    begin
      CallWindowProc(ProcAddr, nDllAddr, 0, 0, 0);
      Result := True;
    end;
    FreeLibrary(nDllAddr);
  end;
end;

// ·´×¢²á
function UnRegisterDllServer(FileName: string): boolean;
var
  nDllAddr: integer;
  bstr: string;
  ProcAddr: Pointer;
  str: PAnsiChar;
begin
  Result := False;

  if not FileExists(FileName) then
    exit;

  nDllAddr := LoadLibrary(PWideChar(FileName));
  if nDllAddr <> 0 then
  begin
    bstr := 'DllUnregisterServer' + chr(0);

    str := PAnsiChar(AnsiString(bstr));
    ProcAddr := GetProcAddress(nDllAddr, str);
    if ProcAddr <> nil then
    begin
      CallWindowProc(ProcAddr, nDllAddr, 0, 0, 0);
      Result := True;
    end;
    FreeLibrary(nDllAddr);
  end;
end;

begin
  UnRegisterDllServer('C:\Windows\System32\midas.dll');
  RegisterDllServer(extractfilepath(paramstr(0) + 'midas.dll'));
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;

end.
