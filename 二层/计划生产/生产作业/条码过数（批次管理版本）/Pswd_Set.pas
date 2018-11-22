unit Pswd_Set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,AdoDB;

type
  TfrmPswd_Set = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPswdOrg: TEdit;
    edtPswdNew: TEdit;
    edtPswdConfirm: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Pswd_Old:string;
  public
    { Public declarations }
    procedure enter(rKeyUser:integer);
  end;

var
  frmPswd_Set: TfrmPswd_Set;

implementation
uses dm,common,MyClass;
{$R *.dfm}

{ TfrmPswd_Set }

procedure TfrmPswd_Set.enter(rKeyUser: integer);
begin
  MyDataClass.OpenDataSetByPara(rkeyUser,dmcon.adsUserInfo);
end;

procedure TfrmPswd_Set.Button1Click(Sender: TObject);
begin
  Pswd_Old := Base64_Decode(trim(dmcon.adsUserInfo.FieldByName('LOGIN_PASS').AsString));
  if Pswd_Old <> trim(edtPswdOrg.Text) then
  begin
    ShowMsg('原密码输入错误,请重新输入!',1);
    edtPswdOrg.Text:='';
    edtPswdOrg.SetFocus;
    abort;
  end;
  if trim(edtPswdNew.Text) = '' then
  begin
    ShowMsg('新密码不能为空!',1);
    abort;
  end; 
  if trim(edtPswdConfirm.Text)<>trim(edtPswdNew.Text) then
  begin
    ShowMsg('确认密码和新密码不一致,请重新输入!',1);
    edtPswdConfirm.SetFocus;
    abort;
  end;
  try
    dmcon.adsUserInfo.Edit;
    dmcon.adsUserInfo.FieldByName('LOGIN_PASS').AsString := Base64_Encode(trim(edtPswdConfirm.Text));
    dmcon.adsUserInfo.Post;
    dmcon.adsUserInfo.UpdateBatch(arAll);
  except
    ShowMsg('更改密码失败!',1);
  end;
  close;
end;

procedure TfrmPswd_Set.Button2Click(Sender: TObject);
begin
  close;
end;

end.
