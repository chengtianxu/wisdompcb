unit rma_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TForm_custrma = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button2: TButton;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADODataSet1RMA_NUMBER: TStringField;
    ADODataSet1RMA_DATE: TDateTimeField;
    ADODataSet1SALES_ORDER: TStringField;
    ADODataSet1QTY_RECD: TIntegerField;
    ADODataSet1PART_PRICE: TFloatField;
    ADODataSet1tax_in_price: TStringField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1CURR_NAME: TStringField;
    ADODataSet1RUSH_CHARGE: TBCDField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1sys_date: TDateTimeField;
    BitBtn3: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_custrma: TForm_custrma;

implementation

uses DAMO, main;

{$R *.dfm}

procedure TForm_custrma.NewGridWnd(var Message: TMessage);
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

procedure TForm_custrma.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  adodataset1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  adodataset1.filter := '';

end;

procedure TForm_custrma.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>adodataset1.IndexFieldNames) then
 adodataset1.IndexFieldNames:=column.FieldName;

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

procedure TForm_custrma.FormActivate(Sender: TObject);
begin
self.ADODataSet1.Open;
field_name:='RMA_NUMBER';
end;

procedure TForm_custrma.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_custrma.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adodataset1.IsEmpty) then ModalResult:=mrok;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adodataset1.CommandText);
end;

procedure TForm_custrma.BitBtn3Click(Sender: TObject);
begin
  if ADODataSet1.RecordCount>0 then form1.CopyDbDataToExcel([DBGrid1]);
end;

end.
