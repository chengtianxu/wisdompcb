unit debit_bysupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    label11: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    edit5: TEdit;
    dtpk1: TDateTimePicker;
    Edit6: TEdit;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Edit15: TEdit;
    Edit8: TEdit;
    BitBtn3: TBitBtn;
    a_or_e: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Label9: TLabel;
    dtpk2: TDateTimePicker;
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_error(number:string):boolean;
    procedure update_04(v_seed: string);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
   check_ptr,supp_ptr,curr_ptr:integer; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
implementation

uses datamd, curr_search, main, supplier_search, prepay_supp;

{$R *.dfm}
function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm2.update_04(v_seed: string);
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

function tform2.find_error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0132');
   sql.Add('where MEMO_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm2.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if self.a_or_e.Caption='0' then
 begin
  dm.ADOsp04.Close;
  dm.ADOsp04.Open;
  if dm.ADOsp04SEED_FLAG.Value<>1 then
   edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
 end
else       //编辑
 begin
  if dm.aq132MEMO_TP.Value=4 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select CHECK_NUMBER from data0129');
    sql.Add('where rkey='+dm.aq132check_ptr.AsString);
    open;
    edit2.Text:=fieldvalues['CHECK_NUMBER'];
    check_ptr:=dm.aq132check_ptr.Value;
   end
  else
   begin
    self.supp_ptr:=dm.aq132SUPP_PTR.Value;
    self.curr_ptr:=dm.aq132CURRENCY_PTR.Value;
    if self.curr_ptr=1 then
     edit6.Enabled:=false
    else
     edit6.Enabled:=true;
     
   end;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.Create(application);
if form3.ShowModal=mrok then
 begin
  edit2.Text:=form3.aq129CHECK_NUMBER.Value;
  self.check_ptr:=form3.aq129RKEY.Value;
  edit4.Text:=form3.aq129CODE.Value;
  label10.Caption:=form3.aq129SUPPLIER_NAME.Value;
  self.supp_ptr:=form3.aq129SRCE_PTR.Value;
  edit5.Text:=form3.aq129CURR_CODE.Value;
  label11.Caption:=form3.aq129CURR_NAME.Value;
  self.curr_ptr:=form3.aq129CURR_PTR.Value;
  edit6.Text:=form3.aq129EX_RATE.AsString;
  edit8.Text:=form3.aq129AMOUNT.AsString;
  edit8.ReadOnly:=true;
  edit15.SetFocus;
 end;
form3.Free;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
form_supp:=tform_supp.Create(application);
form_supp.Edit1.Text:=edit4.Text;
if form_supp.ShowModal=mrok then
 begin
 if supp_ptr<>form_supp.ADOdata0023RKEY.Value then
  begin

   edit4.Text:=form_supp.ADOdata0023CODE.Value;
   label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
   self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
   edit5.Text:=form_supp.ADOData0023curr_code.Value;
   label11.Caption:=form_supp.ADOData0023curr_name.Value;
   self.curr_ptr:=form_supp.ADOData0023currency_ptr.Value;
   edit6.Text:=form_supp.ADOData0023BASE_TO_OTHER.AsString;
   edit8.SetFocus;
   if self.curr_ptr=1 then
    edit6.Enabled:=false
   else
    edit6.Enabled:=true;
  end;
 end;
finally
form_supp.Free;
end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
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
   end;
 end;
form_curr.Free;
end;

procedure TForm2.Edit8Exit(Sender: TObject);
begin
if trim(edit8.Text)='' then edit8.Text:='0';
edit8.Text:=formatfloat('0.00',strtofloat(edit8.Text));
if strtofloat(edit8.Text)-strtofloat(edit3.Text)<0 then
 begin
  edit8.SetFocus;
  showmessage('该借项备忘已被使用,借项金额不能少于'+edit3.Text);
 end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('备忘编号不允许为空!');
  edit1.SetFocus;
  exit;
 end;

if not dm.ADOsp04.Active then dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;

if strtofloat(edit8.Text)=0 then
 begin
  showmessage('备忘金额必需大于零');
  edit8.SetFocus;
  exit;
 end;

if (combobox1.ItemIndex=0) and (trim(edit2.Text)='') then
 begin
  showmessage('预付支票不允许为空!');
  bitbtn2.SetFocus;
  exit;
 end
else
if trim(edit4.Text)='' then
 begin
  showmessage('供应商不允许为空!');
  bitbtn5.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin

if self.a_or_e.Caption='0' then  //新增
begin
if self.find_error(trim(edit1.Text)) then
 begin
  if messagedlg('支票编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adosp04.close;
    dm.adosp04.Open;
    edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end;
 end;
 dm.ACt.BeginTrans;
 try
 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=null;
 dm.ADO132.Open;
 dm.ADO132.Append;
 dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
 dm.ADO132SUPP_PTR.Value:=self.supp_ptr;
 if self.ComboBox1.ItemIndex=0 then  //预付备忘
  begin
   dm.ADO132MEMO_TP.Value:=4;
   dm.ADO132CHECK_PTR.Value:=self.check_ptr;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=2');
     sql.Add('where rkey='+dm.ADO132CHECK_PTR.AsString);
     ExecSQL;
    end;
  end
 else
  dm.ADO132MEMO_TP.Value:=2;   //其它备忘
 dm.ADO132EMPL_PTR.Value:=strtoint(form1.user_ptr.caption);
 dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
 dm.ADO132ENT_DATE.Value:=self.dtpk2.Date;
 dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
 dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value;
 dm.ADO132CURRENCY_PTR.Value:=self.curr_ptr;
 dm.ADO132EX_RATE.Value:=strtofloat(edit6.Text);
 dm.ADO132REF_NUMBER.Value:=edit15.Text;
 dm.ADO132.Post;

 self.update_04(trim(edit1.Text));
 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
  edit1.SetFocus;
 end;
end
else//编辑
 begin
 dm.ACt.BeginTrans;
 try
 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
 dm.ADO132.Open;
 dm.ADO132.Edit;
 dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
 dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
 dm.ADO132ENT_DATE.Value:=self.dtpk2.Date;
 dm.ADO132REF_NUMBER.Value:=edit15.Text;
 if (self.ComboBox1.ItemIndex=0) and (self.check_ptr<>dm.aq132check_ptr.Value) then  //预付备忘
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=1');
     sql.Add('where rkey='+dm.ADO132CHECK_PTR.AsString);
     ExecSQL;
    end;
   dm.ADO132CHECK_PTR.Value:=self.check_ptr;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=2');
     sql.Add('where rkey='+dm.ADO132CHECK_PTR.AsString);
     ExecSQL;
    end;
   dm.ADO132SUPP_PTR.Value:=self.supp_ptr;
   dm.ADO132CURRENCY_PTR.Value:=self.curr_ptr;
   dm.ADO132EX_RATE.Value:=strtofloat(edit6.Text);
  end
 else
  if (self.ComboBox1.ItemIndex=1) then
  begin
   dm.ADO132SUPP_PTR.Value:=self.supp_ptr;
   dm.ADO132CURRENCY_PTR.Value:=self.curr_ptr;
   dm.ADO132EX_RATE.Value:=strtofloat(edit6.Text);
  end;
 dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
 dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value-strtofloat(edit3.Text);
 dm.ADO132.Post;
 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
  edit1.SetFocus;
 end;

 end;
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
  end;
end;

end.
