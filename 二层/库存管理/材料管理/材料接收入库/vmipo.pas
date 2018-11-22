unit vmipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS133: TADODataSet;
    ADO134: TADOQuery;
    ADS133RKEY: TIntegerField;
    ADS133GRN_NUMBER: TStringField;
    ADS133PO_NUMBER: TStringField;
    ADS133CONFIRMATION_NUMBER: TStringField;
    ADS133PO_DATE: TDateTimeField;
    ADS133CODE: TStringField;
    ADS133SUPPLIER_NAME: TStringField;
    ADS133abbr_suppname: TStringField;
    ADS133abbr_warename: TStringField;
    ADS133WAREHOUSE_PTR: TIntegerField;
    ADS133WAREHOUSE_CODE: TStringField;
    ADS133WAREHOUSE_NAME: TStringField;
    ADS133CURRENCY_PTR: TIntegerField;
    ADS133CURR_CODE: TStringField;
    ADS133CURR_NAME: TStringField;
    ADS133EXCH_RATE: TBCDField;
    ADS133REF_NUMBER: TStringField;
    ADS133SHIP_BY: TStringField;
    ADS133SHIP_DATE: TDateTimeField;
    ADS133CREATE_DATE: TDateTimeField;
    ADS133TTYPE: TSmallintField;
    ADS133stype: TStringField;
    ADS133deliver_number: TStringField;
    ADO134RKEY: TAutoIncField;
    ADO134INV_NAME: TStringField;
    ADO134INV_DESCRIPTION: TStringField;
    ADO134QUANTITY: TBCDField;
    ADO134QUAN_ON_HAND: TBCDField;
    ADO134UNIT_NAME: TStringField;
    ADO134SOURCE_PTR: TIntegerField;
    ADO134SHELF_LIFE: TSmallintField;
    ADO134INV_PART_NUMBER: TStringField;
    ADO134rohs: TStringField;
    ADO134price: TBCDField;
    ADO134TAX_PRICE: TBCDField;
    ADO134TAX_2: TBCDField;
    ADO134EXPIRE_DATE: TDateTimeField;
    ADO134SUPPLIER2: TStringField;
    ADO134BARCODE_ID: TStringField;
    Label2: TLabel;
    ADO134inventory_ptr: TIntegerField;
    ADO134unit_ptr: TIntegerField;
    ADS133supp_ptr: TIntegerField;
    ADO134STOCK_BASE: TFloatField;
    ADS133po_ptr: TIntegerField;
    ADO134location: TStringField;
    ADO134MANU_DATE: TDateTimeField;
    ADO134cust_decl: TStringField;
    ADS133SECOND_WHSE_PTR: TIntegerField;
    ADO134RKEY391: TIntegerField;
    ADO134CONVERSION_FACTOR: TFloatField;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ADO134SUPPLIER3: TStringField;
    ADO134ORIG_ABBRNAME: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
 //  v_colwidth: array of integer;
   dbgrid_width:integer;
   file_name:string;
   OldGridWnd : TWndMethod;
   strSQL:string;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses data_module,ConstVar,Pick_Item_Single;

{$R *.dfm}
procedure tform9.NewGridWnd(var message:Tmessage);
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

procedure TForm9.DBGrid1DblClick(Sender: TObject);
begin
if not self.ADS133.IsEmpty then
 ModalResult := mrok;
end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not self.ADS133.IsEmpty) then ModalResult := mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(self.ADS133.CommandText);
end;

procedure TForm9.Edit1Change(Sender: TObject);
begin
 if Trim(Edit2.Text)<>'' then
 begin
   Edit2.Text:='';
   ADS133.Close;
   self.ADS133.CommandText := strSQL;
   ADS133.Open;
   ADO134.Open;
 end;
 IF trim(EDIT1.TEXT)<>'' THEN
 self.ADS133.Filter := self.file_name+' like ''%'+trim(edit1.text)+'%'''
 ELSE
 self.ADS133.FILTER := '';
if self.ADS133.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
file_name:='GRN_NUMBER';
OldGridWnd := DBGrid1.WindowProc;
DBGrid1.WindowProc := NewGridWnd;
dbgrid_width:=dbgrid1.Width;
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>self.ADS133.IndexFieldNames) and
   (column.FieldName<>'stype') then
 self.ADS133.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
ADS133.Close;
ADS133.Open;
ADO134.Close;
ADO134.Open;
strSQL:=ADS133.CommandText;
//setlength(v_colwidth,dbgrid1.FieldCount);
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'INV_PART_NUMBER/材料代码/160,INV_NAME/材料名称/200,INV_DESCRIPTION/材料规格/250';
    InputVar.Sqlstr := 'select DISTINCT INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION,data0017.rkey '
    +'from data0017 inner join DATA0134 on data0017.rkey=data0134.INVENTORY_PTR where (data0134.QUAN_ON_HAND>0)';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
      Edit2.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
begin
  ADS133.close;
  IF trim(EDIT2.TEXT)<>'' THEN
    self.ADS133.CommandText :=strSQL+' and data0133.rkey in(select distinct data0133.rkey from data0133 '
    +'inner join data0134 on data0133.rkey=data0134.grn_ptr inner join data0017 on DATA0134.INVENTORY_PTR=data0017.rkey '
    +'where data0017.INV_PART_NUMBER like ''%'+trim(edit2.text)+'%'')'
  ELSE
    self.ADS133.CommandText := strSQL;
  ADS133.Open;
  ADO134.Open;
end;

end.
