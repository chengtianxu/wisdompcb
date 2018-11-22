unit smtp_email;

interface

{uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Psock, NMsmtp, ComCtrls, ExtCtrls, Buttons, Menus,
  IdBaseComponent;
 }
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Psock, NMsmtp,NMuue,ComCtrls, ExtCtrls, Buttons, Menus,
  IdBaseComponent;


type
  EIdException = class(Exception);
  TIdCardinalBytes = record
    case Integer of
    0: (
      Byte1: Byte;
      Byte2: Byte;
      Byte3: Byte;
      Byte4: Byte;);
    1: (Whole: Cardinal);
  end;
  TForm16 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    OpenDialog1: TOpenDialog;
    NMSMTP1: TNMSMTP;
    Panel1: TPanel;
    Panel2: TPanel;
    Button3: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    RichEdit1: TRichEdit;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure Button3Enter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function login(smtp:TNMSMTP;user,password:string):boolean;
    function Encode(const ASrc: string): string;
    function Encode2(ASrcStream: TStream; const ABytes: integer = MaxInt): string;
    procedure EncodeUnit(const AIn1, AIn2, AIn3: Byte; var VOut: Cardinal);
    procedure NMSMTP1AuthenticationFailed(var Handled: Boolean);
    procedure NMSMTP1HeaderIncomplete(var handled: Boolean;
      hiType: Integer);
    procedure NMSMTP1RecipientNotFound(Recipient: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;
  CodingTable: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  FillChar: char = '=';

implementation

{$R *.dfm}

procedure TForm16.Button4Click(Sender: TObject);
begin
 close;
end;

procedure TForm16.SpeedButton1Click(Sender: TObject);
begin
if opendialog1.Execute then
 listbox1.Items.Add(opendialog1.filename);
end;

procedure TForm16.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_INSERT then
  begin
   if opendialog1.Execute then
    listbox1.items.Add(opendialog1.filename);
 end
else
 if key=VK_DELETE then
  listbox1.items.delete(listbox1.itemindex);
end;

procedure TForm16.N1Click(Sender: TObject);
begin
 listbox1.items.delete(listbox1.itemindex);
end;

procedure TForm16.Button3Enter(Sender: TObject);
begin
 if trim(edit1.Text)='' then
  begin
   showmessage('SMTP主机地址不能为空！');
   edit1.SetFocus;
   exit;
  end;
 if (trim(edit3.Text)='') or (pos('@',edit3.Text)<=1) then
  begin
   showmessage('发件人地址不能为空！或者格式不正确');
   edit3.SetFocus;
   exit;
  end;
 if (trim(edit7.Text)='') or (pos('@',edit7.Text)<=1) then
  begin
   showmessage('收件人地址不能为空！或者格式不正确');
   edit7.SetFocus;
   exit;
  end;

end;

procedure TForm16.Button3Click(Sender: TObject);
begin
   nmsmtp1.host:=edit1.text;     //主机
   nmsmtp1.UserID :=edit4.Text ;  //密码
   statusbar1.SimpleText :='正在连接服务器中,请销侯.....';
   try
    nmsmtp1.Connect;
    login(nmsmtp1,edit4.Text,edit6.Text);
   except
    showmessage('无法连上SMTP服务器(即发送服务器)');
    statusbar1.SimpleText := '断开......';
    exit;
   end;
  if nmsmtp1.Connected then
   begin
    statusbar1.SimpleText :='现在正在发送邮件.....';
    nmsmtp1.PostMessage.FromAddress :=edit3.text; //发件人地址
    nmsmtp1.PostMessage.FromName :=edit2.text;    //发件人姓名
    nmsmtp1.PostMessage.Body.Text :=richedit1.text;  //邮件正文
    nmsmtp1.PostMessage.Attachments.Text :=listbox1.Items.Text; //附近件
    nmsmtp1.PostMessage.Subject :=edit5.text;    //主题
    nmsmtp1.EncodeType :=uumime;
    nmsmtp1.PostMessage.ToAddress.Text :=edit7.Text;//收件人地址
    try
     nmsmtp1.SendMail;
    except
     showmessage('邮件发送不成功请检查网络设置及状态!');
     statusbar1.SimpleText :='断开......';
     exit;
    end;
   end;
   nmsmtp1.Disconnect ;
   showmessage('邮件发送成功!');
   statusbar1.SimpleText :='已经发送完毕.';
 end;

function TForm16.login(smtp:TNMSMTP;user,password:string):boolean;
const crlf = #13#10;
var
   s:string;
begin
   result:=false;
 try
   s:='auth LOGIN'+crlf;
   smtp.SendBuffer(pchar(s),length(s));
   s:=smtp.ReadLn;
   if copy(s,1,3)<>'334' then exit;  //Fail

   s:=Encode(user)+crlf;
   smtp.SendBuffer(pchar(s),length(s));
   s:=copy(smtp.ReadLn,1,3);
   if (s<>'334')and(s<>'235') then exit;  //Fail

   s:=Encode(password)+crlf;
   smtp.SendBuffer(pchar(s),length(s));
   s:=copy(smtp.ReadLn,1,3);
   if (s<>'235') then exit;  //Fail
   result:=true;
 except
 end;
end;

function TForm16.Encode(const ASrc: string): string;
var
  LSrcStream: TStringStream;
begin
  LSrcStream := TStringStream.Create(ASrc);
  try
    Result := Encode2(LSrcStream);
  finally
   FreeAndNil(LSrcStream);
  end;
end;

function TForm16.Encode2(ASrcStream: TStream; const ABytes: integer = MaxInt): string;
var
  LIn1, LIn2, LIn3: Byte;
  LSize: integer;
  LStartPos: integer;
  LUnit: TIdCardinalBytes;
begin
  //TODO: Make this more efficient. Profile it to test, but maybe make single calls to ReadBuffer
  //then pull from memory
  if (ABytes <> MaxInt) and ((ABytes mod 3) > 0) then begin
    raise EIdException.Create('Uneven size in Encode.');
  end;
  Result := '';
  LStartPos := ASrcStream.Position;
  while (ASrcStream.Position < ASrcStream.Size) and (ASrcStream.Position - LStartPos < ABytes)
   do begin
    ASrcStream.ReadBuffer(LIn1, 1);
    if ASrcStream.Position < ASrcStream.Size then begin
      ASrcStream.ReadBuffer(LIn2, 1);
      if ASrcStream.Position < ASrcStream.Size then begin
        ASrcStream.ReadBuffer(LIn3, 1);
        LSize := 3;
      end else begin
        LIn3 := 0;
        LSize := 2;
      end;
    end else begin
      LIn2 := 0;
      LSize := 1;
    end;
    EncodeUnit(LIn1, LIn2, LIn3, LUnit.Whole);
    Result := Result + Chr(LUnit.Byte1) + Chr(LUnit.Byte2) + Chr(LUnit.Byte3) + Chr(LUnit.Byte4);
    if LSize < 3 then begin
      Result[Length(Result)] := FillChar;
      if LSize = 1 then begin
        Result[Length(Result) - 1] := FillChar;
      end;
    end;
  end;
end;

procedure TForm16.EncodeUnit(const AIn1, AIn2, AIn3: Byte; var VOut: Cardinal);
var
  LUnit: TIdCardinalBytes;
begin
  LUnit.Byte1 := Ord(CodingTable[((AIn1 SHR 2) and 63) + 1]);
  LUnit.Byte2 := Ord(CodingTable[(((AIn1 SHL 4) or (AIn2 SHR 4)) and 63) + 1]);
  LUnit.Byte3 := Ord(CodingTable[(((AIn2 SHL 2) or (AIn3 SHR 6)) and 63) + 1]);
  LUnit.Byte4 := Ord(CodingTable[(Ord(AIn3) and 63) + 1]);
  VOut := LUnit.Whole;
end;

procedure TForm16.NMSMTP1AuthenticationFailed(var Handled: Boolean);
begin
 showmessage('你不是一个有效的用户,你不能使用此服务器发送邮件.请检查用户名.');
end;

procedure TForm16.NMSMTP1HeaderIncomplete(var handled: Boolean;
  hiType: Integer);
begin
 showmessage('邮件头不全.');
end;

procedure TForm16.NMSMTP1RecipientNotFound(Recipient: String);
begin
 showmessage('没有此'+nmsmtp1.PostMessage.ToAddress.Text+'接收者,邮件没有被发送.');
end;

end.
