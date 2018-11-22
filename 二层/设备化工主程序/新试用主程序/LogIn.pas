unit LogIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Inifiles, DB, ADODB,Winsock, RzCmboBx, Mask, RzEdit,
  RzButton, ExtCtrls, RzPanel;

type
  TfrmLogin = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    ComboBox1: TRzComboBox;
    ComboBox2: TRzComboBox;
    ComboBox3: TRzComboBox;
    Edit1: TRzEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    FUNCTION PASSWORD_Encrypt(pass:string):string;
    function PASSWORD_Decrypt(pass: string): string;    
  private
    { Private declarations }
   program_ini:Tinifile;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  
implementation

uses dmcon,common,Md5;

{$R *.dfm}

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
var
 filename:string;
begin
 filename:=Extractfilepath(ParamStr(0))+'pcberp.ini';
 program_ini:=Tinifile.Create(filename);
 program_ini.ReadSection('服务器',combobox1.Items);
 program_ini.ReadSection('数据库',combobox2.Items);
 program_ini.ReadSection('用户',combobox3.Items);

 checkbox1.Checked:=program_ini.ReadBool('保存密码','save',false);
 combobox1.Text:=program_ini.ReadString('默认连接','服务器名','');
 combobox2.ItemIndex:=program_ini.ReadInteger('默认数据','数据库',0);
 if combobox1.Text<>'' then
  begin
   ComboBox1Exit(sender);
   edit1.SetFocus;
  end;
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
var
  server_name:string;
begin
if trim(combobox1.Text)='' then
 begin
  showmessage('请输入ERP服务器的名称!');
  combobox1.SetFocus;
 end
else
 begin
 try
 screen.Cursor := crHourglass;
 if dm.adoconnection1.Connected then dm.ADOConnection1.Connected:=false;

  dm.adoconnection1.ConnectionString:=
  'Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;';

 dm.adoconnection1.ConnectionString:=
        dm.adoconnection1.ConnectionString+'Initial Catalog='+
        program_ini.ReadString('数据库',combobox2.Text,'')+';';

  dm.adoconnection1.ConnectionString:=
   dm.adoconnection1.ConnectionString+'Data Source=' + trim(combobox1.Text);
  server_name := dm.adoconnection1.ConnectionString;
  dm.adoconnection1.Connected := true;


 dm.ADOData0073.Close;
 dm.ADOData0073.Parameters[1].Value:=TRIM(combobox3.Text);
 dm.ADOData0073.Open;

if dm.ADOData0073.IsEmpty then  //用户名不正确
 begin
  showmessage('用户名不正确,请重新输入');
  combobox3.SetFocus;
  screen.Cursor:= crDefault;
 end                //用户名正确判断密码是否正确
else
 begin

  if (MD5Print(MD5String(trim(edit1.Text))) <> trim(dm.adodata0073USER_PASSWORD.value))
     and (trim(dm.adodata0073USER_PASSWORD.value)<>'') then
   begin
    Messagedlg('密码不正确,请注意区分大小写！',mtinformation,[mbOk],0);
    edit1.SetFocus ;
    screen.Cursor:= crDefault;
   end
  else
   begin
    program_ini.WriteString('服务器',combobox1.Text,combobox3.Text);

    if checkbox1.Checked then
     program_ini.WriteString('用户',combobox3.Text,PASSWORD_Encrypt(trim(edit1.Text)))
    else
     program_ini.WriteString('用户',combobox3.Text,'');

    program_ini.WriteString('默认连接','服务器名',combobox1.Text);
    program_ini.WriteInteger('默认数据','数据库',combobox2.ItemIndex);

    program_ini.WriteBool('保存密码','save',checkbox1.Checked);


    dm.ADODate.Open;
    dm.ADOData0073.Edit;
    dm.ADOData0073.FieldValues['NETWORK_ID']:= GetLocalIP;
    dm.ADOData0073.FieldValues['COMPUTER']:= GetLocalName;
    dm.ADOData0073.FieldValues['LOGIN_IN_TIME']:=dm.ADODate.FieldValues['vdt'];
    dm.ADOData0073.Post;
    dm.ADODate.Close;
   screen.Cursor:= crDefault;
   user_ptr:=dm.ADOData0073.fieldbyName('rKey').AsString;
   Modalresult:=mrok;
   end;
 end;

