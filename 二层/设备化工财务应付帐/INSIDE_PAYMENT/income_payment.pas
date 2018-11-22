unit income_payment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, Menus;

type
  TForm2 = class(TForm)
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
    Label14: TLabel;
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
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    stgd1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label12: TLabel;
    PopupMenu2: TPopupMenu;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure stgd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure stgd1KeyPress(Sender: TObject; var Key: Char);
    procedure stgd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure stgd1Exit(Sender: TObject);
    procedure calculate_Payment;
    procedure stgd1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_error(number:string):boolean;
    procedure update_128(v_seed: string);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
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

uses datamd, supplier_search, BankSearch, warehouse_search, main,
  curr_search;

{$R *.dfm}

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
  end;
FrmBankSearch.Free;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
form_empl:=tform_empl.Create(application);
form_empl.Edit1.Text:=edit4.Text;
if form_empl.ShowModal=mrok then
 begin
  if supp_ptr<>form_empl.ADOQuery1RKEY.Value then
   begin
     edit4.Text:=form_empl.ADOQuery1EMPL_CODE.Value;
     label10.Caption:=form_empl.ADOQuery1EMPLOYEE_NAME.Value;
     self.supp_ptr:=form_empl.ADOQuery1RKEY.Value;
   end;
 end;
finally
form_empl.Free;
end;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
form_inex:=tform_inex.Create(application);
if form_inex.ShowModal=mrok then
 begin
  stgd1.Cells[0,stgd1.RowCount-1]:=form_inex.ADOData0023NAME.Value;
  stgd1.Cells[1,stgd1.RowCount-1]:=form_inex.ADOData0023DESCRIPTION.Value;
  stgd1.Cells[3,stgd1.RowCount-1]:=form_inex.ADOData0023RKEY.AsString;
  stgd1.Cells[2,stgd1.RowCount-1]:='0.00';
  stgd1.Col:=2;
  stgd1.RowCount:=stgd1.RowCount+1;
 end;
form_inex.Free;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:integer;
begin
  stgd1.Cells[0,0]:='支出类别';
  stgd1.Cells[1,0]:='说明';
  stgd1.Cells[2,0]:='金额';
  if label12.Caption='1' then
   begin
   dm.ADO129.Close;
   dm.ADO129.Parameters[0].Value:=dm.AQ129rkey.Value;
   dm.ADO129.Open;
   self.bank_ptr:=dm.ADO129BANK_PTR.Value;
   self.warehouse_ptr:=dm.ADO129warehouse_ptr.Value;
   self.curr_ptr:=dm.ADO129CURR_PTR.Value;
   self.supp_ptr:=dm.ADO129SRCE_PTR.Value;
   dm.ADO129.Close;

   dm.ADO521.Close;
   dm.ADO521.Parameters[0].Value:=dm.AQ129rkey.Value;
   dm.ADO521.Open;
   stgd1.RowCount:=dm.ADO521.RecordCount+2;

 for i:=1 to dm.ADO521.RecordCount do
  begin
   stgd1.Cells[0,i]:=dm.ADO521EXPENSE_TP.Value;
   stgd1.Cells[1,i]:=dm.ADO521SUMMARIZE.Value;
   stgd1.Cells[2,i]:=dm.ADO521AMOUNT.AsString;
   stgd1.cells[3,i]:=dm.ADO521inex_ptr.AsString;
   dm.ADO521.Next;;
  end;

   dm.ADO521.Close;
   end;
end;

procedure TForm2.stgd1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if acol=3 then
 canselect:=false
else
 canselect:=true;

if stgd1.Row<>stgd1.RowCount-1 then
 begin
 
  stgd1.Cells[2,stgd1.Row]:=formatfloat('0.00',strtofloat(stgd1.Cells[2,stgd1.Row]));

  self.calculate_Payment;
 end;
end;

procedure TForm2.stgd1KeyPress(Sender: TObject; var Key: Char);
begin
if stgd1.Row=stgd1.RowCount-1 then abort;

if stgd1.Col=2 then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])>0  then abort;
end;

procedure TForm2.stgd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stgd1.MouseToCell(x,y,column,row);
   if row<>0 then stgd1.Row:=row;
 end;
end;

procedure TForm2.calculate_Payment;
var
 i:integer;
 pay_amt:currency;
begin
 pay_amt:=0;
 for i:=1 to stgd1.RowCount-2 do
   if strtofloat(stgd1.Cells[2,i])>0 then
    pay_amt:=pay_amt+strtofloat(stgd1.Cells[2,i]);
 edit8.Text:=formatfloat('0.00',pay_amt);
end;

procedure TForm2.stgd1Exit(Sender: TObject);
begin
if stgd1.RowCount>2  then
self.calculate_Payment;
end;

