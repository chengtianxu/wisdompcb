unit invt_recept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,DateUtils;

type
  TForm_invtrecept = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    aqwz456: TADODataSet;
    aqwz456RKEY: TIntegerField;
    aqwz456GRN_NUMBER: TStringField;
    aqwz456DELIVER_NUMBER: TStringField;
    aqwz456PO_NUMBER: TStringField;
    aqwz456ship_DATE: TDateTimeField;
    aqwz456EMPLOYEE_NAME: TStringField;
    aqwz456TTYPE: TSmallintField;
    aqwz456CURR_NAME: TStringField;
    aqwz456CURR_CODE: TStringField;
    aqwz456amount: TBCDField;
    aqwz456SUPP_PTR: TIntegerField;
    aqwz456warehouse_ptr: TIntegerField;
    aqwz456CODE: TStringField;
    aqwz456SUPPLIER_NAME: TStringField;
    aqwz456PAYMENT_TERMS: TSmallintField;
    aqwz456ABBR_NAME: TStringField;
    aqwz456WAREHOUSE_CODE: TStringField;
    aqwz456WAREHOUSE_NAME: TStringField;
    aqwz456currency_ptr: TIntegerField;
    aqwz456v_type: TStringField;
    Label3: TLabel;
    aqwz456ACC_PAYABLE_PTR: TIntegerField;
    aqwz456name15: TStringField;
    aqwz456exch_rate: TFloatField;
    aqwz456TAX_2: TFloatField;
    ComboBox1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    function find_std_error():boolean;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);    
  public
    { Public declarations }
  end;

var
  Form_invtrecept: TForm_invtrecept;

implementation

uses datamd, main;

{$R *.dfm}
procedure TForm_invtrecept.NewGridWnd(var Message: TMessage);
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

procedure TForm_invtrecept.FormActivate(Sender: TObject);
begin
self.aqwz456.Close;
aqwz456.Parameters[1].Value := dtpk1.date;
aqwz456.Parameters[2].Value := dtpk2.date+1;
aqwz456.Open;
edit1.Text:=''; 
with dm.ADOQuery4 do
 begin
   close;
   sql.Clear;
   sql.Add('select WAREHOUSE_CODE from data0015');
   open;
   comboBox1.Items.Clear();
   aqwz456.Filter:='';
   while not eof do
    begin
     combobox1.Items.Add(dm.ADOQuery4.FieldValues['WAREHOUSE_CODE']);
     next;
    end;
   combobox1.Items.Add('全部');
   combobox1.ItemIndex:=combobox1.Items.Count-1;
  end;
  dbgrid1.SetFocus;
end;

procedure TForm_invtrecept.FormCreate(Sender: TObject);
begin
 field_name:='CODE';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 dtpk1.Date:=form1.sys_shortdate-dayof(form1.sys_shortdate)+1;
 dtpk2.Date:=form1.sys_shortdate;
end;

procedure TForm_invtrecept.Button1Click(Sender: TObject);
begin
if self.aqwz456ACC_PAYABLE_PTR.Value>0 then
 if dbgrid1.SelectedRows.Count=1 then
  ModalResult:=mrok
 else
  if dbgrid1.SelectedRows.Count>1 then
  if self.find_std_error then
   showmessage('出错了!在选择多个入仓单号时,必须是同一个供应商,同一货币,同一汇率,同一税率,同一入仓类型的入库!')
  else
   ModalResult:=mrok
  else
   showmessage('至少选择一条入仓单号!')
else
 showmessage('供应商未定义A/P帐目对应的会计科目!');
end;

procedure TForm_invtrecept.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.aqwz456RKEY.Value;
  self.aqwz456.DisableControls;
  aqwz456.First;
  while not aqwz456.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   aqwz456.Next;
  end;
  self.aqwz456.EnableControls;
   aqwz456.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.aqwz456RKEY.Value;
  self.aqwz456.DisableControls;
  aqwz456.First;
  while not aqwz456.Eof do
  begin
   if self.aqwz456RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   aqwz456.Next;
  end;
  self.aqwz456.EnableControls;
   aqwz456.Locate('rkey',rkey,[]);
 end;
end;

function TForm_invtrecept.find_std_error():boolean;
var
 std_number:array of array of currency;
 i,j:byte;
 find_error:boolean;
begin
 find_std_error:=false; //开始标识为没有错误
 find_error:=false;
 setlength(std_number,dbgrid1.SelectedRows.Count,5);//设置数组下标个数
 dbgrid1.DataSource.DataSet.DisableControls;
 for i:=low(std_number) to high(std_number)  do
  begin
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   std_number[i,0]:=self.aqwz456SUPP_PTR.Value;
   std_number[i,1]:=self.aqwz456CURRENCY_PTR.Value;
   std_number[i,2]:=self.aqwz456TTYPE.Value;
   std_number[i,3]:=self.aqwz456exch_rate.Value;
   std_number[i,4]:=self.aqwz456TAX_2.Value;
  end;
 dbgrid1.DataSource.DataSet.EnableControls;

 for i:=low(std_number) to high(std_number)-1  do
  begin
   for j:=i+1 to high(std_number) do
   if (std_number[i,0]<>std_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
      (std_number[i,1]<>std_number[j,1]) or   //stringgrid的下标，正好相反
      (std_number[i,2]<>std_number[j,2]) or
      (std_number[i,3]<>std_number[j,3]) or
      (std_number[i,4]<>std_number[j,4]) then
   begin
    find_std_error:=true;
    find_error:=true;
    break;
   end;
   if find_error then break;
  end;
end;

procedure TForm_invtrecept.Edit1Change(Sender: TObject);
begin
 if checkbox1.Checked then checkbox1.Checked := false;
  self.aqwz456.DisableControls;
  aqwz456.First;
  while not aqwz456.Eof do
  begin
   if dbgrid1.SelectedRows.CurrentRowSelected then
   dbgrid1.SelectedRows.CurrentRowSelected:=false;
   aqwz456.Next;
  end;
  self.aqwz456.EnableControls;
if(combobox1.ItemIndex<>combobox1.Items.Count-1) and (trim(edit1.Text)<>'') then
 aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
  +' and WAREHOUSE_CODE = '''+combobox1.Items.Strings[combobox1.ItemIndex]+''''
else
  if (combobox1.ItemIndex<>combobox1.Items.Count-1) and (trim(edit1.Text)='') then
 aqwz456.Filter:= 'WAREHOUSE_CODE = '''+combobox1.Items.Strings[combobox1.ItemIndex]+''''
else
  if (combobox1.ItemIndex=combobox1.Items.Count-1) and (trim(edit1.Text)<>'') then
   aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
else
  aqwz456.Filter:='';

end;

procedure TForm_invtrecept.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aqwz456.IndexFieldNames)  then
 aqwz456.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label3.Caption:=column.Title.Caption;
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


procedure TForm_invtrecept.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if aqwz456.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtrecept.ComboBox1Change(Sender: TObject);
begin
 if(combobox1.ItemIndex<>combobox1.Items.Count-1) and (trim(edit1.Text)<>'') then
 aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
  +' and WAREHOUSE_CODE = '''+combobox1.Items.Strings[combobox1.ItemIndex]+''''
else
  if (combobox1.ItemIndex<>combobox1.Items.Count-1) and (trim(edit1.Text)='') then
 aqwz456.Filter:= 'WAREHOUSE_CODE = '''+combobox1.Items.Strings[combobox1.ItemIndex]+''''
else
  if (combobox1.ItemIndex=combobox1.Items.Count-1) and (trim(edit1.Text)<>'') then
   aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
else
  aqwz456.Filter:='';
end;

end.
