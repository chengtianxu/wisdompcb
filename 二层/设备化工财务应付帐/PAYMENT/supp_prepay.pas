unit supp_prepay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
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
    Label21: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edit5: TEdit;
    dtpk1: TDateTimePicker;
    Edit6: TEdit;
    BitBtn2: TBitBtn;
    Edit7: TEdit;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Edit15: TEdit;
    Label14: TLabel;
    Edit8: TEdit;
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_error(number:string):boolean;
    procedure update_128(v_seed: string);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
   bank_ptr,warehouse_ptr,supp_ptr,curr_ptr:integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;
implementation

uses BankSearch, datamd, curr_search, main, supplier_search,
  warehouse_search;

{$R *.dfm}

procedure TForm4.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
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

  end;
FrmBankSearch.Free;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
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

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
if trim(edit2.Text)='' then
 showmessage('请首先确定银行帐户')
else
try
form_supp:=tform_supp.Create(application);
form_supp.Edit1.Text:=edit4.Text;
if form_supp.ShowModal=mrok then
 begin
  if supp_ptr<>form_supp.ADOdata0023RKEY.Value then
   begin
    if form_supp.ADOData0023currency_ptr.Value<>self.curr_ptr then
     if messagedlg('所选供应定义的货币与现金银行帐户货币不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)=mryes then
      begin
       edit4.Text:=form_supp.ADOdata0023CODE.Value;
       label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
       self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
      end
     else
    else
    begin
     edit4.Text:=form_supp.ADOdata0023CODE.Value;
     label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
     self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
    end;
   end;
 end;
finally
form_supp.Free;
end;

end;

procedure TForm4.Edit8Exit(Sender: TObject);
begin
if trim(edit8.Text)='' then
 edit8.Text:='0';
edit8.Text:=formatfloat('0.00',strtofloat(edit8.Text));
end;

procedure TForm4.BitBtn1Enter(Sender: TObject);
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

if strtofloat(edit8.Text)=0 then
 begin
  showmessage('付款金额必需大于零');
  edit8.SetFocus;
  exit;
 end;

end;

procedure TForm4.BitBtn1Click(Sender: TObject);
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
 dm.ADO129BANK_PTR.Value:=self.bank_ptr;
 self.update_128(trim(edit1.Text));
 dm.ADO129TDATE.Value:=self.dtpk1.Date;
 dm.ADO129STATUS.Value:=1;
 dm.ADO129TTYPE.Value:=2;
 dm.ADO129SRCE_PTR.Value:=self.supp_ptr;  //指向供应商
 dm.ADO129EMPL_PTR.Value:=strtoint(form1.user_ptr.Caption);
 dm.ADO129CURR_PTR.Value:=self.curr_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
 dm.ADO129REMARK.Value:=edit15.Text;
 dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO129.Post;
 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
  edit1.SetFocus; 
 end;

end;

function tform4.find_error(number:string):boolean;
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

procedure TForm4.update_128(v_seed: string);
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

procedure TForm4.Edit6Exit(Sender: TObject);
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
