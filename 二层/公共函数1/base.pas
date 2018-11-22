unit base;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,MidasLib;

type
  TBase_f = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Base_f: TBase_f;

implementation

uses PublicFile;

{$R *.dfm}

procedure TBase_f.FormCreate(Sender: TObject);
begin
  Self.Font.Name:= FontName;
  Self.Font.Charset:=FontCharset;
  Self.Font.Size:=FontSize;
  SysLocale.PriLangID:=LANG_CHINESE;
  DateSeparator:='-';
  LongDateFormat:='yyyy-mm-dd';
  ShortDateFormat:='yyyy-mm-dd';
  TimeSeparator:=':';
  LongTimeFormat:='hh:nn:ss';
  TimeAMString:='ионГ';
  TimePMString:='обнГ';

end;

end.
