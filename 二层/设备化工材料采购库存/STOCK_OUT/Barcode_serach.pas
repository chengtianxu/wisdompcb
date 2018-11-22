unit Barcode_serach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmBCSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1INVENTORY_PTR: TIntegerField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1QUAN_ON_HAND: TBCDField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1scode: TStringField;
    ADOQuery1STD_COST: TBCDField;
    ADOQuery1unit_price: TBCDField;
    ADOQuery1WareHOUSE_PTR: TIntegerField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1INV_PART_DESCRIPTION: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   filename:string;
  public
    { Public declarations }
  end;

var
  FrmBCSearch: TFrmBCSearch;

implementation
uses Mainmenu;
{$R *.dfm}

procedure TFrmBCSearch.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   Adoquery1.Filter :=self.filename+' like '''+Trim(Edit1.Text)+'%'''
  else
   Adoquery1.filter:='';
end;

procedure TFrmBCSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TFrmBCSearch.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFrmBCSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TFrmBCSearch.Button1Click(Sender: TObject);
begin
  if Adoquery1.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmBCSearch.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBCSearch.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

procedure TFrmBCSearch.FormShow(Sender: TObject);
begin
  Adoquery1.Open ;
end;

procedure TFrmBCSearch.FormCreate(Sender: TObject);
begin
self.filename:= 'INV_PART_NUMBER';
end;

procedure TFrmBCSearch.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly=true) and
   (column.FieldName<>self.filename)  then
 begin
  self.filename:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
end;

end.
