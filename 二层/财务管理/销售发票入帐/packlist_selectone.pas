unit packlist_selectone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DB, ADODB, ComCtrls,DateUtils;

type
  TForm_selectpk = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    aqd439: TADODataSet;
    aqd64: TADODataSet;
    Edit1: TEdit;
    Label1: TLabel;
    aqd439rkey: TIntegerField;
    aqd439delivery_no: TStringField;
    aqd439date_sailing: TDateTimeField;
    aqd439shipping_method: TStringField;
    aqd439cartons_no: TIntegerField;
    aqd439CUST_CODE: TStringField;
    aqd439CUSTOMER_NAME: TStringField;
    aqd439ABBR_NAME: TStringField;
    aqd439DISCOUNT_PCT: TBCDField;
    aqd439DISCOUNT_DAYS: TSmallintField;
    aqd439NET_PAY: TSmallintField;
    aqd439LOCATION: TStringField;
    aqd439EMPLOYEE_NAME: TStringField;
    aqd439customer_ptr: TIntegerField;
    aqd439CURR_CODE: TStringField;
    aqd439CURR_NAME: TStringField;
    aqd439charge: TFloatField;
    aqd439ship_addr_ptr: TIntegerField;
    aqd439ACC_REC_PTR: TIntegerField;
    aqd64SALES_ORDER: TStringField;
    aqd64PO_NUMBER: TStringField;
    aqd64part_price: TFloatField;
    aqd64TAX_2: TBCDField;
    aqd439currency_ptr: TIntegerField;
    aqd64QUAN_SHIPPED: TIntegerField;
    aqd64tax_in_price: TStringField;
    aqd64discount: TBCDField;
    aqd64tools_amount: TFloatField;
    aqd439sum_amount: TFloatField;
    aqd439base_to_other: TFloatField;
    aqd64packing_list_ptr: TIntegerField;
    aqd64rkey: TIntegerField;
    aqd64MANU_PART_NUMBER: TStringField;
    aqd64MANU_PART_DESC: TStringField;
    aqd64SHIPMENT_NO: TSmallintField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
   v_colwidth,v_colwidth1: array of integer; 
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   function find_std_error():boolean;    
  public
    { Public declarations }
  end;

var
  Form_selectpk: TForm_selectpk;

implementation

uses damo, main;

{$R *.dfm}

procedure TForm_selectpk.NewGridWnd(var Message: TMessage);
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

procedure TForm_selectpk.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(aqd439.CommandText);
if (key=13) and (not aqd439.IsEmpty) then self.ModalResult:=mrok;
end;

procedure TForm_selectpk.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_selectpk.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  aqd439.Filter :=field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  aqd439.filter:='';

 if aqd439.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm_selectpk.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aqd439.IndexFieldNames) then
 aqd439.IndexFieldNames:=column.FieldName;

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

procedure TForm_selectpk.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aqd64.CommandText);
end;

procedure TForm_selectpk.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-708)*v_colwidth[i]/678);
for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid2.Width-708)*v_colwidth1[i]/678);
end;

function TForm_selectpk.find_std_error():boolean;
var
 std_number:array of array of currency;
 i,j:byte;
 find_error:boolean;
begin
 find_std_error:=false; //开始标识为没有错误
 find_error:=false;
 setlength(std_number,dbgrid1.SelectedRows.Count,2);//设置数组下标个数
 dbgrid1.DataSource.DataSet.DisableControls;
 for i:=low(std_number) to high(std_number)  do
  begin
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   std_number[i,0]:=self.aqd439customer_ptr.Value;
   std_number[i,1]:=self.aqd439currency_ptr.Value;
  end;
 dbgrid1.DataSource.DataSet.EnableControls;

 for i:=low(std_number) to high(std_number)-1  do
  begin
   for j:=i+1 to high(std_number) do
   if (std_number[i,0]<>std_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
      (std_number[i,1]<>std_number[j,1]) then  //stringgrid的下标，正好相反
   begin
    find_std_error:=true;
    find_error:=true;
    break;
   end;
   if find_error then break;
  end;
end;

procedure TForm_selectpk.FormShow(Sender: TObject);
var
 i:byte;
begin
if aqd439.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;

field_name:='delivery_no';
setlength(v_colwidth,dbgrid1.FieldCount);
setlength(v_colwidth1,dbgrid2.FieldCount);

for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;

end;

procedure TForm_selectpk.DBGrid1DblClick(Sender: TObject);
begin
if not aqd439.IsEmpty then self.ModalResult:=mrok;
end;

end.
