unit editprice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
implementation
uses main, accountsearch;
{$R *.dfm}
procedure TForm2.Button2Click(Sender: TObject);
begin
 v_close:=1;
 form1.ADOQuery1.Cancel;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
try
 form3:=tform3.Create(application);
 form3.Edit1.Text:=edit1.Text;
 if form3.ADOQuery1.IsEmpty then
  begin
   showmessage('没有查找到数据!');
   edit1.SetFocus;
  end
 else
  if form3.ShowModal=mrok then
  begin
   form1.adoquery1.FieldValues['PTR_TO_GL_ACCT']:=form3.adoquery1.FieldValues['rkey'];
   edit1.Text:=form3.adoquery1.FieldValues['gl_acc_number'];
   edit1.Font.Color:=clwindowtext;
   label3.Caption:='    '+form3.adoquery1.FieldValues['gl_description'];
   dbcheckbox1.SetFocus;
  end
  else
  edit1.SetFocus;
finally
 form3.free;
end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
IF trim(DBEDIT1.Text)='' then
 begin
  messagedlg('类别不能为空!',mtwarning,[mbok],0);
  dbedit1.SetFocus;
 end
else
try
 form3:=tform3.Create(application);
 if trim(edit1.Text)<>'' then
 begin
  form3.Edit1.Text:=edit1.Text;
  if comparetext(trim(edit1.text),trim(form3.ADOQuery1.Fieldbyname('gl_acc_number').asstring))<>0 then
  begin
   messagedlg('请输入正确的帐目编号!',mtwarning,[mbok],0);
   edit1.SetFocus;
  end
  else
  begin
   form1.adoquery1.FieldValues['PTR_TO_GL_ACCT']:=form3.adoquery1.FieldValues['rkey'];
   label3.Caption:='    '+form3.adoquery1.FieldValues['gl_description'];
   v_close:=1; //正常退出
   ModalResult:=mrok;
  end;
 end
else
 begin
  v_close:=1; //正常退出
  ModalResult:=mrok;
 end;
finally
 form3.free;
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edit1.Text := '';
 edit1.Font.Color := clblue;
 label3.Caption := '';
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if edit1.Text='' then
 begin
  form1.ADOQuery1.fieldvalues['PTR_TO_GL_ACCT']:=null;
  label3.Caption:='';
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 dbedit1.SetFocus;
 v_close:=0;
end;

procedure TForm2.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
  begin
   button1.SetFocus;
   button1click(sender);
  end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then
  form1.ADOQuery1.Cancel;  
end;

end.
