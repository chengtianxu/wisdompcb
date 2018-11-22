unit payment_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, ExtCtrls, ToolWin,
  DateUtils,StrUtils;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edit5: TEdit;
    dtpk1: TDateTimePicker;
    Edit6: TEdit;
    StGd1: TStringGrid;
    BitBtn2: TBitBtn;
    Edit7: TEdit;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    stgd2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    ComboBox1: TComboBox;
    Edit13: TEdit;
    Edit15: TEdit;
    Button3: TButton;
    Button4: TButton;
    ToolBar1: TToolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label25: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Edit_fyear: TEdit;
    Edit_number: TEdit;
    Edit_PERIOD: TEdit;
    Edit_date: TEdit;
    report_Check: TCheckBox;
    Edit_ATTACHED: TEdit;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Edit_employee: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    sgrid2: TStringGrid;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    abbr_name: TLabel;
    RadioGroup1: TRadioGroup;
    BATCH_NUMBER: TEdit;
    Label29: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure load_dedit(supp_ptr,curr_ptr,wh_ptr:integer);
    procedure calculate_Payment();
    procedure Button1Click(Sender: TObject);
    procedure StGd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure stgd2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StGd1KeyPress(Sender: TObject; var Key: Char);
    procedure StGd1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgd2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgd2Exit(Sender: TObject);
    procedure StGd1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_error(number:string):boolean;
    procedure update_128(v_seed: string);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StGd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure stgd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StGd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1Exit(Sender: TObject);
    procedure re_calculate;
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function get_col5(row:integer):currency;
    function get_col6(row:integer):currency;
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit_dateKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_dateExit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    function find_invoicerkey(rkey107: integer): boolean;
    procedure update_invoice();
    procedure update_107_132();
    procedure Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Exit(Sender: TObject);
  private
    { Private declarations }
   bank_ptr,warehouse_ptr,supp_ptr,curr_ptr:integer;
  public
    { Public declarations }
   edit_flag:byte;  //0,新增1,编辑2,检查
   accbank_gl_ptr,accsupp_gl_ptr:integer;
   function get_name(sgrid:TStringGrid):string;
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
implementation

uses BankSearch, datamd, curr_search, main, supplier_search,
  warehouse_search, AcctSearch, voucher_dictionary, voucher_report,
  invoice_search,common;

{$R *.dfm}
function tform2.get_name(sgrid:TStringGrid):string;
var
  i:Integer;
  str:string;
begin
 for i:=1 to sgrid.RowCount-1 do
 begin
  if StrToFloat(sgrid.Cells[5,i])>0 then
  begin
   str:=sgrid.Cells[1,i];
   if StrToInt(str[6])>0 then
   begin
    Result:='付'+abbr_name.Caption+leftstr(str,4)+'年'+str[6]+str[7]+'月份'+'货款';
   end
   else
   begin
    Result:='付'+abbr_name.Caption+leftstr(str,4)+'年'+str[7]+'月份'+'货款';
   end;
  Break;
  end;
 end;
end;
procedure tform2.update_107_132();
var
 i:integer;
begin
 for i:=1 to stgd1.RowCount-1 do
  if (strtofloat(stgd1.Cells[5,i])>0) or (strtofloat(stgd1.Cells[6,i])>0) then
   begin
    dm.ADO130.Append;
    dm.ADO130CHECK_PTR.Value:=dm.ADO129RKEY.Value;
    dm.ADO130INVOICE_PTR.Value:=strtoint(stgd1.Cells[7,i]);
    dm.ADO130AMOUNT.Value:=strtofloat(stgd1.Cells[5,i]);
    dm.ADO130CASH_DISCOUNT.Value:=strtofloat(stgd1.Cells[6,i]);
    dm.ADO130.Post;
   end;

   with dm.ADOQuery1 do         //更新发票已付款及，折扣金额
    begin
     close;
     sql.Clear;
     sql.Add('update data0107');
     sql.Add('set AMT_PAID=AMT_PAID+data0130.AMOUNT,');
     sql.Add('CASH_DISC=CASH_DISC+data0130.CASH_DISCOUNT');
     sql.Add('from data0130 inner join data0107');
     sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新发票装状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0107');
     sql.Add('set STATUS=2');
     sql.Add('from data0130 inner join data0107');
     sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
     sql.Add('where data0107.inv_total=data0107.amt_paid+data0107.cash_disc');
     sql.Add('and data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

 for i:=1 to stgd2.RowCount-1 do
  if (strtofloat(stgd2.Cells[7,i])>0) then
   begin
    dm.ADO130.Append;
    dm.ADO130CHECK_PTR.Value:=dm.ADO129RKEY.Value;
    dm.ADO130DEBIT_AP_HEAD_PTR.Value:=strtoint(stgd2.Cells[8,i]);
    dm.ADO130AMOUNT.Value:=strtofloat(stgd2.Cells[7,i]);
    dm.ADO130.Post;
   end;

   with dm.ADOQuery1 do         //更新借项备忘
    begin
     close;
     sql.Clear;
     sql.Add('update data0132');
     sql.Add('set AVL_AMT=AVL_AMT-data0130.AMOUNT');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新借项备忘
    begin
     close;
     sql.Clear;
     sql.Add('update data0132');
     sql.Add('set memo_status=2');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     sql.Add('and data0132.avl_amt=0');
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新预付支票状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=2');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('inner join data0129 on');
     sql.Add('data0132.srce_ptr=data0129.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     sql.Add('and data0132.avl_amt=0');
     sql.Add('and data0132.memo_tp=4');
     ExecSQL;
    end;
end;

procedure TForm2.update_invoice();
begin
   with dm.ADOQuery1 do         //更新发票已付款及，折扣金额
    begin
     close;
     sql.Clear;
     sql.Add('update data0107');
     sql.Add('set AMT_PAID=AMT_PAID-data0130.AMOUNT,');
     sql.Add('CASH_DISC=CASH_DISC-data0130.CASH_DISCOUNT');
     sql.Add('from data0130 inner join data0107');
     sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新发票装状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0107');
     sql.Add('set STATUS = 1');
     sql.Add('from data0130 inner join data0107');
     sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新借项备忘可用金额
    begin
     close;
     sql.Clear;
     sql.Add('update data0132');
     sql.Add('set AVL_AMT=AVL_AMT+data0130.AMOUNT');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新借项备忘
    begin
     close;
     sql.Clear;
     sql.Add('update data0132');
     sql.Add('set memo_status=1');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     sql.Add('and data0132.avl_amt>0');
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新预付支票状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=1');
     sql.Add('from data0130 inner join data0132');
     sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
     sql.Add('inner join data0129 on');
     sql.Add('data0132.srce_ptr=data0129.rkey');
     sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     sql.Add('and data0132.avl_amt>0');
     sql.Add('and data0132.memo_tp=4');
     ExecSQL;
    end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('delete data0130');
   sql.Add('where data0130.CHECK_PTR='+dm.ado129RKEY.AsString);
   ExecSQL;
  end;
end;

function TForm2.find_invoicerkey(rkey107: integer): boolean;
var
 i:word;
begin
result:=false;
for i:=1 to stgd1.RowCount-1 do
 if strtoint(stgd1.Cells[7,i])=rkey107 then
  begin
   result:=true;
   break;
  end;
end;

function TForm2.get_col5(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[5,i])<>'') and (i<>row) then
   result:=result+strtofloat(sgrid1.Cells[5,i]);
  end;
end;

function TForm2.get_col6(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[6,i])<>'') and (i<>row) then
   result:=result+strtofloat(sgrid1.Cells[6,i]);
  end;
