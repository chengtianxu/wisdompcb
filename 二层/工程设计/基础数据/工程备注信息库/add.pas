unit add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
     v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses main;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
    Close;
    v_close:=1;
    Form1.ADOQuery2.Cancel;
    Form1.Show;

end;

procedure TForm2.Button1Click(Sender: TObject);
var
   flag:Integer;
begin
  if DbEdit1.Text='' then
  begin
    MessageDlg('请输入客户编号',mtinformation,[mbOk],0);
    DbEdit1.SetFocus;
    exit;
  end;
  if DbMemo1.Text='' then
  begin
    MessageDlg('请输入内容',mtinformation,[mbok],0);
    DbMemo1.SetFocus;
    exit;
  end;
  try
    if form1.ADOQuery2.Modified then
    begin
      flag:=MessageDlg('此记录已修改，是否存盘',mtinformation,[mbyes,mbno,mbcancel],0);
      if flag=7 then
         form1.ADOQuery2.Cancel
      else if flag=6 then
         form1.ADOQuery2.Post
      else
         exit;
    end;
  except
    MessageDlg('保存失败，请检查代码是否重复',mtwarning,[mbok],0);
    exit;
    end;
   close;
   v_close:=1;
   form1.Show;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if v_close<>1 then
  begin
    Form1.ADOQuery2.Cancel;
    Form1.Show;
  end;
end;

end.
