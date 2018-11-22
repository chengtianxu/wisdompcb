unit purchase_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons;

type
  TForm_po = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_po: TForm_po;

implementation
uses damo;
{$R *.dfm}

procedure TForm_po.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult := mrok;
end;

procedure TForm_po.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_po.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   Adoquery1.Filter := 'po_number like '''+trim(edit1.Text)+'%'''
  else
   Adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TForm_po.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then
 ModalResult:=mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.adoquery1.SQL.Text); 
end;

procedure TForm_po.FormCreate(Sender: TObject);
begin
  self.ADOQuery1.Open;
end;

end.
