program qkMainApp;

uses
  Vcl.Forms,
  system.Variants,
  system.Types,
  Winapi.Windows,
  System.SysUtils,
  Vcl.Dialogs,
  Datasnap.DBClient,
  Vcl.Styles,
  vcl.Themes,
  system.Generics.Collections,
  System.IOUtils,
  System.IniFiles,
  firedac.Stan.Param,
  firedac.Comp.Client,
  qkSvrIntf.ClientIntf,
  qkFunc.Commfunc,
  qkMainFrm in 'qkMainFrm.pas' {frmqkMainApp};

{$R *.res}

function LoadSkin: Boolean;
var
  LPath: string;
  Lstr: string;
  LIni: TIniFile;
  LSyName: string;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ClientConfig.ini');
  try
    LSyName := LIni.ReadString('Skins','Skin1','Sapphire Kamri');
  finally
    LIni.Free;
  end;
  Result := False;
  try
    LPath := ExtractFilePath(ParamStr(0)) + '\Skins';
    for Lstr in TDirectory.GetFiles(LPath,'*.Vsf') do
    begin
      TStyleManager.LoadFromFile(Lstr);
    end;
    if Length(TStyleManager.StyleNames) > 1 then
    begin
      TStyleManager.SetStyle(LSyName);
    end;
  except
    ShowMessage('加载皮肤资源失败');
    Exit;
  end;
  Result := True;
end;

{$REGION 'COpy'}
procedure CopyUpdate;
  function CopyCheck(A,B: string): Boolean;
  var
    Ldt1,Ldt2: TDateTime;
  begin
    Ldt1 := 0;
    Ldt2 := 0;
    if FileExists(A) then
      Ldt1 := qkCommfunc.GetFileLastTime(a);
    if FileExists(B) then
      Ldt2 := qkCommfunc.GetFileLastTime(b);

    Result := Ldt1 > Ldt2;
  end;
var
  LFiles: TStringDynArray;
  I: Integer;
  LtmpDir: string;
