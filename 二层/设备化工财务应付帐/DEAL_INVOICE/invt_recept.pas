unit invt_recept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons;

type
  TForm_invtrecept = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    aqwz456: TADOQuery;
    aqwz456RKEY: TIntegerField;
    aqwz456GRN_NUMBER: TStringField;
    aqwz456DELIVER_NUMBER: TStringField;
    aqwz456PO_NUMBER: TStringField;
    aqwz456ship_DATE: TDateTimeField;
    aqwz456EMPLOYEE_NAME: TStringField;
    aqwz456TTYPE: TWordField;
    aqwz456CURR_NAME: TStringField;
    aqwz456amount: TBCDField;
    aqwz456v_type: TStringField;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    aqwz456CURRENCY_PTR: TIntegerField;
    aqwz456EXCHANGE_RATE: TBCDField;
    aqwz456SUPP_PTR: TIntegerField;
    aqwz456warehouse_ptr: TIntegerField;
    aqwz456CODE: TStringField;
    aqwz456SUPPLIER_NAME: TStringField;
    aqwz456WAREHOUSE_CODE: TStringField;
    aqwz456WAREHOUSE_NAME: TStringField;
    aqwz456PAYMENT_TERMS: TSmallintField;
    CheckBox1: TCheckBox;
    aqwz456abbr_name: TStringField;
    procedure aqwz456CalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    function find_std_error():boolean;
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);    
  public
    { Public declarations }
  end;

var
  Form_invtrecept: TForm_invtrecept;

implementation

uses datamd;

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

procedure TForm_invtrecept.aqwz456CalcFields(DataSet: TDataSet);
begin
 case
  self.Aqwz456TTYPE.Value of
  1:Aqwz456v_type.Value:='编码入库';
  2:Aqwz456v_type.Value:='杂项入库';
  3:Aqwz456v_type.Value:='直接入库';
 end;
end;

procedure TForm_invtrecept.BitBtn1Click(Sender: TObject);
begin
self.aqwz456.Close;
aqwz456.Parameters[0].Value:=dtpk1.date;
aqwz456.Parameters[1].Value:=dtpk2.date+1;
if trim(edit1.Text)='' then
 begin
  aqwz456.SQL.Delete(aqwz456.SQL.Count-8);
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'');
 end
else
 begin
  aqwz456.SQL.Delete(aqwz456.SQL.Count-8);
  case combobox1.ItemIndex of
  0:
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'and data0023.code like ''%'+trim(edit1.Text)+'%''');
  1:
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'and data0023.abbr_name like ''%'+trim(edit1.Text)+'%''');
  2:
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'and Data0456.DELIVER_NUMBER like ''%'+trim(edit1.Text)+'%''');
  3:
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'and Data0456.GRN_NUMBER like ''%'+trim(edit1.Text)+'%''');
  4:
  aqwz456.SQL.Insert(aqwz456.SQL.Count-7,'and Data0070.PO_NUMBER like ''%'+trim(edit1.Text)+'%''');
  end;
 end;
self.aqwz456.Open;
if aqwz456.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtrecept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aqwz456.SQL.Text);
end;

procedure TForm_invtrecept.FormActivate(Sender: TObject);
begin
self.aqwz456.Close;
aqwz456.Parameters[0].Value := dtpk1.date;
aqwz456.Parameters[1].Value := dtpk2.date+1;
aqwz456.Open;
if aqwz456.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtrecept.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_invtrecept.Button1Click(Sender: TObject);
begin
if dbgrid1.SelectedRows.Count=1 then
 ModalResult:=mrok
else
 if dbgrid1.SelectedRows.Count>1 then
 if self.find_std_error then
  showmessage('出错了!在选择多个入仓单号时,必须是同一个供应商,同一货币,同一工厂,同一入仓类型的入库!')
 else
  ModalResult:=mrok
 else
  showmessage('至少选择一条入仓单号!');
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
 std_number:array of array of integer;
 i,j:byte;
 find_error:boolean;
begin
 find_std_error:=false; //开始标识为没有错误
 find_error:=false;
 setlength(std_number,dbgrid1.SelectedRows.Count,4);//设置数组下标个数
 dbgrid1.DataSource.DataSet.DisableControls;

 for i:=low(std_number) to high(std_number)  do
  begin
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   std_number[i,0]:=self.aqwz456warehouse_ptr.Value;
   std_number[i,1]:=self.aqwz456SUPP_PTR.Value;
   std_number[i,2]:=self.aqwz456CURRENCY_PTR.Value;
   std_number[i,3]:=self.aqwz456TTYPE.Value;
  end;
  dbgrid1.DataSource.DataSet.EnableControls;

 for i:=low(std_number) to high(std_number)-1  do
  begin
  for j:=i+1 to high(std_number) do
  if (std_number[i,0]<>std_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
     (std_number[i,1]<>std_number[j,1]) or   //stringgrid的下标，正好相反
     (std_number[i,2]<>std_number[j,2]) or
     (std_number[i,3]<>std_number[j,3]) then
   begin
    find_std_error:=true;
    find_error:=true;
    break;
   end;
   if find_error then break;
  end;
end;

end.
