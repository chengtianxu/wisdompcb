unit Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IniFiles;

type
  TfrmLog = class(TForm)
    Label1: TLabel;
    edtConStr: TEdit;
    Label2: TLabel;
    edtServer: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ReadLogInfo;
  public
    { Public declarations }
  end;

var
  frmLog: TfrmLog;

implementation
uses ConstDeclare,Client_Func,DmConn,PUbFunc,SrvQuery_TLB;
{$R *.dfm}

procedure TfrmLog.Button1Click(Sender: TObject);
var
  ErrorMsg:widestring;
begin
  if trim(edtConStr.Text) = '' then
  begin
    ShowMsg('获取数据连接字符串失败！',1);
    abort;
  end;
  with pdmConn do begin
    try
      SocketConnection1.Connected := false;
      SocketConnection1.Address := edtServer.Text;
      SocketConnection1.ServerName := 'SrvQuery.CoQuery';
      SocketConnection1.Connected := true;
    except
      ShowMsg('连接服务器失败，请联系系统管理员','提示',1);
      abort;
    end;
    coMyQuery := ICoQueryDisp(IDispatch(pdmConn.SocketConnection1.AppServer));
    if not coMyQuery.Set_Ado_Conn_Str(trim(edtConStr.Text),ErrorMsg) then
    begin
      ShowMsg('程序启动失败：'+ErrorMsg,1);
      abort;
    end
    else
      Modalresult := mrok;
  end;
end;

procedure TfrmLog.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmLog.FormShow(Sender: TObject);

    function OpenFile(FileName:string;var ErrorMsg:string):string;//打开文件
    var
    F: TextFile;
    S: string;
    begin
      try
        AssignFile(F, FileName); { File selected in dialog }
        Reset(F);
        Readln(F, S); { Read first line of file }
        result := S; { Put string in a TEdit control }
        CloseFile(F);
      except
        on E:Exception do
          ErrorMsg:=E.Message;
      end;
    end;
begin
  ReadLogInfo;
//  edtConStr.Text := OpenFile('C:\dbconn\qryConn.cds',tmp);//App_Init;
{
3.Com+对象的状态把握
好的的3层系统,应该能响应更多的客户端,占用更少的服务器资源.Com+事务处理
}

end;

procedure TfrmLog.ReadLogInfo;
var 
  filename,DBName:string;
  myinifile:TIniFile; 
begin
  filename:=ExtractFilePath(Application.ExeName)+'Login.ini';
  myinifile:=TInifile.Create(filename);
  try
    edtServer.Text:=myinifile.readstring('LogIn_Info','SERVER_IP_SS',' ');
    edtConStr.text:=myinifile.readString('LogIn_Info','CONN_STR_SS',' ');
  finally
    myinifile.free;
  end;
end;

end.
