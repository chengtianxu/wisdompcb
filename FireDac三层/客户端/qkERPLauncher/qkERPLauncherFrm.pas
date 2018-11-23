unit qkERPLauncherFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Buttons, System.IniFiles,System.Generics.Collections,
  qkSvrIntf.ClientIntf,
  qkFunc.Commfunc,


  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Param
  ;

const
  QKMAINAPPNAME = 'qkMainApp.exe';
  QKMUTEXSTRHEADER = 'qkERP三层系统_';//互斥头
  QKUSERINIFILENAME = 'qkUser.ini';
  QKSYSINIFILENAME = 'qkERPLauncher.ini';

type

  TfrmERPLauncher = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    btnLogin: TSpeedButton;
    btnExit: TSpeedButton;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtPassword: TEdit;
    cbxSvr: TComboBox;
    cbxDBName: TComboBox;
    lblSvrIP: TLabel;
    cbxUser: TComboBox;
    procedure btnExitClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure lbl2DblClick(Sender: TObject);
  private
    { Private declarations }
    FUserIDKey: Int64;
    FUpdateNO: Integer;
    FSvrIP: string;
    FPassWordMD5: string;
    function CheckIsover: Boolean;
    function LoginCheck: Boolean;
    procedure GetUpdateFiles;
    procedure UpdateCallBack(AFileName: string; Status: Integer; ANote: string);
    procedure LoadIni;
    procedure SaveIni;
    procedure LoadMainApp;
  public
    { Public declarations }
  end;

var
  frmERPLauncher: TfrmERPLauncher;

implementation




{$R *.dfm}

procedure TfrmERPLauncher.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmERPLauncher.btnLoginClick(Sender: TObject);
var
  LChar: Char;
  LHandle: THandle;