end;

procedure TForm2.re_calculate;
var
 i:word;
 vdb,vcr:currency;
begin
vdb:=0;
vcr:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if trim(sgrid1.cells[5,i])<>'' then
    vdb:=vdb+strtofloat(trim(sgrid1.cells[5,i]));
   if trim(sgrid1.cells[6,i])<>'' then
    vcr:=vcr+strtofloat(trim(sgrid1.cells[6,i]));
  end;
statictext1.Caption:=Floattostrf(vdb,ffNumber,10,2);
statictext2.Caption:=Floattostrf(vcr,ffNumber,10,2);
end;

procedure TForm2.calculate_Payment;
var
 i:integer;
 pay_amt,disc_amt,exch_amt,debit_amt,yinfu:currency;
begin
 pay_amt:=0;
 disc_amt:=0;
 exch_amt:=0;
 debit_amt:=0;
 yinfu:=0;
 for i:=1 to stgd1.RowCount-1 do
  begin
   if strtofloat(stgd1.Cells[5,i])>0 then
    begin
     pay_amt:=pay_amt+strtofloat(stgd1.Cells[5,i]);
     if (strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text)) and
        (self.RadioGroup1.ItemIndex=1) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[5,i])*
       (strtofloat(stgd1.Cells[3,i])-strtofloat(edit6.Text));      //记汇兑损溢
    end;

   if strtofloat(stgd1.Cells[6,i])>0 then
    begin
     disc_amt:=disc_amt+strtofloat(stgd1.Cells[6,i]);
     if (strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text)) and
        (self.RadioGroup1.ItemIndex=1) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[6,i])*
       (strtofloat(edit6.Text)-strtofloat(stgd1.Cells[3,i]));      //记汇兑损溢
    end;
   yinfu:=yinfu+strtofloat(stgd1.Cells[4,i]);
  end;

 for i:=1 to stgd2.RowCount-1 do
  begin
   if strtofloat(stgd2.Cells[7,i])>0 then
    begin
     debit_amt:=debit_amt+strtofloat(stgd2.Cells[7,i]);
     if (strtofloat(edit6.Text)<>strtofloat(stgd2.Cells[6,i])) and
        (self.RadioGroup1.ItemIndex=1) then
     exch_amt:=exch_amt+strtofloat(stgd2.Cells[7,i])*
     (strtofloat(edit6.Text)-strtofloat(stgd2.Cells[6,i]));//记汇兑损溢
    end;
  end;

edit9.Text:=formatfloat('0.00',pay_amt); //付款合计
edit10.Text:=formatfloat('0.00',disc_amt);   //折扣合计
edit12.Text:=formatfloat('0.00',debit_amt); //借方备忘合计
edit11.Text:=formatfloat('0.00',exch_amt);  //记汇兑损溢
edit13.Text:=formatfloat('0.00',yinfu);  //应付合计
end;

