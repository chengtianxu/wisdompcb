unit uPB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, IdComponent,
  IdFTP, IdFTPCommon, IdFTPList, IniFiles, IdGlobal, IdBaseComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  Vcl.Samples.Gauges;

const base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';

type
  TfrmPB = class(TForm)
    IdFTP1: TIdFTP;
    lbl: TLabel;
    gg_ShowWorking: TGauge;
    btn_Abort: TSpeedButton;
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormCreate(Sender: TObject);
    procedure btn_AbortClick(Sender: TObject);
  private
    IP,UID,PSW,FileDir: string;
    function Base64_Decode(a: string): string;stdcall;
    function mimedecode(a: string): Integer;stdcall;
  public
    FTransferrignData: Boolean;    //是否在传输数据
    FBytesToTransfer: LongWord;    //传输的字节大小
    FAbortTransfer: Boolean;       //取消数据传输
    STime: TDateTime;             //时间
    FAverageSpeed: Double;        //平均速度
    function ConnectFTP(Host, UId, PSW, FileDir: string):Boolean;stdcall;  //连接FTP
    function UpLoadFTP(FileName: PAnsiChar):Boolean;stdcall;    //上传文件
    function DownLoadFTP(DataBaseFileName,dlgFileName: PAnsiChar):Boolean;stdcall;  //下载文件
    function DeleteFTP(FileName: PAnsiChar):Boolean;stdcall;    //删除文件
  end;

var
  frmPB: TfrmPB;

implementation

{$R *.dfm}

procedure TfrmPB.FormCreate(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'FTP_Link.ini');
  try
    IP:= MyIniFile.ReadString('FTP服务器','服务器IP','172.18.0.15');
    UID:= MyIniFile.ReadString('FTP服务器','用户名','erpmk');
    PSW:= Base64_Decode(MyIniFile.ReadString('FTP服务器','密码','i/V12ur1WAY'));  //解密后:erpmkpcb
    FileDir:=MyIniFile.ReadString('FTP服务器','报价时效文档目录','BJ_Data');
  finally
    MyIniFile.Free;
  end;
end;

procedure TfrmPB.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  S: String;
  TotalTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  Application.ProcessMessages;
  try
    TotalTime :=  Now - STime;      //已花费的时间
    DecodeTime(TotalTime, H, M, Sec, MS);  //解码时间
    Sec := Sec + M * 60 + H * 3600;  //转换成以秒计算
    DLTime := Sec + MS / 1000;      //精确到毫秒
    if DLTime > 0 then
      FAverageSpeed := (AWorkCount / 1024) / DLTime;   //求平均速度
    if FAverageSpeed > 0 then
    begin
      Sec := Trunc(((gg_ShowWorking.MaxValue - AWorkCount) / 1024) / FAverageSpeed);
      S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
      S := '剩余时间 ' + S;
    end
    else
      S := '';
    S := FormatFloat('0.00 KB/s', FAverageSpeed) + '; ' + S;
    case AWorkMode of
      wmRead: lbl.Caption:= '下载速度 ' + S;
      wmWrite: lbl.Caption:= '上传速度 ' + S;
    end;
    if FAbortTransfer then   //取消数据传输
      IdFTP1.Abort;
    gg_ShowWorking.Progress := AWorkCount;
    FAbortTransfer := false;
  except
    IdFTP1.Abort;
  end;
end;

procedure TfrmPB.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  try
    FTransferrignData := True;
    btn_Abort.Enabled:= True;
    FAbortTransfer := False;
    STime := Now;
    if AWorkCountMax > 0 then
    begin
      gg_ShowWorking.MaxValue := AWorkCountMax;
    end
    else
    begin
      gg_ShowWorking.MaxValue := FBytesToTransfer;
    end;
    FAverageSpeed := 0;
  except
    IdFTP1.Abort;
  end;
end;

