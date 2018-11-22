unit Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Main;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if Edit1.Text='' then
  begin
    MessageDlg('请输入长度',mtinformation,[mbOk],0);
    Edit1.SetFocus;
    exit;
  end;
  if Edit2.Text='' then
  begin
    MessageDlg('请输入宽度',mtinformation,[mbok],0);
    Edit2.SetFocus;
    exit;
  end;
  try
    Form1.ADOQuery1.Edit;
    Form1.ADOQuery1.FieldValues['length']:=StrtoFloat(Edit1.Text);
    Form1.ADOQuery1.FieldValues['width']:=StrtoFloat(Edit2.Text);
    Form1.ADOQuery1.FieldValues['seet_szie']:=Trim(Edit3.Text);
    if CheckBox1.Checked then
      Form1.ADOQuery1.FieldValues['selected']:='Y'
    else
      Form1.ADOQuery1.FieldValues['selected']:='N';
    Form1.ADOQuery1.Post;
  except
    MessageDlg('保存失败，请检查代码是否重复',mtwarning,[mbok],0);
    exit;
  end;
   close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    abort
 else
  begin
   if (key = chr(46)) then
    if pos('.',Edit1.Text)>0 then
      abort;
  end;
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',Edit1.Text)>0
     then
      abort;
  end;
end;

end.
