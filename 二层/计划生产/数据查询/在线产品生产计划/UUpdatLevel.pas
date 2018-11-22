unit UUpdatLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmUpdateLevel = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
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

uses UDM;

{$R *.dfm}

procedure TfrmUpdateLevel.FormShow(Sender: TObject);
begin
  dm.qrytemp.Close;
  dm.qrytemp.SQL.Text:='select * from data0283';
  dm.qrytemp.Open;
  ComboBox1.Items.Clear;
  if not DM.qrytemp.IsEmpty then
  begin
    while not dm.qrytemp.Eof do
    begin
      ComboBox1.Items.AddObject(dm.qrytemp.fieldBYName('PRIORITY_name').AsString,Pointer(dm.qrytemp.fieldBYName('PRIORITY_CODE').AsInteger));
      dm.qrytemp.Next;
    end;
  end;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.qrytemp.fieldBYName('PRIORITY_name').AsString);
  ComboBox1.ItemIndex:=0;
end;

procedure TfrmUpdateLevel.BitBtn2Click(Sender: TObject);
begin
BitBtn2.Tag:=integer(combobox1.items.objects[combobox1.itemindex]);
end;

end.
