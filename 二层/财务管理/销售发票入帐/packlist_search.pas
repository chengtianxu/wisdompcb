unit packlist_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DB, ADODB, ComCtrls,DateUtils;

type
  TForm_packlist = class(TForm)
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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
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
    CheckBox1: TCheckBox;
    aqd439base_to_other: TFloatField;
    aqd64packing_list_ptr: TIntegerField;
    aqd64rkey: TIntegerField;
    aqd64MANU_PART_NUMBER: TStringField;
    aqd64MANU_PART_DESC: TStringField;
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    aqd439REG_TAX_FIXED_UNUSED: TStringField;
    aqd439EDI_FLAG_CREDIT_MEMO: TSmallintField;
    aqd439abbr_name15: TStringField;
    aqd439warehouse_ptr: TIntegerField;
    aqd439FED_TAX_ID_NO: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }

   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   function find_std_error():boolean;    
  public
    { Public declarations }
  end;

var
  Form_packlist: TForm_packlist;

implementation

uses damo, main;

{$R *.dfm}

procedure TForm_packlist.NewGridWnd(var Message: TMessage);
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

procedure TForm_packlist.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(aqd439.CommandText);
if (key=13) and (not aqd439.IsEmpty) then button1.OnClick(sender);
end;

procedure TForm_packlist.FormCreate(Sender: TObject);
begin
 dtpk1.Date:=form1.sys_sortdate-dayof(form1.sys_sortdate)+1;
 dtpk2.Date:=form1.sys_sortdate;
 field_name:='CUST_CODE';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_packlist.FormShow(Sender: TObject);
begin
 aqd439.Close;
 aqd439.Parameters.ParamByName('dtpk1').Value:=
         strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)
                      +formatdatetime('hh:nn:ss',dtt1.DateTime));
 aqd439.Parameters.ParamByName('dtpk2').Value:=
          strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)
                        +formatdatetime('hh:nn:ss',dtt2.DateTime));
 aqd439.Open;
end;

procedure TForm_packlist.Edit1Change(Sender: TObject);
begin
 if checkbox1.Checked then checkbox1.Checked := false;
  self.aqd439.DisableControls;
  aqd439.First;
  while not aqd439.Eof do
  begin
   if dbgrid1.SelectedRows.CurrentRowSelected then
   dbgrid1.SelectedRows.CurrentRowSelected:=false;
   aqd439.Next;
  end;
  self.aqd439.EnableControls;

 if trim(Edit1.text)<>'' then
  aqd439.Filter :=field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  aqd439.filter:='';


end;

procedure TForm_packlist.dtpk1CloseUp(Sender: TObject);
begin
 aqd439.Close;
 aqd439.Parameters.ParamByName('dtpk1').Value:=
         strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)
                      +formatdatetime('hh:nn:ss',dtt1.DateTime));
 aqd439.Parameters.ParamByName('dtpk2').Value:=
          strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)
                        +formatdatetime('hh:nn:ss',dtt2.DateTime));
 aqd439.Open;
end;

procedure TForm_packlist.DBGrid1TitleClick(Column: TColumn);
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

procedure TForm_packlist.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.aqd439RKEY.Value;
  self.aqd439.DisableControls;
  aqd439.First;
  while not aqd439.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   aqd439.Next;
  end;
  self.aqd439.EnableControls;
  aqd439.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.aqd439RKEY.Value;
  self.aqd439.DisableControls;
  aqd439.First;
  while not aqd439.Eof do
  begin
   if self.aqd439RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   aqd439.Next;
  end;
  self.aqd439.EnableControls;
  aqd439.Locate('rkey',rkey,[]);
 end;
end;

function TForm_packlist.find_std_error():boolean;
var
 std_number:array of array of currency;
 i,j:byte;
 find_error:boolean;
begin
 find_std_error:=false; //开始标识为没有错误
 find_error:=false;
 setlength(std_number,dbgrid1.SelectedRows.Count,3);//设置数组下标个数
 dbgrid1.DataSource.DataSet.DisableControls;
 for i:=low(std_number) to high(std_number)  do
  begin
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   std_number[i,0]:=self.aqd439customer_ptr.Value;
   std_number[i,1]:=self.aqd439currency_ptr.Value;
   std_number[i,2]:=self.aqd439warehouse_ptr.Value;
  end;
 dbgrid1.DataSource.DataSet.EnableControls;

 for i:=low(std_number) to high(std_number)-1  do
  begin
   for j:=i+1 to high(std_number) do
    if (std_number[i,0]<>std_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
       (std_number[i,1]<>std_number[j,1]) or
       (std_number[i,2]<>std_number[j,2]) then  //stringgrid的下标，正好相反
     begin
      find_std_error:=true;
      find_error:=true;
      break;
     end;
   if find_error then
    break;
  end;
end;

procedure TForm_packlist.Button1Click(Sender: TObject);
begin
if self.aqd439ACC_REC_PTR.Value>0 then
 if dbgrid1.SelectedRows.Count=1 then
  ModalResult:=mrok
 else
  if dbgrid1.SelectedRows.Count>1 then
   if self.find_std_error then
    showmessage('出错了!在选择多个送货单号时,必须是同一个客户,同一货币!!')
   else
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
else
 showmessage('客户未定义A/R帐目对应的会计科目!');
end;

procedure TForm_packlist.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if aqd439.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
