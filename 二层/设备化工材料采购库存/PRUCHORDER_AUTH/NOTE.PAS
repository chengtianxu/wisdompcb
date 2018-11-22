unit note;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  Tedit_note = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Button3: TButton;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MemoLine: Integer;
    function LineLen(r: Integer): Integer;
    function NRows: Integer;
  end;

var
  edit_note: Tedit_note;
  MaxCharsPerLine, MaxLines: Integer;
implementation

{$R *.dfm}

procedure Tedit_note.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if SendMessage(Memo1.Handle,EM_LINEFROMCHAR,Memo1.SelStart,0)=4 then
    abort;
 with Memo1 do begin
 case Key of
 ' '..#255: if (LineLen(MemoLine) >= MaxCharsPerLine) then
    Key := #0;
 #10, #13: if (NRows >= MaxLines) then
    Key := #0;
 #8: if (SelStart = SendMessage(Handle, EM_LINEINDEX, MemoLine, 0)) then
    Key := #0;
 end;
end;
end;

function tedit_note.NRows: integer;
begin
 with Memo1 do
  Result := 1 + SendMessage(Handle, EM_LINEFROMCHAR, GetTextLen-1, 0);
end;

function Tedit_note.LineLen(r: Integer): Integer;
 var r1, r2: Integer;
begin
 with Memo1 do
  begin
   r1 := SendMessage(Handle, EM_LINEINDEX, r, 0);
   if (r < NRows-1) then
    r2 := SendMessage(Handle, EM_LINEINDEX, r+1, 0)-2 {-CR/LF}
   else
    r2 := GetTextLen;
  end;
   Result := r2-r1;
end;

function Tedit_note.MemoLine: Integer;
begin
 with Memo1 do
 Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

procedure Tedit_note.Button3Click(Sender: TObject);
begin
 close;
end;

Initialization
 MaxCharsPerLine := 70;
 MaxLines := 4;
end.
