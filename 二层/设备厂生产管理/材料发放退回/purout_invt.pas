unit purout_invt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_putout = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    Label5: TLabel;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_putout: TForm_putout;

implementation

{$R *.dfm}

procedure TForm_putout.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit3.Text)>0 then
    abort;
end;

procedure TForm_putout.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit3.Text)='' then edit3.Text:='0.000';
  if strtocurr(edit3.Text)>strtocurr(edit1.Text) then
     edit3.Text:=edit1.Text;
end;

procedure TForm_putout.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then bitbtn1.OnClick(sender);
end;

procedure TForm_putout.BitBtn1Click(Sender: TObject);
begin
  if (self.Tag=1) and (strtocurr(edit3.text)>(strtocurr(edit4.text)-strtocurr(edit5.Text)))  then
  begin
    if messagedlg('超出申请数量！是否继续？',mtWarning,[mbYes,mbNo],0)<>mrYes then
      Exit;
  end;
  if strtocurr(edit3.Text)<=0 then
  begin
    messagedlg('对不起,不能发放数据小于零的材料!!!',mterror,[mbcancel],0);
    edit3.SetFocus;
  end
  else
   ModalResult:=mrok;
end;

procedure TForm_putout.Edit3Exit(Sender: TObject);
begin
edit3.Text:=formatfloat('0.000',strtocurr(edit3.Text));
if (strtocurr(edit3.text)>=(strtocurr(edit4.text)-strtocurr(edit5.Text))) then CheckBox1.checked:=True else CheckBox1.Checked:=False;
BitBtn1.SetFocus;
end;

procedure TForm_putout.FormShow(Sender: TObject);
begin
  if (strtocurr(edit3.text)>=(strtocurr(edit4.text)-strtocurr(edit5.Text))) then CheckBox1.checked:=True;
end;

end.
