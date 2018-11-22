unit uProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TfrmProduct = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Query1: TADOQuery;
    Query1PROD_CODE: TStringField;
    Query1PRODUCT_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduct: TfrmProduct;

implementation

{$R *.dfm}

procedure TfrmProduct.FormActivate(Sender: TObject);
begin
 Query1.Open;
end;

procedure TfrmProduct.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Query1.Filter :='PROD_CODE like '''+trim(edit1.text)+'%'''
 else
  Query1.filter:='';
if Query1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TfrmProduct.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure TfrmProduct.DBGrid1DblClick(Sender: TObject);
begin
if not Query1.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmProduct.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not Query1.IsEmpty) then ModalResult:=mrOK;
end;

end.