procedure TfrmPB.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  try
    btn_Abort.Enabled := False;
    FTransferrignData := False;
    FBytesToTransfer := 0;
    gg_ShowWorking.Progress := 0;
    FAverageSpeed := 0;
    lbl.Caption := '传输完成';
  except
    IdFTP1.Abort;
  end;
end;

function TfrmPB.Base64_Decode(a: string): string;
var
  w1,w2,w3,w4,n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(a) do begin
    w1 := mimedecode(a[n]);
    w2 := mimedecode(a[n + 1]);
    w3 := mimedecode(a[n + 2]);
    w4 := mimedecode(a[n + 3]);
    if w2 >= 0 then retry := retry + chr(((w1 * 4 + Trunc(w2 / 16)) and 255));
    if w3 >= 0 then retry := retry + chr(((w2 * 16 + Trunc(w3 / 4)) and 255));
    if w4 >= 0 then retry := retry + chr(((w3 * 64 + w4) and 255));
    n := n + 4;
  end;
  result := retry;
end;

procedure TfrmPB.btn_AbortClick(Sender: TObject);
begin
  FAbortTransfer := True;
end;

function TfrmPB.ConnectFTP(Host, UId, PSW, FileDir: string): Boolean;
var
  vList: TStrings;
begin
  Result:= False;
  try
    IdFTP1.Passive := True; //连接模式:被动模式
    IdFTP1.Host := Host;
    IdFTP1.Username := UId;  //FTP服务器用户名
    IdFTP1.Password := PSW;  //FTP服务器密码
    IdFTP1.ReadTimeout := 120000;
    IdFTP1.ConnectTimeout := 120000;  //超时时间(2分钟)，单位毫秒
    IdFTP1.Connect();  //连接到ftp
    IdFTP1.ChangeDir(FileDir);  //进入FileDir:=BJ_Data子目录{初始目录IdFTP1.RetrieveCurrentDir}
    vList:= TStringList.Create;
    try
      IdFTP1.List(vList);  //得到BJ_Data目录下所有文件列表
    finally
      vList.Free;
    end;
    Result:= True;
    lbl.Caption:='连接FTP服务器成功！准备中，请稍候...';
    Application.ProcessMessages;
  except
    Showmessage('连接FTP服务器失败!');
    Exit;
  end;
end;



function TfrmPB.DeleteFTP(FileName: PAnsiChar): Boolean;
var
  i: Integer;
  t: TIdFTPListItem;
  setMark: string;
begin
  Result:= False;
  if not frmPB.IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
//        IdFTP1.TransferType:= ftBinary;
        for i:= 0 to frmPB.IdFTP1.DirectoryListing.Count - 1 do
        begin
          t:= frmPB.IdFTP1.DirectoryListing.Items[i];  //从当前目录下文件及列表得到文件相关信息
          if t.FileName = strpas(FileName) then
          begin
            setMark:= 'Find';
            try
              if frmPB.IdFTP1.DirectoryListing.Items[i].ItemType = ditFile then  //如果是文件
              begin
                frmPB.IdFTP1.Delete(t.FileName);
              end;
              ShowMessage('文件删除成功!');
              Result:= True;
            except
              ShowMessage('文件删除失败!');
              Abort;
            end;
          end;
        end;
        if setMark <> 'Find' then
          ShowMessage('未找到您要删除的文件!');
      finally
        frmPB.IdFTP1.Disconnect;
      end;
    end;
  end;
end;



function TfrmPB.DownLoadFTP(DataBaseFileName, dlgFileName: PAnsiChar): Boolean;
var
  i: integer;
  t: TIdFTPListItem;
  setMark: string;
