unit note;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  Tedit_note = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  edit_note: Tedit_note;
  MaxCharsPerLine, MaxLines: Integer;
implementation

uses note_search;

{$R *.dfm}

procedure Tedit_note.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 try
  note_form := tnote_form.Create(application);
  if note_form.ShowModal=mrok then
  begin
   memo1.Clear;
   for i:=1 to 4 do
   memo1.lines.add(note_form.Adoquery1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
  end;
 finally
  note_form.Free;
 end;
end;

end.