begin
  {$REGION '输入检查'}
  if cbxSvr.Text = '' then
  begin
    ShowMessage('无效的服务器');
    Exit;
  end;

  if cbxDBName.Text = '' then
  begin
    ShowMessage('无效的数据库');
    Exit;
  end;

  if cbxUser.Text = '' then
  begin
    ShowMessage('请输入用户名');
    Exit;
  end;

  for LChar in cbxUser.Text do
  begin
    if not CharInSet(LChar, ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_']) then
    begin
      ShowMessage('用户名只能由a-z,A-Z,0-9,_组成，用户名包含无效字符 : ' + LChar + ' !');
      Exit;
    end;
  end;

  {$ENDREGION}
  {$REGION '互斥检查'}
  LHandle := OpenMutexW(MUTEX_ALL_ACCESS, False,
    PWideChar(QKMUTEXSTRHEADER + cbxDBName.Text));
  if (LHandle <> 0) and (LHandle <> INVALID_HANDLE_VALUE) then
  begin
    CloseHandle(LHandle);
    ShowMessage('已经登陆当前系统，请勿重新登陆');
    Exit;
  end;
  {$ENDREGION}
  {$REGION '登陆检查'}
  if not LoginCheck then
    Exit;
  {$ENDREGION}
  {$REGION '检查软件有效期'}
  if not CheckIsover then Exit;
  {$ENDREGION}
  SaveIni;
  {$REGION '获取更新'}
  GetUpdateFiles;
  {$ENDREGION}
  {$REGION '启动主程序'}
  LoadMainApp;
  {$ENDREGION}

end;

function TfrmERPLauncher.CheckIsover: Boolean;
var
  LErr: OleVariant;
  lN: Integer;
begin
  dmSvrIntf.RefreshRegTime(cbxDBName.Text,lerr);
  lN := dmSvrIntf.CheckALterRegDate(cbxDBName.Text,Lerr);
  if (lN >=0) and (lN < 30) then
  begin
    ShowMessage('系统将于'+inttostr(lN)+'天后过期将无法使用，请联系公司注册');
  end;
  if lN < 0 then
  begin
    ShowMessage('系统已经过期，请联系公司注册 13434454800');
    Result := False;
    Exit;
  end;
  Result := True;

end;

procedure TfrmERPLauncher.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnLoginClick(btnLogin);
end;

procedure TfrmERPLauncher.FormCreate(Sender: TObject);
begin
  LoadIni;
end;

procedure TfrmERPLauncher.GetUpdateFiles;
  procedure GetNeedUpdatesFiles(Ads: TDataSet;AoutDS: TDataSet);
  var
    LFile: string;
    b: Boolean;
  begin
    Ads.DisableControls;
    Ads.First;
    while not Ads.Eof do
    begin
      b := False;
      LFile := ExtractFileDir(ParamStr(0)) + Ads.FieldByName('destdir').AsString +
        Ads.FieldByName('destfilename').AsString;
      if not FileExists(LFile) then
      begin
        b := True;
      end else
      begin
        if Ads.FieldByName('UpdateByVer').AsInteger = 1 then
        begin
          if qkCommfunc.GetFileVersion(LFile) <> Ads.FieldByName('version').AsString then
          begin
            b := True;
          end;
        end else
        begin
          if qkCommfunc.GetFileLastTime(LFile) < Ads.FieldByName('ModifyTime').AsDateTime then
            b := True;
        end;
      end;
      if b then
      begin
        AoutDS.Append;
        AoutDS.FieldByName('DestDir').Value := ExtractFilePath(LFile);
        AoutDS.FieldByName('DestFileName').AsString := Ads.FieldByName('DestFileName').AsString;
        AoutDS.FieldByName('FtpName').AsString := Ads.FieldByName('FtpName').AsString;
        AoutDS.FieldByName('FtpDir').AsString := Ads.FieldByName('FtpDir').AsString;
        AoutDS.FieldByName('FtpFileName').AsString := Ads.FieldByName('FtpFileName').AsString;
        AoutDS.Post;
      end;

      Ads.Next;
    end;
  end;

var
  LdsList: TList<TFDMemtable>;
  LParams: TFDParams;
  I: Integer;
  LmtNeedDowns: TFDMemTable;
begin
  LdsList := nil;
  LParams := TFDParams.Create;
  LmtNeedDowns := qkCommfunc.CreateDownFileDS;
  with LParams.Add do
  begin
    Name := '@LoginName';
    Value := cbxUser.Text;
  end;
  try
    LdsList := dmSvrIntf.SpOpen('Sys_GetUpdateInfo',LParams);
    if LdsList = nil then
      exit;
    if not qkCommfunc.CheckSPRetParam(LParams) then
      Exit;
//    LmtFtp := LdsList[0];
//    LmtMustFiles := LdsList[1];
//    LmtLib := LdsList[2];
//    LmtModLink := LdsList[3];
    try
      for I := 1 to 3 do
        GetNeedUpdatesFiles(LdsList[I],LmtNeedDowns);

      if not LmtNeedDowns.IsEmpty then
        qkCommfunc.DownLoadFileFromFtp(LmtNeedDowns,LdsList[0],UpdateCallBack);
    except
      on E: Exception do
        ShowMessage(e.Message);
    end;
  finally
    LmtNeedDowns.Free;
    LParams.Free;
    if LdsList <> nil then
    begin
      for I := 0 to LdsList.Count - 1 do
        LdsList[I].Free;
      LdsList.Free;
    end;
  end;

end;

procedure TfrmERPLauncher.lbl2DblClick(Sender: TObject);
var
  LArr: TArray<string>;
  LErr: OleVariant;
begin
  SetLength(larr,3);
  if InputQuery('注册',['密码','key1','key2'],larr) then
  begin
    if LArr[0].ToUpper <> 'QUICKSOFT' then
    begin
      ShowMessage('密码错误');
      Exit;
    end;
    dmSvrIntf := TdmSvrIntf.Create(Self);
    FSvrIP := qkCommfunc.GetIniValue(ExtractFilePath(ParamStr(0)) + QKSYSINIFILENAME,'SvrList',cbxSvr.Text);
    dmSvrIntf.FDefConName := cbxDBName.Text;
    dmSvrIntf.con1.Params.Clear;
    dmSvrIntf.con1.Params.Add('DriverUnit=Data.DBXDataSnap');
    dmSvrIntf.con1.Params.Add('HostName=' + FSvrIP);
    dmSvrIntf.con1.Params.Add('Port=212');
    dmSvrIntf.con1.Params.Add('CommunicationProtocol=tcp/ip');
    dmSvrIntf.con1.Params.Add('DatasnapContext=datasnap/');
    dmSvrIntf.con1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');

    if not dmSvrIntf.UpdateRegCode(cbxDBName.Text,larr[1],larr[2],LErr) then
    begin
      ShowMessage(VarToStr(LErr));
    end else
    begin
      ShowMessage('注册完成');
    end;
    dmSvrIntf.Free;
  end;
end;

procedure TfrmERPLauncher.LoadIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
  LStrArr: TArray<string>;
begin
{$REGION '加载ERPLauncher ini'}
  LFileName := ExtractFilePath(ParamStr(0)) + QKSYSINIFILENAME;
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到qkERPLauncher.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSectionValues('SvrList', LS);
    for LStr in LS do
    begin
      LStrArr := lstr.Split(['=']);
      cbxSvr.Items.Add(LStrArr[0]);
    end;
    if cbxSvr.Items.Count > 0 then
      cbxSvr.ItemIndex := 0;

    Lini.ReadSectionValues('DBList', LS);
    for LStr in LS do
    begin
      LStrArr := lstr.Split(['=']);
      cbxDBName.Items.Add(lstrarr[0]);
    end;
    if cbxDBName.Items.Count > 0 then
      cbxDBName.ItemIndex := 0;
  finally
    Lini.Free;
    LS.Free;
  end;
{$ENDREGION}

{$REGION '加载用户ini'}
  LFileName := ExtractFilePath(ParamStr(0)) + QKUSERINIFILENAME;
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到qkUser.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSection('LogSvr', LS);
    for LStr in LS do
    begin
      if cbxSvr.Items.IndexOf(LStr) > 0 then
      begin
        cbxSvr.ItemIndex := cbxSvr.Items.IndexOf(LStr);
        Break;
      end;
    end;

    Lini.ReadSection('LogDB', LS);
    for LStr in LS do
    begin
      if cbxDBName.Items.IndexOf(LStr) > 0 then
      begin
        cbxDBName.ItemIndex := cbxDBName.Items.IndexOf(LStr);
        Break;
      end;
    end;

    Lini.ReadSection('LogName', cbxUser.Items);
    if cbxUser.Items.Count > 0 then
      cbxUser.ItemIndex := cbxUser.Items.Count - 1;
  finally
    Lini.Free;
    LS.Free;
  end;
{$ENDREGION}
end;

procedure TfrmERPLauncher.LoadMainApp;
var
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  LProcID: Cardinal;
  LCmdLine: string;
begin
  CreateMutexW(nil,False,PWideChar(QKMUTEXSTRHEADER + cbxDBName.Text));
  if GetLastError = Error_ALREADY_EXISTS then
  begin
    ShowMessage('已经存在唯一互斥对象，启动失败');
    Exit;
  end;

  LProcID := GetCurrentProcessId;

  LCmdLine := ExtractFilePath(
    ParamStr(0)) + QKMAINAPPNAME + ' ' +    //0
    cbxUser.Text + ' ' +     //1
    FPassWordMD5 + ' ' +     //2
    FSvrIP + ' ' +           //3
    cbxDBName.Text + ' ' +   //4
    'Quick' + ' ' +  //5 intf AuthName
    '123456' + ' ' + //6 inft Password
    Format('%d',[LProcID]) + ' ' + //7 Launcher ThreadID
    FUserIDKey.ToString; //8
  FillChar(ProcessInfo,sizeof(TProcessInformation),0);
  FillChar(StartupInfo,Sizeof(TStartupInfo),0);
  StartupInfo.cb:=Sizeof(TStartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=SW_SHOW;
  Close;
  if CreateProcessW(QKMAINAPPNAME,PWideChar(LCmdLine),nil,nil,False,NORMAL_PRIORITY_CLASS,nil,nil,StartupInfo,ProcessInfo) then
  begin

  end else
  begin
    ShowMessage('主程序启动失败');
  end;
end;

function TfrmERPLauncher.LoginCheck: Boolean;
var
  LParams: TFDParams;
begin
  Result := False;
  dmSvrIntf := TdmSvrIntf.Create(Self);
  FSvrIP := qkCommfunc.GetIniValue(ExtractFilePath(ParamStr(0)) + QKSYSINIFILENAME,'SvrList',cbxSvr.Text);
  dmSvrIntf.FDefConName := cbxDBName.Text;
  dmSvrIntf.con1.Params.Clear;
  dmSvrIntf.con1.Params.Add('DriverUnit=Data.DBXDataSnap');
  dmSvrIntf.con1.Params.Add('HostName=' + FSvrIP);
  dmSvrIntf.con1.Params.Add('Port=212');
  dmSvrIntf.con1.Params.Add('CommunicationProtocol=tcp/ip');
  dmSvrIntf.con1.Params.Add('DatasnapContext=datasnap/');
  dmSvrIntf.con1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
  //dmSvrIntf.con1.Params.Add('DSAuthenticationPassword=wisdomtopcb1077');
  //dmSvrIntf.con1.Params.Add('DSAuthenticationUser=admin');

  LParams := TFDParams.Create;
  with LParams.Add do
  begin
    Name := '@userName';
    Value := cbxUser.Text;
  end;
  with LParams.Add do
  begin
    Name := '@psw';
    FPassWordMD5 := qkCommfunc.MD5Print(edtPassword.Text);
    Value := FPassWordMD5;
  end;
  with LParams.Add do
  begin
    Name := '@ip';
    Value := qkCommfunc.GetLocalIP;
  end;
  with LParams.Add do
  begin
    Name := '@cumputer';
    Value := qkCommfunc.GetLocalCumputerName;
  end;

  try
    if not dmSvrIntf.SpExec('Sys_UserLogin',LParams) then
    begin
      Exit;
    end else
    begin
      if LParams.ParamByName('@ret').AsInteger = 1 then
      begin
        FUserIDKey := LParams.ParamByName('@userIDKey').AsLargeInt;
        Result := True;
      end else
      begin
        ShowMessage(LParams.ParamByName('@errMsg').AsString);
        exit;
      end;
    end;
  finally
    LParams.Free;
  end;

end;

procedure TfrmERPLauncher.SaveIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
begin
  LS := TStringList.Create;
  LFileName := ExtractFilePath(ParamStr(0)) + QKUSERINIFILENAME;
  Lini := TIniFile.Create(LFileName);
  try
    Lini.EraseSection('LogSvr');
    Lini.EraseSection('LogDB');

    Lini.WriteString('LogSvr',cbxSvr.Text,'');
    Lini.WriteString('LogDB',cbxDBName.Text,'');
    Lini.ReadSection('LogName',LS);
    if LS.Count > 10 then
    begin
      while LS.Count > 10 do
      begin
        Lini.DeleteKey('LogName',LS[0]);
        LS.Delete(0);
      end;
    end else
    begin
      Lini.DeleteKey('LogName',cbxUser.Text);
    end;
    Lini.WriteString('LogName',cbxUser.Text,'');
  finally
    Lini.Free;
    LS.Free;
  end;

end;

procedure TfrmERPLauncher.UpdateCallBack(AFileName: string; Status: Integer;
  ANote: string);
begin
  inc(FUpdateNo);
  with TLabel.Create(Self) do
  begin
    Color := clWhite;
    Transparent := True;
    Font.Color := clGray;
    Font.Size := 10;
    Top := FUpdateNO * Height;
    Width := 170;
    Caption := AFileName;
    Parent := Self;
  end;
  with TLabel.Create(Self) do
  begin
    Color := clWhite;
    Transparent := True;
    Font.Color := clGray;
    Font.Size := 10;
    Left := 202;
    Top := FUpdateNO * Height;
    Width := 200;
    Caption := ANote;
    Parent := Self;
  end;
end;

end.