except
 showmessage('数据库连接不成功请检查服务器名称是否正确？');
 screen.Cursor:= crDefault;
 combobox1.SetFocus;
end;
end;
end;

procedure TfrmLogin.ComboBox1Exit(Sender: TObject);
begin
if trim(combobox1.Text)<>'' then
 begin
  combobox3.Text:=program_ini.ReadString('服务器',combobox1.Text,'');
 end
else
 combobox3.Text :='';
ComboBox3exit(sender);
end;

procedure TfrmLogin.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TfrmLogin.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then  Button1Click(sender);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
 StartTime: tdatetime;
begin
{  frmWndFlash:=TFrmWndflash.create(application);
  FrmWndFlash.Show;
  FrmWndFlash.Update;
  StartTime := now;
  repeat
   Application.ProcessMessages;
  until Now > StartTime + 2*(1/24/60/60);

  frmwndflash.Close;
  FrmWndFlash.Free;  // Free the splash screen}
end;

function LocalIP : string;
type 
    TaPInAddr = array [0..10] of PInAddr; 
    PaPInAddr = ^TaPInAddr; 
var 
    phe  : PHostEnt; 
    pptr : PaPInAddr; 
    Buffer : array [0..63] of char; 
    I    : Integer; 
    GInitData      : TWSADATA; 
begin 
    WSAStartup($101, GInitData); 
    Result := '';
    GetHostName(Buffer, SizeOf(Buffer)); 
    phe :=GetHostByName(buffer); 
    if phe = nil then Exit; 
    pptr := PaPInAddr(Phe^.h_addr_list); 
    I := 0; 
    while pptr^[I] <> nil do begin 
      result:=StrPas(inet_ntoa(pptr^[I]^)); 
      Inc(I); 
    end; 
    WSACleanup; 
end;

function GetLocalName: string;
var
  CNameBuffer : PChar;
  fl_loaded : Boolean;
  CLen : ^DWord;
begin
  GetMem(CNameBuffer,255);
  New(CLen);
  CLen^:= 255;
  fl_loaded := GetComputerName(CNameBuffer,CLen^);
  if fl_loaded then
   GetLocalName := StrPas(CNameBuffer)
  else
   GetLocalName := '未知';
  FreeMem(CNameBuffer,255);
  Dispose(CLen);
end;

procedure TfrmLogin.ComboBox3Exit(Sender: TObject);
begin
if (trim(combobox3.Text)<>'') and (checkbox1.Checked) then
 edit1.Text:=self.PASSWORD_Decrypt(trim(program_ini.ReadString('用户',combobox3.Text,'')))
else                                    //解密
 edit1.Text :='';
end;

function TfrmLogin.PASSWORD_Encrypt(pass: string): string;
var
  vstr:array of char;    //加密
 vstring:string;
  i:integer;
begin
setlength(vstr,length(pass));
for i:=0 to length(pass)-1 do vstr[i]:=pass[i+1];
 vstring:='';
 for i:=0 to length(pass)-1 do
  vstring:=vstring+chr(word(vstr[i])-7);
 PASSWORD_Encrypt:=trim(vstring);
end;

function TfrmLogin.PASSWORD_Decrypt(pass: string): string;
var
  vstr:array of char;      //解密
  vstring:string;
  i:integer;
begin
setlength(vstr,length(pass));
for i:=0 to length(pass)-1 do vstr[i]:=pass[i+1];
 vstring:='';
  for i:=0 to length(pass)-1 do
   vstring:=vstring+chr(word(vstr[i])+7);
 PASSWORD_Decrypt:=trim(vstring);
end;

end.
