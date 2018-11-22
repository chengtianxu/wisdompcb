unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask,winsock, jpeg;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    Panel1: TPanel;
    Image1: TImage;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation
uses datamodule;

{$R *.DFM}

procedure TFrmLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
IF KEY=#13 THEN edit2.setfocus
end;

procedure TFrmLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  vstr:array[0..15] of char;
  vstring:string;
  i:integer;

  wVersionRequested : WORD;
  wsaData : TWSAData;
  s : array[0..128] of char;
  p : PHostEnt;
  p2 : pchar;
begin
 IF KEY=#13 THEN
  begin
    With DM.ADOData0073 do
    begin
      close;
      parameters.ParamByName('@vptr').Value :=trim(Edit1.text);
      open;
    end;
    if DM.ADOData0073.eof  then
    begin
      Messagedlg('用户名不正确，请重新输入！',mtinformation,[mbOk],0);
      DM.ADOData0073.Close;
      Edit1.SetFocus ;
      exit;
    end;
    strpcopy(vstr,'*'+trim(DM.ADOData0073.fieldbyname('user_password').asstring)+'*');
    vstring:='';
    for i:=0 to 14 do
      if trim(vstr[i])<>'' then
        vstring:=vstring+chr( (word(vstr[i]) shr 1)-3);

    vstring:=copy(trim(vstring),2,length(trim(vstring))-2);
    if ansiuppercase(VString) <>ansiuppercase(trim(edit2.Text)) then
    begin
      Messagedlg('密码不正确，请重新输入！',mtinformation,[mbOk],0);
      DM.ADOData0073.Close;
      edit2.SetFocus ;
      exit;
    end;

 {   DM.ADOUsers.close;
    DM.ADOUsers.open;
    if DM.ADOUsers.fieldbyname('user_qty').asinteger>5 then
    begin
      messagedlg('当前在线用户数量已经达到'+DM.ADOUsers.fieldbyname('user_qty').asstring+'必须等到其他用户退出后才能登录！',mtinformation,[mbok],0);
      dm.ADOData0073.Close;
      close;
      exit;
    end;
  }
    {启动 WinSock}
 {   wVersionRequested := MAKEWORD(1, 1);
    WSAStartup(wVersionRequested, wsaData);

    //计算机名
    GetHostName(@s, 128);
    p := GetHostByName(@s);
    //IP地址
    p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);

    if Trim(DM.ADOData0073.fieldbyname('network_id').asstring)<>'' then
    if trim(DM.ADOData0073.fieldbyname('computer').asstring)<>trim(p^.h_Name) then
    begin
      Messagedlg('该帐号已经在'+trim(DM.ADOData0073.fieldbyname('computer').asstring)+'登录，不能重复登录！',mtinformation,[mbOk],0);
      DM.ADOData0073.Close;
      Edit1.SetFocus ;
      exit;
    end;

    DM.ADODate.Close ;
    DM.ADODate.Open;
    DM.ADOData0073.Edit;
    DM.ADOData0073.fieldbyname('network_id').asstring:=p2;
    DM.ADOData0073.fieldbyname('login_in_time').asdatetime:=dm.Adodate.fieldbyname('vdt').AsDateTime;
    DM.ADOData0073.fieldbyname('computer').asstring:=p^.h_Name;
    DM.ADOData0073.post;

    WSACleanup;   }

    close;
  end;
end;

end.
