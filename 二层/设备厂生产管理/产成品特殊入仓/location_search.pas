unit location_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_lo = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lo: TForm_lo;

implementation
uses main, damo;
{$R *.dfm}

procedure TForm_lo.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_lo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_lo.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_lo.Edit1Change(Sender: TObject);
begin
  if Edit1.text<>'' then
   Adoquery1.Filter := 'CODE like '''+trim(edit1.Text)+'%'''
  else
   Adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;   
end;

end.
