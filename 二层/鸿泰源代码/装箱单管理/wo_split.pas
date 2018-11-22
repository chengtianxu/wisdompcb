unit wo_split;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm12.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)='' then edit4.Text:='0';
if strtoint(edit4.Text)>=strtoint(label5.Caption) then
 edit4.Text:='0';
 edit3.Text:=inttostr(strtoint(label5.Caption)-strtoint(edit4.Text));
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
if edit4.Text='0' then
 begin
  showmessage('不能拆去数量为零的作业单');
  edit4.SetFocus;
 end
else
 self.ModalResult:=mrok;
end;

procedure TForm12.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (chr(key)='V') and (ssCtrl in shift) then
//  Abort;
end;

end.
