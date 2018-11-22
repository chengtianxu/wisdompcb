unit stocksearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB, Buttons;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADS134: TADODataSet;
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
    ADS134INVENTORY_PTR: TIntegerField;
    ADS134RKEY: TAutoIncField;
    ADS134barcode_id: TStringField;
    ADS134tax_price: TBCDField;
    ADS134tax_2: TBCDField;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    ADS134exch_rate: TBCDField;
    ADS134ship_by: TStringField;
    ADS134rke02: TAutoIncField;
    ADS134STOCK_BASE: TFloatField;
    ADS134deliver_number: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    OldGridWnd:TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
    parent_flag:byte;
  end;

var
  Form8: TForm8;

implementation

uses data_module, putout, vmidein;

{$R *.dfm}

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
self.field_name:='INV_PART_NUMBER';
OldGridWnd:=Dbgrid1.WindowProc;
Dbgrid1.WindowProc:=NewGridWnd;
end;

procedure TForm8.NewGridWnd(var Message: TMessage);
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
procedure TForm8.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
self.ADS134.Filter:=field_name+'like''%'+trim(edit1.Text)+'%'''
else
self.ADS134.Filter:='';
if self.ADS134.IsEmpty then
button1.Enabled:=false
else
button1.Enabled:=true;
end;

procedure TForm8.DBGrid1TitleClick(Column: TColumn);
var
i:word;
begin
if self.ADS134.IndexFieldNames<>column.FieldName then
self.ADS134.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
begin
label1.Caption:=column.Title.Caption;
self.field_name:=column.FieldName;
edit1.SetFocus;
for i:=0 to dbgrid1.FieldCount-1 do
if dbgrid1.Columns[i].Title.Color=clred then
dbgrid1.Columns[i].Title.Color:=clbtnface;
column.Title.Color:=clred;
end
else
edit1.SetFocus;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
if self.ADS134.IsEmpty then
exit
else
button1.Enabled:=true;
try
form_output:=tform_output.Create(application);
with form_output do
begin
edit1.Text:=self.ADS134QUAN_ON_HAND.AsString;
edit2.Text:=self.ADS134UNIT_NAME.Value;
edit3.Text:=self.ADS134QUAN_ON_HAND.AsString;
end;
if form_output.ShowModal=mrok then
begin
if self.parent_flag=0 then
with form6 do
begin
 edit8.Text:=self.ADS134exch_rate.AsString;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=self.ADS134INV_PART_NUMBER.Value;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=self.ADS134INV_NAME.Value;
     sgrid1.Cells[2,sgrid1.RowCount-1]:=self.ADS134INV_DESCRIPTION.Value;
     sgrid1.Cells[3,sgrid1.RowCount-1]:=self.ADS134rohs.Value;
     sgrid1.Cells[4,sgrid1.RowCount-1]:=self.ADS134UNIT_NAME.Value;
     sgrid1.Cells[5,sgrid1.RowCount-1]:=self.ADS134QUAN_ON_HAND.AsString;
     sgrid1.Cells[6,sgrid1.RowCount-1]:=form_output.Edit3.Text;
     sgrid1.Cells[7,sgrid1.RowCount-1]:=self.ADS134tax_price.AsString;
     sgrid1.Cells[8,sgrid1.RowCount-1]:=self.ADS134tax_2.AsString;
     sgrid1.Cells[9,sgrid1.RowCount-1]:='';
     sgrid1.Cells[10,sgrid1.RowCount-1]:='';
     sgrid1.Cells[11,sgrid1.RowCount-1]:=self.ADS134EXPIRE_DATE.AsString;
     sgrid1.Cells[12,sgrid1.RowCount-1]:=self.ADS134SUPPLIER2.Value;
     sgrid2.Cells[0,sgrid2.RowCount-1]:=self.ADS134INVENTORY_PTR.AsString;
     sgrid2.Cells[1,sgrid2.RowCount-1]:=self.ADS134RKEY.AsString;
     sgrid2.Cells[3,sgrid2.RowCount-1]:=self.ADS134rke02.AsString;
     sgrid2.Cells[4,sgrid2.RowCount-1]:=self.ADS134STOCK_BASE.AsString;
     sgrid2.Cells[5,sgrid2.RowCount-1]:=self.ADS134QUAN_ON_HAND.AsString;
     sgrid1.RowCount:=sgrid1.RowCount+1;
     sgrid2.RowCount:=sgrid2.RowCount+1;
     self.ADS134.Delete;
end
end;
finally
form_output.free;
end
end;

procedure TForm8.DBGrid1DblClick(Sender: TObject);
begin
if not self.ADS134.IsEmpty then
button1.OnClick(sender);
end;

procedure TForm8.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (not self.ADS134.IsEmpty) and (key=13) then
button1.OnClick(sender);
if (chr(key)='V') and (ssalt in shift) then
showmessage(self.ADS134.CommandText);
end;

procedure TForm8.FormShow(Sender: TObject);
begin
if self.ADS134.IsEmpty then
button1.Enabled:=false
else
button1.Enabled:=true;
end;

end.
