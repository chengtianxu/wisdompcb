unit supp_invtrecept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm_suppinvtrecept = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    aq22: TADOQuery;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22QUANTITY: TBCDField;
    aq22UNIT_NAME: TStringField;
    aq22PRICE: TBCDField;
    aq22TAX_2: TBCDField;
    aq22amount: TBCDField;
    aq22tax_amount: TBCDField;
    aq22GRN_PTR: TIntegerField;
    aq22RKEY: TIntegerField;
    aq22SOURCE_PTR: TIntegerField;
    Edit1: TEdit;
    Label1: TLabel;
    aq235: TADOQuery;
    aq235goods_name: TStringField;
    aq235goods_guige: TStringField;
    aq235QUAN_RECD: TBCDField;
    aq235UNIT_NAME: TStringField;
    aq235unit_price: TBCDField;
    aq235state_tax: TBCDField;
    aq235GRN_PTR: TIntegerField;
    aq235D0072_PTR: TIntegerField;
    aq235RKEY: TIntegerField;
    aq235amount: TBCDField;
    aq235tax_amount: TBCDField;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    aq456: TADODataSet;
    aq456RKEY: TIntegerField;
    aq456GRN_NUMBER: TStringField;
    aq456DELIVER_NUMBER: TStringField;
    aq456PO_NUMBER: TStringField;
    aq456ship_DATE: TDateTimeField;
    aq456EMPLOYEE_NAME: TStringField;
    aq456TTYPE: TSmallintField;
    aq456CURR_NAME: TStringField;
    aq456amount: TBCDField;
    aq456CURR_CODE: TStringField;
    aq456v_type: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    function find_std_error():boolean;
  private
    { Private declarations }
    field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_suppinvtrecept: TForm_suppinvtrecept;

implementation

uses datamd;

{$R *.dfm}
procedure TForm_suppinvtrecept.NewGridWnd(var Message: TMessage);
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

procedure TForm_suppinvtrecept.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';     //设备过滤字段
end;

procedure TForm_suppinvtrecept.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  aq456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq456.Filter:='';
 if aq456.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true; 
end;

procedure TForm_suppinvtrecept.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aq456.IndexFieldNames)  then
 aq456.IndexFieldNames:=column.FieldName;

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

procedure TForm_suppinvtrecept.DBGrid1DblClick(Sender: TObject);
begin
 if not self.aq456.IsEmpty then   self.ModalResult:=mrok;
end;

procedure TForm_suppinvtrecept.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq22.SQL.Text);
end;

procedure TForm_suppinvtrecept.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if self.aq456TTYPE.Value=2 then
 dbgrid3.BringToFront
else
 DBGrid2.BringToFront; 
end;

procedure TForm_suppinvtrecept.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq235.SQL.Text);
end;

procedure TForm_suppinvtrecept.Button1Click(Sender: TObject);
begin
  if self.find_std_error then
   showmessage('出错了!在选择多个入仓单号时,必须是同一个供应商,同一货币,同一汇率,同一税率,同一入仓类型的入库!')
  else
   ModalResult:=mrok;
end;

function TForm_suppinvtrecept.find_std_error: boolean;
var
 std_number:array of array of currency;
 i,j:byte;
 find_error:boolean;
begin
 find_std_error:=false; //开始标识为没有错误
 find_error:=false;
 setlength(std_number,DBGrid2.DataSource.DataSet.RecordCount,1);//设置数组下标个数
 DBGrid2.DataSource.DataSet.DisableControls;
 for i:=low(std_number) to high(std_number)  do
  begin
   std_number[i,0]:=self.aq22TAX_2.Value;
  end;
 DBGrid2.DataSource.DataSet.EnableControls;
 
 if low(std_number)<>high(std_number) then
 begin
  for i:=low(std_number) to high(std_number)-1  do
  begin
   for j:=i+1 to high(std_number) do
   if (std_number[i,0]<>std_number[j,0]) then
   begin
    find_std_error:=true;
    find_error:=true;
    break;
   end;
   if find_error then break;
  end;
 end;
end;

end.
