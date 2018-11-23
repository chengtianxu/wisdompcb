unit qkFtpFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.StdCtrls, RzLabel, RzPrgres, RzButton,IdGlobalProtocols, Vcl.ComCtrls,
  IdFTPList, IdGlobal;

type
  Tfrmqkftp = class(TForm)
    idftp1: TIdFTP;
    lbl3: TRzLabel;
    btnCLose: TRzButton;
    lblTotalSize: TRzLabel;
    pb1: TProgressBar;
    lblLocalFile: TRzLabel;
    lblNowSize: TStaticText;
    procedure idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure FormDestroy(Sender: TObject);
    procedure idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure idftp1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnCLoseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateUi;
  end;

  function qkUpLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string): Boolean;
  function qkDownLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string;AutoOpen: Boolean= True): Boolean;

implementation

uses
  ShellAPI;

{$R *.dfm}

var
  GCount: Int64;
  GTotalCount: Int64;
  GThread: TThread;

//FtpDir例如: \ERP_3_TIER\Tier3
function qkUpLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string): Boolean;
var
  LFrm: Tfrmqkftp;
  LDirArr: TArray<string>;
  I: Integer;
  b: Boolean;
begin
  Result := False;
  if not FileExists(ALocalFile) then
  begin
    ShowMessage('文件不存在: ' + ALocalFile);
    Exit;
  end;

  GTotalCount := FileSizeByName(ALocalFile);


  LFrm := Tfrmqkftp.Create(nil);
  LFrm.pb1.Max := GTotalCount div 1024;
  LFrm.pb1.Position := 0;
  LFrm.lblTotalSize.Caption := '/'+FormatFloat('0.00',GTotalCount/1024/1024) + ' M';
  LFrm.lblLocalFile.Caption := '本地文件：' + ALocalFile;
  try
    LFrm.idftp1.Host := AFtpIp;
    LFrm.idftp1.Port := StrToIntDef(APort,21);
    LFrm.idftp1.Username := AUserName;
    LFrm.idftp1.Password := APssword;
    try
      lfrm.idftp1.Connect;
      lfrm.idftp1.iohandler.DefStringEncoding := IndyTextEncoding(tencoding.ansi);//这句防止中文乱码
      {$REGION '创建多级目录'}
      LDirArr := AFtpDir.Split(['\']);
      for I := 0 to Length(LDirArr)-1 do
      begin
        b := False;
        if LDirArr[I] <> '' then
        begin
          try
            LFrm.idftp1.ChangeDir(LDirArr[I]);
            b := True;
          except
          end;
          if not b then
          begin
            try
              LFrm.idftp1.MakeDir(ldirarr[I]);
              LFrm.idftp1.ChangeDir(LDirArr[I]);
            except
              on E: Exception do
              begin
                ShowMessage(e.Message);
                Exit;
              end;
            end;
          end;
        end;
      end;
      {$ENDREGION}
      GThread := TThread.CreateAnonymousThread(
        procedure
        begin
          LFrm.idftp1.Put(ALocalFile,AFtpFileName);
        end
      );
      GThread.Start;

      LFrm.ShowModal;
      Result := True;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
        Exit;
      end;
    end;
  finally
    LFrm.idftp1.Disconnect;
    LFrm.Free;
  end;
end;

function qkDownLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string;AutoOpen: Boolean= True): Boolean;
var
  LFrm: Tfrmqkftp;
  I: Integer;
  LBExistInFtp: Boolean;
begin
  Result := False;
  if not DirectoryExists(ExtractFilePath(ALocalFile)) then
  begin
    if not CreateDir(ExtractFilePath(ALocalFile)) then
    begin
      ShowMessage('创建保存目录失败:'+ ExtractFilePath(ALocalFile));
      Exit;
    end;
  end;

  LFrm := Tfrmqkftp.Create(nil);
  try
    LFrm.idftp1.Host := AFtpIp;
    LFrm.idftp1.Port := StrToIntDef(APort,21);
    LFrm.idftp1.Username := AUserName;
    LFrm.idftp1.Password := APssword;
    try
      lfrm.idftp1.Connect;
      lfrm.idftp1.iohandler.DefStringEncoding := IndyTextEncoding(tencoding.ansi);//这句防止中文乱码
      if AFtpDir <> '' then
        LFrm.idftp1.ChangeDir(AFtpDir);

      LBExistInFtp := False;
      LFrm.idftp1.List;
      for I := 0 to LFrm.idftp1.DirectoryListing.Count - 1 do
      begin
        if (LFrm.idftp1.DirectoryListing.Items[I].FileName.ToUpper = AFtpFileName.ToUpper) and (LFrm.idftp1.DirectoryListing.Items[I].ItemType = ditFile) then
        begin
          GTotalCount := LFrm.idftp1.DirectoryListing.Items[I].Size;
          LBExistInFtp := true;
          Break;
        end;
      end;
      if not LBExistInFtp then
      begin
        ShowMessage('服务器文件不存在:'+ AFtpFileName);
        exit;
      end;

      LFrm.pb1.Max := GTotalCount div 1024;
      LFrm.pb1.Position := 0;
      LFrm.lblTotalSize.Caption := '/'+FormatFloat('0.00',GTotalCount/1024/1024) + ' M';
      LFrm.lblLocalFile.Caption := '本地文件：' + ALocalFile;

      GThread := TThread.CreateAnonymousThread(
        procedure
        begin
          LFrm.idftp1.Get(AFtpFileName,ALocalFile,True,False);
        end
      );
      GThread.Start;

      LFrm.ShowModal;
      Result := True;
      if AutoOpen then
        ShellExecute(Application.Handle,nil,PWideChar(ALocalFile),nil,nil,SW_SHOWNORMAL);
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
        Exit;
      end;
    end;
  finally
    LFrm.idftp1.Disconnect;
    LFrm.Free;
  end;
end;

procedure Tfrmqkftp.btnCLoseClick(Sender: TObject);
begin
  if idftp1.Connected then idftp1.Disconnect;
end;

procedure Tfrmqkftp.FormDestroy(Sender: TObject);
begin
  //if idftp1.Connected then idftp1.Disconnect;
end;

procedure Tfrmqkftp.idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  case AWorkMode of
    wmRead: ;
    wmWrite: ;
  end;
  GCount := AWorkCount;
  TThread.Synchronize(GThread,UpdateUi);

end;

procedure Tfrmqkftp.idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
//
end;

procedure Tfrmqkftp.idftp1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Close;
end;

procedure Tfrmqkftp.UpdateUi;
begin
  lblNowSize.Caption := FormatFloat('0.00',GCount/1024/1024);
  //lblTotalSize.Left := lblNowSize.Left + lblNowSize.Width + 2;
  pb1.Position := GCount div 1024;
end;

end.
