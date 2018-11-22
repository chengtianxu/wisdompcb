unit StockSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls;

type
  TForm_StockSearch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADS134: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADS134INV_PART_NUMBER: TStringField;
    ADS134INV_NAME: TStringField;
    ADS134INV_DESCRIPTION: TStringField;
    ADS134LOCATION: TStringField;
    ADS134UNIT_NAME: TStringField;
    ADS134QUAN_ON_HAND: TBCDField;
    ADS134EXPIRE_DATE: TDateTimeField;
    ADS134rohs: TStringField;
    ADS134ABBR_NAME: TStringField;
    ADS134SUPPLIER2: TStringField;
    ADS134STD_COST: TFloatField;
    ADS134INVENTORY_PTR: TIntegerField;
    ADS134RKEY: TAutoIncField;
    ADS134barcode_id: TStringField;
    ADS134tax_price: TBCDField;
    ADS134tax_2: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
    parent_flag:byte;
  end;

var
  Form_StockSearch: TForm_StockSearch;

implementation

uses demo, PutOut, Main, OutWh;

{$R *.dfm}

procedure TForm_StockSearch.Button1Click(Sender: TObject);
begin
try
 form_putout:=tform_putout.Create(application);
 with form_putout do
  begin
   edit1.Text:=self.ADS134QUAN_ON_HAND.AsString;
   edit2.Text:=self.ADS134UNIT_NAME.Value;
   edit3.Text:=self.ADS134QUAN_ON_HAND.AsString;
  end;
 if form_putout.ShowModal=mrok then
  begin
   if self.parent_flag=0 then
    with form_outwh do
    begin
     sgrid1.Cells[0,sgrid1.RowCount-1]:=self.ADS134INV_PART_NUMBER.Value;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=self.ADS134INV_NAME.Value;
     sgrid1.Cells[2,sgrid1.RowCount-1]:=self.ADS134INV_DESCRIPTION.Value;
     sgrid1.Cells[3,sgrid1.RowCount-1]:=self.ADS134rohs.Value;
     sgrid1.Cells[4,sgrid1.RowCount-1]:=self.ADS134UNIT_NAME.Value;
     sgrid1.Cells[5,sgrid1.RowCount-1]:=form_putout.Edit3.Text;
     sgrid1.Cells[6,sgrid1.RowCount-1]:=self.ADS134tax_price.AsString;
     sgrid1.Cells[7,sgrid1.RowCount-1]:=self.ADS134tax_2.AsString;
     sgrid2.Cells[0,sgrid2.RowCount-1]:=self.ADS134INVENTORY_PTR.AsString;
     sgrid2.Cells[1,sgrid2.RowCount-1]:=self.ADS134RKEY.AsString;
     sgrid2.Cells[2,sgrid2.RowCount-1]:=self.ADS134STD_COST.AsString;
     sgrid1.RowCount:=sgrid1.RowCount+1;
     sgrid2.RowCount:=sgrid2.RowCount+1;
     self.ADS134.Delete;
    end
  end;
finally
 form_putout.Free;
end
end;

procedure TForm_StockSearch.FormCreate(Sender: TObject);
begin
self.field_name:='INV_PART_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_stocksearch.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure TForm_StockSearch.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ads134.Filter:=field_name+ ' LIKE ''%'+TRIM(EDIT1.TEXT)+'%'''
 ELSE
  ads134.FILTER:='';
if ads134.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_StockSearch.DBGrid1DblClick(Sender: TObject);
begin
if not self.ads134.IsEmpty then
 button1.OnClick(sender);
end;

procedure TForm_StockSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (not self.ads134.IsEmpty) and (key=13) then
 button1.OnClick(sender);
end;

procedure TForm_StockSearch.DBGrid1TitleClick(Column: TColumn);
var
 i:word;
begin
if self.ads134.IndexFieldNames<>column.FieldName then
 ads134.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

end.