procedure TForm2.stgd1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if stgd1.Row<>stgd1.RowCount-1 then
if trim(stgd1.Cells[2,stgd1.Row])='' then stgd1.Cells[2,stgd1.Row]:='0.00';
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if stgd1.Row <> stgd1.RowCount-1 then
 n2.Enabled:=true
else
 n2.Enabled:=false;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 i:integer;
begin
edit8.Text:=formatfloat('0.00',strtofloat(edit8.Text)-strtofloat(stgd1.Cells[2,stgd1.row]));
 for i:=stgd1.Row to stgd1.RowCount-2 do
  stgd1.Rows[i].Text:=stgd1.Rows[i+1].Text;
 stgd1.RowCount:=stgd1.RowCount-1;
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

if strtofloat(edit8.Text)=0 then
 begin
  showmessage('付款金额必需大于零');
  edit8.SetFocus;
  exit;
 end;
if trim(edit3.Text)='' then
 begin
  showmessage('工厂不允许为空!');
  edit3.SetFocus;
  exit;
 end;

if trim(edit4.Text)='' then
 begin
  showmessage('收款人员不能为空!');
  edit4.SetFocus;
  exit;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if label12.Caption='0' then
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
 dm.ADO129.Parameters[0].Value:=null;
 dm.ADO129.Open;
 dm.ADO129.Append;
 dm.ADO129CHECK_NUMBER.Value:=edit1.Text;
 dm.ADO129AMOUNT.AsString:=edit8.Text;
 dm.ADO129BANK_PTR.Value:=self.bank_ptr;
 self.update_128(trim(edit1.Text));
 dm.ADO129TDATE.Value:=self.dtpk1.Date;
 dm.ADO129STATUS.Value:=1;
 dm.ADO129TTYPE.Value:=3;
 dm.ADO129SRCE_PTR.Value:=self.supp_ptr;  //指向员工
 dm.ADO129EMPL_PTR.Value:=strtoint(form1.user_ptr.Caption);
 dm.ADO129CURR_PTR.Value:=self.curr_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
 dm.ADO129REMARK.Value:=edit15.Text;
 dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO129.Post;
 dm.ADO521.Close;
 dm.ADO521.Parameters[0].Value:=dm.ADO129RKEY.Value;
 dm.ADO521.Open;

 for i:=1 to stgd1.RowCount-2 do
  begin
   dm.ADO521.Append;
   dm.ADO521TTYPE.Value:=0;
   dm.ADO521EXPENSE_TP.Value:=stgd1.Cells[0,i];
   dm.ADO521SUMMARIZE.Value:=stgd1.Cells[1,i];
   dm.ADO521SRCE_PTR.Value:=dm.ADO129RKEY.Value;
   dm.ADO521AMOUNT.Value:=strtofloat(stgd1.Cells[2,i]);
   dm.ADO521inex_ptr.Value:=strtoint(stgd1.cells[3,i]);
   dm.ADO521.Post;
  end;

 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
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
 dm.ADO129.Close;
 dm.ADO129.Parameters[0].Value:=dm.AQ129rkey.Value;
 dm.ADO129.Open;
 dm.ADO129.Edit;
 dm.ADO129CHECK_NUMBER.Value:=edit1.Text;
 dm.ADO129AMOUNT.AsString:=edit8.Text;
 dm.ADO129BANK_PTR.Value:=self.bank_ptr;
 self.update_128(trim(edit1.Text));
 dm.ADO129TDATE.Value:=self.dtpk1.Date;
 dm.ADO129STATUS.Value:=1;
 dm.ADO129TTYPE.Value:=3;
 dm.ADO129SRCE_PTR.Value:=self.supp_ptr;  //指向员工
 dm.ADO129EMPL_PTR.Value:=strtoint(form1.user_ptr.Caption);
 dm.ADO129CURR_PTR.Value:=self.curr_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
 dm.ADO129REMARK.Value:=edit15.Text;
 dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO129.Post;
 dm.ADO521.Close;
 dm.ADO521.Parameters[0].Value:=dm.ADO129RKEY.Value;
 dm.ADO521.Open;
 while not dm.ADO521.Eof do dm.ADO521.Delete;
 for i:=1 to stgd1.RowCount-2 do
  begin
   dm.ADO521.Append;
   dm.ADO521TTYPE.Value:=0;
   dm.ADO521EXPENSE_TP.Value:=stgd1.Cells[0,i];
   dm.ADO521SUMMARIZE.Value:=stgd1.Cells[1,i];
   dm.ADO521SRCE_PTR.Value:=dm.ADO129RKEY.Value;
   dm.ADO521AMOUNT.Value:=strtofloat(stgd1.Cells[2,i]);
   dm.ADO521inex_ptr.Value:=strtoint(stgd1.cells[3,i]);
   dm.ADO521.Post;
  end;

 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
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

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

end.
