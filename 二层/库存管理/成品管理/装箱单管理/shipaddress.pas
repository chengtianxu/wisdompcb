unit shipaddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_address = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1location: TStringField;
    ADOQuery1ship_to_address_1: TStringField;
    ADOQuery1state: TStringField;
    ADOQuery1zip: TStringField;
    ADOQuery1SHIP_SHIPPING_METHOD: TStringField;
    ADOQuery1CUSTOMER_PTR: TIntegerField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_address: TForm_address;

implementation
uses damo;
{$R *.dfm}

procedure TForm_address.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
  ModalResult:=mrok;
end;

procedure TForm_address.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_address.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_address.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter :='location like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TForm_address.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

end.
