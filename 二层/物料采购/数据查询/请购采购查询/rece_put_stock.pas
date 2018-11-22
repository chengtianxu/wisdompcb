unit rece_put_stock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, DB, ADODB, DBGrids, ExtCtrls;

type
  TForm_date = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    Label16: TLabel;
    DTpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ADO15: TADOQuery;
    ADO15rkey: TIntegerField;
    ADO15ABBR_NAME: TStringField;
    RadioGroup1: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_date: TForm_date;

implementation

uses  main;

{$R *.dfm}

procedure TForm_date.FormActivate(Sender: TObject);
begin
  dtpk2.Date:=date();
  dtpk1.Date:=date()-30;
  ado15.Open;
  while not ado15.Eof do
   begin
    combobox1.Items.Add(self.ADO15ABBR_NAME.Value);
    ado15.Next;
   end;
   combobox1.Items.Add('È«²¿...');
   combobox1.ItemIndex:=combobox1.Items.Count-1;
end;

procedure TForm_date.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 ado15.MoveBy(combobox1.ItemIndex+1-ado15.RecNo);
end;

end.
