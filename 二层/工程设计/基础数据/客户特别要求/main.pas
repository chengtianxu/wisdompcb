unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   rkey10: integer;
   v_close: boolean;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses common;
{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
 if (v_close=true) and (trim(memo1.Text)<>'') then
 case messagedlg('数据被修改是否保存?',mtconfirmation,[mbyes,mbno,mbcancel],0) of
  mryes :
   begin
    button1click(sender);
    application.Terminate;
   end;
  mrno : application.Terminate;
  mrCancel :memo1.SetFocus;
 end
else
 application.Terminate;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then memo1.SetFocus;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (trim(edit1.Text) <> '') and ((activecontrol.Name<>'Button3')) then
 begin
  if (v_close=true) and (trim(memo1.Text)<>'') and
     (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
   button1click(sender);
  with adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey,customer_name from data0010 where cust_code='''+trim(edit1.Text)+'''');
    open;
   end;
  if adoquery1.IsEmpty then
   begin
    showmessage('对不起!没有找到对应的客户,请确认客户代码是否正确');
    edit1.SetFocus;
   end
  else
   begin
    self.Caption:='客户特别要求: '+adoquery1.FieldValues['customer_name'];
    rkey10:=adoquery1.FieldValues['rkey'];
    memo1.ReadOnly:=false;
    button1.Enabled:=true;
    button2.Enabled:=true;
    with adoquery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select * from data0011 where SOURCE_TYPE=6010');
      sql.Add('and FILE_POINTER='+inttostr(rkey10));
      open;
     end;
    if not adoquery1.IsEmpty then
     memo1.Text:=adoquery1.FieldValues['memo_text']
    else
     memo1.Lines.Text:='';
     v_close:=false;
   end;
 end
else
if (trim(edit1.Text) = '') and ((activecontrol.Name<>'Button3')) then
 begin
  if (v_close=true) and (trim(memo1.Text)<>'') and
     (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
   button1click(sender);
  self.Caption:='客户特别要求: ';
  if button1.Enabled=true then button1.Enabled:=false;
  if button2.Enabled=true then button2.Enabled:=false;
  memo1.Text:='';
  v_close:=false;
  memo1.ReadOnly:=true;
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if (adoquery1.IsEmpty) and (trim(memo1.Text)<>'') then
  begin
   adoquery1.append;
   adoquery1.FieldValues['file_pointer']:=rkey10;
   adoquery1.FieldValues['source_type']:=6010;
   adoquery1.Fieldvalues['memo_text']:=memo1.Lines.Text;
   adoquery1.Post;
   v_close:=false;
   showmessage('数据保存成功');
  end
 else
  if (not adoquery1.IsEmpty) and (trim(memo1.Text)<>'') then
   begin
    adoquery1.Edit;
    adoquery1.FieldValues['memo_text']:=memo1.Text;
    adoquery1.Post;
    v_close:=false;
    showmessage('数据保存成功');
   end
  else
   if (not adoquery1.IsEmpty) and (trim(memo1.Text)='') then
    begin
     adoquery1.Delete;
     v_close:=false;
     showmessage('数据保存成功');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
  memo1.Lines.Text:=adoquery1.FieldValues['memo_text']
 else
  memo1.Lines.Text:='';
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (v_close=true) and (trim(memo1.Text)<>'') then
 case messagedlg('数据被修改是否保存?',mtconfirmation,[mbyes,mbno,mbcancel],0) of
  mryes : button1click(sender);
  mrno :;
  mrCancel :canclose:=false
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(ADOConnection1) then
 begin
   ShowMsg('程序起动失败请联系管理员',1);
   application.Terminate;  
 end;
 self.Caption:=application.title;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
v_close:=true;
end;

end.
