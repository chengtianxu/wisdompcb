unit EditNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_EditNote = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label9: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EditNote: TForm_EditNote;

implementation

uses Demo;

{$R *.dfm}

procedure TForm_EditNote.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_EditNote.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',Edit2.Text)>0  then abort;
end;

procedure TForm_EditNote.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Edit2.Text='' then Edit2.Text:='0';
end;

procedure TForm_EditNote.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',Edit7.Text)>0  then abort;
end;

procedure TForm_EditNote.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Edit7.Text='' then Edit7.Text:='0';
end;

end.
