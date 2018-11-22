unit standard_bill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, Menus, ExtCtrls, ComCtrls,
  DB,Excel2000,DBGrids,ToolWin,DateUtils, ClipBrd, ComObj,OleServer,ActiveX,ADODB
;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edit1: TEdit;
    edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    DBEdit3: TDBEdit;
    Edit4: TEdit;
    DBEdit2: TDBEdit;
    SText5: TStaticText;
    SGrid3: TStringGrid;
    SText1: TStaticText;
    Button1: TButton;
    Button2: TButton;
    SText3: TStaticText;
    Edit5: TEdit;
    SGrid4: TStringGrid;
    Edit6: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button3: TButton;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    sgrid1: TStringGrid;
    SGrid2: TStringGrid;
    Panel2: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Edit14: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label6: TLabel;
    SText2: TStaticText;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    abbr_name: TLabel;
    Button4: TButton;
    DBRadioGroup1: TDBRadioGroup;
    N3: TMenuItem;
    Edit15: TEdit;
    Label24: TLabel;
    Label26: TLabel;
    ComboBox1: TComboBox;
    Label27: TLabel;
    Label28: TLabel;
    DBCheckBox1: TDBCheckBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SGrid3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure SGrid3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure calculate_Payment;
    procedure SGrid3Exit(Sender: TObject);
    procedure SGrid4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGrid4Exit(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    function get_vouchernumber(inv_date: tdatetime): string;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function vo_number(number:string): boolean;
    function invo_number_error(number: string): boolean;
    function get_bankcheck(bank_ptr:integer): string;
    function find_invoicerkey(rkey112:integer): boolean;
    function find_bank_acct(rkey103:integer): boolean;   
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure re_calculate;
    procedure sgrid1Exit(Sender: TObject);
    procedure sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure update_128(v_seed: string);
    procedure save_invcre();
    procedure update_invcre();
    procedure update_04(v_seed: string);
    procedure N2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
   warehouse_number:array of integer;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
  public
    { Public declarations }
    accbank_gl_ptr,acc_gl_ptr:integer;
  end;

var
  Form2: TForm2;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;
implementation

uses DAMO, customer_search, BankSearch, curr_search, AcctSearch, main,
  credit_memo, invoice_search, voucher_report,common, voucher_dictionary;

{$R *.dfm}

procedure TForm2.calculate_Payment;
var
 i:integer;
 pay_amt,disc_amt,credit,exch_amt:currency;
begin
 pay_amt:=0;
 disc_amt:=0;
 exch_amt:=0;
 credit:=0;
 for i:=1 to sgrid3.RowCount-1 do
  begin
   if strtofloat(sgrid3.Cells[6,i])>0 then
    begin
     pay_amt:=pay_amt+strtofloat(sgrid3.Cells[6,i]);
     if (strtofloat(sgrid3.Cells[3,i])<>strtofloat(edit5.Text)) and
        (dm.ado114trans_pl.Value=1)  then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(sgrid3.Cells[6,i])*
       (strtofloat(edit5.Text)-strtofloat(sgrid3.Cells[3,i]));      //记汇兑损溢
    end;

   if strtofloat(sgrid3.Cells[7,i])>0 then
    begin
     disc_amt:=disc_amt+strtofloat(sgrid3.Cells[7,i]);
     if (strtofloat(sgrid3.Cells[3,i])<>strtofloat(edit5.Text)) and
        (dm.ado114trans_pl.Value=1) then //如果汇率发生改变
      exch_amt:=exch_amt+strtofloat(sgrid3.Cells[7,i])*
       (strtofloat(sgrid3.Cells[3,i])-strtofloat(edit5.Text));      //记汇兑损溢
    end;
  end;

 for i:=1 to sgrid4.RowCount-1 do
  begin
   if strtofloat(sgrid4.Cells[7,i])>0 then
    begin
     credit:=credit+strtofloat(sgrid4.Cells[7,i]);
     if (strtofloat(sgrid4.Cells[6,i])<>strtofloat(edit5.Text)) and
        (dm.ado114trans_pl.Value=1) then
     exch_amt:=exch_amt+strtofloat(sgrid4.Cells[7,i])*
     (strtofloat(sgrid4.Cells[6,i])-strtofloat(edit5.Text));//记汇兑损溢
    end;
  end;

edit9.Text:=formatfloat('0.00',pay_amt);
edit10.Text:=formatfloat('0.00',disc_amt);
stext2.caption:=formatfloat('0.00',credit);    //贷方信用合计
stext5.caption:=formatfloat('0.00',exch_amt);  //记汇兑损溢
stext1.caption:=formatfloat('0.00',strtocurr(edit6.Text)+credit-pay_amt);//多收余额
end;

function TForm2.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
if dm.ado114bank_ptr.value>0 then
 begin
  voucher:='RA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
  label25.Caption := '收款凭证';
 end
else
 begin
  voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
  label25.Caption := '转帐凭证';
 end;

 if length(inttostr(monthof(inv_date))) < 2 then
  voucher := voucher+'0'+inttostr(monthof(inv_date))
 else
  voucher := voucher+inttostr(monthof(inv_date));      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQuery1.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
 result:=voucher;
end;

function TForm2.get_bankcheck(bank_ptr:integer): string;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select bank_current_check from data0128');
   sql.Add('where rkey='+inttostr(bank_ptr));
   open;
   if fieldvalues['bank_current_check']<>null then
    result:= fieldvalues['bank_current_check']
   else
    result:='';
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
    vdb:=vdb+strtocurr(trim(sgrid1.cells[5,i]));
   if trim(sgrid1.cells[6,i])<>'' then
    vcr:=vcr+strtocurr(trim(sgrid1.cells[6,i]));
  end;
statictext1.Caption:=Formatfloat('#,##0.00',vdb);
statictext2.Caption:=Formatfloat('#,##0.00',vcr);
end;

function TForm2.get_gltp(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_tp from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_tp').AsInteger;
 end;
end;

function TForm2.get_glcurr_ptr(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_ptr from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_ptr').AsInteger;
 end;
end;

function RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm2.vo_number(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0105');
  sql.Add('where VOUCHER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TForm2.invo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0114');
  sql.Add('where REFERENCE_NO='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm2.update_128(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin

 dm.ado128.Close;
 dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
 dm.ado128.Open;
 dm.ADO128.Edit;
 dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+dm.ADO114AMOUNT.Value-
                            dm.ado114DEBIT_AMOUNT.Value;

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

procedure TForm2.save_invcre();
var
 i:integer;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select TTYPE,SRCE_PTR,INV_PTR,AMOUNT,APPL_CASH_DISC');
  sql.Add('from data0115');
  sql.Add('where rkey is null');
  open;
 end;

 for i:=1 to sgrid3.RowCount-1 do
  if (strtocurr(sgrid3.Cells[6,i])>0) or (strtocurr(sgrid3.Cells[7,i])>0) then
   dm.ADOQuery1.AppendRecord([1,dm.ado114RKEY.Value,
                                sgrid3.Cells[8,i],
                                strtocurr(sgrid3.Cells[6,i]),
                                strtocurr(sgrid3.Cells[7,i])
                                ]);

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0112');
   sql.Add('set data0112.amount_paid = data0112.amount_paid+data0115.AMOUNT,');
   sql.Add('    data0112.CASH_DISC=data0112.CASH_DISC+data0115.APPL_CASH_DISC');
   sql.Add('from data0115 inner join data0112');
   sql.Add('on data0115.INV_PTR=data0112.rkey');
   sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
   ExecSQL;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0112');
   sql.Add('set data0112.INVOICE_STATUS = 2');
   sql.Add('from data0115 inner join data0112');
   sql.Add('on data0115.INV_PTR=data0112.rkey');
   sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
   sql.Add('and data0112.amount_paid+data0112.CASH_DISC>=data0112.INVOICE_TOTAL');
   ExecSQL;
  end;
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 IF strtocurr(stext2.Caption)>0 then
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select TTYPE,SRCE_PTR,CRE_MEMO_PTR,AMOUNT');
    sql.Add('from data0115');
    sql.Add('where rkey is null');
    open;
   end;
   for i:=1 to sgrid4.RowCount-1 do
    if (strtocurr(sgrid4.Cells[7,i])>0) then
     dm.ADOQuery1.AppendRecord([1,dm.ado114RKEY.Value,
                                sgrid4.Cells[8,i],
                                strtocurr(sgrid4.Cells[7,i])
                                ]);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0116');
     sql.Add('set data0116.avl_amt = data0116.avl_amt-data0115.AMOUNT');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0116');
     sql.Add('set data0116.memo_status = 2');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
     sql.Add('and data0116.avl_amt=0');
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新预收支票状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0114');
     sql.Add('set status=2');        //已结清
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('inner join data0114 on');
     sql.Add('data0116.srce_ptr=data0114.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ADO114RKEY.AsString);
     sql.Add('and data0116.avl_amt=0');
     sql.Add('and data0116.memo_tp=1');
     ExecSQL;
    end;
    
  end;

end;

procedure TForm2.update_invcre;
begin

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0112');
   sql.Add('set data0112.INVOICE_STATUS = 1');
   sql.Add('from data0115 inner join data0112');
   sql.Add('on data0115.INV_PTR=data0112.rkey');
   sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
   sql.Add('and data0112.amount_paid+data0112.CASH_DISC>=data0112.INVOICE_TOTAL');
   ExecSQL;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0112');
   sql.Add('set data0112.amount_paid = data0112.amount_paid-data0115.AMOUNT,');
   sql.Add('    data0112.CASH_DISC=data0112.CASH_DISC-data0115.APPL_CASH_DISC');
   sql.Add('from data0115 inner join data0112');
   sql.Add('on data0115.INV_PTR=data0112.rkey');
   sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
   ExecSQL;
  end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0116');
     sql.Add('set data0116.avl_amt = data0116.avl_amt+data0115.AMOUNT');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0116');
     sql.Add('set data0116.memo_status = 1');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
     sql.Add('and data0116.avl_amt>0');
     ExecSQL;
    end;

   with dm.ADOQuery1 do         //更新预收支票状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0114');
     sql.Add('set status=1');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('inner join data0114 on');
     sql.Add('data0116.srce_ptr=data0114.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ADO114RKEY.AsString);
     sql.Add('and data0116.avl_amt>0');
     sql.Add('and data0116.memo_tp=1');
     ExecSQL;
    end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('delete data0115');
   sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
   ExecSQL;
  end;

end;

procedure TForm2.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:word;
begin
 sgrid3.Cells[0,0]:='发票编号';
 sgrid3.Cells[1,0]:='发票日期';
 sgrid3.Cells[2,0]:='发票金额';
 sgrid3.Cells[3,0]:='入帐汇率';
 sgrid3.Cells[4,0]:='已收金额';
 sgrid3.Cells[5,0]:='应收金额';
 sgrid3.Cells[6,0]:='实收金额';
 sgrid3.Cells[7,0]:='现金折扣';
 sgrid3.Cells[8,0]:='rkey112'; //没有直接列出

 sgrid4.Cells[0,0]:='贷方备忘号';
 sgrid4.Cells[1,0]:='类别';
 sgrid4.Cells[2,0]:='参考号';
 sgrid4.Cells[3,0]:='日期';
 sgrid4.Cells[4,0]:='贷项金额';
 sgrid4.Cells[5,0]:='可用金额';
 sgrid4.Cells[6,0]:='入帐汇率';
 sgrid4.Cells[7,0]:='使用金额';
 sgrid4.Cells[8,0]:='rkey116';

 sgrid1.Cells[0,0]:='科目摘要';
 sgrid1.Cells[1,0]:='科目代码及明称';
 sgrid1.Cells[2,0]:='币种';
 sgrid1.Cells[3,0]:='汇率';
 sgrid1.Cells[4,0]:='原币金额';
 sgrid1.Cells[5,0]:='借方(本币)';
 sgrid1.Cells[6,0]:='贷方(本币)';

with dm.ADOQuery1 do
 begin
   close;
   SQL.Text:='select rkey,abbr_name from data0015 order by rkey';
   open;
   setlength(warehouse_number,RecordCount);//设置数组下标个数
   for i:=0 to RecordCount-1 do
   begin
     ComboBox1.Items.Add(fieldbyname('abbr_name').AsString);
     warehouse_number[i]:=fieldbyname('rkey').AsInteger;
     Next;
   end;
 end;
  
if dm.ADo114.State=dsinsert then     //新增
  begin

  end
else           //编辑
 begin
  if dm.ado114bank_ptr.value>0 then
   label25.Caption:='收款凭证'
  else
   label25.Caption:='转帐凭证';
  Label27.Caption:=dm.aqd114FED_TAX_ID_NO.Value; 
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.aqd114abbrname15.Value);
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO114RKEY.Value;
  dm.Aqd105.Open;
  edit7.Text:=dm.Aqd105VOUCHER.Value;
  edit8.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit12.Text:=dm.Aqd105FYEAR.AsString;
  edit13.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit14.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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
      if dm.Aqd106EXCH_RATE.Value>0 then
       sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value)
      else
       sgrid1.Cells[3,i]:='0.00';
      sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString;
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
  dm.aqd115_112.Close;
  dm.aqd115_112.Parameters[0].Value:=dm.ADO114RKEY.Value;
  dm.aqd115_112.Open;
 while not dm.aqd115_112.Eof do
  begin
   sgrid3.RowCount:=sgrid3.RowCount+1;
   sgrid3.Cells[0,sgrid3.RowCount-1]:=dm.aqd115_112invoice_number.Value;
   sgrid3.Cells[1,sgrid3.RowCount-1]:=dm.aqd115_112INVOICE_DATE.AsString;
   sgrid3.Cells[2,sgrid3.RowCount-1]:=dm.aqd115_112INVOICE_TOTAL.AsString;
   sgrid3.Cells[3,sgrid3.RowCount-1]:=dm.aqd115_112EXCHANGE_RATE.AsString;
   sgrid3.Cells[4,sgrid3.RowCount-1]:=dm.aqd115_112yisou.AsString;
   sgrid3.Cells[5,sgrid3.RowCount-1]:=dm.aqd115_112yinsou.AsString;
   sgrid3.Cells[6,sgrid3.RowCount-1]:=dm.aqd115_112AMOUNT.AsString;
   sgrid3.Cells[7,sgrid3.RowCount-1]:=dm.aqd115_112APPL_CASH_DISC.AsString;
   sgrid3.Cells[8,sgrid3.RowCount-1]:=dm.aqd115_112RKEY.AsString; //112.rkey
   dm.aqd115_112.Next;
  end;
  if sgrid3.RowCount>1 then sgrid3.FixedRows:=1;
  if sgrid3.RowCount>7 then
   sgrid3.ColWidths[7]:=69
  else
   sgrid3.ColWidths[7]:=84;
   
  dm.aqd115_116.Close;
  dm.aqd115_116.Parameters[0].Value:=dm.ADO114RKEY.Value;
  dm.aqd115_116.Parameters[1].Value:=dm.ado114SRCE_PTR.Value;
  dm.aqd115_116.Parameters[2].Value:=dm.ado114CURRECY_PTR.Value;
  dm.aqd115_116.Open;
 while not dm.aqd115_116.Eof do
  begin
   sgrid4.RowCount:=sgrid4.RowCount+1;
   sgrid4.Cells[0,sgrid4.RowCount-1]:=dm.aqd115_116.FieldValues['MEMO_NUMBER'];
   sgrid4.Cells[1,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('type').AsString;
   sgrid4.Cells[2,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('REF_NUMBER').AsString;
   sgrid4.Cells[3,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('RMA_DATE').AsString;
   sgrid4.Cells[4,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('AMOUNT').AsString;
   sgrid4.Cells[5,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('AVL_amount').AsString;
   sgrid4.Cells[6,sgrid4.RowCount-1]:=dm.aqd115_116.Fieldbyname('EX_RATE').AsString;
   sgrid4.Cells[7,sgrid4.RowCount-1]:=dm.aqd115_116AMOUNT_115.AsString;
   sgrid4.Cells[8,sgrid4.RowCount-1]:=dm.aqd115_116.fieldbyname('rkey').AsString; //112.rkey
   dm.aqd115_116.Next;
  end;
  if sgrid4.RowCount>1 then sgrid4.FixedRows:=1;
  if sgrid4.RowCount>7 then
   sgrid4.ColWidths[7]:=84
  else
   sgrid4.ColWidths[7]:=98;
   self.calculate_Payment;
   
  end;

self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
form_bank:=tform_bank.Create(application);

if form_bank.ShowModal=mrok then
 if dm.ado114BANK_PTR.Value<>form_bank.Adodata0128rkey.Value then
 begin
  dm.ado114BANK_PTR.Value:=form_bank.Adodata0128rkey.Value;
  edit3.Text:=form_bank.Adodata0128bank_name.Value;
  stext3.Caption:=form_bank.Adodata0128bal_amount.AsString;
  dm.ado114CURRECY_PTR.Value:=form_bank.Adodata0128currency_ptr.Value;
  edit2.Text:=form_bank.Adodata0128curr_code.Value;
  label15.Caption:=form_bank.Adodata0128curr_name.Value;
  edit5.Text:=form_bank.Adodata0128base_to_other.AsString;
  edit4.Text:=trim(form_bank.Adodata0128bank_current_check.Value);
  self.accbank_gl_ptr:=form_bank.Adodata0128gl_acct_ptr.Value;
  if dm.ado114CURRECY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
form_bank.Free;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
if (bitbtn6.Enabled) and
   (trim(edit3.Text)='') then
 begin
  messagedlg('请首先确定现金银行帐户',mterror,[mbcancel],0);
  bitbtn6.SetFocus;
 end
else
try
form_customer:=tform_customer.Create(application);
if form_customer.ShowModal=mrok then
 begin
  dm.ado114SRCE_PTR.Value:=form_customer.ADOQuery1rkey.Value;
  edit1.Text:=form_customer.ADOQuery1CUST_CODE.Value;
  label14.Caption:=form_customer.ADOQuery1CUSTOMER_NAME.Value;
  self.acc_gl_ptr:=form_customer.ADOQuery1ACC_REC_PTR.Value;
  abbr_name.Caption:=form_customer.ADOQuery1abbr_name.Value;
  label27.Caption:=form_customer.ADOQuery1FED_TAX_ID_NO.Value;
  if trim(edit2.Text)='' then
   begin
    edit2.Text:=form_customer.ADOQuery1CURR_CODE.Value;
    label15.Caption:=form_customer.ADOQuery1CURR_NAME.Value;
    dm.ado114CURRECY_PTR.Value:=form_customer.ADOQuery1CURRENCY_PTR.Value;
    edit5.Text:=form_customer.ADOQuery1base_to_other.AsString;
    if dm.ado114CURRECY_PTR.Value=1 then
     edit5.Enabled:=false
    else
     edit5.Enabled:=true;
   end;
  if sgrid4.RowCount>1 then
   Button3Click(sender);
  self.calculate_Payment;
 end;
finally
 form_customer.Free;
end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if (trim(edit1.Text)='') or (trim(edit2.Text)='') then
 messagedlg('请首先确定客户,货币!',mterror,[mbcancel],0)
else
 begin
 WITH DM.ADOQuery1 do
  begin
   close;
   SQL.Clear ;
   sql.Add('SELECT invoice_number, INVOICE_DATE, INVOICE_TOTAL, EXCHANGE_RATE,');
   sql.Add('amount_paid + CASH_DISC AS yisou,rkey,');
   sql.Add('INVOICE_TOTAL - amount_paid - CASH_DISC AS yinsou');
   sql.Add('FROM dbo.Data0112');
   sql.Add('WHERE INVOICE_STATUS = 1');
   sql.Add('and INVOICE_TOTAL > 0');
   sql.Add('and CUSTOMER_PTR='+dm.ado114SRCE_PTR.AsString);
   sql.Add('and CURRENCY_PTR='+dm.ado114CURRECY_PTR.AsString);
//   SQL.Add('and warehouse_ptr='+dm.ado114warehouse_ptr.AsString);
   sql.Add('order by due_date');
   open;
  end;
 sgrid3.RowCount:=1;
 while not dm.ADOQuery1.Eof do
  begin
   sgrid3.RowCount:=sgrid3.RowCount+1;
   sgrid3.Cells[0,sgrid3.RowCount-1]:=dm.ADOQuery1.FieldValues['invoice_number'];
   sgrid3.Cells[1,sgrid3.RowCount-1]:=dm.ADOQuery1.Fieldbyname('INVOICE_DATE').AsString;
   sgrid3.Cells[2,sgrid3.RowCount-1]:=dm.ADOQuery1.Fieldbyname('INVOICE_TOTAL').AsString;
   sgrid3.Cells[3,sgrid3.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EXCHANGE_RATE').AsString;
   sgrid3.Cells[4,sgrid3.RowCount-1]:=dm.ADOQuery1.Fieldbyname('yisou').AsString;
   sgrid3.Cells[5,sgrid3.RowCount-1]:=dm.ADOQuery1.Fieldbyname('yinsou').AsString;
   sgrid3.Cells[6,sgrid3.RowCount-1]:='0.00';
   sgrid3.Cells[7,sgrid3.RowCount-1]:='0.00';
   sgrid3.Cells[8,sgrid3.RowCount-1]:=dm.ADOQuery1.fieldbyname('rkey').AsString; //112.rkey
   dm.ADOQuery1.Next;
  end;
  if sgrid3.RowCount>1 then
   begin
    sgrid3.FixedRows:=1;
    bitbtn6.Enabled:=false;
    bitbtn4.Enabled:=false;
    bitbtn5.Enabled:=false;
    ComboBox1.Enabled:=false;
   end;
  if sgrid3.RowCount>7 then
   sgrid3.ColWidths[7]:=69
  else
   sgrid3.ColWidths[7]:=84;
  edit9.Text:='0.00';
  edit10.Text:='0.00';
 end;
end;

procedure TForm2.SGrid3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid3.MouseToCell(x,y,column,row);
   if row<>0 then sgrid3.Row:=row;
 end;
end;

procedure TForm2.SGrid3KeyPress(Sender: TObject; var Key: Char);
begin
 if (sender as Tstringgrid).RowCount=1 then abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,
    (sender as Tstringgrid).row])>0  then abort;
end;

procedure TForm2.SGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=8)  then
 canselect:=false
else
 canselect:=true;
if sgrid3.Row>0 then
 begin
  sgrid3.Cells[sgrid3.col,sgrid3.Row]:=
   formatfloat('0.00',strtofloat(sgrid3.Cells[sgrid3.col,sgrid3.Row]));
  self.calculate_Payment;
 end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if (trim(edit1.Text)='') or (trim(edit2.Text)='') then
 messagedlg('请首先确定客户及货币!',mterror,[mbcancel],0)
else
begin
with dm.adoquery1 do
begin
 close;
 sql.Clear;
 sql.Add('SELECT MEMO_NUMBER, MEMO_TP, REF_NUMBER, RMA_DATE, AMOUNT, AVL_AMT,');
 sql.Add('EX_RATE, RKEY, case memo_tp when 1 then ''预收'' ');
 sql.Add('when 3 then ''扣款'' when 4 then ''退货'' end as type');
 sql.Add('FROM Data0116');
 sql.Add('where cust_ptr='+dm.ado114SRCE_PTR.AsString);
 sql.Add('and currency_ptr='+dm.ado114CURRECY_PTR.AsString);
// SQL.Add('and warehouse_ptr='+dm.ado114warehouse_ptr.AsString);
 sql.Add('and memo_status=1');
 sql.Add('order by MEMO_NUMBER');
 open
end;
if sgrid4.RowCount>1 then sgrid4.RowCount:=1;
while not dm.ADOQuery1.Eof do
 begin
  sgrid4.RowCount:=sgrid4.RowCount+1;
  sgrid4.Cells[0,sgrid4.RowCount-1]:=dm.ADOQuery1.FieldValues['MEMO_NUMBER'];
  sgrid4.Cells[1,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('type').AsString;
  sgrid4.Cells[2,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('REF_NUMBER').AsString;
  sgrid4.Cells[3,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('RMA_DATE').AsString;
  sgrid4.Cells[4,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AMOUNT').AsString;
  sgrid4.Cells[5,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('AVL_AMT').AsString;
  sgrid4.Cells[6,sgrid4.RowCount-1]:=dm.ADOQuery1.Fieldbyname('EX_RATE').AsString;
  sgrid4.Cells[7,sgrid4.RowCount-1]:='0.00';
  sgrid4.Cells[8,sgrid4.RowCount-1]:=dm.ADOQuery1.fieldbyname('rkey').AsString; //116.rkey
  dm.ADOQuery1.Next;
 end;
  if sgrid4.RowCount>1 then sgrid4.FixedRows:=1;
  if sgrid4.RowCount>7 then
   sgrid4.ColWidths[7]:=84
  else
   sgrid4.ColWidths[7]:=98;
  stext2.Caption:='0.00';
end;
end;

procedure TForm2.SGrid3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])= '' then
(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row]:='0.00';

if sgrid3.Row>0 then
if strtofloat(sgrid3.Cells[6,sgrid3.Row])+strtofloat(sgrid3.Cells[7,sgrid3.Row])>
   strtofloat(sgrid3.Cells[5,sgrid3.Row]) then
begin
 if sgrid3.col=6 then
  sgrid3.Cells[6,sgrid3.Row] := formatfloat('0.00',strtofloat(sgrid3.Cells[5,sgrid3.Row])-
                            strtofloat(sgrid3.Cells[7,sgrid3.Row]))
 else
  sgrid3.Cells[7,sgrid3.Row] := formatfloat('0.00',strtofloat(sgrid3.Cells[5,sgrid3.Row])-
                            strtofloat(sgrid3.Cells[6,sgrid3.Row]))
end;
end;

procedure TForm2.SGrid3Exit(Sender: TObject);
begin
if sgrid3.RowCount>1  then
self.calculate_Payment;
end;

procedure TForm2.SGrid4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row])= '' then
(sender as Tstringgrid).Cells[(sender as Tstringgrid).col,(sender as Tstringgrid).row]:='0.00';
if sgrid4.Row>0 then
if strtofloat(sgrid4.Cells[7,sgrid4.Row])>strtofloat(sgrid4.Cells[5,sgrid4.Row]) then
 sgrid4.Cells[7,sgrid4.Row]:=sgrid4.Cells[5,sgrid4.Row];
end;

procedure TForm2.SGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (acol=8) then
 canselect:=false
else
 canselect:=true;
if sgrid4.Row>0 then
begin
 sgrid4.Cells[sgrid4.col,sgrid4.Row]:=
  formatfloat('0.00',strtofloat(sgrid4.Cells[sgrid4.col,sgrid4.Row]));
 self.calculate_Payment;
end;
end;

procedure TForm2.SGrid4Exit(Sender: TObject);
begin
if sgrid4.RowCount>1  then
self.calculate_Payment;
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
if trim(edit6.Text)='' then edit6.Text:='0.00';
edit6.Text:=formatfloat('0.00',strtocurr(edit6.Text));
stext1.caption:=formatfloat('0.00',strtocurr(edit6.Text)+
                                   strtocurr(stext2.Caption)-
                                   strtocurr(edit9.Text));//多收余额

if strtocurr(edit15.Text) > strtocurr(edit6.Text) then
 begin
  messagedlg('银行手续费不能大于票据金额!',mterror,[mbcancel],0);
  edit6.SetFocus;
 end;


end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  messagedlg('支票号码不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

if (dm.ado114BANK_PTR.Value>0) and
   (dm.ado114.State=dsinsert) then
if not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9']) then
  begin
   messagedlg('票据编号最后一位必需是一个整数!',mtinformation,[mbok],0);
   edit4.SetFocus;
   exit;
  end;

if strtofloat(stext1.Caption)<0 then
 begin
  messagedlg('现金收据金额不足,请增加金额或者利用贷项备忘!',mtWarning,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit6.SetFocus;
  exit;
 end;
if (strtofloat(stext1.Caption)>0) and (strtofloat(stext2.Caption)>0) then
 begin
  messagedlg('在使用贷项备忘的情况下不能有多收余额!',mtWarning,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  sgrid4.SetFocus;
  exit;
 end;
 if strtocurr(edit9.Text)<=0 then
 begin
  messagedlg('无法新增实收金额为零的现金收据!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  sgrid3.SetFocus;
  exit;
 end;
  if DM.ado114IF_VOUCHER.AsBoolean then  //jacky zhong 2016-03-28
  begin
    self.PageControl1Change(sender);
    if sgrid1.RowCount>2 then
    begin
    if strtocurr(RemoveInvalid(statictext1.Caption))<>
       strtocurr(RemoveInvalid(statictext2.Caption)) then
     begin
      messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
      self.PageControl1.ActivePageIndex:=1;
      sgrid1.SetFocus;
      exit;
     end;

    { if strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)+
                                     strtocurr(edit10.Text)*strtofloat(edit5.Text)+
                                     abs(strtocurr(stext5.Caption)) //借方合计
                                 ))<>
        strtocurr(RemoveInvalid(statictext1.Caption)) then
      begin
       messagedlg('业务发生额与凭证发生额不一致!',mterror,[mbcancel],0);
       self.PageControl1.ActivePageIndex:=1;
       sgrid1.SetFocus;
       exit;
      end;  }

     if not dm.Aqd508.Active then dm.Aqd508.Open;
     if (strtoint(Edit12.Text) < dm.Aqd508CURR_FYEAR.Value) or
        ((strtoint(Edit12.Text) <= dm.Aqd508CURR_FYEAR.Value) and
        (strtoint(Edit13.Text) < dm.Aqd508CURR_PERIOD.Value)) then
      begin
       messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
       self.PageControl1.ActivePageIndex:=1;
       edit8.SetFocus;
       exit;
      end;

     if (strtoint(Edit13.Text) <> monthof(strtodate(edit8.text))) then
      begin
       messagedlg('凭证期间不等于凭证日期的会计期间请修改!',mterror,[mbcancel],0);
       self.PageControl1.ActivePageIndex:=1;
       edit8.SetFocus;
       exit;
      end;
    end;
  end;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  try
   form_curr:=tform_curr.Create(application);
   if form_curr.ShowModal=mrok then
    begin
     if (dm.ado114TTYPE.Value=5) and (find_bank_acct(form_acct.ADOQuery1RKEY.Value)) then
      begin
       messagedlg('科目连接有现金银行帐户,不能添加!',mterror,[mbcancel],0);
       exit;
      end;


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
                         trim(form_acct.ADOQuery1description_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1curr_code.Value;
       if dm.ado114CURRECY_PTR.Value= form_curr.ADOQuery1rkey.Value then
        sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
       else
        sgrid1.Cells[3,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1base_to_other.AsString;
        sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        if sgrid1.RowCount=3 then
         begin
         speedbutton2.Enabled:=true;
         speedbutton3.Enabled:=true;
         speedbutton4.Enabled:=true;
         speedbutton5.Enabled:=true;
         speedbutton6.Enabled:=true;
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
                        trim(form_acct.ADOQuery1description_2.Value);

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
   if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (self.get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=              //货币
               form_curr.ADOQuery1curr_code.Value;
     if dm.ado114CURRECY_PTR.Value= form_curr.ADOQuery1rkey.Value then
      sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
     else
      sgrid1.Cells[3,sgrid1.Row]:=
               form_curr.ADOQuery1base_to_other.AsString;
      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;

     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
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
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end;
self.re_calculate;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1];  
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO114.State=dsinsert then
 begin
  edit7.Text:=self.get_vouchernumber(strtodate(edit8.Text));
  Edit12.Text:=inttostr(yearof(strtodate(edit8.Text)));
  Edit13.Text:=inttostr(monthof(strtodate(edit8.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);  
end;

procedure TForm2.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm2.sgrid1Exit(Sender: TObject);
begin
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
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]) );
     end;
    6:       //贷方
     begin
      sgrid1.Cells[5,sgrid1.Row]:='';
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]) );
     end;
    4:   //原币
     begin
      if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
       sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]))
      else
       sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]));
     end;
   end;
   self.re_calculate;
 end;
 end;
    SGrid1.Col:=0;  
end;

procedure TForm2.sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm2.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm2.sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if arow=sgrid1.RowCount-1 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;

if (acol=1) or (acol=2) or (acol=3) or (arow=sgrid1.RowCount-1) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 sgrid1.Options:=sgrid1.Options+[goEditing];

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
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]) );
     end;
    6:       //贷方
     begin
      sgrid1.Cells[5,sgrid1.Row]:='';
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]) );
     end;
    4:   //原币
     begin
      if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
       sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]))
      else
       sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]));
     end;
   end;
   self.re_calculate;
 end;
 end;
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1  then
 begin
  n3.Enabled:=false;
  n5.Enabled:=false;
  n7.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
  n11.Enabled:=false;
 end
