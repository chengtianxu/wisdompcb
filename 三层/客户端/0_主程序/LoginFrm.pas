{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, RzButton, RzLabel, Vcl.ComCtrls,
  System.Generics.Collections,
  Datasnap.DBClient, Vcl.Grids, IdGlobal, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Data.DB,IdFTPList,
  IdHashMessageDigest, uLoginFunc;

type
  TfrmLogin = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    idftp1: TIdFTP;
    pnl1: TPanel;
    pnlLogin: TPanel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    btnExit: TBitBtn;
    btnLogin: TBitBtn;
    edtPassWord: TEdit;
    cbxDB: TComboBox;
    cbxSvr: TComboBox;
    cbxUserName: TComboBox;
    shp1: TShape;
    pnlUpdate: TPanel;
    lblUpdatewait: TLabel;
    sgUpdateFiles: TStringGrid;
    shp2: TShape;
    btnCancleUpdate: TButton;
    tmr2: TTimer;
    lblSvr: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPassWordKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancleUpdateClick(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure cbxSvrChange(Sender: TObject);
  private
    { Private declarations }
    FNowTime: TDateTime;
    FRkey73: string;
    FPassWordMD5: string;
    FNeedUpdate: Boolean;
    FUpdateFinsh: Boolean;
    FLoadMainTimes: Integer;
    procedure wmnchittest(var msg: twmnchittest); message wm_nchittest;
    procedure LoadSvrIni;
    procedure LoadLocalIni;
    procedure SaveLocalIni;

    function LoginCheck: Boolean;
    function GetFileListFromBD(ARkey73: string): Boolean;
    function DownLoadFileFromFtp(): Boolean;

    procedure LoadMainApp;

    function IntfGetDataBySql(ASvrIP: string; APort: string; ADBName: string;
      ASql: string; out AData: OleVariant; out ErrMsg: string): Boolean;
    function IntfPostDataByTable(ASvrIP: string; APort: string; ADBName: string;
      ATable: string; AData: OleVariant; out ErrMsg: string): Boolean;
  public
    { Public declarations }
    FSvrList: TDictionary<string, string>;
    FDBList: TDictionary<string, string>;
    FFileDS: TClientDataSet;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  System.IniFiles, System.StrUtils;

{$R *.dfm}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
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

  if cbxDB.Text = '' then
  begin
    ShowMessage('无效的数据库');
    Exit;
  end;

  if cbxUserName.Text = '' then
  begin
    ShowMessage('请输入用户名');
    Exit;
  end;

  for LChar in cbxUserName.Text do
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
    PWideChar('ERP三层系统_' + cbxDB.Text));
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
  {$REGION '取得用户有权的文件列表和必须的文件列表'}
  if not GetFileListFromBD(FRkey73) then
    Exit;
  {$ENDREGION}
  pnlLogin.Visible := False;
  pnlUpdate.Visible := True;
  pnlUpdate.BringToFront;
  tmr1.Enabled := True;

  {$REGION '从FTP更新文件'}
  FUpdateFinsh := False;
  FNeedUpdate := False;
  if not DownLoadFileFromFtp then
    Exit;
  FUpdateFinsh := True;
  {$ENDREGION}

  tmr1.Enabled := False;
  lblUpdatewait.Caption := '更新完成！';
  SaveLocalIni;

  if FNeedUpdate then
  begin
    FLoadMainTimes := 1;
    btnCancleUpdate.Caption := '启动ERP:' + IntToStr(FLoadMainTimes);
    tmr2.Enabled := True;
  end
  else
    LoadMainApp;
end;

procedure TfrmLogin.cbxSvrChange(Sender: TObject);
var
  LStr: string;
begin
  if FSvrList.TryGetValue(cbxSvr.Text,LStr) then
  begin
    lblSvr.Caption := LStr;
  end else
    lblSvr.Caption := '';
end;

function inlineGetFileVersion(FileName: string): String; // 得程序版本号
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  VerInfo: ^VS_FIXEDFILEINFO;
begin
  result := '0.0.0.0';
  InfoSize := GetFileVersionInfoSizeW(Pchar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfoW(Pchar(FileName), Wnd, InfoSize, VerBuf) then
      begin
        VerInfo := nil;
        VerQueryValueW(VerBuf, '\', Pointer(VerInfo), Wnd);
        if VerInfo <> nil then
        begin
          result := Format('%d.%d.%d.%d', [VerInfo^.dwFileVersionMS shr 16,
            VerInfo^.dwFileVersionMS and $0000FFFF,
            VerInfo^.dwFileVersionLS shr 16, VerInfo^.dwFileVersionLS and
            $0000FFFF]);
        end;
      end;
    finally
      FreeMem(VerBuf, InfoSize);
    end;
  end;
end;

function inlineGetFileTime(const AFileName: string): TDateTime;
  function CovFileDate(AFileTime: TFileTime): TDateTime;
  var
    Tct: TSystemTime;
    Temp: TFileTime;
  begin
    FileTimeToLocalFileTime(AFileTime, Temp);
    FileTimeToSystemTime(Temp, Tct);
    CovFileDate := SystemTimeToDateTime(Tct);
  end;

// const
// Model='yyyy/mm/dd,hh:mm:ss'; { 设定时间格式 }
var
  Tp: TSearchRec; { 申明Tp为一个查找记录 }
  // T1,T2,T3:string;
begin
  FindFirst(AFileName, faAnyFile, Tp); { 查找目标文件 }
  try
    // T1:=FormatDateTime(Model,CovFileDate(Tp.FindData.ftCreationTime));
    // { 返回文件的创建时间 }
    // T2:=FormatDateTime(Model,CovFileDate(Tp.FindData.ftLastWriteTime));
    // { 返回文件的修改时间 }
    // T3:=FormatDateTime(Model,Now);
    // { 返回文件的当前访问时间 }
    result := CovFileDate(Tp.FindData.ftLastWriteTime);
  finally
    FindClose(Tp);
  end;
end;

function IsFileInUse(Afname: string): Boolean;
var
  hfileres: hfile;
begin
  Result := False;
  if not fileexists(Afname) then
    Exit;
  hfileres := createfile(Pchar(Afname), generic_read or generic_write, 0, nil,
    open_existing, file_attribute_normal, 0);
  result := (hfileres = invalid_handle_value);
  if not result then
    CloseHandle(hfileres);
end;

function inlineSetFileDateTime(AFileName: string; ADateTime: TDateTime)
  : Boolean;
var
  Dt1: Integer;
  Fs: TFileStream;
  Fct: TFileTime;
begin
  Dt1 := DateTimeToFileDate(ADateTime);
  try
    Fs := TFileStream.Create(AFileName, fmOpenReadWrite);
    try
      if DosDateTimeToFileTime(LongRec(Dt1).Hi, LongRec(Dt1).Lo, Fct) and
        LocalFileTimeToFileTime(Fct, Fct)
      then
      begin
        SetFileTime(Fs.Handle, @Fct, @Fct, @Fct);
      end;
    finally
      Fs.Free;
    end;
    result := True;
  except
    result := False;
  end;
end;

function TfrmLogin.DownLoadFileFromFtp: Boolean;
var
  LCdsFtp: TClientDataSet;
  LSql: string;
  LIntfRet: Boolean;
  LErrMsg: string;
  LData: OleVariant;
  LSvrIP: string;

  LLocalFileName: string;
  LBNeedDown: Boolean;
  LBCheckByVer: Boolean;
  LTmpDatetime: TDateTime;

  LDir: string;
  LtmpStr: string;
  I: Integer;
  LBExistInFtp: Boolean;
begin
  result := False;

  if not FSvrList.TryGetValue(cbxSvr.Text, LSvrIP) then
  begin
    ShowMessage('没有找到对应的服务器');
    Exit;
  end;

  LCdsFtp := TClientDataSet.Create(Self);
  try
  {$REGION '取得ftp列表'}
    LSql := 'select * from Tier3_FtpList';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCdsFtp.Data := LData;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
    FFileDS.First;
    while not FFileDS.Eof do
    begin
      LDir := FFileDS.FieldByName('DestDir').AsString;
      if LDir[Length(LDir)] <> '\' then
      begin
        LDir := LDir + '\';
        FFileDS.Edit;
        FFileDS.FieldByName('DestDir').AsString := LDir;
        FFileDS.Post;
      end;
      FFileDS.Next;
    end;
    FFileDS.First;
    while not FFileDS.Eof do
    begin
      Application.ProcessMessages;
      LBNeedDown := False;
      LBCheckByVer := FFileDS.FieldByName('CheckByVer').AsInteger = 1;
      LLocalFileName := FFileDS.FieldByName('DestDir').AsString +
        FFileDS.FieldByName('DestFileName').AsString;
      if not fileexists(LLocalFileName) then
        LBNeedDown := True;
      if not LBNeedDown then
      begin
        if LBCheckByVer then
        begin
          LBNeedDown := inlineGetFileVersion(LLocalFileName) <>
            FFileDS.FieldByName('LastVersion').AsString;
        end
        else
        begin
          LTmpDatetime := inlineGetFileTime(LLocalFileName);
          if LTmpDatetime < FFileDS.FieldByName('LastModifyTime').AsDateTime
          then
            LBNeedDown := True;
        end;
      end;

      if LBNeedDown then
      begin
        FNeedUpdate := True;
        lblUpdatewait.Caption := '正在更新  ' + FFileDS.FieldByName('DestFileName').AsString + '  请稍后';
        Application.ProcessMessages;
        sgUpdateFiles.Cells[0, sgUpdateFiles.RowCount - 1] := FFileDS.FieldByName('DestFileName').AsString;

        {$REGION '判断是否需要创建路径'}
        if not DirectoryExists(FFileDS.FieldByName('DestDir').AsString) then
        begin
          ForceDirectories(FFileDS.FieldByName('DestDir').AsString);
        end;
        {$ENDREGION}

        {$REGION '判断本地文件是否占用'}
        if IsFileInUse(FFileDS.FieldByName('DestDir').AsString + FFileDS.FieldByName('DestFileName').AsString) then
        begin
          sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'InUse';
          FFileDS.Next;
          sgUpdateFiles.RowCount := sgUpdateFiles.RowCount + 1;
          Continue;
        end;
        {$ENDREGION}

        if not LCdsFtp.Locate('FtpID',FFileDS.FieldByName('Ftp_Ptr').AsInteger,[loCaseInsensitive]) then
        begin
          sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_NotFind';
          FFileDS.Next;
          sgUpdateFiles.RowCount := sgUpdateFiles.RowCount + 1;
          Continue;
        end;

        {$REGION '连接FTP开始下载'}
        if not idftp1.Connected then
        begin
          idftp1.Host := LCdsFtp.FieldByName('FtpIP').AsString;
          idftp1.Port := LCdsFtp.FieldByName('FtpPort').AsInteger;
          idftp1.Username := LCdsFtp.FieldByName('FtpUserName').AsString;
          idftp1.Password := LCdsFtp.FieldByName('FtpPassWord').AsString;
          try
            idftp1.Connect;
          except
            sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_ConnetError';
          end;
        end else
        begin
          if (idftp1.Host <> LCdsFtp.FieldByName('FtpIP').AsString) or
             (idftp1.Port <> LCdsFtp.FieldByName('FtpPort').AsInteger) or
             (idftp1.Username <> LCdsFtp.FieldByName('FtpUserName').AsString) or
             (idftp1.Password <> LCdsFtp.FieldByName('FtpPassWord').AsString)
          then
          begin
            idftp1.Disconnect;
            idftp1.Host := LCdsFtp.FieldByName('FtpIP').AsString;
            idftp1.Port := LCdsFtp.FieldByName('FtpPort').AsInteger;
            idftp1.Username := LCdsFtp.FieldByName('FtpUserName').AsString;
            idftp1.Password := LCdsFtp.FieldByName('FtpPassWord').AsString;
            try
              idftp1.Connect;
            except
              sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_ConnetError';
            end;
          end;
        end;

        if idftp1.Connected then
        begin
          LtmpStr := FFileDS.FieldByName('FtpDir').AsString;
          if LtmpStr <> '' then
          begin
            if LtmpStr[Length(LtmpStr)] = '\' then
              LtmpStr[Length(LtmpStr)] := ' ';
            if Trim(LtmpStr) <> Trim(idftp1.RetrieveCurrentDir) then
            begin
              try
                idftp1.ChangeDir(LtmpStr);
              except
                sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_FtpDirNotExist';
                sgUpdateFiles.RowCount := sgUpdateFiles.RowCount + 1;
                FFileDS.Next;
                Continue;
              end;
            end;
          end else
          begin
            LtmpStr := LCdsFtp.FieldByName('FtpDir').AsString;
            if LtmpStr <> '' then
            begin
              if LtmpStr[Length(LtmpStr)] = '\' then
                LtmpStr[Length(LtmpStr)] := ' ';
              if Trim(LtmpStr) <> Trim(idftp1.RetrieveCurrentDir) then
              begin
                idftp1.ChangeDir(LtmpStr);
              end;
            end;
          end;
          idftp1.List;
          LBExistInFtp := False;
          for I := 0 to idftp1.DirectoryListing.Count - 1 do
          begin
            if (idftp1.DirectoryListing.Items[I].FileName.ToUpper = FFileDS.FieldByName('FtpFileName').AsString.ToUpper) and
               (idftp1.DirectoryListing.Items[I].ItemType = ditFile)
            then
            begin
              LBExistInFtp := true;
              try
                idftp1.Get(idftp1.DirectoryListing.Items[I].FileName,FFileDS.FieldByName('DestDir').AsString +
                      FFileDS.FieldByName('DestFileName').AsString,True,False);
                sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'OK!';
              except
                sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_DownError';
              end;
            end;
          end;
          if not LBExistInFtp then
            sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_FileNoExist';
        end;
        {$ENDREGION}

        sgUpdateFiles.RowCount := sgUpdateFiles.RowCount + 1;

      end;
      FFileDS.Next;
    end;
    result := True;
  finally
    LCdsFtp.Free;
  end;
end;

procedure TfrmLogin.edtPassWordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnLoginClick(btnLogin);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FSvrList := TDictionary<string, string>.Create;
  FDBList := TDictionary<string, string>.Create;
  FFileDS := TClientDataSet.Create(Self);
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  FSvrList.Free;
  FDBList.Free;
  FFileDS.Free;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  LoadSvrIni;
  LoadLocalIni;
  sgUpdateFiles.ColWidths[0] := 320;
  sgUpdateFiles.ColWidths[1] := 90;
  cbxSvrChange(cbxSvr);
end;

function TfrmLogin.GetFileListFromBD(ARkey73: string): Boolean;
var
  LSql: string;
  LErrMsg: string;
  LData: OleVariant;
  LIntfRet: Boolean;
  LSvrIP: string;
  LCds: TClientDataSet;
  I: Integer;
begin
  result := False;

  if not FSvrList.TryGetValue(cbxSvr.Text, LSvrIP) then
  begin
    ShowMessage('没有找到对应的服务器');
    Exit;
  end;
  LCds := TClientDataSet.Create(Self);
  try
  {$REGION '取得必须的文件'}
    LSql := 'select * from Tier3_SysFiles where MustDown = 1 order by FtpDir';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      FFileDS.Data := LData;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
  {$REGION '取得用户权限的BPL'}
    LSql := ' SELECT t1.* FROM Tier3_UserModAuthCards ' +
             ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
              ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserModAuthCards.ModID '+
              ' INNER JOIN Tier3_SysFiles t1 ON t1.FileName = d419.BPLName ' +
              ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND D73_Ptr = ' + ARkey73 +
            ' UNION ' +
            ' SELECT t1.* FROM Tier3_UserAddsModOperator ' +
            ' INNER JOIN Tier3_UserModAuthCards on Tier3_UserAddsModOperator.MasterUserCard_IDKey = Tier3_UserModAuthCards.IDKey ' +
            ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserAddsModOperator.ModID ' +
            ' INNER JOIN Tier3_SysFiles t1 ON t1.FileName = d419.BPLName ' +
            ' INNER JOIN Tier3_ModAuthCard on Tier3_UserModAuthCards.ModAuthCard_IDKey = Tier3_ModAuthCard.IDKey ' +
            ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND (getdate() BETWEEN BeginTime AND EndTime) ' +
            ' AND Tier3_UserAddsModOperator.D73_Ptr = ' + ARkey73;
   {
    LSql := ' select * from Tier3_SysFiles where filename in (' +
      ' SELECT t1.FileName FROM	Data0073 d73 ' +
      ' INNER JOIN data0074 d74 ON d74.USER_PTR = d73.RKEY ' +
      ' INNER JOIN Data0419 d419 ON d74.FUNCTION_ID = d419.RKEY ' +
      ' INNER JOIN Tier3_SysFiles t1 ON t1.FileName = d419.BPLName ' +
      ' WHERE d73.rkey = ' + ARkey73 + ' And ISNULL(d74.AuthList,'''') <> ''''  GROUP BY t1.FileName )';
    }
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds.Data := LData;
      while not LCds.Eof do
      begin
        FFileDS.Append;
        for I := 0 to FFileDS.FieldCount - 1 do
        begin
          FFileDS.Fields[I].Value := LCds.Fields[I].Value;
        end;
        FFileDS.Post;
        LCds.Next;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}

  {$REGION '取得Mod关联的文件'}
    LSql := ' select * from Tier3_SysFiles where LinkModID in (' +
            ' SELECT d419.modid FROM Tier3_UserModAuthCards ' +
             ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
              ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserModAuthCards.ModID '+
              ' INNER JOIN Tier3_SysFiles t1 ON t1.FileName = d419.BPLName ' +
              ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND D73_Ptr = ' + ARkey73 +
            ' UNION ' +
            ' SELECT d419.modid FROM Tier3_UserAddsModOperator ' +
            ' INNER JOIN Tier3_UserModAuthCards on Tier3_UserAddsModOperator.MasterUserCard_IDKey = Tier3_UserModAuthCards.IDKey ' +
            ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserAddsModOperator.ModID ' +
            ' INNER JOIN Tier3_SysFiles t1 ON t1.FileName = d419.BPLName ' +
            ' INNER JOIN Tier3_ModAuthCard on Tier3_UserModAuthCards.ModAuthCard_IDKey = Tier3_ModAuthCard.IDKey ' +
            ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND (getdate() BETWEEN BeginTime AND EndTime) ' +
            ' AND Tier3_UserAddsModOperator.D73_Ptr = ' + ARkey73 + ')';

    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds.Data := LData;
      while not LCds.Eof do
      begin
        FFileDS.Append;
        for I := 0 to FFileDS.FieldCount - 1 do
        begin
          FFileDS.Fields[I].Value := LCds.Fields[I].Value;
        end;
        FFileDS.Post;
        LCds.Next;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
    result := True;
  finally
    LCds.Free;
  end;
end;

procedure TfrmLogin.LoadLocalIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'ClientConfig.ini';
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到ClientConfig.ini配置文件，加载INI失败');
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
      if cbxDB.Items.IndexOf(LStr) > 0 then
      begin
        cbxDB.ItemIndex := cbxDB.Items.IndexOf(LStr);
        Break;
      end;
    end;

    Lini.ReadSection('LogName', cbxUserName.Items);
    if cbxUserName.Items.Count > 0 then
      cbxUserName.ItemIndex := cbxUserName.Items.Count - 1;

  finally
    Lini.Free;
    LS.Free;
  end;

end;

procedure TfrmLogin.LoadMainApp;
var
  LSvrIP: string;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  LProcID: Cardinal;
  LCmdLine: string;
begin
  if not FSvrList.TryGetValue(cbxSvr.Text, LSvrIP) then
  begin
    ShowMessage('没有找到对应的服务器');
    Exit;
  end;


  CreateMutexW(nil,False,PWideChar('ERP三层系统_' + cbxDB.Text));
  if GetLastError = Error_ALREADY_EXISTS then
  begin
    ShowMessage('已经存在唯一互斥对象，启动失败');
    Exit;
  end;

  LProcID := GetCurrentProcessId;

  LCmdLine := ExtractFilePath(ParamStr(0)) + 'MainApp.exe' + ' ' + cbxUserName.Text + ' ' + FPassWordMD5 + ' ' + LSvrIP + ' ' + cbxDB.Text + ' ' + Format('%d',[LProcID]);
  FillChar(ProcessInfo,sizeof(TProcessInformation),0);
  FillChar(StartupInfo,Sizeof(TStartupInfo),0);
  StartupInfo.cb:=Sizeof(TStartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=SW_SHOW;
  if CreateProcessW('MainApp.exe',PWideChar(LCmdLine),nil,nil,False,NORMAL_PRIORITY_CLASS,nil,nil,StartupInfo,ProcessInfo) then
  begin

  end else
  begin
    ShowMessage('主程序启动失败');
  end;
end;

procedure TfrmLogin.LoadSvrIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'ERPLauncher.ini';
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到ERPLauncher.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSectionValues('SvrList', LS);
    for LStr in LS do
    begin
      FSvrList.Add(SplitString(LStr, '=')[0], SplitString(LStr, '=')[1]);
      cbxSvr.Items.Add(SplitString(LStr, '=')[0]);
    end;
    if cbxSvr.Items.Count > 0 then
      cbxSvr.ItemIndex := 0;

    Lini.ReadSectionValues('DBList', LS);
    for LStr in LS do
    begin
      FDBList.Add(SplitString(LStr, '=')[0], SplitString(LStr, '=')[1]);
      cbxDB.Items.Add(SplitString(LStr, '=')[0]);
    end;
    if cbxDB.Items.Count > 0 then
      cbxDB.ItemIndex := 0;

  finally
    Lini.Free;
    LS.Free;
  end;
end;

function TfrmLogin.IntfGetDataBySql(ASvrIP: string; APort: string;
  ADBName: string; ASql: string; out AData: OleVariant;
  out ErrMsg: string): Boolean;
type
  TPF = function(ASvrIP: string; APort: string; ADBName: string; ASql: string;
    out AData: OleVariant; out ErrMsg: string): Boolean; stdcall;
var
  LPF: Pointer;
  LHandle: THandle;
  LFileName: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'gSvrIntf.bpl';
  if not fileexists(LFileName) then
  begin
    ErrMsg := '没有找到gSvrIntf.bpl ，取得数据失败';
    result := False;
    Exit;
  end;

  LHandle := LoadPackage(LFileName);
  if (LHandle = 0) or (LHandle = invalid_handle_value) then
  begin
    ErrMsg := '加载 gSvrIntf.bpl 包失败';
    result := False;
    Exit;
  end;

  LPF := GetProcAddress(LHandle, 'GetDataBySql');
  if LPF = nil then
  begin
    ErrMsg := '取得 GetDataBySql 接口函数失败';
    result := False;
    Exit;
  end;

  result := TPF(LPF)(ASvrIP, APort, ADBName, ASql, AData, ErrMsg);
  if (LHandle <> 0) and (LHandle <> invalid_handle_value) then
    UnloadPackage(LHandle);

end;

function TfrmLogin.IntfPostDataByTable(ASvrIP, APort, ADBName, ATable: string;
  AData: OleVariant; out ErrMsg: string): Boolean;
type
  TPF = function(ASvrIP: string; APort: string; ADBName: string; ATable: string;
    AData: OleVariant; out ErrMsg: string): Boolean; stdcall;
var
  LPF: Pointer;
  LHandle: THandle;
  LFileName: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'gSvrIntf.bpl';
  if not fileexists(LFileName) then
  begin
    ErrMsg := '没有找到gSvrIntf.bpl ，取得数据失败';
    result := False;
    Exit;
  end;

  LHandle := LoadPackage(LFileName);
  if (LHandle = 0) or (LHandle = invalid_handle_value) then
  begin
    ErrMsg := '加载 gSvrIntf.bpl 包失败';
    result := False;
    Exit;
  end;

  LPF := GetProcAddress(LHandle, 'PostDataByTable');
  if LPF = nil then
  begin
    ErrMsg := '取得 PostDataByTable 接口函数失败';
    result := False;
    Exit;
  end;

  result := TPF(LPF)(ASvrIP, APort, ADBName, ATable, AData, ErrMsg);
  if (LHandle <> 0) and (LHandle <> invalid_handle_value) then
    UnloadPackage(LHandle);

end;

procedure TfrmLogin.wmnchittest(var msg: twmnchittest);
begin
  inherited;
  if (htclient = msg.result) then
    msg.result := htcaption;
end;

function TfrmLogin.LoginCheck: Boolean;
var
  LSql: string;
  LErrMsg: string;
  LCds: TClientDataSet;
  LCds73: TClientDataSet;
  LData: OleVariant;
  LIntfRet: Boolean;

  LSvrIP: string;
  LStr: string;
  LNowTime: TDateTime;
begin
  result := False;
  if not FSvrList.TryGetValue(cbxSvr.Text, LSvrIP) then
  begin
    ShowMessage('没有找到对应的服务器');
    Exit;
  end;

  LCds := TClientDataSet.Create(Self);
  LCds73 := TClientDataSet.Create(Self);
  try
  {$REGION '软件是否过期检查'}
    LSql := 'select ENG_MI_FILE_NO,part_location,getdate() as nowtime from data0192';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds.Data := LData;
      if LCds.IsEmpty then
      begin
        ShowMessage('主程序序列号已过期,请与软件供应商联系!');
        Exit;
      end
      else
      begin
        LStr := MD5Print
          (Base64_Encode(LCds.FieldByName('ENG_MI_FILE_NO').AsString));
        if LCds.FieldByName('part_location').AsString.ToUpper <> LStr.ToUpper
        then
        begin
          ShowMessage('主程序序列号已过期,请与软件供应商联系!');
          Exit;
        end;
        LNowTime := LCds.FieldByName('nowtime').AsDateTime;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
  {$REGION '文件证书检查'}
    LSql := ' DECLARE @ii bit ' + ' set @ii = 0 ' +
      ' exec sysuselife @ii output ' + ' select @ii as isactive';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds.Data := LData;
      if not LCds.IsEmpty then
      begin
        if not LCds.FieldByName('isactive').AsBoolean then
        begin
          ShowMessage('程序文件证书到期,请与供应商联系');
          Exit;
        end;
      end
      else
      begin
        ShowMessage('程序文件证书到期,请与供应商联系');
        Exit;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
  {$REGION '取得用户的用户名和密码'}
    LSql := 'SELECT * FROM Data0073 where USER_LOGIN_NAME = ' +
      QuotedStr(cbxUserName.Text) +
      ' and active_flag=0 and user_group_flag=1';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds73.Data := LData;
      if LCds73.IsEmpty then
      begin
        ShowMessage('无效的用户名或密码');
        Exit;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
  {$REGION '登陆次数检查'}
    LSql := 'select top 3 csi_ptr,login_date,DATEDIFF(MINUTE,login_date,GETDATE()) as logtimebetween,getdate() as nowtime from data0173 '
      + 'where csi_ptr=' + LCds73.FieldByName('rkey').AsString +
      ' and type=0 and active_flag=1 ' + 'order by login_date desc';
    LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
      LData, LErrMsg);
    if LIntfRet then
    begin
      LCds.Data := LData;
      if not LCds.IsEmpty then
      begin
        if (LCds.RecordCount >= 3) and
          (LCds.FieldByName('logtimebetween').AsInteger <= 240) then
        begin
          ShowMessage('用户密码连续三次输入错误,请4个小时后再试');
          Exit;
        end;
      end;
    end
    else
    begin
      ShowMessage(LErrMsg);
      Exit;
    end;
  {$ENDREGION}
  {$REGION '验证用户名和密码是否匹配'}
    if MD5Print(Trim(edtPassWord.Text)) <>
      UpperCase(LCds73.FieldByName('PASSWORD').AsString) then
    begin
      LSql := 'select * from data0173 where 1=0';
      LIntfRet := IntfGetDataBySql(LSvrIP, '211', cbxDB.Text, LSql,
        LData, LErrMsg);
      if LIntfRet then
      begin
        LCds.Data := LData;
        LCds.Append;
        LCds.FieldByName('csi_ptr').AsString :=
          LCds73.FieldByName('rkey').AsString;
        LCds.FieldByName('compute_name').AsString := GetLocalName;
        LCds.FieldByName('network_ip').AsString := GetLocalIP;
        LCds.FieldByName('login_date').AsDateTime := LNowTime;
        LCds.FieldByName('type').AsBoolean := False;
        LCds.FieldByName('active_flag').AsBoolean := True;
        LCds.Post;
        if not IntfPostDataByTable(LSvrIP, '211', cbxDB.Text, 'data0173',
          LCds.Delta, LErrMsg) then
        begin
          ShowMessage(LErrMsg);
          Exit;
        end;
      end
      else
      begin
        ShowMessage(LErrMsg);
        Exit;
      end;
      ShowMessage('密码不正确,请注意区分大小写！');
      edtPassWord.Text := '';
      Exit;
    end else
      FPassWordMD5 := LCds73.FieldByName('PASSWORD').AsString.ToUpper;
  {$ENDREGION}
  {$REGION '是否绑定了IP'}
    if (LCds73.FieldByName('NETWORK_IP').AsString <> '') and
      (LCds73.FieldByName('NETWORK_IP').AsString <> GetLocalIP) then
    begin
      ShowMessage('用户邦定了IP登入异常，请与管理员联系!');
      Exit;
    end;
  {$ENDREGION}
  {$REGION '是否在其他电脑登陆'}
//    if (LCds73.FieldByName('COMPUTER').AsString <> '') and
//      (LCds73.FieldByName('COMPUTER').AsString <> UpperCase(GetLocalName))
//    then
//    begin
//      ShowMessage('该用户已经在电脑上' + LCds73.FieldByName('COMPUTER').AsString + '日期' +
//        LCds73.FieldByName('LOGIN_IN_TIME').AsString + ' 登入,请首先退出 ');
//      Exit;
//    end;
  {$ENDREGION}
    FNowTime := LNowTime;
    FRkey73 := LCds73.FieldByName('rkey').AsString;
    result := True;
  finally
    LCds.Free;
    LCds73.Free;
  end;
end;

procedure TfrmLogin.SaveLocalIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
begin
  LS := TStringList.Create;
  LFileName := ExtractFilePath(ParamStr(0)) + 'ClientConfig.ini';
  Lini := TIniFile.Create(LFileName);
  try
    Lini.EraseSection('LogSvr');
    Lini.EraseSection('LogDB');

    Lini.WriteString('LogSvr',cbxSvr.Text,'');
    Lini.WriteString('LogDB',cbxDB.Text,'');
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
      Lini.DeleteKey('LogName',cbxUserName.Text);
    end;
    Lini.WriteString('LogName',cbxUserName.Text,'');
  finally
    Lini.Free;
    LS.Free;
  end;

end;

procedure TfrmLogin.tmr2Timer(Sender: TObject);
begin
  if FLoadMainTimes = 0 then
  begin
    tmr2.Enabled := False;
    LoadMainApp;
  end else
  begin
    FLoadMainTimes := FLoadMainTimes - 1;
    btnCancleUpdate.Caption := '启动ERP:' + IntToStr(FLoadMainTimes);
  end;

end;

procedure TfrmLogin.btnCancleUpdateClick(Sender: TObject);
begin
  if FNeedUpdate and FUpdateFinsh then
  begin
    LoadMainApp;
  end
  else
    Close;
end;

procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
