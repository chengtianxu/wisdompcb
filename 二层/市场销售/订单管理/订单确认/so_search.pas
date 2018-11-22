unit so_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
 uses damo;
{$R *.dfm}

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  case radiogroup1.ItemIndex of
   0:Adoquery1.Filter :='sales_order like '''+Trim(Edit1.Text)+'%''';
   1:Adoquery1.Filter :='po_number like ''%'+Trim(Edit1.Text)+'%''';
   2:Adoquery1.Filter :='manu_part_number like ''%'+Trim(Edit1.Text)+'%''';
  end
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TForm5.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
  if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text); 
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
label1.Caption := radiogroup1.Items[radiogroup1.itemindex];
edit1.SetFocus;
end;

end.