begin
  Result:= False;
  if not frmPB.IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
        frmPB.IdFTP1.TransferType:= ftBinary;  //指定为二进制文件 或文本文件ftASCII
        for i:= 0 to frmPB.IdFTP1.DirectoryListing.Count - 1 do
        begin
          t:= frmPB.IdFTP1.DirectoryListing.Items[i];  //从当前目录下文件及列表得到文件相关信息
          if t.FileName = strpas(DataBaseFileName) then
          begin
            setMark:= 'Find';
            try
              if frmPB.IdFTP1.DirectoryListing.Items[i].ItemType = ditFile then  //如果是文件
              begin
                if FileExists(strpas(dlgFileName)) then
                  if MessageDlg('该文件已存在,是否覆盖?',mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
                frmPB.IdFTP1.Get(t.FileName,strpas(dlgFileName),False,True);  //下载到本地,覆盖,支持断点续传
//                if Pos('.',ExtractFileName(strpas(dlgFileName)))<=0 then
//                  RenameFile(strpas(dlgFileName),strpas(dlgFileName)+ExtractFileExt(strpas(DataBaseFileName)) );//为下载的文件加上后缀
              end;
              ShowMessage('文件下载成功!');
              Result:= True;
            except
              on E: Exception do
              begin
                ShowMessage('文件下载失败!');
                Abort;
              end;
            end;
            //Break;  //不同文件后缀需要多次下载
          end;
        end;
        if setMark <> 'Find' then
          ShowMessage('未找到您要下载的文件!');
      finally
        frmPB.IdFTP1.Disconnect;
      end;
    end;
  end;
end;

function TfrmPB.mimedecode(a: string): Integer;
begin
  if Length(a) = 0 then
  begin
    Result := -1;
    Exit;
  end;
  Result := pos(a, base64) - 1;
end;

function TfrmPB.UpLoadFTP(FileName: PAnsiChar): Boolean;
var
  i,j: Integer;
  setMark: string;
  LastTimeTransfer:Int64;
  LSourceStream:TFileStream;
begin
  Result:= False;
  LastTimeTransfer:=-1;
  if not IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
        for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
        begin
          if IdFTP1.DirectoryListing.Items[i].FileName = ExtractFileName(strpas(FileName)) then
          begin                         //先找到同名的文件
            LastTimeTransfer:= IdFTP1.Size(ExtractFileName(strpas(FileName)));
            if LastTimeTransfer>0 then  //且文件大小大于0
            begin
              setMark:= 'Find';
              Break;
            end;
          end;
        end;
        if setMark = 'Find' then
        begin
          ShowMessage('该文件在FTP服务器上已存在,不允许覆盖!');
          Exit;
//            if MessageDlg('该文件在FTP服务器上已存在,是否覆盖?', mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
        end;
        if IdFTP1.Connected then
        begin
          IdFTP1.TransferType := ftBinary;
          try
//            LastTimeTransfer:= IdFTP1.Size(ExtractFileName(strpas(FileName)));
            if LastTimeTransfer=0 then  //ftp服务器存在此文件,且大小为0,续传
            begin
              LSourceStream:= TFileStream.Create(ExtractFileName(strpas(FileName)), fmOpenRead or fmShareDenyNone); //创建文件流；
              LSourceStream.Seek(LastTimeTransfer, 0);//将文件流指向最后一次上传的位置；
              IdFTP1.Put(LSourceStream, ExtractFileName(strpas(FileName)), True); //以文件流方式续传；
            end
            else
              IdFTP1.Put(strpas(FileName),ExtractFileName(strpas(FileName)));  //上传
            ShowMessage('文件上传成功!');
          except on E: Exception do
            begin
              IdFTP1.Abort;
              for j:= 0 to IdFTP1.DirectoryListing.Count - 1 do  //先删除上传失败的文件
              begin
                if IdFTP1.DirectoryListing.Items[j].FileName = strpas(FileName) then
                begin
                  if IdFTP1.DirectoryListing.Items[j].ItemType = ditFile then  //如果是文件
                    IdFTP1.Delete(IdFTP1.DirectoryListing.Items[j].FileName);
                end;
              end;
              ShowMessage('文件上传失败!'+#13+E.Message);
              Abort;
            end;
          end;
        end;
        Result:= True;
      finally
        IdFTP1.Disconnect;
      end;
    end;
  end;
end;

end.
