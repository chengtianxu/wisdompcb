unit misc_dealinvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    DateTimePicker3: TDateTimePicker;
    Bevel1: TBevel;
    add_edit: TLabel;
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_invoerror(number: string): boolean;
    procedure update_04(v_seed:string);
    procedure Edit5Exit(Sender: TObject);

  private
    { Private declarations }
    warehouse_ptr,supp_ptr,currency_ptr:integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;

implementation

uses datamd, warehouse_search, supplier_search, curr_search, main;

{$R *.dfm}

procedure TForm4.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm4.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then
 begin
  if trim((sender as tedit).Text) = '' then (sender as tedit).Text := '0';
  edit6.Text:=formatfloat('0.00',strtofloat(edit7.Text)+
                                 strtofloat(edit8.Text)+
                                 strtofloat(edit9.Text));
 end;
end;

procedure TForm4.DateTimePicker1Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('发票日期不能大于付款日期!');
  self.DateTimePicker1.SetFocus;
 end;
end;

procedure TForm4.DateTimePicker2Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('付款日期不能小于发票日期!');
  self.DateTimePicker2.SetFocus;
 end;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
form_wh:=tform_wh.Create(application);
if form_wh.ShowModal=mrok then
 begin
  edit2.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
  label8.Caption:=form_wh.ADOQuery1WAREHOUSE_NAME.Value;
  self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
 end;
form_wh.Free;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
form_supp:=tform_supp.Create(application);
if form_supp.ShowModal=mrok then
 begin
  edit3.Text:=form_supp.ADOQuery1CODE.Value;
  label9.Caption:=form_supp.ADOQuery1SUPPLIER_NAME.Value;
  self.supp_ptr:=form_supp.ADOQuery1RKEY.Value;
  self.currency_ptr:=form_supp.ADOQuery1CURRENCY_PTR.Value;
  edit4.Text:=form_supp.ADOQuery1curr_name.Value;
  edit5.Text:=form_supp.ADOQuery1BASE_TO_OTHER.AsString;
  self.DateTimePicker2.Date:=self.DateTimePicker1.Date+form_supp.ADOQuery1PAYMENT_TERMS.value;
 end;
form_supp.Free;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  edit4.Text:=form_curr.ADOQuery1CURR_NAME.Value;
  self.currency_ptr:=form_curr.ADOQuery1RKEY.Value;
  edit5.Text:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
  if self.currency_ptr=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
form_curr.Free;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
if add_edit.Caption='0' then     //新增
 begin
  dm.ADOSP04.Close;
  dm.ADOSP04.Open;
  if dm.ADOSP04SEED_FLAG.Value<>1 then
  edit1.Text:=dm.ADOSP04SEED_VALUE.Value;
  self.DateTimePicker1.Date:=form1.sys_shortdate;
  self.DateTimePicker2.Date:=form1.sys_shortdate;
  self.DateTimePicker3.Date:=form1.sys_shortdate;
 end
else      //编辑或者检查
 begin
  self.warehouse_ptr:=dm.Aq107warehouse_ptr.Value;
  self.supp_ptr:=dm.Aq107supp_ptr.Value;
  self.currency_ptr:=dm.Aq107currency_ptr.Value;
  if self.currency_ptr=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
  dm.ADO107.Open;
  edit10.Text:=dm.Ado107tax_invoice_amt.AsString;
  self.DateTimePicker3.Date:=dm.Ado107tax_invoice_date.Value;
  edit11.Text:=dm.Ado107tax_invoice_ref.Value;
  dm.ADO107.Close;
 end;
end;

procedure TForm4.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('发票编号不允许为空!');
  edit1.SetFocus;
  exit;
 end;
 