else
 begin
  n3.Enabled:=true;
  n5.Enabled:=true;
  n7.Enabled:=true;
  n8.Enabled:=true;
  n9.Enabled:=true;
  n11.Enabled:=true;
 end;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error,VoucherExisted:boolean;
 debit_amout,credit_amount,exchange_win,exchange_lose:currency;
begin
if edit2.Text='' then exit;
if not DM.ado114IF_VOUCHER.AsBoolean then exit;
 exchange_win:=0;
 exchange_lose:=0;

 if strtocurr(stext5.Caption) < 0 then
  exchange_lose := abs(strtocurr(stext5.Caption)) //汇兑损失
 else             //票据金额加折扣加汇兑损失
  if strtocurr(stext5.Caption)>0 then         //汇兑收益
   exchange_win := strtocurr(stext5.Caption);

 debit_amout:=
    strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)+
                                 strtocurr(edit10.Text)*strtofloat(edit5.Text)+
                                 exchange_win+
                                 exchange_lose //借方合计
                             ));
  VoucherExisted:=DM.rkey105Exists(DM.ado114.fieldbyName('rkey').AsInteger);
if (dm.ADO114.State=dsinsert) or (edit7.Text='') or (VoucherExisted=false) then //凭证尚未生成
//if (dm.ADO114.State in dseditModes) or (edit7.Text='') then
if (dm.ado114SRCE_PTR.Value>0) and
   (debit_amout<>strtocurr(RemoveInvalid(statictext1.Caption))) then
 begin
   
   edit7.Text:=self.get_vouchernumber(dm.ADO114TDATE.Value);
   if dm.ADO114.State =dsinsert then
     edit8.Text:=dm.ADO114TDATE.AsString
   else
     edit8.Text:=DM.GetServerDate;//dm.ADO114TDATE.AsString;

   Edit12.Text:=inttostr(yearof(dm.ADO114TDATE.Value));  //会计年度
   Edit13.Text:=inttostr(monthof(dm.ADO114TDATE.Value));  //会计期间

  edit14.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  dm.ADO104.Close;
  dm.ADO104.Open;           //打开会计分录定义
  mt_error:=true;         //没有错误
  if strtocurr(edit6.Text)-strtocurr(edit15.Text)+exchange_win>0 then      //借票据到帐金额
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if accbank_gl_ptr>0 then
      sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
    else
    begin
      if VoucherExisted=false then //凭证未生成
      begin
        accbank_gl_ptr:=DM.Get_Bank_gl_acct_ptr_by_rkey(dm.ado114.fieldbyName('BANK_PTR').AsString);
        if accbank_gl_ptr>0 then
          sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
        else
          sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString)
      end
      else
        sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    end;
    open;

    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',(strtocurr(edit6.Text)-strtocurr(edit15.Text))*strtofloat(edit5.Text)+exchange_win);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
         formatfloat('0.00',strtocurr(edit6.Text)-strtocurr(edit15.Text)+exchange_win/strtofloat(edit5.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                           edit4.Text+ '['+
                           edit1.Text+
                           ABBR_NAME.Caption+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+
                           trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                           trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                formatfloat('0.00',(strtocurr(edit6.Text)-strtocurr(edit15.Text))*strtofloat(edit5.Text)+
                            exchange_win);
        if accbank_gl_ptr>0 then
         sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(accbank_gl_ptr)
        else
         sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //========================================== //上面借票据到帐金额==
 if strtocurr(edit15.Text) > 0 then      //借票据手续费金额
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
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit15.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;       //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=                  //原币金额
                           formatfloat('0.00',strtocurr(edit15.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起会计分录中定义的价格折让帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                           edit4.Text+ '['+
                           edit1.Text+
                           ABBR_NAME.Caption+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+
                           trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                           trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=          //借方本位币金额
                formatfloat('0.00',strtocurr(edit15.Text)*strtofloat(edit5.Text)+
                            exchange_win);
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_04.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //========================================== //上面借票据手续费金额==
   mt_error:=true;
  if strtocurr(edit10.Text)>0 then   //借现金折扣
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
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit10.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:= edit10.Text;     //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
        formatfloat('0.00',strtocurr(edit10.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //===========================================================================
   mt_error:=true;
  if strtocurr(stext5.Caption) < 0 then   //借汇兑损失
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_03.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           currtostr(abs(strtocurr(stext5.Caption)));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
     else
      mt_error:=false;
    end;
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                          edit4.Text+ '['+
                          edit1.Text+
                          ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                         currtostr(abs(strtocurr(stext5.Caption)));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end
  else
  if strtocurr(stext5.Caption) > 0 then   //贷汇兑收益
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_06.AsString);
    open;
     case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=stext5.Caption;      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end
     else
      mt_error:=false;
     end;
     if mt_error then
      begin
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                          edit4.Text+ '['+
                          edit1.Text+
                          ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                         stext5.Caption;
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
 //=========以上为借方====以下为贷方============================================
    credit_amount:=strtocurr(edit9.text)+
                   strtocurr(edit10.text)+
                   strtocurr(stext1.Caption)-
                   strtocurr(stext2.Caption);

  mt_error:=true;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if self.acc_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(acc_gl_ptr))
    else
    begin
      if VoucherExisted=false then //凭证未生成
      begin
        self.acc_gl_ptr:=DM.Get_Cust_acc_gl_ptr_by_rkey(dm.ado114.fieldbyName('SRCE_PTR').AsString);
        if self.acc_gl_ptr>0 then
          sql.Add('where Data0103.rkey='+inttostr(acc_gl_ptr))
        else
          sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
      end
      else
       sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
    end;
    open;

    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',credit_amount*strtofloat(edit5.Text)+exchange_lose);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
        formatfloat('0.00',credit_amount+exchange_lose/strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;    //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
          formatfloat('0.00',credit_amount+exchange_lose/strtofloat(edit5.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:=
                         dm.ado114CURRECY_PTR.AsString;
        end
        else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
     sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
     sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
       formatfloat('0.00',credit_amount*strtofloat(edit5.Text)+exchange_lose);
      if self.acc_gl_ptr>0 then
       sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
      else
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  self.re_calculate;
 end;
if sgrid1.RowCount=2 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
 pay_amt:currency;
 i:integer;
begin
for i:=1 to sgrid3.RowCount-1 do
 begin
  sgrid3.Cells[6,i]:='0.00';
  sgrid3.Cells[7,i]:='0.00';
 end;

 pay_amt:=strtofloat(edit6.Text)+strtofloat(stext2.Caption);
 if (pay_amt>0) and (sgrid3.RowCount>1) then
 for i:=1 to sgrid3.RowCount-1 do
 begin
  if pay_amt>0 then
   if pay_amt>strtocurr(sgrid3.Cells[5,i]) then
    begin
     sgrid3.Cells[6,i]:=sgrid3.Cells[5,i];
     pay_amt:=pay_amt-strtocurr(sgrid3.Cells[5,i]);
    end
   else   //小于等下于应付金额
    begin
     sgrid3.Cells[6,i]:=formatfloat('0.00',pay_amt);
     pay_amt:=0;
    end
  else
   break;
 end;
self.calculate_Payment;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
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
   edit5.Text:=formatfloat('0.00000000',strtofloat(edit5.Text));
   self.calculate_Payment;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
 memo_number,memo_remark:string;
 memo_create:boolean;
begin
if dm.ado114.State=dsInsert then //新增
begin
 if self.invo_number_error(trim(edit4.Text)) then
  begin
   if dm.ado114BANK_PTR.Value > 0 then
    begin
     Edit4.Text:=self.get_bankcheck(dm.ado114BANK_PTR.Value);
     messagedlg('票据编号重复可能多人同时新增,系统已自动更新编号:'+edit4.Text,mterror,[mbok],0);
    end
   else
     begin
      messagedlg('票据编号重复!请手工重新输入',mterror,[mbok],0);
      self.PageControl1.ActivePageIndex:=0;
      edit4.SetFocus;
      exit;
     end;
  end;

  if sgrid1.RowCount>2 then
  if self.vo_number(trim(edit7.Text)) then
   begin
    edit7.Text:=self.get_vouchernumber(strtodate(edit8.Text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;

  memo_create:=false;
  if (strtocurr(stext1.Caption) > 0) then     //多出余额记备忘
  begin
   form_credit:=tform_credit.Create(application);
   dm.ADO04.Close;
   dm.ADO04.Open;
   with form_credit do
    begin
     if dm.ADO04SEED_FLAG.Value<>1 then
     edit1.Text:=dm.ADO04SEED_VALUE.Value;
     edit2.Text:=dm.ado114TDATE.AsString;
     edit3.Text:=form2.edit2.Text;
     edit4.Text:=form2.stext1.Caption;
    end;
   if form_credit.ShowModal=mrok then
    begin
     memo_number:=form_credit.Edit1.Text;
     memo_remark:=form_credit.Edit5.Text;
     memo_create:=true;
    end;
   form_credit.Free;
  end;

  dm.ADOConnection1.BeginTrans;
  try
   dm.ado114REFERENCE_NO.Value:=edit4.Text;
   dm.ado114AMOUNT.AsString:=edit6.Text;
   dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;
   dm.ado114DEBIT_AMOUNT.AsString:=edit15.Text;
   dm.ado114.Post;
   if dm.ado114BANK_PTR.Value>0 then
    self.update_128(trim(edit4.Text)); //更新票据编号及金额
   self.save_invcre();   //更新支付了那些发票,同时更新使用了那些备忘

   if memo_create then           //增加贷项备忘
   begin
    dm.ado116.close;
    dm.ado116.Parameters[0].Value:=dm.ado114RKEY.Value;
    dm.ado116.Open;
    dm.ado116.Append;
    dm.ado116MEMO_NUMBER.Value:=memo_number;
    dm.ado116DESCRIPTION.Value:=memo_remark;
    dm.ado116CUST_PTR.Value:=dm.ado114SRCE_PTR.Value;
    dm.ado116SRCE_PTR.Value:=dm.ado114RKEY.Value;
    dm.ado116MEMO_TP.Value:=1;
    dm.ado116EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value;
    dm.ado116MEMO_DATE.Value:=dm.ado114TDATE.Value;
    dm.ado116RMA_DATE.Value:=dm.ado116MEMO_DATE.Value;
    dm.ado116AMOUNT.AsString:=stext1.Caption;
    dm.ado116AVL_AMT.AsString:=stext1.Caption;
    dm.ado116GOODS_AMT.Value:=dm.ado116AMOUNT.Value;
    dm.ado116CURRENCY_PTR.Value:=dm.ado114CURRECY_PTR.Value;
    dm.ado116EX_RATE.Value:=dm.ado114EXCHANGE_RATE.Value;
    dm.ado116REF_NUMBER.Value:=dm.ado114REFERENCE_NO.Value+'结余';
    dm.ado116GLPTR_STATUS.Value:=true;
    dm.ado116warehouse_ptr.Value:=dm.ado114warehouse_ptr.Value;
    dm.ado116.Post;

    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     update_04(trim(dm.ADO04SEED_VALUE.Value));
   end;

   if DM.ado114IF_VOUCHER.AsBoolean then  //jacky zhong 2016-3-28
   begin
    if sgrid1.RowCount>2 then
     begin
      with dm.ado105 do                                        //增加会计凭证总表
      begin
       close;
       dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
       open;
       append;
       dm.ado105VOUCHER.Value:=Edit7.Text;                          //凭证号
       dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;  //参考发票号
       dm.ado105TRANS_TYPE.Value:=6;                                //类型
       if dm.ado114BANK_PTR.Value>0 then
        dm.ado105VOU_TYPE.Value:=2
       else
        dm.ado105VOU_TYPE.Value:=0;
       dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
       dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
       dm.ado105ENTERED_DT.Value:=strtodate(edit8.Text);            //输入日期
       dm.ado105ATTACHED.Value := strtoint(edit11.text);           //附件张数
       dm.ado105FYEAR.Value := strtoint(edit12.Text);              //会计年度
       dm.ado105PERIOD.Value := strtoint(edit13.Text);             //会计期间
       dm.ado105CUSTOMER_PTR.Value:=dm.ado114SRCE_PTR.value;       //客户
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
      dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
      dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
      dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币
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
     end;     //完成凭证处理
   end;

   if memo_create then           //增加贷项备忘
   begin
     dm.ado116.Edit;
     dm.ado116GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
     dm.ado116.Post;
   end;
   dm.ADOConnection1.CommitTrans;
  if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
  begin
    Form_voucherreport:=TForm_voucherreport.Create(application);
    form_voucherreport.ppReport1.Reset;
    form_voucherreport.ppReport1.Template.FileName :=
     stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
    form_voucherreport.ppReport1.Template.LoadFromFile;
    Form_voucherreport.AQD105.Close;
    Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
    Form_voucherreport.AQD105.Open;
    Form_voucherreport.AQD106.Open;
    Form_voucherreport.AQD493.Open;
    Form_voucherreport.ppReport1.Print;
    Form_voucherreport.Free;
  end;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end
else  //编辑
 begin

  memo_create:=false;
  if (strtocurr(stext1.Caption) > 0) then     //多出余额记备忘
  begin
   form_credit:=tform_credit.Create(application);
   dm.ADO04.Close;
   dm.ADO04.Open;
   with form_credit do
    begin
     if dm.ADO04SEED_FLAG.Value<>1 then
     edit1.Text:=dm.ADO04SEED_VALUE.Value;
     edit2.Text:=dm.ado114TDATE.AsString;
     edit3.Text:=label5.Caption;
     edit4.Text:=stext1.Caption;
    end;
   if form_credit.ShowModal=mrok then
    begin
     memo_number:=form_credit.Edit1.Text;
     memo_remark:=form_credit.Edit5.Text;
     memo_create:=true;
    end;
   form_credit.Free;
  end;

  dm.ADOConnection1.BeginTrans;
  try

   if dm.ado114BANK_PTR.Value>0 then
    begin
     dm.ado128.Close;
     dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
     dm.ado128.Open;
     dm.ADO128.Edit;
     dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-
                                (dm.ADO114AMOUNT.Value-dm.ado114DEBIT_AMOUNT.Value)+
                                (strtocurr(edit6.Text)-strtocurr(edit15.Text));
     dm.ADO128.Post;
    end;

   dm.ado114REFERENCE_NO.Value:=edit4.Text;
   dm.ado114AMOUNT.AsString:=edit6.Text;
   dm.ado114DEBIT_AMOUNT.AsString:=edit15.Text;
   dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;
   dm.ado114.Post;
   self.update_invcre;
   self.save_invcre;         //更新发票及贷项备忘

  if memo_create then           //增加贷项备忘
   begin
    dm.ado116.close;
    dm.ado116.Parameters[0].Value:=dm.ado114RKEY.Value;
    dm.ado116.Open;
    if not dm.ado116.IsEmpty then dm.ado116.Delete;
    dm.ado116.Append;
    dm.ado116MEMO_NUMBER.Value:=memo_number;
    dm.ado116DESCRIPTION.Value:=memo_remark;
    dm.ado116CUST_PTR.Value:=dm.ado114SRCE_PTR.Value;
    dm.ado116SRCE_PTR.Value:=dm.ado114RKEY.Value;
    dm.ado116MEMO_TP.Value:=1;
    dm.ado116EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value;
    dm.ado116MEMO_DATE.Value:=dm.ado114TDATE.Value;
    dm.ado116RMA_DATE.Value:=dm.ado116MEMO_DATE.Value;
    dm.ado116AMOUNT.AsString:=stext1.Caption;
    dm.ado116AVL_AMT.AsString:=stext1.Caption;
    dm.ado116GOODS_AMT.Value:=dm.ado116AMOUNT.Value;
    dm.ado116CURRENCY_PTR.Value:=dm.ado114CURRECY_PTR.Value;
    dm.ado116EX_RATE.Value:=dm.ado114EXCHANGE_RATE.Value;
    dm.ado116REF_NUMBER.Value:=dm.ado114REFERENCE_NO.Value+'结余';
    dm.ado116warehouse_ptr.Value:=dm.ado114warehouse_ptr.Value;
    dm.ado116GLPTR_STATUS.Value:=true;
    dm.ado116.Post;
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     update_04(trim(dm.ADO04SEED_VALUE.Value));
   end;

   if DM.ado114IF_VOUCHER.AsBoolean then  //jacky zhong 2016-3-28
   begin
     with dm.ado105 do                                        //增加会计凭证总表
      begin
       close;
       dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
       open;
      end;
      if not dm.ado105.isempty then dm.ado105.Delete;
      dm.ADO106.Close;
      dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
      dm.ADO106.Open;

    if sgrid1.RowCount>2 then
     begin
      dm.ado105.append;
      dm.ado105VOUCHER.Value:=Edit7.Text;                          //凭证号
      dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;  //参考发票号
      dm.ado105TRANS_TYPE.Value:=6;                                //类型
      if dm.ado114BANK_PTR.Value>0 then
       dm.ado105VOU_TYPE.Value:=2
      else
       dm.ado105VOU_TYPE.Value:=0;
      dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
      dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
      dm.ado105ENTERED_DT.Value:=strtodate(edit8.Text);      //输入日期
      dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
      dm.ado105FYEAR.Value := strtoint(edit12.Text);                //会计年度
      dm.ado105PERIOD.Value := strtoint(edit13.Text);               //会计期间
      dm.ado105CUSTOMER_PTR.Value:=dm.ado114SRCE_PTR.value;       //客户
      dm.ado105.post;
      for i:=1 to SGrid2.RowCount-2 do
      begin
       dm.ado106.Append;
       dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
       dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
       dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
       dm.ADO106EXCH_RATE.AsString:=
       Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
       dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
       dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
       dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币
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
   end;

   if memo_create then           //增加贷项备忘
    begin
     dm.ado116.Edit;
     dm.ado116GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
     dm.ado116.Post;
    end;

   dm.ADOConnection1.CommitTrans;
    if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
    begin
    Form_voucherreport:=TForm_voucherreport.Create(application);
        form_voucherreport.ppReport1.Reset;
        form_voucherreport.ppReport1.Template.FileName :=
         stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
        form_voucherreport.ppReport1.Template.LoadFromFile;
    Form_voucherreport.AQD105.Close;
    Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
    Form_voucherreport.AQD105.Open;
    Form_voucherreport.AQD106.Open;
    Form_voucherreport.AQD493.Open;
    Form_voucherreport.ppReport1.Print;
    Form_voucherreport.Free;
    end;   
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     dm.ado114.Edit;
    end;
  end;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 i:word;
begin
if sgrid3.Row<>sgrid3.RowCount-1 then
 for i:=sgrid3.Row to sgrid3.RowCount-1 do
  sgrid3.Rows[i]:=sgrid3.Rows[i+1]
else
 begin
  sgrid3.Rows[sgrid3.RowCount-1].Clear;
  sgrid3.Cells[6,sgrid3.RowCount-1]:='0';
  sgrid3.Cells[7,sgrid3.RowCount-1]:='0';
 end;

 sgrid3.RowCount:=sgrid3.RowCount-1;

if (sgrid3.RowCount=1) and (dm.ADo114.State=dsinsert) then
 begin
  bitbtn4.Enabled:=true;
  ComboBox1.Enabled:=True;
  if dm.ado114TTYPE.Value = 1 then //现银收款,货币中银行帐户中读取
   begin
    bitbtn5.Enabled:=false;
    bitbtn6.Enabled:=true;
   end
  else
   begin
    bitbtn5.Enabled:=true;
    bitbtn6.Enabled:=false;
   end;
  self.calculate_Payment;
 end;
 
 if sgrid3.RowCount>7 then
  sgrid3.ColWidths[7]:=69
 else
  sgrid3.ColWidths[7]:=84;

end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
    edit2.Text:=form_curr.ADOQuery1CURR_CODE.Value;
    label15.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
    dm.ado114CURRECY_PTR.Value:=form_curr.ADOQuery1rkey.Value;
    edit5.Text:=form_curr.ADOQuery1base_to_other.AsString;
    if dm.ado114CURRECY_PTR.Value=1 then
     edit5.Enabled:=false
    else
     edit5.Enabled:=true;
 end;
form_curr.Free;
end;

function TForm2.find_invoicerkey(rkey112: integer): boolean;
var
 i:word;
begin
result:=false;
for i:=1 to sgrid3.RowCount-1 do
 if strtoint(sgrid3.Cells[8,i])=rkey112 then
  begin
   result:=true;
   break;
  end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:word;
begin
if (trim(edit1.Text)='') or (trim(edit2.Text)='')  then
 messagedlg('请首先确定客户及货币!',mterror,[mbcancel],0)
else
try
 form_invoice:=tform_invoice.Create(application);
 form_invoice.ADODataSet1.Close;
 form_invoice.ADODataSet1.Parameters[0].Value:=dm.ado114SRCE_PTR.Value;
 form_invoice.ADODataSet1.Parameters[1].Value:=dm.ado114CURRECY_PTR.Value;
//form_invoice.ADODataSet1.Parameters[2].Value:=dm.ado114warehouse_ptr.Value;
 form_invoice.ADODataSet1.Open;
if form_invoice.ADODataSet1.IsEmpty then
 messagedlg('没有找到符合条件的应收发票!',mtinformation,[mbok],0)
else
if form_invoice.ShowModal=mrok then
 begin
  WITH form_invoice DO
  BEGIN
  for i := 0 to DBGrid1.SelectedRows.Count-1 do
  BEGIN
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
   
  if find_invoicerkey(form_invoice.ADODataSet1rkey.Value) then
   messagedlg('发票编号:'+ADODataSet1invoice_number.Value+
                      '已经在可收款中,不须增加!',mtinformation,[mbok],0)
  else
   begin
    sgrid3.RowCount:=sgrid3.RowCount+1;
    sgrid3.Cells[0,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.FieldValues['invoice_number'];
    sgrid3.Cells[1,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('INVOICE_DATE').AsString;
    sgrid3.Cells[2,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('INVOICE_TOTAL').AsString;
    sgrid3.Cells[3,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('EXCHANGE_RATE').AsString;
    sgrid3.Cells[4,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('yisou').AsString;
    sgrid3.Cells[5,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('yinsou').AsString;
    if strtocurr(stext1.caption) >= form_invoice.ADODataSet1yinsou.Value then
     sgrid3.Cells[6,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.Fieldbyname('yinsou').AsString
    else
     if strtocurr(stext1.caption) > 0 then
      sgrid3.Cells[6,sgrid3.RowCount-1]:=stext1.caption
     else
      sgrid3.Cells[6,sgrid3.RowCount-1]:='0.00';
    sgrid3.Cells[7,sgrid3.RowCount-1]:='0.00';
    sgrid3.Cells[8,sgrid3.RowCount-1]:=form_invoice.ADODataSet1.fieldbyname('rkey').AsString; //112.rkey
    self.calculate_Payment;
   end;

  END;
  END;


   if sgrid3.RowCount>1 then
    begin
     sgrid3.FixedRows:=1;
     bitbtn6.Enabled:=false;
     bitbtn4.Enabled:=false;
     bitbtn5.Enabled:=false;
     ComboBox1.Enabled:=false;
    end;
    if sgrid3.RowCount>7 then
     sgrid3.ColWidths[7]:=69
    else
     sgrid3.ColWidths[7]:=84;
 end;
finally
form_invoice.Free;
end;
end;

procedure TForm2.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.Edit8Exit(Sender: TObject);
begin
try
 strtodate(edit8.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit8.SetFocus;
 exit;
end;

if dm.ADO114.State=dsinsert then
 begin
  edit7.Text:=self.get_vouchernumber(strtodate(edit8.Text));
  Edit12.Text:=inttostr(yearof(strtodate(edit8.Text)));
  Edit13.Text:=inttostr(monthof(strtodate(edit8.Text)));
 end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
IF SGRID3.Row=0 then
 n2.Enabled:=false
else
 n2.Enabled:=true; 
end;

procedure TForm2.SGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (bitbtn1.Enabled) and (sgrid4.Row>0) then
 if (chr(key)='A') and (ssCtrl in shift) then
  sgrid4.Cells[7,sgrid4.Row]:=sgrid4.Cells[5,sgrid4.Row];
end;

procedure TForm2.SGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (bitbtn1.Enabled) and (sgrid3.Row>0) then
 if (chr(key)='A') and (ssCtrl in shift) then
  sgrid3.Cells[6,sgrid3.Row] := formatfloat('0.00',strtofloat(sgrid3.Cells[5,sgrid3.Row])-
                            strtofloat(sgrid3.Cells[7,sgrid3.Row]))
end;

procedure TForm2.Button4Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to sgrid4.RowCount-1 do
  sgrid4.Cells[7,i]:=sgrid4.Cells[5,i];
 self.calculate_Payment;
end;

function TForm2.find_bank_acct(rkey103: integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0128');
  sql.Add('where GL_ACCT_PTR='+inttostr(rkey103));
  open;
  if IsEmpty then
   result:=false
  else
   result:=true;
 end;
end;

procedure TForm2.sgrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 v_c:currency;
begin
if key=13 then    //用户按下回车键,左右对调
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

if key=187 then    //用户按下=键,自动计算
 begin
  if sgrid1.Row <> sgrid1.RowCount-1 then
  begin

   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext2.Caption))-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext1.Caption))-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.re_calculate;
  end;
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
   result:=result+strtocurr(sgrid1.Cells[5,i]);
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
   result:=result+strtocurr(sgrid1.Cells[6,i]);
  end;
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

procedure TForm2.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.N3Click(Sender: TObject);
var
  i:integer;
begin
  try
   form_acct:=tform_acct.Create(application);
   if form_acct.ShowModal=mrok then
    try
     form_curr:=tform_curr.Create(application);
     if form_curr.ShowModal=mrok then
      begin

     if (dm.ado114TTYPE.Value=5) and (find_bank_acct(form_acct.ADOQuery1RKEY.Value)) then
      begin
       messagedlg('科目连接有现金银行帐户,不能添加!',mterror,[mbcancel],0);
       exit;
      end;

       if (form_acct.ADOQuery1curr_tp.Value=0) and
          (form_curr.ADOQuery1rkey.Value>1) then
        messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
       else
        if (form_acct.ADOQuery1curr_tp.Value=2) and
           (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
         messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
        else
         begin

          for i:=sgrid1.RowCount-1 downto sgrid1.Row+1 do
          begin
           sgrid1.Rows[i]:=sgrid1.Rows[i-1];
           sgrid2.Rows[i]:=sgrid2.Rows[i-1];
          end;

          if (sgrid1.Rowcount>3) and (sgrid1.Row>1) then       //摘要
           sgrid1.Cells[0,sgrid1.Row]:=trim(sgrid1.Cells[0,sgrid1.Row-1])
          else
           sgrid1.Cells[0,sgrid1.Row]:='';

          sgrid1.Cells[1,sgrid1.Row]:=              //科目
                           trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                           trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;

          if dm.ado114CURRECY_PTR.Value=form_curr.ADOQuery1rkey.Value then
           sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
          else
           sgrid1.Cells[3,sgrid1.Row]:=
                            form_curr.ADOQuery1base_to_other.AsString;

           sgrid1.Cells[4,sgrid1.Row]:='';
           sgrid1.Cells[5,sgrid1.Row]:='';
           sgrid1.Cells[6,sgrid1.Row]:='';

          sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
          sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;



          if sgrid1.RowCount=3 then
           begin
           speedbutton2.Enabled:=true;
           speedbutton3.Enabled:=true;
           speedbutton4.Enabled:=true;
           speedbutton5.Enabled:=true;
           speedbutton6.Enabled:=true;
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

procedure TForm2.Edit15Exit(Sender: TObject);
begin
if trim(edit15.Text)='' then edit15.Text:='0.00';
edit15.Text:=formatfloat('0.00',strtocurr(edit15.Text));
if strtocurr(edit15.Text) > strtocurr(edit6.Text) then
 begin
  messagedlg('银行手续费不能大于票据金额!',mterror,[mbcancel],0);
  edit15.SetFocus;
 end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 dm.ado114warehouse_ptr.Value:=
  self.warehouse_number[ComboBox1.ItemIndex];
end;


procedure TForm2.btn1Click(Sender: TObject);
begin
  if sgrid3.RowCount>1 then
     common.Export_Grid_to_Excel(SGrid3,'发票',False)
  else
     btn1.Enabled:=False;

end;

procedure TForm2.btn2Click(Sender: TObject);
begin
    if sgrid4.RowCount>1 then
      common.Export_Grid_to_Excel(SGrid4,'备忘',False)
     else
      btn2.Enabled:=False;
end;

end.
