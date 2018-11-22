unit conf_note;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function MemoLine: Integer;
    function LineLen(r: Integer): Integer;
    function NRows: Integer;
  end;

var
  Form7: TForm7;
  MaxCharsPerLine, MaxLines: Integer;
implementation
{$R *.dfm}
function tform7.NRows: integer;
begin
  with Memo1 do
    Result := 1 + SendMessage(Handle, EM_LINEFROMCHAR, GetTextLen-1, 0);
end;

function Tform7.LineLen(r: Integer): Integer;
var r1, r2: Integer;
begin
  with Memo1 do begin
    r1 := SendMessage(Handle, EM_LINEINDEX, r, 0);
    if (r < NRows-1) then
      r2 := SendMessage(Handle, EM_LINEINDEX, r+1, 0)-2 {-CR/LF}
    else
      r2 := GetTextLen;
  end;
  Result := r2-r1;
end;

function Tform7.MemoLine: Integer;
begin
 with Memo1 do
  Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

procedure TForm7.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
 if SendMessage(Memo1.Handle,EM_LINEFROMCHAR,Memo1.SelStart,0) = 10 then
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

Initialization
 MaxCharsPerLine := 40;
 MaxLines := 10;
end.
