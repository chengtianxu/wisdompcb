unit return_invtstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_returninvt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_returninvt: TForm_returninvt;

implementation

{$R *.dfm}

procedure TForm_returninvt.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
  abort
 else
  if (key = chr(46)) then
   if pos('.',edit4.Text)>0 then
    abort;
end;

procedure TForm_returninvt.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)='' then edit4.Text:='0.000';
if strtocurr(edit4.Text)>strtocurr(edit3.Text) then
  edit4.Text:=edit3.Text;
end;

procedure TForm_returninvt.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then bitbtn1.OnClick(sender);
end;

procedure TForm_returninvt.Edit4Exit(Sender: TObject);
begin
edit4.Text:=formatfloat('0.000',strtocurr(edit4.Text));
end;

procedure TForm_returninvt.BitBtn1Click(Sender: TObject);
begin
if strtocurr(edit4.Text)=0 then
 begin
  messagedlg('对不起,不能退回数据为零的材料!!!',mterror,[mbcancel],0);
  edit4.SetFocus;
 end
else
 ModalResult:=mrok;
end;

end.
