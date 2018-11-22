//*******************************//
//*完成FTP上传下载删除文件的功能*//
//*******By lrl 2014.04.25*******//
//*******************************//
unit uMain;

interface

uses System.Classes, Controls, Vcl.Dialogs, System.SysUtils, IdFTP, IdFTPCommon,
     IdFTPList, IniFiles, IdComponent;

const base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';
type
  TMyClass = class(TObject)
    IdFTP1: TIdFTP;
    function ConnectFTP(Host, UId, PSW, FileDir: string):Boolean;stdcall;  //连接FTP
  private
    IP,UID,PSW,FileDir: string;
    function Base64_Decode(a: string): string;stdcall;
    function mimedecode(a: string): Integer;stdcall;
  public
    function UpLoadFTP(FileName: PAnsiChar):Boolean;stdcall;    //上传文件
    function DownLoadFTP(DataBaseFileName,dlgFileName: PAnsiChar):Boolean;stdcall;  //下载文件
    function DeleteFTP(FileName: PAnsiChar):Boolean;stdcall;    //删除文件
  constructor Create;
  destructor Destroy;
end;

implementation

{ TMyClass }

function TMyClass.Base64_Decode(a: string): string;
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

function TMyClass.ConnectFTP(Host, UId, PSW, FileDir: string): Boolean;
var
  vList: TStrings;
begin
  Result:= False;
  try
    IdFTP1.Passive := True; //连接模式:被动模式
    IdFTP1.Host := Host;
    IdFTP1.Username := UId;  //FTP服务器用户名
    IdFTP1.Password := PSW;  //FTP服务器密码
    IdFTP1.ReadTimeout := 18000;
    IdFTP1.ConnectTimeout := 18000;  //超时时间，单位毫秒
    IdFTP1.Connect();  //连接到ftp
    IdFTP1.ChangeDir(FileDir);  //进入FileDir:=BJ_Data子目录{初始目录IdFTP1.RetrieveCurrentDir}
    vList:= TStringList.Create;
    try
      IdFTP1.List(vList);  //得到BJ_Data目录下所有文件列表
    finally
      vList.Free;
    end;
    Result:= True;
//    ShowMessage('连接FTP服务器成功!');
  except
    Showmessage('连接FTP服务器失败!');
    Exit;
  end;
end;

constructor TMyClass.Create;
var
  MyIniFile: TIniFile;
begin
  IdFTP1:= TIdFTP.Create(nil);
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

function TMyClass.DeleteFTP(FileName: PAnsiChar): Boolean;
var
  i: Integer;
  t: TIdFTPListItem;
  setMark: string;
begin
  Result:= False;
  if not IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
//        IdFTP1.TransferType:= ftBinary;
        for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
        begin
          t:= IdFTP1.DirectoryListing.Items[i];  //从当前目录下文件及列表得到文件相关信息
          if t.FileName = strpas(FileName) then
          begin
            setMark:= 'Find';
            try
              if IdFTP1.DirectoryListing.Items[i].ItemType = ditFile then  //如果是文件
              begin
                IdFTP1.Delete(t.FileName);
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
        IdFTP1.Disconnect;
      end;
    end;
  end;
end;

destructor TMyClass.Destroy;
begin
  if Assigned(IdFTP1) then
    IdFTP1.Free;
end;

function TMyClass.DownLoadFTP(DataBaseFileName, dlgFileName: PAnsiChar): Boolean;
var
  i: integer;
  t: TIdFTPListItem;
  setMark: string;
begin
  Result:= False;
  if not IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
        IdFTP1.TransferType:= ftBinary;  //指定为二进制文件 或文本文件ftASCII
        for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
        begin
          t:= IdFTP1.DirectoryListing.Items[i];  //从当前目录下文件及列表得到文件相关信息
          if t.FileName = strpas(DataBaseFileName) then
          begin
            setMark:= 'Find';
            try
              if IdFTP1.DirectoryListing.Items[i].ItemType = ditFile then  //如果是文件
              begin
                if FileExists(strpas(dlgFileName)) then
                  if MessageDlg('该文件已存在,是否覆盖?',mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
                IdFTP1.Get(t.FileName,strpas(dlgFileName),False,True);  //下载到本地,覆盖,支持断点续传
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
        IdFTP1.Disconnect;
      end;
    end;
  end;
end;

function TMyClass.mimedecode(a: string): Integer;
begin
  if Length(a) = 0 then
  begin
    Result := -1;
    Exit;
  end;
  Result := pos(a, base64) - 1;
end;

function TMyClass.UpLoadFTP(FileName: PAnsiChar): Boolean;
var
  i,j: Integer;
  setMark: string;
begin
  Result:= False;
  if not IdFTP1.Connected then
  begin
    if ConnectFTP(IP,UID,PSW,FileDir) then
    begin
      try
        try
          for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
          begin
            if IdFTP1.DirectoryListing.Items[i].FileName = ExtractFileName(strpas(FileName)) then
            begin
              setMark:= 'Find';
              Break;
            end;
          end;
          if setMark = 'Find' then
          begin
            ShowMessage('该文件在FTP服务器上已存在,不允许覆盖!');
            Exit;
//            if MessageDlg('该文件在FTP服务器上已存在,是否覆盖?',
//                           mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
          end;
          if IdFTP1.Connected then
          begin
            IdFTP1.TransferType := ftBinary;
            IdFTP1.Put(strpas(FileName),ExtractFileName(strpas(FileName)));  //上传
          end;
          ShowMessage('文件上传成功!');
          Result:= True;
        except
          ON E:Exception do
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
      finally
        IdFTP1.Disconnect;
      end;
    end;
  end;
end;

end.