procedure TForm2.update_128(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin

 dm.ado128.Close;
 dm.ADO128.Parameters[0].Value:=dm.ADO129BANK_PTR.Value;
 dm.ado128.Open;

 dm.ADO128.Edit;
 dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-dm.ADO129AMOUNT.Value;

 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ADO128bank_current_check.Value:=new_seed;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ADO128bank_current_check.Value:=new_seed;
    end;
 dm.ADO128.Post;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm2.FormActivate(Sender: TObject);
VAR
  sql_text:string;
  i:integer;
begin
stgd1.Cells[0,0]:='发票编码';
stgd1.Cells[1,0]:='发票日期';
stgd1.Cells[2,0]:='发票金额';
stgd1.Cells[3,0]:='入帐汇率';
stgd1.Cells[4,0]:='应付金额';
stgd1.Cells[5,0]:='付款金额';
stgd1.Cells[6,0]:='现金折扣';
stgd1.Cells[7,0]:='rkey107';
StGd1.ColWidths[7]:=-1;
stgd1.Cells[8,0]:='税票标识';


stgd2.Cells[0,0]:='借项备忘号';
stgd2.Cells[1,0]:='类型';
stgd2.Cells[2,0]:='参考号';
stgd2.Cells[3,0]:='收货日期';
stgd2.Cells[4,0]:='借项金额';
stgd2.Cells[5,0]:='可用金额';
stgd2.Cells[6,0]:='入帐汇率';
stgd2.Cells[7,0]:='使用金额';
stgd2.Cells[8,0]:='rkey132';
StGd2.ColWidths[8]:=-1;
stgd2.Cells[9,0]:='税票标识';

sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';

if edit_flag<>0 then //检查或者编辑
 begin
  dm.ADO129.Close;
  dm.ADO129.Parameters[0].Value:=dm.AQ129RKEY.Value;
  dm.ADO129.Open;
  self.RadioGroup1.ItemIndex := dm.ADO129trans_pl.Value;
  self.bank_ptr := dm.ADO129BANK_PTR.Value;
  self.warehouse_ptr := dm.ADO129warehouse_ptr.Value;
  self.supp_ptr := dm.ADO129SRCE_PTR.Value;
  self.curr_ptr := dm.ADO129CURR_PTR.Value;
  self.accsupp_gl_ptr := dm.AQ129ACC_PAYABLE_PTR.Value;
  self.accbank_gl_ptr := dm.AQ129GL_ACCT_PTR.Value;
  if edit_flag=1 then //编辑
  begin
   if curr_ptr<>1 then
    edit6.Enabled:=true
   else
    edit6.Enabled:=false;
  end
  else
   edit6.Enabled:=false;

  WITH DM.ADOQuery1 do
  begin
   close;
   SQL.Clear ;
   sql.Add('Select data0130.INVOICE_PTR,data0107.invoice_no,inv_date,amt_paid,');
   sql.Add('inv_total-amt_paid-cash_disc+data0130.amount+data0130.cash_discount as amt_payment,');
   sql.Add('data0107.ex_rate,data0107.inv_total,');
   sql.Add('data0130.AMOUNT,data0130.CASH_DISCOUNT,');
    sql.Add('case data0107.GLPTR_STATUS when 0 then ''否'' when 1 then ''是'' end as 税票标识');
   sql.Add('from data0130 inner join data0107');
   sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
   sql.Add('where data0130.check_ptr='+dm.AQ129rkey.AsString);
   sql.Add('order by data0107.inv_date');
   open;
  end;

  while not dm.ADOQuery1.Eof do
  begin
   stgd1.RowCount:=stgd1.RowCount+1;
   stgd1.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['invoice_no'];
   stgd1.Cells[1,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_date').AsString;
   stgd1.Cells[2,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_total').AsString;
   stgd1.Cells[3,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ex_rate').AsString;
   stgd1.Cells[4,stgd1.RowCount-1]:= dm.ADOQuery1.Fieldbyname('amt_payment').AsString;
   stgd1.Cells[5,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
   stgd1.Cells[6,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('CASH_DISCOUNT').AsString;
   stgd1.Cells[7,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('INVOICE_PTR').AsString;//107.rkey
   stgd1.Cells[8,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('税票标识').AsString;//税票标识

   dm.ADOQuery1.Next;
  end;
  if stgd1.RowCount>1 then stgd1.FixedRows:=1;
  if stgd1.RowCount>6 then
   stgd1.ColWidths[5]:=79
  else
   stgd1.ColWidths[5]:=97;

  sql_text:=
  'SELECT MEMO_NUMBER, ent_DATE, Data0132.AMOUNT, REF_NUMBER, EX_RATE,data0132.rkey,'+#13
  +'case data0132.memo_tp when 2 then ''扣款'''+#13
  +'when 3 then ''退货'' when 4 then ''预收'' end as type,'+#13
  +'data0132.avl_amt+isnull(abs(data0130.AMOUNT),0) as avl_amount,'+#13
  +'isnull(abs(data0130.AMOUNT),0) as amt_detbit,'+#13
  +'case data0132.GLPTR_STATUS when 0 then ''否'' when 1 then ''是'' end as 税票标识'+#13
  +'FROM data0130 right outer join Data0132'+#13
  +'on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey'+#13
  +'and data0130.check_ptr='+dm.ADO129RKEY.AsString+#13
  +'where data0132.avl_amt+isnull(abs(data0130.amount),0)>0'+#13
  +'and data0132.SUPP_PTR='+dm.ADO129SRCE_PTR.AsString+#13
  +'and data0132.CURRENCY_PTR='+dm.ADO129CURR_PTR.AsString+#13
  +'order by data0132.memo_number'+#13;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:=sql_text;
   open;
  end;
 while not dm.ADOQuery1.Eof do
  begin
  stgd2.RowCount:=stgd2.RowCount+1;
  stgd2.Cells[0,stgd2.RowCount-1]:=dm.ADOQuery1.FieldValues['MEMO_NUMBER'];
  stgd2.Cells[1,stgd2.RowCount-1]:=dm.ADOQuery1.FieldValues['type'];
  stgd2.Cells[2,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('REF_NUMBER').AsString;
  stgd2.Cells[3,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ent_DATE').AsString;
  stgd2.Cells[4,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
  stgd2.Cells[5,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('avl_amount').AsString;
  stgd2.Cells[6,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EX_RATE').AsString;
  stgd2.Cells[7,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('amt_detbit').AsString;
  stgd2.Cells[8,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('rkey').AsString;//132.rkey
  stgd2.Cells[9,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('税票标识').AsString;//税票标识
  dm.ADOQuery1.Next;
  end;
 if stgd2.RowCount>1 then
  stgd2.FixedRows:=1;

 if stgd2.RowCount>4 then
  stgd2.ColWidths[5]:=79
 else
  stgd2.ColWidths[5]:=96;
 self.calculate_Payment;

  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.AQ129rkey105.Value;
  dm.Aqd105.Open;
  if not dm.Aqd105.IsEmpty then
  begin
  self.Edit_number.Text:=dm.Aqd105VOUCHER.Value;
  self.BATCH_NUMBER.Text:=dm.Aqd105BATCH_NUMBER.Value;
  self.Edit_date.Text:=dm.Aqd105ENTERED_DT.AsString;
  self.Edit_fyear.Text:=dm.Aqd105FYEAR.AsString;
  self.Edit_PERIOD.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  self.Edit_employee.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
  dm.Aqd106.Close;
  dm.Aqd106.Parameters[0].Value:=dm.Aqd105rkey.Value;
  dm.Aqd106.Open;
  sgrid1.RowCount:=dm.Aqd106.RecordCount+2;
  sgrid2.RowCount:=sgrid1.RowCount;
  for i:=1 to dm.Aqd106.RecordCount do
   begin
    sgrid1.Cells[0,i]:=dm.Aqd106DESCRIPTION.Value;
    sgrid1.Cells[1,i]:=dm.Aqd106gl_desc.Value;
    sgrid1.Cells[2,i]:=dm.aqd106curr_code.value;
    sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString; //原币
    if dm.Aqd106EXCH_RATE.Value>0 then
     sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value)
    else
     sgrid1.Cells[3,i]:='0.00';

    sgrid2.Cells[0,i]:=dm.Aqd106GL_ACCT_NO_PTR.AsString;
    sgrid2.Cells[1,i]:=dm.Aqd106CURR_PTR.AsString;
    if dm.Aqd106D_C.Value='D' then
     sgrid1.Cells[5,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value)
    else
     sgrid1.Cells[6,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value);
    dm.Aqd106.Next;
   end;
  dm.Aqd105.Close;
  dm.Aqd106.Close;
  end;
 end;

 if sgrid1.RowCount=2 then
  begin
   speedbutton3.Enabled:=false;
   speedbutton4.Enabled:=false;
   speedbutton5.Enabled:=false;
   speedbutton6.Enabled:=false;
   speedbutton7.Enabled:=false;
   speedbutton8.Enabled:=false;
  end
 else
  self.re_calculate();//重新计算借货金额
 PageControl1.ActivePageIndex:=0;

end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
FrmBankSearch:=tFrmBankSearch.Create(application);
FrmBankSearch.Edit1.Text:=edit2.Text;
if FrmBankSearch.ShowModal=mrok then
 if bank_ptr<>FrmBankSearch.Adodata0128rkey.Value then
  begin
  self.bank_ptr:=FrmBankSearch.Adodata0128rkey.Value;
  self.curr_ptr:=FrmBankSearch.Adodata0128currency_ptr.Value;
  edit2.Text:=FrmBankSearch.Adodata0128bank_name.Value;
  edit7.Text:=FrmBankSearch.Adodata0128bal_amount.AsString;
  edit5.Text:=FrmBankSearch.Adodata0128curr_code.Value;
  label11.Caption:=FrmBankSearch.Adodata0128curr_name.Value;
  edit6.Text:=FrmBankSearch.Adodata0128BASE_TO_OTHER.AsString;
  edit1.Text:=trim(FrmBankSearch.Adodata0128bank_current_check.Value);
  self.accbank_gl_ptr:=FrmBankSearch.Adodata0128gl_acct_ptr.Value;
  if self.curr_ptr=1 then
   edit6.Enabled:=false
  else
   edit6.Enabled:=true;
  stgd1.RowCount:=1;
  stgd2.RowCount:=1;
  stgd1.ColWidths[5]:=97;
  stgd2.ColWidths[5]:=96;
  edit9.Text:='0.00';
  edit10.Text:='0.00';
  edit12.Text:='0.00';
  edit11.Text:='0.00';
  end;
FrmBankSearch.Free;
end;

procedure TForm2.load_dedit(supp_ptr, curr_ptr,wh_ptr: integer);
var
 sql_text:string;
begin

 sql_text:=
 'SELECT MEMO_NUMBER, case memo_tp when 2 then ''扣款'''+#13+
 'when 3 then ''退货'' when 4 then ''预收'' end as type,'+#13+
 'ENT_DATE, AMOUNT, AVL_AMT, REF_NUMBER, EX_RATE,rkey,'+#13+
 'case data0132.GLPTR_STATUS when 0 then ''否'' when 1 then ''是'' end as 税票标识'+#13+
  'FROM dbo.Data0132'+#13+
  'where memo_status=1';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:=sql_text;
   sql.Add('and supp_ptr='+inttostr(supp_ptr));
   sql.Add('and currency_ptr='+inttostr(curr_ptr));
   sql.Add('and warehouse_ptr='+inttostr(wh_ptr));
   open;
  end;

stgd2.RowCount:=1;

while not dm.ADOQuery1.Eof do
 begin
  stgd2.RowCount:=stgd2.RowCount+1;
  stgd2.Cells[0,stgd2.RowCount-1]:=dm.ADOQuery1.FieldValues['MEMO_NUMBER'];
  stgd2.Cells[1,stgd2.RowCount-1]:=dm.ADOQuery1.FieldValues['type'];
  stgd2.Cells[2,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('REF_NUMBER').AsString;
  stgd2.Cells[3,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ENT_DATE').AsString;
  stgd2.Cells[4,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
  stgd2.Cells[5,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AVL_AMT').AsString;
  stgd2.Cells[6,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EX_RATE').AsString;
  stgd2.Cells[7,stgd2.RowCount-1]:='0.00';
  stgd2.Cells[8,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('rkey').AsString;//132.rkey
  stgd2.Cells[9,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('税票标识').AsString;//税票标识

  dm.ADOQuery1.Next;
 end;
if stgd2.RowCount>1 then stgd2.FixedRows:=1;
if stgd2.RowCount>4 then
 stgd2.ColWidths[5]:=79
else
 stgd2.ColWidths[5]:=96;

 edit12.Text:='0.00';
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if (combobox1.ItemIndex =0) and (trim(edit2.text)='') then
  showmessage('请首先确定现金或者银行帐户')
 else
begin
form_supp:=tform_supp.Create(application);
form_supp.Edit1.Text:=edit4.Text;
if form_supp.ShowModal=mrok then
 begin
 if supp_ptr<>form_supp.ADOdata0023RKEY.Value then
  begin
   if combobox1.ItemIndex = 4 then //转帐支付
    begin
     edit5.Text:=form_supp.ADOData0023curr_code.Value;
     label11.Caption:=form_supp.ADOData0023curr_name.Value;
     self.curr_ptr:=form_supp.ADOData0023currency_ptr.Value;
     edit6.Text:=form_supp.ADOData0023BASE_TO_OTHER.AsString;
     if self.curr_ptr=1 then
      edit6.Enabled:=false
     else
      edit6.Enabled:=true;
     bitbtn6.Enabled:=true; 
    end;
   edit4.Text:=form_supp.ADOdata0023CODE.Value;
   label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
   self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
   self.accsupp_gl_ptr:=form_supp.ADOData0023ACC_PAYABLE_PTR.Value;
   self.abbr_name.Caption:=form_supp.ADOData0023abbr_name.Value;
   if stgd2.RowCount>1 then stgd2.RowCount:=1;
   self.calculate_Payment;
  end;
 end;
form_supp.Free;
end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
form_wh:=tform_wh.Create(application);
if form_wh.ShowModal=mrok then
 begin
  edit3.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
  label9.Caption:=form_wh.ADOQuery1ABBR_NAME.Value;
  self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
 end;
form_wh.Free;
end;

procedure TForm2.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;


procedure TForm2.Button1Click(Sender: TObject);
begin
if (trim(edit3.Text)='') or (trim(edit4.Text)='') or (trim(edit5.Text)='') then
  showmessage('请首先确定工厂，供应商，货币')
else
begin
 WITH DM.ADOQuery1 do
  begin
   close;
   SQL.Clear ;
   sql.Add('Select rkey,invoice_no,inv_date,inv_total,amt_paid,cash_disc,GLPTR_STATUS, ');
   sql.Add('ex_rate,inv_total-amt_paid-cash_disc as amt_payment,');
   sql.Add('case data0107.GLPTR_STATUS when 0 then ''否'' when 1 then ''是'' end as 税票标识');
   sql.Add('from data0107');
   sql.Add('where currency_ptr='+inttostr(self.curr_ptr));
   sql.Add('and data0107.supp_ptr='+inttostr(self.supp_ptr));
   sql.Add('and warehouse_ptr='+inttostr(self.warehouse_ptr));
   sql.Add('and inv_total-amt_paid-cash_disc > 0');
   sql.Add('and status=1');
   sql.Add('order by data0107.inv_date');
   open;
  end;
 stgd1.RowCount:=1;
 while not dm.ADOQuery1.Eof do
  begin
   stgd1.RowCount:=stgd1.RowCount+1;
   stgd1.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['invoice_no'];
   stgd1.Cells[1,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_date').AsString;
   stgd1.Cells[2,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_total').AsString;
   stgd1.Cells[3,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ex_rate').AsString;
   stgd1.Cells[4,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('amt_payment').AsString;

   stgd1.Cells[5,stgd1.RowCount-1]:='0.00';
   stgd1.Cells[6,stgd1.RowCount-1]:='0.00';
   stgd1.Cells[7,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('rkey').AsString;//107.rkey
   stgd1.Cells[8,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('税票标识').AsString;//税票标识

   dm.ADOQuery1.Next;
  end;
 if stgd1.RowCount>1 then
  begin
   stgd1.FixedRows:=1;
   if bitbtn2.Enabled then bitbtn2.Enabled := not bitbtn2.Enabled;
   if bitbtn3.Enabled then bitbtn3.Enabled := not bitbtn3.Enabled;
   if bitbtn5.Enabled then bitbtn5.Enabled := not bitbtn5.Enabled;
   if bitbtn6.Enabled then bitbtn6.Enabled := not bitbtn6.Enabled;
  end;

 if stgd1.RowCount>6 then
  stgd1.ColWidths[5]:=79
 else
  stgd1.ColWidths[5]:=97;

calculate_Payment;
load_dedit(self.supp_ptr,self.curr_ptr,self.warehouse_ptr);
end;
end;

procedure TForm2.StGd1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if  (acol<=4) or (acol=8)  then
 canselect:=false
else
 canselect:=true;

if stgd1.Row>0 then
 begin
  stgd1.Cells[stgd1.col,stgd1.Row]:=
   formatfloat('0.00',strtofloat(stgd1.Cells[stgd1.col,stgd1.Row]));
  self.calculate_Payment;
 end;
end;

procedure TForm2.stgd2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=9) then
 canselect:=false
else
 canselect:=true;
if stgd2.Row>0 then
begin
 stgd2.Cells[stgd2.col,stgd2.Row]:=
  formatfloat('0.00',strtofloat(stgd2.Cells[stgd2.col,stgd2.Row]));
self.calculate_Payment;
end;
end;

procedure TForm2.StGd1KeyPress(Sender: TObject; var Key: Char);
begin
 if (sender as Tstringgrid).RowCount=1 then abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])>0  then abort;
end;

procedure TForm2.StGd1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])= '' then
(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row]:='0.00';

if stgd1.Row>0 then
if strtofloat(stgd1.Cells[5,stgd1.Row])+strtofloat(stgd1.Cells[6,stgd1.Row])>
   strtofloat(stgd1.Cells[4,stgd1.Row]) then
begin
 if stgd1.col=5 then
  stgd1.Cells[5,stgd1.Row] := formatfloat('0.00',strtofloat(stgd1.Cells[4,stgd1.Row])-
                            strtofloat(stgd1.Cells[6,stgd1.Row]))
 else
  stgd1.Cells[6,stgd1.Row] := formatfloat('0.00',strtofloat(stgd1.Cells[4,stgd1.Row])-
                            strtofloat(stgd1.Cells[5,stgd1.Row]))
end;

end;

procedure TForm2.stgd2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])= '' then
(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row]:='0.00';
if stgd2.Row>0 then
if strtofloat(stgd2.Cells[7,stgd2.Row])>strtofloat(stgd2.Cells[5,stgd2.Row]) then
 stgd2.Cells[7,stgd2.Row]:=stgd2.Cells[5,stgd2.Row];
end;



procedure TForm2.stgd2Exit(Sender: TObject);
begin
 if stgd2.RowCount>1 then
self.calculate_Payment;
end;

procedure TForm2.StGd1Exit(Sender: TObject);
begin
if stgd1.RowCount>1  then
self.calculate_Payment;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
 pay_amt:currency;
 i:integer;
begin
for i:=1 to stgd1.RowCount-1 do
 begin
  stgd1.Cells[5,i]:='0.00';
  stgd1.Cells[6,i]:='0.00';
 end;

 pay_amt:=strtofloat(edit8.Text)+strtofloat(edit12.Text);
 if (pay_amt>0) and (stgd1.RowCount>1) then
 for i:=1 to stgd1.RowCount-1 do
 begin
  if pay_amt>0 then
   if pay_amt>strtofloat(stgd1.Cells[4,i]) then //大于应付
    begin
     stgd1.Cells[5,i]:=stgd1.Cells[4,i];
     pay_amt:=pay_amt-strtofloat(stgd1.Cells[4,i]);
    end
   else   //小于等下于应付金额
    begin
     stgd1.Cells[5,i]:=formatfloat('0.00',pay_amt);
     pay_amt:=0;
    end
  else
   break;
 end;

self.calculate_Payment;
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
if trim(edit6.Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  edit6.SetFocus;
 end
else
 if strtofloat(edit6.Text)<=0 then
  begin
   showmessage('汇率数据输入有误!');
   edit6.SetFocus;
  end
 else
  begin
   edit6.Text:=formatfloat('0.00000000',strtofloat(edit6.Text));
   self.calculate_Payment;
  end;

end;

procedure TForm2.BitBtn1Enter(Sender: TObject);

begin
if trim(edit1.Text)='' then
 begin
  showmessage('支票编号不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if trim(edit3.Text)='' then
 begin
  showmessage('工厂代码不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit3.SetFocus;
  exit;
 end;

if combobox1.ItemIndex=0 then
if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('支票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

  if StrToCurr(edit9.Text)=0 then
   begin
    showmessage('付款金额必需大于零');
    self.PageControl1.ActivePageIndex:=0;
    stgd1.SetFocus;
    exit;
   end;

  if StrToCurr(edit9.Text)<>StrToCurr(edit8.Text)+StrToCurr(edit12.Text) then
   begin
    showmessage('付款金额不等于实付金额加借项金额,请手工调整付款金额,或者自动分配');
    self.PageControl1.ActivePageIndex:=0;
    stgd1.SetFocus;
    exit;
   end;

 self.PageControl1Change(sender);
 if sgrid1.RowCount>2 then
 begin
  if StrToCurr(RemoveInvalid(statictext1.Caption))<>
     StrToCurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

 { if strtofloat(formatfloat('0.00',(strtofloat(edit8.Text)+strtofloat(edit10.Text))*
                                  strtofloat(edit6.Text)+
                                  abs(strtofloat(edit11.Text))
                          ))<>
     strtofloat(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目贷方金额与发票发生额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end; }

  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit_fyear.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit_fyear.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit_PERIOD.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    self.Edit_date.SetFocus;
    exit;
   end;

  if (strtoint(self.Edit_PERIOD.Text) <> monthof(strtodate(edit_date.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex := 1;
    edit_date.SetFocus;
    exit;
   end;

 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
  if self.edit_flag=0 then //新增
  begin
    if self.find_error(trim(edit1.Text)) then
    begin
      if bank_ptr>0then
        if messagedlg('支票编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
                [mbYes,mbNo],0)=mrYes  then
          begin
          dm.ado128.close;
          dm.ADO128.Parameters[0].Value:=self.bank_ptr;
          dm.ADO128.Open;
          edit1.Text:=dm.ADO128bank_current_check.Value;
          end
        else
        begin
          self.PageControl1.ActivePageIndex:=0;
          edit1.SetFocus;
          exit;
        end
      else
      begin
        messagedlg('支票编号重复!请手工重新输入',mtinformation,[mbok],0);
        self.PageControl1.ActivePageIndex:=0;
        edit1.SetFocus;
        exit;
      end;
    end;

    if sgrid1.RowCount>2 then
    if form1.vo_number(trim(self.Edit_number.Text)) then
    begin
      Edit_number.Text:=form1.get_vouchernumber(combobox1.ItemIndex+1,strtodate(self.Edit_date.Text));
      messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit_number.Text,mterror,[mbcancel],0);
    end;

    dm.ACt.BeginTrans;
    try
     dm.ADO129.Close;
     dm.ADO129.Parameters[0].Value:=null;
     dm.ADO129.Open;
     dm.ADO129.Append;
     dm.ADO129CHECK_NUMBER.Value:=edit1.Text;
     dm.ADO129AMOUNT.AsString:=edit8.Text;
      if self.ComboBox1.ItemIndex<>4 then   //更新银行帐户余额及初始值
      begin
       dm.ADO129BANK_PTR.Value:=self.bank_ptr;
       self.update_128(trim(edit1.Text));
      end;
     dm.ADO129TDATE.Value:=self.dtpk1.Date;
     dm.ADO129STATUS.Value:=1;
     dm.ADO129TTYPE.Value:=self.ComboBox1.ItemIndex+1;
     dm.ADO129SRCE_PTR.Value:=self.supp_ptr;  //指向供应商
     dm.ADO129EMPL_PTR.Value:=strtoint(user_ptr);
     dm.ADO129CURR_PTR.Value:=self.curr_ptr;
     dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
     dm.ADO129REMARK.Value:=edit15.Text;
     dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
     dm.ADO129trans_pl.Value:=self.RadioGroup1.ItemIndex;
     dm.ADO129.Post;
     dm.ADO130.Open;

     self.update_107_132;

      if sgrid1.RowCount>2 then
      begin
        dm.ADO104.Close;
        dm.ADO104.Open;

        with dm.ado105 do                                        //增加会计凭证总表
        begin
         close;
         dm.ado105.Parameters[0].Value:=null;
         open;
         append;
         dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
         dm.ado105BATCH_NUMBER.Value:=self.BATCH_NUMBER.Text;  //参考发票号
         dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
         if self.ComboBox1.ItemIndex=4 then
          dm.ado105VOU_TYPE.Value:=0             //转帐凭证
         else
          dm.ado105VOU_TYPE.Value:=1;             //付款凭证
         dm.ado105SOURCE_PTR.Value:=dm.ADO129RKEY.Value;              //发票指针
         dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO129EMPL_PTR.Value; //输入人员
         dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);   //输入日期
         dm.ado105ATTACHED.Value := strtoint(self.Edit_ATTACHED.Text);//附件张数
         dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
         dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);    //会计期间
         dm.ado105supp_PTR.Value:=dm.ADO129SRCE_PTR.value;            //供应商
         post;
        end;
        dm.ADO106.Close;
        dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
        dm.ADO106.Open;
        for i:=1 to SGrid2.RowCount-2 do
        begin
          dm.ado106.Append;
          dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
          dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
          dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
          dm.ADO106EXCH_RATE.AsString:=
          Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
           { TODO -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
          dm.ado106REF_NUMBER.Value:=dm.ADO129CHECK_NUMBER.Value;
          dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
          dm.ADO106PRICE.AsString := SGrid1.Cells[4,i];
          if (trim(sgrid1.Cells[5,i])<>'') then
            begin
            dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
            dm.ado106D_C.Value:='D';               //借方
            end
          else
            begin
            dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
            dm.ado106D_C.Value:='C';               //贷方
            end;
          dm.ado106.Post;
        end;
      end;
       //============================保存凭证===================

      dm.ACt.CommitTrans;
      if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
      begin  //打印凭证
        form_voucherreport:=Tform_voucherreport.Create(application);
        Form_voucherreport.ppReport1.Reset;
        Form_voucherreport.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'VOUCHER_REPORT.rtm';         //R:\NIERP\Report\VOUCHER_REPORT.rtm
        Form_voucherreport.ppReport1.Template.LoadFromFile;
        form_voucherreport.AQD105.Close;
        form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
        form_voucherreport.AQD105.open;
        form_voucherreport.AQD106.Open;
        form_voucherreport.AQD493.Open;
        form_voucherreport.ppReport1.Print;
        form_voucherreport.Free;
      end;
      self.ModalResult:=mrok;
    except
      on E: Exception do
      begin
        dm.ACt.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
        edit1.SetFocus;
      end;
    end;
  end
  else  //编辑
  begin
    dm.ado105.Close;
    dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
    dm.ado105.Open;
    if (not dm.ADO105.IsEmpty) and
      (dm.ado105STATUS.Value>0) then
    begin
      messagedlg('发票生成的会计凭证已被审核或作废,资料无法保存!',mtinformation,[mbok],0);
      dm.ADO105.Close;
      Abort;
    end;
    dm.ADO129.Close;
    dm.ADO129.Parameters[0].Value:=dm.AQ129RKEY.Value;
    dm.ADO129.Open;
    if dm.ADO129STATUS.Value<>1 then
      showmsg('支票状态发生变化,不能保存,请取消退出检查状态!',1)
    else
    try
      dm.ACt.BeginTrans;
      if dm.ADO129BANK_PTR.Value>0 then
      begin
        dm.ado128.Close;
        dm.ADO128.Parameters[0].Value:=dm.ADO129BANK_PTR.Value;
        dm.ado128.Open;
        dm.ADO128.Edit;
        dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+
                                  dm.ADO129AMOUNT.Value-
                                  strtofloat(edit8.Text);
        dm.ADO128.Post;
      end;
      dm.ADO129.Edit;
      dm.ADO129CHECK_NUMBER.Value:=trim(edit1.Text);
      dm.ADO129TDATE.Value:=self.dtpk1.Date;
      dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
      dm.ADO129REMARK.Value := edit15.Text;
      dm.ADO129AMOUNT.Value:=strtofloat(edit8.Text);
      dm.ADO129EMPL_PTR.Value:=strtoint(user_ptr);
      dm.ADO129trans_pl.Value:=self.RadioGroup1.ItemIndex;
      dm.ADO129.Post;
      dm.ADO130.open;
      self.update_invoice; //更新发票
      self.update_107_132;

//      with dm.ado105 do                                        //增加会计凭证总表
//      begin
//        close;
//        dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
//        open;
//      end;
      if not dm.ado105.isempty then
        dm.ado105.Delete;                    //会不会是这个地方根本就没有数据了？彭华

      dm.ADO106.Close;
      dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
      dm.ADO106.Open;

      if sgrid1.RowCount>2 then
      begin
        dm.ADO104.Close;
        dm.ADO104.Open;

        with dm.ado105 do                                        //增加会计凭证总表
        begin
          append;
          dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
          dm.ado105BATCH_NUMBER.Value:=self.BATCH_NUMBER.Text;  //参考发票号
          dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
          if self.ComboBox1.ItemIndex=4 then
            dm.ado105VOU_TYPE.Value:=0             //转帐凭证
          else
            dm.ado105VOU_TYPE.Value:=1;             //付款凭证
          dm.ado105SOURCE_PTR.Value:=dm.ADO129RKEY.Value;              //发票指针
          dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO129EMPL_PTR.Value; //输入人员
          dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);   //输入日期
          dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
          dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
          dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);    //会计期间
          dm.ado105supp_PTR.Value:=dm.ADO129SRCE_PTR.value;            //供应商
          post;
        end;
        for i:=1 to SGrid2.RowCount-2 do
        begin
          dm.ado106.Append;
          dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
          dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
          dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
          dm.ADO106EXCH_RATE.AsString:=
          Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
           { TODO -owilliam -c注意事项 : 在保存凭证时汇率要是 1的倒数 }
          dm.ado106REF_NUMBER.Value:=dm.ADO129CHECK_NUMBER.Value;
          dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
          dm.ADO106PRICE.AsString := SGrid1.Cells[4,i];
          if (trim(sgrid1.Cells[5,i])<>'') then
            begin
            dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
            dm.ado106D_C.Value:='D';               //借方
            end
          else
            begin
            dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
            dm.ado106D_C.Value:='C';               //贷方
            end;
          dm.ado106.Post;
        end;
      end;//=============保存凭证

      dm.ACt.CommitTrans;
      if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
      begin  //打印凭证
        form_voucherreport:=Tform_voucherreport.Create(application);
        Form_voucherreport.ppReport1.Reset;
        Form_voucherreport.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'VOUCHER_REPORT.rtm';         //R:\NIERP\Report\VOUCHER_REPORT.rtm
        Form_voucherreport.ppReport1.Template.LoadFromFile;
        form_voucherreport.AQD105.Close;
        form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
        form_voucherreport.AQD105.open;
        form_voucherreport.AQD106.Open;
        form_voucherreport.AQD493.Open;

        form_voucherreport.ppReport1.Print;
        form_voucherreport.Free;
      end;
      self.ModalResult:=mrok;
    except
      on E: Exception do
      begin
        dm.ACt.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
        edit1.SetFocus;
      end;
    end;
  end;
end;

function tform2.find_error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0129');
   sql.Add('where CHECK_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  if curr_ptr<>form_curr.ADOQuery1RKEY.Value then
   begin
     edit5.Text:=form_curr.ADOQuery1curr_code.Value;
     label11.Caption:=form_curr.ADOQuery1curr_name.Value;
     self.curr_ptr:=form_curr.ADOQuery1rkey.Value;
     edit6.Text:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
     if self.curr_ptr=1 then
      edit6.Enabled:=false
     else
      edit6.Enabled:=true;
     self.load_dedit(self.supp_ptr,self.curr_ptr,self.warehouse_ptr);
   end;
 end;
form_curr.Free;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 if (trim(edit3.Text)='') or (trim(edit4.Text)='') or (trim(edit5.Text)='') then
  showmessage('请首先确定工厂，供应商，货币')
 else
  self.load_dedit(self.supp_ptr,self.curr_ptr,self.warehouse_ptr);
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
IF Stgd1.Row=0 then
 n2.Enabled:=false
else
 n2.Enabled:=true;
end;

procedure TForm2.StGd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,v_row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  stgd1.MouseToCell(x,y,column,v_row);
  if (v_row>0) then 
    //and (column>4) 
    //and (column<8) then
   begin
    stgd1.Row:=v_row;
    stgd1.Col:=column;
   end;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 i:word;
begin
if stgd1.Row<>stgd1.RowCount-1 then
 for i:=stgd1.Row to stgd1.RowCount-1 do
  stgd1.Rows[i]:=stgd1.Rows[i+1]
else
 begin
  stgd1.Rows[stgd1.RowCount-1].Clear;
  stgd1.Cells[5,stgd1.RowCount-1]:='0';
  stgd1.Cells[6,stgd1.RowCount-1]:='0';
 end;

 stgd1.RowCount:=stgd1.RowCount-1;

if stgd1.RowCount=1 then
 begin
  if self.edit_flag=0 then
  begin
  bitbtn2.Enabled:=true;
  bitbtn3.Enabled:=true;
  bitbtn5.Enabled:=true;
  if combobox1.ItemIndex=0 then
   bitbtn6.Enabled:=false
  else                         //
   bitbtn6.Enabled:=true;
  end;
  self.calculate_Payment; //;计算
 end;

 if stgd1.RowCount>6 then
  stgd1.ColWidths[5]:=79
 else
  stgd1.ColWidths[5]:=97;

end;
procedure TForm2.Button4Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to stgd2.RowCount-1 do
  stgd2.Cells[7,i]:=stgd2.Cells[5,i];
 self.calculate_Payment;
end;

procedure TForm2.stgd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (bitbtn1.Enabled) and (stgd2.Row>0) then
 if (chr(key)='A') and (ssCtrl in shift) then
  stgd2.Cells[7,stgd2.Row]:=stgd2.Cells[5,stgd2.Row];
end;

procedure TForm2.StGd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (bitbtn1.Enabled) and (StGd1.Row>0) then
 if (chr(key)='A') and (ssCtrl in shift) then
  StGd1.Cells[5,StGd1.Row] := formatfloat('0.00',strtofloat(StGd1.Cells[4,StGd1.Row])-
                            strtofloat(StGd1.Cells[6,StGd1.Row]))
end;

procedure TForm2.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm2.SGrid1Exit(Sender: TObject);
begin
if (sgrid1.col>3) and (sgrid1.row<>sgrid1.RowCount-1) then
 begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';

  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';
if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));

 case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
 end;
   self.re_calculate;
 end;
 end;
    SGrid1.Col:=0;
end;

procedure TForm2.SGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 v_c:currency;
begin
if key=13 then    //用户按下F11键,左右对调
 begin
  if sgrid1.Row<> sgrid1.RowCount-1 then
  begin
   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[5,sgrid1.Row]:=sgrid1.Cells[6,sgrid1.Row];
    sgrid1.Cells[6,sgrid1.Row]:='';
    end;
   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[6,sgrid1.Row]:=sgrid1.Cells[5,sgrid1.Row];
    sgrid1.Cells[5,sgrid1.Row]:='';
    end;

  self.re_calculate;
  end;
 end;

if key=187 then    //用户按下F12键,自动计算
 begin
  if sgrid1.Row <> sgrid1.RowCount-1 then
  begin

   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]='') then
   begin
    v_c:=strtofloat(RemoveInvalid(statictext2.Caption))-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtofloat(RemoveInvalid(statictext1.Caption))-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.re_calculate;
  end;
 end;

end;

procedure TForm2.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if row<>0 then sgrid1.Row:=row;
   sgrid1.Col:=column;
 end;
end;

procedure TForm2.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if arow=sgrid1.RowCount-1 then
 begin
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end
else
 begin
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
  speedbutton7.Enabled:=true;
  speedbutton8.Enabled:=true;
 end;

if (acol=1) or (acol=2) or (acol=3) or (arow=sgrid1.RowCount-1) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 sgrid1.Options:=sgrid1.Options+[goEditing];

if (sgrid1.col > 3) and (sgrid1.row<>sgrid1.RowCount-1) then
 begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';
  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';

if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));

 case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
 end;
   self.re_calculate;
 end;
 end;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  if (combobox1.ItemIndex = 4) and //转帐支付
    (form1.find_accterror(form_acct.ADOQuery1RKEY.Value)) then
   messagedlg('该科目连接有现金帐户,不能在转帐凭证中选取!',mtinformation,[mbok],0)
  else
  try
   form_curr:=tform_curr.Create(application);
   if form_curr.ShowModal=mrok then
    begin
     if (form_acct.ADOQuery1curr_tp.Value=0) and
        (form_curr.ADOQuery1rkey.Value>1) then
      messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
     else
      if (form_acct.ADOQuery1curr_tp.Value=2) and
         (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
       messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
      else
       begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                  sgrid1.Cells[0,sgrid1.RowCount-2];

        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=form_curr.ADOQuery1curr_code.Value;

        if self.curr_ptr=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:= edit6.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=
                                   form_curr.ADOQuery1BASE_TO_OTHER.AsString;
                                   
        sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        if sgrid1.RowCount=3 then
         begin
          speedbutton3.Enabled:=true;
          speedbutton4.Enabled:=true;
          speedbutton5.Enabled:=true;
          speedbutton6.Enabled:=true;
          speedbutton7.Enabled:=true;
          speedbutton8.Enabled:=true;
         end;
       end;
    end;
  finally
   form_curr.Free;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  begin
   if (form_acct.ADOQuery1curr_tp.Value=0) and
      (strtoint(sgrid2.Cells[1,sgrid1.Row])>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (form_acct.ADOQuery1curr_tp.Value=2) and
       (form_acct.ADOQuery1curr_ptr.Value<>strtoint(sgrid2.Cells[1,sgrid1.Row])) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[1,sgrid1.Row]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
      sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
     end;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   if (form1.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (form1.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (form1.get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;   //货币

      if self.curr_ptr=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit6.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=
                                  form_curr.ADOQuery1BASE_TO_OTHER.AsString;

      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
      self.re_calculate;
     end;
  end;
finally
 form_curr.Free;
end;
end;

procedure TForm2.N7Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
if sgrid1.Row=sgrid1.RowCount-1 then
 begin
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end;
self.re_calculate;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
if self.edit_flag=0 then  //新增
 begin
  edit_number.Text:=form1.get_vouchernumber(self.ComboBox1.ItemIndex+1,strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm2.Edit_dateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.Edit_dateExit(Sender: TObject);
begin
try
 strtodate(Edit_date.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 Edit_date.SetFocus;
 exit;
end;
if self.edit_flag=0 then  //新增
 begin
  edit_number.Text:=form1.get_vouchernumber(self.ComboBox1.ItemIndex+1,strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
 debit_amout,credit_amount,exchange_win,exchange_lose:currency;
begin
{ TODO -owilliam -c规格 :
凭证的的更新在下便情况下发生,第一用户是新增状态,
第二在编辑状态时因为原往为业务发生额为零没有产生凭证当
用户修改了发生额需要产生新的凭证.
编辑时如果用户修改了发生额,但业务的凭证新增已经产生,那么
凭证的发生额需要用户自已修改,系统不产生新的业务分录 }
 exchange_win:=0;
 exchange_lose:=0;

 if StrToCurr(edit11.Text) < 0 then
  exchange_lose:=abs(StrToCurr(edit11.Text))//汇兑损失,分录记借方
 else
  if StrToCurr(edit11.Text)>0 then          //汇兑收益,分录记贷方
   exchange_win:=StrToCurr(edit11.Text);

if (self.supp_ptr>0)  then     //已确定供应商
 debit_amout:=
    StrToCurr(formatfloat('0.00',StrToCurr(edit9.Text)*StrToFloat(edit6.Text)+
                                 StrToCurr(edit10.Text)*StrToFloat(edit6.Text)-
                                 StrToCurr(edit12.text)*StrToFloat(edit6.Text)+
                                 exchange_win+exchange_lose //借方合计等于
                             ))   //付款合计+折扣-借方信用+汇兑收益
else                              //如果有汇兑收益,那么分录是记在贷方的,加上它是为了平衡
 debit_amout:=0;

if (self.edit_flag=0) or (trim(edit_number.Text)='') then
if (debit_amout<>StrToCurr(RemoveInvalid(statictext1.Caption))) then
begin
 edit_date.Text:=datetostr(dtpk1.Date);
 edit_number.Text:=form1.get_vouchernumber(combobox1.ItemIndex+1,dtpk1.Date);
 Edit_fyear.Text:=inttostr(yearof(dtpk1.Date));   //会计年度
 Edit_PERIOD.Text:=inttostr(monthof(dtpk1.Date));  //会计期间
 Edit_employee.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  mt_error:=true;
  dm.ADO104.Close;
  dm.ADO104.Open;

 debit_amout:=
    strtofloat(formatfloat('0.00',StrToCurr(edit9.Text)+
                                 StrToCurr(edit10.Text)-
                                 StrToCurr(edit12.text) //借方合计等于
                             ));

  if debit_amout+exchange_win > 0 then    //借方应付帐款
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if self.accsupp_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(self.accsupp_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption; //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;                     //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=                          //原币金额
         Formatfloat('0.00',debit_amout*strtofloat(edit6.Text)+exchange_win);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;       //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;       //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=Formatfloat('0.00',
         debit_amout+exchange_win/strtofloat(edit6.Text));  //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr)//货币指针;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;       //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=Formatfloat('0.00',
          debit_amout+exchange_win/strtofloat(edit6.Text));  //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr)//货币指针;
        end
       else
        begin
         messagedlg('对不起供应商信息中所定义的A/P帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=get_name(StGd1);              //摘要
//                         edit1.Text+ '['+        //发票编号加供应商代码加简称
//                         edit4.Text+
//                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);

      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                        formatfloat('0.00',debit_amout*strtofloat(edit6.Text)+exchange_win);
      if self.accsupp_gl_ptr>0 then
      sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.accsupp_gl_ptr)
      else
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;

      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;     //处理借方应付帐款
      end;
   end;
//======================================================
   mt_error:=true;
  if exchange_lose > 0 then   //借汇兑损失
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_02.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;   //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           currtostr(exchange_lose);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
      else
       mt_error:=false;
    end;
     if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=get_name(StGd1);              //摘要
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                         currtostr(exchange_lose);
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end
  else
  if exchange_win > 0 then   //贷汇兑收益
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_04.AsString);
    open;
     case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=currtostr(exchange_win);      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
     else
      mt_error:=false;
     end;
     if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=get_name(StGd1);              //摘要
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                         currtostr(exchange_win);
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_04.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

//==============================================================处理贷方银行存款
  mt_error:=true;
  if StrToCurr(edit8.Text)+exchange_lose > 0 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if self.accbank_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_03.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;    //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=          //本币金额
         Formatfloat('0.00',StrToCurr(edit8.Text)*strtofloat(edit6.Text)+exchange_lose);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=    //原币金额
        Formatfloat('0.00',StrToCurr(edit8.Text)+exchange_lose/strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=curr_ptr then
        begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=    //原币金额
        Formatfloat('0.00',StrToCurr(edit8.Text)+exchange_lose/strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr);
        end
       else
        begin
         messagedlg('对不起供应商中所定义的A/P帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=get_name(StGd1);              //摘要
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
        Formatfloat('0.00',StrToCurr(edit8.Text)*strtofloat(edit6.Text)+exchange_lose);

    if self.accbank_gl_ptr>0 then
     sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(accbank_gl_ptr)
    else
     sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;     //处理贷方银行存款
      end;
   end;
  //=============================
  mt_error:=true;
  if strtofloat(edit10.Text) > 0 then      //现金折扣
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;    //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=          //本币金额
         Formatfloat('0.00',StrToCurr(edit10.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=    //原币金额
        Formatfloat('0.00',StrToCurr(edit10.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=    //原币金额
         Formatfloat('0.00',StrToCurr(edit10.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr);
        end
       else
        begin
         messagedlg('对不起供应商中所定义的A/P帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=get_name(StGd1);              //摘要
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
        Formatfloat('0.00',StrToCurr(edit10.Text)*strtofloat(edit6.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;  //外理贷方折扣金额


 self.re_calculate;
if sgrid1.RowCount=2 then
 begin
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
  speedbutton7.Enabled:=false;
  speedbutton8.Enabled:=false;
 end
else
 begin
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
  speedbutton7.Enabled:=true;
  speedbutton8.Enabled:=true;
 end;
 
end
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1  then
 begin
  n5.Enabled:=false;
  n7.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
  n11.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  n7.Enabled:=true;
  n8.Enabled:=true;
  n9.Enabled:=true;
  n11.Enabled:=true;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:word;
begin
if (trim(edit4.Text)='') or (trim(edit5.Text)='') then
 messagedlg('请首先确定供应商及货币!',mterror,[mbcancel],0)
else
try
form_invoice:=tform_invoice.Create(application);
form_invoice.ADODataSet1.Close;
form_invoice.ADODataSet1.Parameters[0].Value:=self.supp_ptr;
form_invoice.ADODataSet1.Parameters[1].Value:=self.curr_ptr;
form_invoice.ADODataSet1.Open;
if form_invoice.ADODataSet1.IsEmpty then
 messagedlg('没有找到符合条件的应付发票!',mtinformation,[mbok],0)
else
if form_invoice.ShowModal=mrok then
 begin
  WITH form_invoice DO
  BEGIN
  for i := 0 to DBGrid1.SelectedRows.Count-1 do
  BEGIN
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   
  if find_invoicerkey(form_invoice.ADODataSet1rkey.Value) then
   messagedlg('发票编号:'+ADODataSet1invoice_no.Value+
                      '已经在可付款中,不须增加!',mtinformation,[mbok],0)
  else
   begin
    stgd1.RowCount:=stgd1.RowCount+1;
    stgd1.Cells[0,stgd1.RowCount-1]:=form_invoice.ADODataSet1invoice_no.value;
    stgd1.Cells[1,stgd1.RowCount-1]:=form_invoice.ADODataSet1inv_date.AsString;
    stgd1.Cells[2,stgd1.RowCount-1]:=form_invoice.ADODataSet1INV_TOTAL.AsString;
    stgd1.Cells[3,stgd1.RowCount-1]:=form_invoice.ADODataSet1EX_RATE.AsString;
    stgd1.Cells[4,stgd1.RowCount-1]:=form_invoice.ADODataSet1yinsou.AsString;

    if strtofloat(edit8.Text)+strtofloat(edit12.Text)-
        strtofloat(edit9.Text) >= form_invoice.ADODataSet1yinsou.Value then
     stgd1.Cells[5,stgd1.RowCount-1]:=form_invoice.ADODataSet1yinsou.AsString
    else
     if strtofloat(edit8.Text)+strtofloat(edit12.Text)-
        strtofloat(edit9.Text) > 0 then
      stgd1.Cells[5,stgd1.RowCount-1]:=currtostr(strtofloat(edit8.Text)+
                                       strtofloat(edit12.Text)-
                                       strtofloat(edit9.Text))
     else
      stgd1.Cells[5,stgd1.RowCount-1]:='0.00';

    stgd1.Cells[6,stgd1.RowCount-1]:='0.00';
    stgd1.Cells[7,stgd1.RowCount-1]:=form_invoice.ADODataSet1rkey.AsString; //107.rkey
    stgd1.Cells[8,stgd1.RowCount-1]:=form_invoice.ADODataSet1DSDesigner.AsString; //税票标识

    self.calculate_Payment;
   end;

  END;
  END;

 if stgd1.RowCount>1 then
  begin
   stgd1.FixedRows:=1;
   if bitbtn2.Enabled then bitbtn2.Enabled := not bitbtn2.Enabled;
   if bitbtn3.Enabled then bitbtn3.Enabled := not bitbtn3.Enabled;
   if bitbtn5.Enabled then bitbtn5.Enabled := not bitbtn5.Enabled;
   if bitbtn6.Enabled then bitbtn6.Enabled := not bitbtn6.Enabled;
  end;
 if stgd1.RowCount>6 then
  stgd1.ColWidths[5]:=79
 else
  stgd1.ColWidths[5]:=97;

 end;
finally
form_invoice.Free;
end;
end;

procedure TForm2.Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.Edit8Exit(Sender: TObject);
begin
if trim(edit8.Text)='' then edit8.Text:='0';
edit8.Text:=floattostrf(strtofloat(edit8.Text),fffixed,11,2);
end;

end.
