unit PasUpdateLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmUpdateLevel = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateLevel: TfrmUpdateLevel;

implementation

uses PasDM;

{$R *.dfm}

procedure TfrmUpdateLevel.FormShow(Sender: TObject);
begin
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select * from data0283';
  dm.tmp.Open;
  ComboBox1.Items.Clear;
  if not DM.tmp.IsEmpty then
  begin
    while not dm.tmp.Eof do
    begin
      ComboBox1.Items.AddObject(dm.tmp.fieldBYName('PRIORITY_name').AsString,Pointer(dm.tmp.fieldBYName('PRIORITY_CODE').AsInteger));
      dm.tmp.Next;
    end;
  end;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.tmp.fieldBYName('PRIORITY_name').AsString);
  ComboBox1.ItemIndex:=0;
end;

procedure TfrmUpdateLevel.BitBtn2Click(Sender: TObject);
begin
  BitBtn2.Tag:=integer(combobox1.items.objects[combobox1.itemindex]);
end;

end.
