unit edit_rep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm_rep = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_rep: TForm_rep;

implementation

uses rep_search, damo;

{$R *.dfm}

procedure TForm_rep.BitBtn1Click(Sender: TObject);
begin
 try
  rep_form := Trep_form.Create(Application);
  rep_form.Edit1.Text:=edit1.Text;
  if rep_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else 
 IF rep_form.showmodal=mrok then
  begin
   edit1.Text:=rep_form.ADOQuery1.FieldValues['rep_code'];
   edit1.Font.Color:=clwindowtext;
   label4.Caption:=rep_form.ADOQuery1.FieldValues['sales_rep_name'];
   label7.Caption:=rep_form.ADOQuery1.FieldValues['rkey'];
   edit2.SetFocus;
  end
 else
  edit1.SetFocus;
 finally
  rep_form.free;
 end;

end;

procedure TForm_rep.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
   begin
    edit1.SelectAll;
    edit1.Font.Color:=clblue;
   end;
end;

procedure TForm_rep.Edit1Exit(Sender: TObject);
begin
 if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') then
 begin
 try
  rep_form := Trep_form.Create(Application);
  rep_form.Edit1.Text:=edit1.Text;
 if comparetext(edit1.text,rep_form.ADOQuery1.Fieldbyname('rep_code').AsString)=0 then
    begin
     edit1.Font.Color:=clwindowtext;
     label4.Caption:=rep_form.ADOQuery1.FieldValues['sales_rep_name'];
     label7.Caption:=rep_form.ADOQuery1.FieldValues['rkey'];
    end
   else
    begin
     messagedlg('代表代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label4.Caption:='';
     edit1.SetFocus;
     exit;
    end;
 finally
  rep_form.free;
 end;
  end;
end;

procedure TForm_rep.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if edit3.Text<>'' then  //输入数字不能大于100
 if (strtofloat(edit3.Text)>=100) and (key <> chr(8)) then
   abort;
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',edit3.Text)>0
    then abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //如果输入的不是数字
     abort;
end;

procedure TForm_rep.Edit3Exit(Sender: TObject);
begin
if edit3.Text='' then edit3.Text:='0';
 edit3.Text:=formatfloat('0.00',strtofloat(edit3.Text));
end;

procedure TForm_rep.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if edit2.Text<>'' then  //输入数字不能大于100
 if (strtofloat(edit2.Text)>=100) and (key <> chr(8)) then
   abort;
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',edit2.Text)>0
    then abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //如果输入的不是数字
     abort;
end;

procedure TForm_rep.Edit2Exit(Sender: TObject);
begin
if edit2.Text='' then edit2.Text:='0';
 edit2.Text:=formatfloat('0.00',strtofloat(edit2.Text));
end;

end.