begin
  LtmpDir := ExtractFilePath(ParamStr(0)) + 'updatetmp\';
  if not DirectoryExists(LtmpDir) then Exit;

  LFiles := TDirectory.GetFiles(ExtractFilePath(ParamStr(0)) + 'updatetmp\');
  for I := 0 to Length(LFiles) - 1 do
  begin
    if CopyCheck(LFiles[I],ExtractFilePath(ParamStr(0)) + ExtractFileName(LFiles[I])) then
    begin
      if not qkCommfunc.IsFileInUse(ExtractFilePath(ParamStr(0)) + ExtractFileName(LFiles[I])) then
        TFile.Copy(LFiles[I],ExtractFilePath(ParamStr(0)) + ExtractFileName(LFiles[I]),True);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Histroy'}
function InsertHistory: Boolean;
var
  LParams: TFDParams;
begin
  Result := False;
  LParams := TFDParams.Create;
  try
    with LParams.Add do
    begin
      Name := '@UserIDKey';
      Value := qkVar.LoginIDKey.ToString;
    end;
    with LParams.Add do
    begin
      Name := '@PassWordMD5';
      Value := qkVar.LoginPsdMD5;
    end;
    with LParams.Add do
    begin
      Name := '@LoginComputer';
      Value := qkCommfunc.GetLocalCumputerName;
    end;
    with LParams.Add do
    begin
      Name := '@LoginIP';
      Value := qkVar.LoginIP;
    end;
    with LParams.Add do
    begin
      Name := '@LoginServer';
      Value := qkVar.LoginSvrIP;
    end;
    with LParams.Add do
    begin
      Name := '@LoginDBConnect';
      Value := qkVar.LoginDBName;
    end;

    if not dmSvrIntf.SpExec('Sys_InsertLoginHistory',LParams) then
      Exit;

    if VarToStr(LParams.ParamByName('@ret').Value) <> '1' then
    begin
      ShowMessage(LParams.ParamByName('@errMsg').AsString);
      Exit;
    end;
    Result := True;
  finally
    LParams.Free;
  end;

end;

{$ENDREGION}

function StartUpInit: Boolean;
var
  LDs: TFDMemTable;
begin

  Result := False;
{$REGION 'Debug'}
{$IFDEF DEBUG}
  qkVar.LoginIDKey := 1;
  qkVar.LoginName := 'admin';
  qkVar.LoginTime := qkCommfunc.DateTimeToStr(now);
  qkVar.LoginIP := qkCommfunc.GetLocalIP;
  qkVar.LoginDBName := 'QuickSoft';
  qkVar.LoginSvrIP := 'www.topcb.work';
  qkVar.LoginPsdMD5 := '21232F297A57A5A743894A0E4A801FC3';
  //qkVar.LoginSvrIP := '172.18.8.30';
{$ENDIF}
{$ENDREGION}

  //gVar.FourceEXITCode := 0;
  //gVar.AutoCloseTCPTime := 0;
{$IFNDEF DEBUG}
  for I := 0 to 8 do
  begin
    if ParamStr(I) = '' then
    begin
      ShowMessage(I.ToString + ':' + ParamStr(I));
      ShowMessage('程序启动失败');
      Result := False;
      Exit;
    end;
  end;

  LHandle := OpenMutexW(MUTEX_ALL_ACCESS, False,
    PWideChar('qkERP三层系统_' + ParamStr(4)));
  if (LHandle = 0) or (LHandle = INVALID_HANDLE_VALUE) then
  begin
    ShowMessage('程序启动失败1');
    Result := False;
    Exit;
  end;

  if not TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),StrToInt(ParamStr(7))),0) then
  begin
    ShowMessage('结束登录进程失败');
    Result := False;
    Exit;
  end;


  qkVar.LoginIDKey := StrToInt64(Paramstr(8));
  qkVar.LoginName := ParamStr(1);
  qkVar.LoginPsdMD5 := ParamStr(2);
  qkVar.LoginIP := qkCommfunc.GetLocalIP;
  qkVar.LoginTime := qkCommfunc.DateTimeToStr(Now);
  qkVar.LoginDBName := ParamStr(4);
  qkVar.LoginSvrIP := ParamStr(3);

{$ENDIF}

  dmSvrIntf.FDefConName := qkVar.LoginDBName;
  dmSvrIntf.con1.Params.Clear;
  dmSvrIntf.con1.Params.Add('DriverUnit=Data.DBXDataSnap');
  dmSvrIntf.con1.Params.Add('DatasnapContext=datasnap/');
  dmSvrIntf.con1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
  dmSvrIntf.con1.Params.Add('HostName=' + qkVar.LoginSvrIP);
  dmSvrIntf.con1.Params.Add('Port=212');
  dmSvrIntf.con1.Params.Add('DSAuthenticationUser=' + ParamStr(5));
  dmSvrIntf.con1.Params.Add('DSAuthenticationPassword=' + ParamStr(6));
  dmSvrIntf.con1.Params.Add('CommunicationProtocol=tcp/ip');
  try
    dmSvrIntf.con1.Open;
  except
    on E: Exception do
    begin
      ShowMessage(e.Message);
      Exit;
    end;
  end;

  if not InsertHistory then Exit;

  {$REGION '取得用户全局变量信息'}
  LDs := TFDMemtable.Create(nil);

  try
    if not qkDataIntf.GetTableData(lds,'gSys_User','IDkey = ' + qkVar.LoginIDKey.ToString) then
      exit;
    if LDs.IsEmpty then
      Exit;
    qkVar.LoginFullName := LDs.FieldByName('FullName').AsString;
  finally
    LDs.Free;
  end;


  {$ENDREGION}

  Result := True;
end;


begin
  //拷贝更新
  CopyUpdate;

  dmSvrIntf := TdmSvrIntf.Create(Application);

  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  if StartUpInit then
  begin
    LoadSkin;
    Application.CreateForm(TfrmqkMainApp, frmqkMainApp);
  end else
  begin

  end;
  Application.Run;
  dmSvrIntf.Free;
end.
