unit annotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm11 = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses note_search;

{$R *.dfm}

procedure TForm11.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 try
  form_note := tform_note.Create(application);
  if form_note.ShowModal=mrok then
   for i:=1 to 4 do
   memo1.lines.add(form_note.Adoquery1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
 finally
  form_note.Free;
 end;
end;

end.
