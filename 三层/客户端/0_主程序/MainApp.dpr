{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

program MainApp;

uses
  Vcl.Forms,
  uCommFunc,
  uSvrIntf,
  Winapi.Windows,
  System.SysUtils,
  Vcl.Dialogs,
  Datasnap.DBClient,
  uLookupDM,
  Vcl.Styles,
  vcl.Themes,
  System.IOUtils,
  System.IniFiles,
  MainFrm in 'MainFrm.pas' {frmMain};

{$R *.res}

function SetLoginStatus: Boolean;
var
  LCds: TClientDataSet;
  LSql: string;
begin
  Result := False;
  LCds := TClientDataSet.Create(Application);
  try
    //更新0073
    LSql := 'select * from data0073 where USER_LOGIN_NAME = ' + QuotedStr(ParamStr(1));
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if LCds.IsEmpty then Exit;
    gVar.rkey05 := LCds.FieldByName('EMPLOYEE_PTR').AsString;
    gVar.rkey73 := LCds.FieldByName('rkey').AsString;
    gVar.LoginName73 := LCds.FieldByName('USER_LOGIN_NAME').AsString;

    LCds.Edit;
    LCds.FieldByName('NETWORK_ID').AsString := gSysFunc.GetLocalIP;
    LCds.FieldByName('COMPUTER').AsString := gSysFunc.GetComputerName;
    LCds.FieldByName('LOGIN_IN_TIME').AsDateTime := gFunc.GetSvrDateTime;
    LCds.Post;
    if not gSvrIntf.IntfPostDataByTable('data0073',LCds.Delta) then Exit;

    //插入更新173
    LSql := 'select * from data0173 where active_flag<>0 and type=0 and csi_ptr=' + gVar.rkey73;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    LCds.First;
    while not LCds.Eof do
    begin
      LCds.Edit;
      LCds.FieldByName('active_flag').AsBoolean := False;
      LCds.Post;
      LCds.Next;
    end;
    LCds.Append;
    LCds.FieldByName('csi_ptr').AsString := gVar.rkey73;
    LCds.FieldByName('compute_name').AsString := gSysFunc.GetComputerName;
    LCds.FieldByName('network_ip').AsString := gSysFunc.GetLocalIP;
    LCds.FieldByName('login_date').AsDateTime := gFunc.GetSvrDateTime;
    LCds.FieldByName('type').AsBoolean := True;
    LCds.FieldByName('active_flag').AsBoolean := True;
    LCds.Post;
    if not gSvrIntf.IntfPostDataByTable('data0173',LCds.Delta) then Exit;


    //取得05Name
    LSql := 'select EMPLOYEE_NAME from data0005 where rkey = ' + gVar.rkey05;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    gVar.UserName05 := LCds.FieldByName('EMPLOYEE_NAME').AsString;

    Result := True;
  finally
    LCds.Free;
  end;
end;

function StartUpInit: Boolean;
var
  I: Integer;
  LHandle: THandle;
begin
{$IFDEF DEBUG}
  gSvrConDM.con1.Params.Clear;
  gSvrConDM.con1.Params.Add('HostName=172.16.8.112');
  //gSvrConDM.con1.Params.Add('HostName=127.0.0.1');
  //gSvrConDM.con1.Params.Add('HostName=172.18.8.37');
  gSvrConDM.con1.Params.Add('Port=211');
  gSvrConDM.con1.Params.Add('DSAuthenticationPassword=wisdomtopcb1077');
  gSvrConDM.con1.Params.Add('DSAuthenticationUser=admin');
  gSvrConDM.con1.Params.Add('DatasnapContext=datasnap/');


  //深圳测试
  gVar.rkey05 := '2685';
  gVar.rkey73 := '2224';
  gVar.SvrIP := '172.16.8.112';
  //gVar.SvrIP := '127.0.0.1';
  gVar.SvrDB := '深圳演示';



  //深圳五铢
  gVar.rkey05 := '2685';
  gVar.rkey73 := '2224';
  gVar.SvrIP := '172.16.0.8';
  //gVar.SvrIP := '127.0.0.1';
  gVar.SvrDB := '深圳五株';

  //东莞链接
  gVar.rkey05 := '1284';
  gVar.rkey73 := '1171';
  //gVar.SvrIP := '172.16.8.112';
  gVar.SvrIP := '172.18.8.37';
  gVar.SvrDB := '东莞五株';
//
//
//  //香港链接
//  gVar.rkey05 := '476';
//  gVar.rkey73 := '328';
//  //gVar.SvrIP := '172.16.8.112';
//  gVar.SvrIP := '127.0.0.1';
//  gVar.SvrDB := '香港五株';

  Result := True;
  Exit;
{$ENDIF}

  gVar.FourceEXITCode := 0;
  gVar.AutoCloseTCPTime := 0;

  Result := False;
  for I := 0 to 5 do
  begin
    if ParamStr(I) = '' then
    begin
      ShowMessage('程序启动失败');
      Result := False;
      Exit;
    end;
  end;

  LHandle := OpenMutexW(MUTEX_ALL_ACCESS, False,
    PWideChar('ERP三层系统_' + ParamStr(4)));
  if (LHandle = 0) or (LHandle = INVALID_HANDLE_VALUE) then
  begin
    ShowMessage('程序启动失败');
    Result := False;
    Exit;
  end;

  if not TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),StrToInt(ParamStr(5))),0) then
  begin
    ShowMessage('结束登录进程失败');
    Result := False;
    Exit;
  end;


  gSvrConDM.con1.Params.Clear;
  gSvrConDM.con1.Params.Add('HostName=' + ParamStr(3));
  gSvrConDM.con1.Params.Add('Port=211');
  gSvrConDM.con1.Params.Add('DSAuthenticationPassword=wisdomtopcb1077');
  gSvrConDM.con1.Params.Add('DSAuthenticationUser=admin');
  gSvrConDM.con1.Params.Add('DatasnapContext=datasnap/');

  gVar.SvrIP := ParamStr(3);
  gVar.SvrDB := ParamStr(4);

  if not SetLoginStatus then Exit;

  Result := True;
end;

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

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  gSvrConDM := TdmSvrIntf.Create(Application);
  gLookDM := TdmLookup.Create(Application);
  Application.MainFormOnTaskbar := True;
  if StartUpInit then
  begin
    LoadSkin;
    gLookDM.GetData;
    Application.CreateForm(TfrmMain, frmMain);
  end else
  begin

  end;
  Application.Run;
  gSvrConDM.Free;
  gLookDM.Free;


end.
