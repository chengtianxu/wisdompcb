unit payment_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    dtpk1: TDateTimePicker;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    StGd1: TStringGrid;
    BitBtn2: TBitBtn;
    Edit7: TEdit;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    stgd2: TStringGrid;
    Label12: TLabel;
    Label13: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit8: TEdit;
    Label14: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit11: TEdit;
    Label17: TLabel;
    Edit12: TEdit;
    Label18: TLabel;
    edit5: TEdit;
    label11: TLabel;
    ComboBox1: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Edit13: TEdit;
    Edit15: TEdit;
    Label21: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure load_dedit(supp_ptr,curr_ptr:integer);
    procedure calculate_Payment();
    procedure calculate_debit();
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
  private
    { Private declarations }
   bank_ptr,warehouse_ptr,supp_ptr,curr_ptr:integer; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
implementation

uses BankSearch, datamd, curr_search, main, supplier_search,
  warehouse_search;

{$R *.dfm}
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
  pay_amt,disc_amt:currency;
  sql_text:string;
begin
stgd1.Cells[0,0]:='发票编码';
stgd1.Cells[1,0]:='到期日期';
stgd1.Cells[2,0]:='发票金额';
stgd1.Cells[3,0]:='入帐汇率';
stgd1.Cells[4,0]:='应付金额';
stgd1.Cells[5,0]:='付款金额';
stgd1.Cells[6,0]:='现金折扣';
stgd1.Cells[7,0]:='rkey107';