if not dm.Adosp04.Active then dm.adosp04.Open;
if (dm.adosp04SEED_FLAG.Value<>1) and
  (not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9'])) then
 begin
  messagedlg('发票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;

if trim(edit2.Text)='' then
 begin
  showmessage('必须选择一个工厂!');
  edit2.SetFocus;
  exit;
 end;

if trim(edit3.Text)='' then
 begin
  showmessage('必须选择一个供应商!');
  edit3.SetFocus;
  exit;
 end;

if strtofloat(edit6.Text)<=0 then
 begin
  showmessage('发票总金额不能少于等于零');
  edit8.SetFocus;
  exit;
 end;

end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if add_edit.Caption='0' then
 begin
  if self.find_invoerror(trim(edit1.Text)) then
  begin
  if messagedlg('发票编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adosp04.Close;
    dm.adosp04.Open;
    edit1.Text:=dm.adosp04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end;
  end;
  dm.ACt.BeginTrans;
  try
  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=null;
  dm.ADO107.Open;
  dm.ADO107.Append;
  dm.ADO107INVOICE_NO.Value:=trim(edit1.Text);
  dm.ADO107SUPP_PTR.Value:=self.supp_ptr;
  dm.ADO107CURRENCY_PTR.Value:=self.currency_ptr;
  dm.ADO107EX_RATE.AsString:=edit5.Text;
  dm.ADO107warehouse_ptr.Value:=self.warehouse_ptr;
  dm.ADO107EMPL_PTR.Value:=strtoint(form1.user_ptr.caption);
  dm.ADO107INV_TP.Value:=4;
  dm.ADO107STATUS.Value:=1;
  dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);
  dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);
  dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);
  dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);
  dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
  dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
  dm.ADO107ENT_DATE.Value:=form1.sys_longdate;
  dm.ADO107tax_invoice_amt.Value:=strtofloat(edit10.Text);
  dm.ADO107tax_invoice_date.Value:=self.DateTimePicker3.Date;
  dm.ADO107tax_invoice_ref.Value:=edit11.Text;
  dm.ADO107.Post;
  update_04(trim(dm.ADOSP04SEED_VALUE.Value)); //更新04控制码
  dm.ACt.CommitTrans;
  ModalResult:=mrok;
  except
   dm.ACt.RollbackTrans;
   showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
   edit1.SetFocus;
  end;
 end
else
 begin
  dm.ACt.BeginTrans;
  try
   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Edit;
   dm.ADO107INVOICE_NO.Value:=trim(edit1.Text);

   dm.ADO107SUPP_PTR.Value:=self.supp_ptr;
   dm.ADO107CURRENCY_PTR.Value:=self.currency_ptr;
   dm.ADO107EX_RATE.AsString:=edit5.Text;
   dm.ADO107warehouse_ptr.Value:=self.warehouse_ptr;

   dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
   dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
   dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);
   dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);
   dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);
   dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);
   dm.ADO107tax_invoice_amt.Value:=strtofloat(edit10.Text);
   dm.ADO107tax_invoice_date.Value:=self.DateTimePicker3.Date;
   dm.ADO107tax_invoice_ref.Value:=edit11.Text;

   dm.ADO107.Post;

   dm.ACt.CommitTrans;
   modalresult:=mrok;
  except
   dm.ACt.RollbackTrans;
   showmessage('数据保存遇到错误请认确码修改后是否重复!');
   edit1.SetFocus;
  end;

 end;
end;

function TForm4.find_invoerror(number: string): boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0107');
   sql.Add('where INVOICE_NO='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm4.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.adosp04.Close;
 dm.adosp04.Open;
 if dm.adosp04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adosp04.Edit; //使前缀不变后缀加1
    dm.adosp04SEED_VALUE.Value := new_seed;
    dm.adosp04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adosp04.Edit;
     dm.adosp04SEED_VALUE.Value := new_seed;
     dm.adosp04.Post;
    end;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm4.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  edit5.SetFocus;
 end
else
 if strtofloat(edit5.Text)<=0 then
  begin
   showmessage('汇率数据输入有误!');
   edit5.SetFocus;
  end
 else
  begin
   edit5.Text:=formatfloat('0.000000',strtofloat(edit5.Text));
  end;
end;

end.
