unit data_editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tdataedt = class(TForm)
    clrbox: TColorBox;
    doqry: TButton;
    restname: TEdit;
    remark: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    showresult: TButton;
    procedure FormShow(Sender: TObject);
    procedure doqryClick(Sender: TObject);
  private
    { Private declarations }
  public
    function DeleteLineBreaks(const S: string): string;
    { Public declarations }
  end;

var
  dataedt: Tdataedt;

implementation

uses dm, DB, ADODB;

{$R *.dfm}

procedure Tdataedt.FormShow(Sender: TObject);
var
  i:Integer;
begin
  case Tag of
  1: Caption:='ÐÂÔö';
  2: Caption:='ÐÞ¸Ä';
  3: Caption:='É¾³ý';
  else
    Self.Close;
  end;
  doqry.Caption:=Caption;

  with udm.adotbl do
  begin
    clrbox.Hint:=Fields.FieldByName('color').AsString;
    doqry.Tag:=Fields.FieldByName('rkey').AsInteger;
    restname.Text:=Fields.FieldByName('resttype_name').AsString;
    remark.Lines.Clear;
    remark.Lines.Add(Fields.FieldByName('remark').AsString);
    First;
    while not Eof do
    begin
      for i:=0 to clrbox.Items.Count-1 do
      if clrbox.Items.Strings[i]=Fields.FieldByName('color').AsString then
        case Self.Tag of
        1: clrbox.Items.Delete(i);
        else
        if  clrbox.Items.Strings[i]<> clrbox.Hint then
            clrbox.Items.Delete(i);
        end;

      Next;
    end;
    clrbox.Items.Delete(clrbox.Items.Count-1);
    clrbox.Items.Delete(0);

    case Self.Tag of
    1:  begin
          restname.Text:='';
          remark.Lines.Clear;
          clrbox.Hint:='';
          clrbox.ItemIndex:=0;
        end;
    2,3:begin
          clrbox.Selected:=StringToColor(clrbox.Hint);
        end;
    end;

    clrbox.Enabled:=Tag<>3;
    remark.ReadOnly:=Tag=3;
    restname.ReadOnly:=Tag=3;




  end;
end;

procedure Tdataedt.doqryClick(Sender: TObject);
begin
  if   udm.doqry(Tag,
            doqry.Tag,
            restname.Text,
            ColorToString(clrbox.Selected),
            DeleteLineBreaks(remark.Lines.Text)) then
  showresult.ModalResult:=mrOk
  else
  showresult.ModalResult:=mrAbort;

  showresult.Click;
end;

function Tdataedt.DeleteLineBreaks(const S: string): string;
var
  Source, SourceEnd: PChar;
begin
  Source := Pointer(S);
  SourceEnd := Source + Length(S);
  while Source < SourceEnd do
  begin
    case Source^ of
    #10: Source^ := #32;
    #13: Source^ := #32;
    end;
    Inc(Source);
  end;
  Result := S;
end;


end.
