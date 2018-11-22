unit editcurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Bar1: TStatusBar;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    MaskEdit1: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main;
{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
var
v_message:integer;
begin
 if form1.adoTable1.State=dsinsert then
  begin
   form1.adoTable1.Cancel;
   v_close:=1; //正常退出
   close;
  end;
if (form1.adoTable1.Modified) or (edit1.Modified) or (edit2.Modified) or (edit3.Modified) then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   form1.adoTable1.Cancel     //取消对当前记录的修改包括新增
  else
   if v_message=6 then     //对修改的记录存盘
    bitbtn1click(sender)
   else                    //cancel不存盘也不保存
    exit;
  end;
   v_close:=1; //正常退出
 close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
dbedit1.SetFocus;
 if form1.adoTable1.State=dsedit then  //编辑
  begin
   edit1.Text:=format('%.8f',[form1.adotable1.fieldbyname('exch_rate').asfloat]);
   edit2.Text:=format('%.8f',[form1.adotable1.fieldbyname('base_to_other').asfloat]);
   edit4.Text:=format('%.8f',[form1.ADOTable1QTE_EXCH_RATE.Value]);
   edit5.Text:=format('%.8f',[form1.ADOTable1QTE_BASE_TO_OTHER.Value]);
   edit3.Text:=form1.adoTable1.FieldValues['curr_name'];
  end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if dbedit1.Text='' then
begin
 showmessage('请输入正确的货币代码!');
 dbedit1.SetFocus;
 exit;
end;
if edit3.Text='' then
begin
 showmessage('请输入正确的货币名称!');
 edit3.SetFocus;
 exit;
end;
if (edit1.Text='') or (edit2.Text='') then
begin
 showmessage('请输入一个正确的汇率!');
 exit;
end;
if (strtofloat(edit1.Text)=0) or (strtofloat(edit2.Text)=0) then
begin
 showmessage('请输入一个正确的汇率!');
 exit;
end;

//保存数据
 form1.ADOTable1TDATE.AsString := MaskEdit1.Text;
if form1.adoTable1.State=dsedit then
 begin            //如果table1在编辑状态
  form1.adotable1.FieldValues['exch_rate']:=strtofloat(edit1.Text);
  form1.adotable1.FieldValues['base_to_other']:=strtofloat(edit2.Text);
  form1.ADOTable1QTE_EXCH_RATE.Value:=strtofloat(edit4.Text);
  form1.ADOTable1QTE_BASE_TO_OTHER.Value:=strtofloat(edit5.Text);
  form1.adoTable1.FieldValues['curr_name']:=edit3.Text;
  form1.adoTable1.Post;
   v_close:=1;    //正常退出
  close;
 end
else              //如果table1在新增状态(dsinert)
 begin
  form1.adotable1.FieldValues['exch_rate']:=strtofloat(edit1.Text);
  form1.adotable1.FieldValues['base_to_other']:=strtofloat(edit2.Text);
  form1.ADOTable1QTE_EXCH_RATE.Value:=strtofloat(edit4.Text);
  form1.ADOTable1QTE_BASE_TO_OTHER.Value:=strtofloat(edit5.Text);
  form1.adoTable1.FieldValues['curr_name']:=edit3.Text;
  form1.adoTable1.Post;
  form1.adoTable1.Append;
  MaskEdit1.Text:= datetostr(date());
  edit3.Text:='';
  Edit1.Text:='0.00000000';
  Edit2.Text:='0.00000000';
  Edit4.Text:='0.00000000';
  Edit5.Text:='0.00000000';
  bar1.SimpleText:='';
  edit1.ReadOnly:=false;
  edit2.ReadOnly:=false;
  edit1.Color:=clwindow;
  edit2.Color:=clwindow;
  edit1.TabStop:=true;
  edit2.TabStop:=true;

  dbedit1.SetFocus;
 end;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

if not (key in ['0'..'9','.',#8]) then  abort
else
if key=chr(46) then            //不允许重复输入'.'
 if pos('.',(sender as Tedit).text)<>0 then
  abort;

end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 (sender as Tedit).SelectAll;
end;

procedure TForm2.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if edit1.Text<>'' then
  if strtofloat(edit1.Text)>0 then
   edit2.text:=format('%.8f',[1/strtofloat(edit1.Text)])
  else
   edit2.Text:='0.00000000'
 else
  edit1.Text:='0.00000000';
end;

procedure TForm2.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if edit2.Text<>'' then
  if strtofloat(edit2.Text)>0 then
   edit1.text:=format('%.8f',[1/strtofloat(edit2.Text)])
  else
   edit1.Text:='0.00000000'
 else
  edit2.Text:='0.00000000';
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
  form1.adoTable1.Cancel;     //取消对当前记录的修改包括新增
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 v_close:=0;
 bar1.SimpleText:='';
end;

procedure TForm2.MaskEdit1Exit(Sender: TObject);
begin
try
 strtodate(maskedit1.Text);
except
 messagedlg('日期格式录入有误',mtinformation,[mbok],0);
 maskedit1.SetFocus;
end;
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
if form1.adoTable1rkey.Value=1 then
 begin
  bar1.SimpleText:='基准货币';
  edit1.ReadOnly:=true;
  edit2.ReadOnly:=true;
  edit1.Color:=cl3dlight;
  edit2.Color:=cl3dlight;
  edit4.ReadOnly:=true;
  edit5.ReadOnly:=true;
  edit4.Color:=cl3dlight;
  edit5.Color:=cl3dlight;
  edit1.TabStop:=false;
  edit2.TabStop:=false;
 end
 else
 begin
  bar1.SimpleText:='';
  edit1.ReadOnly:=false;
  edit2.ReadOnly:=false;
  edit1.Color:=clwindow;
  edit2.Color:=clwindow;
  edit4.ReadOnly:=false;
  edit5.ReadOnly:=false;
  edit4.Color:=clwindow;
  edit5.Color:=clwindow;
  edit1.TabStop:=true;
  edit2.TabStop:=true;
 end;
end;

procedure TForm2.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if edit4.Text<>'' then
  if strtofloat(edit4.Text)>0 then
   edit5.text:=format('%.8f',[1/strtofloat(edit4.Text)])
  else
   edit5.Text:='0.00000000'
 else
  edit4.Text:='0.00000000';
end;

procedure TForm2.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if edit5.Text<>'' then
  if strtofloat(edit5.Text)>0 then
   edit4.text:=format('%.8f',[1/strtofloat(edit5.Text)])
  else
   edit4.Text:='0.00000000'
 else
  edit5.Text:='0.00000000';
end;

end.
