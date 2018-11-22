unit invt_recept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TForm_invtship = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    aqwz95: TADOQuery;
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
    CheckBox1: TCheckBox;
    aqwz95INV_NAME: TStringField;
    aqwz95INV_DESCRIPTION: TStringField;
    aqwz95GRN_NUMBER: TStringField;
    aqwz95DELIVER_NUMBER: TStringField;
    aqwz95PRICE: TBCDField;
    aqwz95TAX_2: TBCDField;
    aqwz95CURRENCY_PTR: TIntegerField;
    aqwz95CURR_CODE: TStringField;
    aqwz95CURR_NAME: TStringField;
    aqwz95UNIT_NAME: TStringField;
    aqwz95SUPP_PTR: TIntegerField;
    aqwz95CODE: TStringField;
    aqwz95ABBR_NAME: TStringField;
    aqwz95SUPPLIER_NAME: TStringField;
    aqwz95EXCHANGE_RATE: TBCDField;
    aqwz95RKEY: TIntegerField;
    aqwz95QUANTITY: TFloatField;
    aqwz95TRAN_DATE: TDateTimeField;
    aqwz95EMPLOYEE_NAME: TStringField;
    Panel1: TPanel;
    aqwz95amount: TFloatField;
    aqwz95tax_amount: TFloatField;
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
  Form_invtship: TForm_invtship;

implementation

uses datamd;

{$R *.dfm}
function TForm_invtship.find_std_error():boolean;
var
 std_number:array of array of integer;
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
   std_number[i,0]:=self.aqwz95SUPP_PTR.Value;
   std_number[i,1]:=self.aqwz95CURRENCY_PTR.Value;
  end;
  dbgrid1.DataSource.DataSet.EnableControls;

 for i:=low(std_number) to high(std_number)-1  do
  begin
  for j:=i+1 to high(std_number) do
  if (std_number[i,0]<>std_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
     (std_number[i,1]<>std_number[j,1])  then  //stringgrid的下标，正好相反

   begin
    find_std_error:=true;
    find_error:=true;
    break;
   end;
   if find_error then break;
  end;
end;

procedure TForm_invtship.NewGridWnd(var Message: TMessage);
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

procedure TForm_invtship.BitBtn1Click(Sender: TObject);
begin
self.aqwz95.Close;
aqwz95.Parameters[0].Value:=dtpk1.date;
aqwz95.Parameters[1].Value:=dtpk2.date+1;
if trim(edit1.Text)='' then
 begin
  aqwz95.SQL.Delete(aqwz95.SQL.Count-2);
  aqwz95.SQL.Insert(aqwz95.SQL.Count-1,'');
 end
else
 begin
  aqwz95.SQL.Delete(aqwz95.SQL.Count-2);
  case combobox1.ItemIndex of
  0:
  aqwz95.SQL.Insert(aqwz95.SQL.Count-1,'and data0023.code like ''%'+trim(edit1.Text)+'%''');
  1:
  aqwz95.SQL.Insert(aqwz95.SQL.Count-1,'and data0023.abbr_name like ''%'+trim(edit1.Text)+'%''');
  2:
  aqwz95.SQL.Insert(aqwz95.SQL.Count-1,'and Data0456.DELIVER_NUMBER like ''%'+trim(edit1.Text)+'%''');
  3:
  aqwz95.SQL.Insert(aqwz95.SQL.Count-1,'and Data0456.GRN_NUMBER like ''%'+trim(edit1.Text)+'%''');
  end;
 end;
self.aqwz95.Open;
if aqwz95.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtship.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aqwz95.SQL.Text);
end;

procedure TForm_invtship.FormActivate(Sender: TObject);
begin
self.aqwz95.Close;
aqwz95.Parameters[0].Value := dtpk1.date;
aqwz95.Parameters[1].Value := dtpk2.date+1;
aqwz95.Open;
if aqwz95.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtship.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_invtship.Button1Click(Sender: TObject);
begin
if dbgrid1.SelectedRows.Count=1 then
 ModalResult:=mrok
else
 if dbgrid1.SelectedRows.Count>1 then
 if self.find_std_error then
  showmessage('出错了!在选择多个退货装运时,必须是同一个供应商,同一货币!')
 else
  ModalResult:=mrok
 else
  showmessage('至少选择一条入仓单号!');
end;

procedure TForm_invtship.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.aqwz95RKEY.Value;
  self.aqwz95.DisableControls;
  aqwz95.First;
  while not aqwz95.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   aqwz95.Next;
  end;
  self.aqwz95.EnableControls;
   aqwz95.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.aqwz95RKEY.Value;
  self.aqwz95.DisableControls;
  aqwz95.First;
  while not aqwz95.Eof do
  begin
   if self.aqwz95RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   aqwz95.Next;
  end;
  self.aqwz95.EnableControls;
   aqwz95.Locate('rkey',rkey,[]);
 end;
end;

end.
