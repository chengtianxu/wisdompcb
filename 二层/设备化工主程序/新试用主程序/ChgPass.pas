unit ChgPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmChgPass = class(TForm)
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChgPass: TFrmChgPass;

implementation

uses dmcon,md5;

{$R *.dfm}

procedure TFrmChgPass.Edit1Exit(Sender: TObject);
begin
 if (dm.ADOData0073USER_PASSWORD.Value <> MD5Print(MD5String(trim(edit1.Text)))) and
  (activecontrol.Name<>'BitBtn2') then
   begin
    Messagedlg('旧密码不正确请注意大小写!',mtinformation,[mbOk],0);
    edit1.SetFocus ;
   end
  else
   button1.enabled:=true
end;

procedure TFrmChgPass.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13  then edit2.SetFocus;
end;

procedure TFrmChgPass.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then edit3.SetFocus;
end;

procedure TFrmChgPass.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1.SetFocus;
end;

procedure TFrmChgPass.Button1Click(Sender: TObject);
begin
  if length(trim(edit2.Text))<4 then
   begin
    Messagedlg('密码不能少于4位，请重新输入！',mtinformation,[mbOk],0);
    Edit2.SetFocus ;
    exit;
   end;
 if (Edit2.Text <>  edit3.Text) then
  begin
   Messagedlg('第二次输入的密码同第一次不一致，请重新输入!',mtinformation,[mbOk],0);
   Edit3.SetFocus ;
   exit;
  end;

 DM.Adodata0073.Edit;
 DM.Adodata0073user_password.value := MD5Print(MD5String(trim(edit3.Text)));
 DM.Adodata0073.Post ;

 Messagedlg('密码更改成功！',mtinformation,[mbOk],0);
 modalresult:=mroK;
end;

end.
