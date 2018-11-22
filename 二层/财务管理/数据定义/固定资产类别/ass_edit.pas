unit ass_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_edit = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_edit: TForm_edit;

implementation
uses damo,main,ass_add;

{$R *.dfm}

procedure TForm_edit.BitBtn1Click(Sender: TObject);
var flag:integer;
begin
flag:=0;
if trim(edit1.Text)='' then exit;
if self.RadioButton1.Checked then flag:=0;
if self.RadioButton2.Checked then flag:=1;
if self.RadioButton3.Checked then flag:=2;
if self.RadioButton4.Checked then flag:=3;
if self.RadioButton5.Checked then flag:=4;
 with dm.ADOQuery1 do
  begin
  edit;
  fieldbyname('fasset_type').AsString:=edit1.Text;
  fieldbyname('depr_mthd_ptr').AsInteger:=flag;
  fieldbyname('expected_life').AsString:=edit2.Text;
  fieldbyname('expected_surplus_rate').AsString:=edit3.Text;
  fieldbyname('prechar1').AsString:=edit4.Text;
  prepared;
  post;
  end;
end;

procedure TForm_edit.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;
end;

end.