stgd2.Cells[0,0]:='借项备忘';
stgd2.Cells[1,0]:='参考号';
stgd2.Cells[2,0]:='备忘日期';
stgd2.Cells[3,0]:='借项金额';
stgd2.Cells[4,0]:='可用金额';
stgd2.Cells[5,0]:='入帐汇率';
stgd2.Cells[6,0]:='使用金额';
stgd2.Cells[7,0]:='rkey132';
if trim(edit1.Text)<>'' then //检查或者编辑
 begin
  WITH DM.ADOQuery1 do
  begin
   close;
   SQL.Clear ;
   sql.Add('Select data0130.INVOICE_PTR,invoice_no,due_date,inv_total,amt_paid,');
   sql.Add('ex_rate,inv_total-amt_paid-cash_disc as amt_payment,');
   sql.Add('data0130.AMOUNT,data0130.CASH_DISCOUNT');
   sql.Add('from data0130 inner join data0107');
   sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
   sql.Add('where data0130.check_ptr='+dm.AQ129rkey.AsString);
   sql.Add('order by data0107.due_date');
   open;
  end;
   pay_amt:=0;
   disc_amt:=0;
  while not dm.ADOQuery1.Eof do
  begin
   stgd1.RowCount:=stgd1.RowCount+1;
   stgd1.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['invoice_no'];
   stgd1.Cells[1,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('due_date').AsString;
   stgd1.Cells[2,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_total').AsString;
   stgd1.Cells[3,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ex_rate').AsString;
   stgd1.Cells[4,stgd1.RowCount-1]:= dm.ADOQuery1.Fieldbyname('amt_payment').AsString;
   stgd1.Cells[5,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
   stgd1.Cells[6,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('CASH_DISCOUNT').AsString;
   stgd1.Cells[7,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('INVOICE_PTR').AsString;//107.rkey
   pay_amt:=pay_amt+dm.ADOQuery1.Fieldvalues['AMOUNT'];
   disc_amt:=disc_amt+dm.ADOQuery1.Fieldvalues['CASH_DISCOUNT'];
   dm.ADOQuery1.Next;
  end;
  if stgd1.RowCount>1 then stgd1.FixedRows:=1;
  if stgd1.RowCount>6 then
   stgd1.ColWidths[5]:=79
  else
   stgd1.ColWidths[5]:=97;
  edit9.Text:= floattostr(pay_amt);
  edit10.Text:=floattostr(disc_amt);
  stgd1.Options:=stgd1.Options-[goediting];
  stgd2.Options:=stgd2.Options-[goediting];

  sql_text:=
 'SELECT MEMO_NUMBER, MEMO_DATE, Data0132.AMOUNT, AVL_AMT, REF_NUMBER, EX_RATE,DEBIT_AP_HEAD_PTR,'+#13
  +'abs(data0130.AMOUNT) as amt_detbit FROM data0130 inner join Data0132'+#13
  +'on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey'+#13
  +'where data0130.check_ptr='+dm.AQ129rkey.AsString;
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
  stgd2.Cells[1,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('REF_NUMBER').AsString;
  stgd2.Cells[2,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('MEMO_DATE').AsString;
  stgd2.Cells[3,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
  stgd2.Cells[4,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AVL_AMT').AsString;
  stgd2.Cells[5,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EX_RATE').AsString;
  stgd2.Cells[6,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('amt_detbit').AsString;
  stgd2.Cells[7,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('DEBIT_AP_HEAD_PTR').AsString;//132.rkey
  dm.ADOQuery1.Next;
 end;
 if stgd2.RowCount>1 then
  stgd2.FixedRows:=1;

 if stgd2.RowCount>4 then
  stgd2.ColWidths[5]:=79
 else
  stgd2.ColWidths[5]:=96;
 self.calculate_debit;
 end;
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

procedure TForm2.load_dedit(supp_ptr, curr_ptr: integer);
var
 sql_text:string;
begin
 sql_text:=
 'SELECT MEMO_NUMBER, MEMO_DATE, AMOUNT, AVL_AMT, REF_NUMBER, EX_RATE,rkey'+#13
  +'FROM dbo.Data0132'+#13
  +'where AVL_AMT>0';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:=sql_text;
   sql.Add('and supp_ptr='+inttostr(supp_ptr));
   sql.Add('and currency_ptr='+inttostr(curr_ptr));
   open;
  end;

stgd2.RowCount:=1;

while not dm.ADOQuery1.Eof do
 begin
  stgd2.RowCount:=stgd2.RowCount+1;
  stgd2.Cells[0,stgd2.RowCount-1]:=dm.ADOQuery1.FieldValues['MEMO_NUMBER'];
  stgd2.Cells[1,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('REF_NUMBER').AsString;
  stgd2.Cells[2,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('MEMO_DATE').AsString;
  stgd2.Cells[3,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
  stgd2.Cells[4,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AVL_AMT').AsString;
  stgd2.Cells[5,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EX_RATE').AsString;
  stgd2.Cells[6,stgd2.RowCount-1]:='0.00';
  stgd2.Cells[7,stgd2.RowCount-1]:=dm.ADOQuery1.Fieldbyname('rkey').AsString;//132.rkey
  dm.ADOQuery1.Next;
 end;
if stgd2.RowCount>1 then stgd2.FixedRows:=1;
if stgd2.RowCount>4 then
 stgd2.ColWidths[5]:=79
else
 stgd2.ColWidths[5]:=96;
 stgd1.RowCount:=1;
 stgd1.ColWidths[5]:=97;
 edit9.Text:='0.00';
 edit10.Text:='0.00';
 edit11.Text:='0.00';
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
   if combobox1.ItemIndex =4 then //转帐支付
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
   self.load_dedit(self.supp_ptr,self.curr_ptr);

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
  label9.Caption:=form_wh.ADOQuery1WAREHOUSE_NAME.Value;
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
var
 pay_amt:currency;
begin
if (trim(edit3.Text)='') or (trim(edit4.Text)='') or (trim(edit5.Text)='') then
  showmessage('请首先确定工厂，供应商，货币')
else
begin
 WITH DM.ADOQuery1 do
  begin
   close;
   SQL.Clear ;
   sql.Add('Select rkey,invoice_no,due_date,inv_total,amt_paid,cash_disc, ');
   sql.Add('ex_rate,inv_total-amt_paid-cash_disc as amt_payment from data0107');
   sql.Add('where currency_ptr='+inttostr(self.curr_ptr));
   sql.Add('and data0107.supp_ptr='+inttostr(self.supp_ptr));
   sql.Add('and warehouse_ptr='+inttostr(self.warehouse_ptr));
   sql.Add('and inv_total-amt_paid-cash_disc > 0');
   sql.Add('and status=1');
   sql.Add('order by data0107.due_date');
   open;
  end;
 stgd1.RowCount:=1;
 pay_amt:=0;
 while not dm.ADOQuery1.Eof do
  begin
   stgd1.RowCount:=stgd1.RowCount+1;
   stgd1.Cells[0,stgd1.RowCount-1]:=dm.ADOQuery1.FieldValues['invoice_no'];
   stgd1.Cells[1,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('due_date').AsString;
   stgd1.Cells[2,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('inv_total').AsString;
   stgd1.Cells[3,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('ex_rate').AsString;
   stgd1.Cells[4,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('amt_payment').AsString;
   stgd1.Cells[5,stgd1.RowCount-1]:='0.00';
   stgd1.Cells[6,stgd1.RowCount-1]:='0.00';
   stgd1.Cells[7,stgd1.RowCount-1]:=dm.ADOQuery1.Fieldbyname('rkey').AsString;//107.rkey
   pay_amt:=pay_amt+dm.ADOQuery1.Fieldvalues['amt_payment'];
   dm.ADOQuery1.Next;
  end;
 if stgd1.RowCount>1 then stgd1.FixedRows:=1;
 if stgd1.RowCount>6 then
  stgd1.ColWidths[5]:=79
 else
  stgd1.ColWidths[5]:=97;
 edit9.Text:='0.00';
 edit10.Text:='0.00';
 edit11.Text:='0.00';
 edit13.Text:=formatfloat('0.00',pay_amt);
 self.calculate_debit;

end;
end;

procedure TForm2.StGd1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=7)  then
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
if (acol=7) then
 canselect:=false
else
 canselect:=true;
if stgd2.Row>0 then
begin
 stgd2.Cells[stgd2.col,stgd2.Row]:=
  formatfloat('0.00',strtofloat(stgd2.Cells[stgd2.col,stgd2.Row]));
 self.calculate_debit;
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
if strtofloat(stgd2.Cells[6,stgd2.Row])>strtofloat(stgd2.Cells[4,stgd2.Row]) then
 stgd2.Cells[6,stgd2.Row]:=stgd2.Cells[4,stgd2.Row];
end;

procedure TForm2.calculate_Payment;
var
 i:integer;
 pay_amt,disc_amt,exch_amt:currency;
begin
 pay_amt:=0;
 disc_amt:=0;
 exch_amt:=0;
 for i:=1 to stgd1.RowCount-1 do
  begin
   if strtofloat(stgd1.Cells[5,i])>0 then
    begin
     pay_amt:=pay_amt+strtofloat(stgd1.Cells[5,i]);
     if strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[5,i])*
       (strtofloat(stgd1.Cells[3,i])-strtofloat(edit6.Text));      //记汇兑损溢
    end;

   if strtofloat(stgd1.Cells[6,i])>0 then
    begin
     disc_amt:=disc_amt+strtofloat(stgd1.Cells[6,i]);
     if strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[6,i])*
       (strtofloat(edit6.Text)-strtofloat(stgd1.Cells[3,i]));      //记汇兑损溢
    end;
  end;

 for i:=1 to stgd2.RowCount-1 do
  begin
   if strtofloat(stgd2.Cells[6,i])>0 then
    begin
     if strtofloat(edit6.Text)<>strtofloat(stgd2.Cells[5,i]) then
     exch_amt:=exch_amt+strtofloat(stgd2.Cells[6,i])*
     (strtofloat(edit6.Text)-strtofloat(stgd2.Cells[5,i]));//记汇兑损溢
    end;
  end;

edit9.Text:=formatfloat('0.00',pay_amt);
edit10.Text:=formatfloat('0.00',disc_amt);
edit8.Text:=formatfloat('0.00',strtofloat(edit9.Text)-strtofloat(edit12.Text));
edit11.Text:=formatfloat('0.00',exch_amt);  //记汇兑损溢

end;

procedure TForm2.calculate_debit;
var
 i:integer;
 debit_amt,exch_amt:currency;
begin
 debit_amt:=0;
 exch_amt:=0;
 for i:=1 to stgd2.RowCount-1 do
  if strtofloat(stgd2.Cells[6,i])>0 then
   begin
    debit_amt:=debit_amt+strtofloat(stgd2.Cells[6,i]);
    if strtofloat(edit6.Text)<>strtofloat(stgd2.Cells[5,i]) then
    exch_amt:=exch_amt+strtofloat(stgd2.Cells[6,i])*
     (strtofloat(edit6.Text)-strtofloat(stgd2.Cells[5,i]));//记汇兑损溢
   end;

 for i:=1 to stgd1.RowCount-1 do
  begin
   if strtofloat(stgd1.Cells[5,i])>0 then
    begin
     if strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[5,i])*
       (strtofloat(stgd1.Cells[3,i])-strtofloat(edit6.Text));      //记汇兑损溢
    end;

   if strtofloat(stgd1.Cells[6,i])>0 then
    begin
     if strtofloat(stgd1.Cells[3,i])<>strtofloat(edit6.Text) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(stgd1.Cells[6,i])*
       (strtofloat(edit6.Text)-strtofloat(stgd1.Cells[3,i]));      //记汇兑损溢
    end;
  end;

edit12.Text:=formatfloat('0.00',debit_amt);
edit11.Text:=formatfloat('0.00',exch_amt);  //记汇兑损溢
end;

procedure TForm2.stgd2Exit(Sender: TObject);
begin
 if stgd2.RowCount>1 then
 self.calculate_debit;
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
   if pay_amt>strtocurr(stgd1.Cells[4,i]) then
    begin
     stgd1.Cells[5,i]:=stgd1.Cells[4,i];
     pay_amt:=pay_amt-strtocurr(stgd1.Cells[4,i]);
    end
   else   //小于等下于应付金额
    begin
     stgd1.Cells[5,i]:=formatfloat('0.00',pay_amt);
     pay_amt:=0;
    end
  else
   break;
 end;

 if (pay_amt>0) then
  edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)-pay_amt);
  edit9.Text:=formatfloat('0.00',strtocurr(edit8.Text)+strtocurr(edit12.Text));
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
   edit6.Text:=formatfloat('0.000000',strtofloat(edit6.Text));
   self.calculate_debit;
  end;

end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('支票编号不允许为空!');
  edit1.SetFocus;
  exit;
 end;

if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('支票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;
 
if strtofloat(edit9.Text)=0 then
 begin
  showmessage('付款金额必需大于零');
  stgd1.SetFocus;
  exit;
 end;

if strtocurr(edit9.Text)<strtocurr(edit12.Text) then
 begin
  showmessage('付款金额不能小于借项金额,请手工调整付款金额,或者自动分配');
  stgd1.SetFocus;
  exit;
 end;

if strtocurr(edit9.Text)<>strtocurr(edit8.Text)+strtocurr(edit12.Text) then
 begin
  showmessage('付款金额不等于实付金额加借项金额,请手工调整付款金额,或者自动分配');
  stgd1.SetFocus;
  exit;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if self.find_error(trim(edit1.Text)) then
 begin
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
    edit1.SetFocus;
    exit;
   end;
 end;
 dm.ACt.BeginTrans;
 try
 dm.ADO129.Close;
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
 dm.ADO129EMPL_PTR.Value:=strtoint(form1.user_ptr.Caption);
 dm.ADO129CURR_PTR.Value:=self.curr_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
 dm.ADO129REMARK.Value:=edit15.Text;
 dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO129.Post;
 dm.ADO130.Open;
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

   with dm.ADOQuery1 do         //更新发票已付款及，折扣金额
    begin
     close;
     sql.Clear;
     sql.Add('update data0107');
     sql.Add('set STATUS=2');
     sql.Add('from data0130 inner join data0107');
     sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
     sql.Add('where inv_total=amt_paid+cash_disc');
     sql.Add('and data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
     ExecSQL;
    end;


 for i:=1 to stgd2.RowCount-1 do
  if (strtofloat(stgd2.Cells[6,i])>0) then
   begin
    dm.ADO130.Append;
    dm.ADO130CHECK_PTR.Value:=dm.ADO129RKEY.Value;
    dm.ADO130DEBIT_AP_HEAD_PTR.Value:=strtoint(stgd2.Cells[7,i]);
    dm.ADO130AMOUNT.Value:=-strtofloat(stgd2.Cells[6,i]);
    dm.ADO130.Post;
   end;

   with dm.ADOQuery1 do         //更新借项备忘
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

 dm.ACt.CommitTrans;
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
    self.load_dedit(self.supp_ptr,self.curr_ptr);  
   end;
 end;
form_curr.Free;
end;

end.
