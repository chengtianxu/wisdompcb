unit supp_prepay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, ExtCtrls, Menus, ToolWin,
  DateUtils;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
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
    Label19: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    abbr_name: TLabel;
    ToolBar1: TToolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label25: TLabel;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label15: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Edit_ATTACHED: TEdit;
    Edit_date: TEdit;
    Edit_fyear: TEdit;
    Edit_number: TEdit;
    Edit_PERIOD: TEdit;
    report_Check: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Edit_employee: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    sgrid2: TStringGrid;
    Label29: TLabel;
    BATCH_NUMBER: TEdit;
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
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1Exit(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure re_calculate;
    function get_col5(row:integer):currency;
    function get_col6(row:integer):currency;
    procedure PopupMenu3Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit_dateExit(Sender: TObject);
    procedure Edit_dateKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton9Click(Sender: TObject);
    function find_debit_error(number:string):boolean;
    procedure update_04(v_seed: string);
    procedure Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   bank_ptr,warehouse_ptr,supp_ptr,curr_ptr:integer;
  public
    { Public declarations }
   edit_flag:byte;  //0,新增1,编辑2,检查
   accbank_gl_ptr,accsupp_gl_ptr:integer;
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;
implementation

uses BankSearch, datamd, curr_search, main, supplier_search,common,
  warehouse_search, AcctSearch, voucher_dictionary, voucher_report;

{$R *.dfm}
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

function tform4.find_debit_error(number:string):boolean;
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

function TForm4.get_col5(row: integer): currency;
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

function TForm4.get_col6(row: integer): currency;
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

procedure TForm4.re_calculate;
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
statictext1.Caption:=Floattostrf(vdb,ffNumber,10,2);
statictext2.Caption:=Floattostrf(vcr,ffNumber,10,2);
end;

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
  self.accbank_gl_ptr:=FrmBankSearch.Adodata0128gl_acct_ptr.Value;
  if curr_ptr=1 then
   edit6.Enabled:=false
  else
   edit6.Enabled:=true;
  end;
FrmBankSearch.Free;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
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

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
if  (combobox1.ItemIndex =1) and (trim(edit2.Text)='') then
 showmessage('请首先确定银行帐户')
else
try
form_supp:=tform_supp.Create(application);
form_supp.Edit1.Text:=edit4.Text;
if form_supp.ShowModal=mrok then
 begin
  if supp_ptr<>form_supp.ADOdata0023RKEY.Value then
   begin
    if (combobox1.ItemIndex =1) and (form_supp.ADOData0023currency_ptr.Value<>self.curr_ptr) then
     if messagedlg('所选供应商定义的货币与现金银行帐户货币不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)=mryes then
      begin
       edit4.Text:=form_supp.ADOdata0023CODE.Value;
       label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
       self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
       self.accsupp_gl_ptr:=form_supp.ADOData0023ACC_PAYABLE_PTR.Value;
       self.abbr_name.Caption:=form_supp.ADOData0023abbr_name.Value;
      end
     else
    else
    begin
     if combobox1.ItemIndex = 5 then //转帐支付
      begin
       edit5.Text:=form_supp.ADOData0023curr_code.Value;
       label11.Caption:=form_supp.ADOData0023curr_name.Value;
       self.curr_ptr:=form_supp.ADOData0023currency_ptr.Value;
       edit6.Text:=form_supp.ADOData0023BASE_TO_OTHER.AsString;
       if self.curr_ptr=1 then
        edit6.Enabled:=false
       else
        edit6.Enabled:=true;
      end;
     edit4.Text:=form_supp.ADOdata0023CODE.Value;
     label10.Caption:=form_supp.ADOdata0023SUPPLIER_NAME.Value;
     self.supp_ptr:=form_supp.ADOdata0023RKEY.Value;
     self.accsupp_gl_ptr:=form_supp.ADOData0023ACC_PAYABLE_PTR.Value;
     self.abbr_name.Caption:=form_supp.ADOData0023abbr_name.Value;
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
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if trim(edit3.Text)='' then
 begin
  showmessage('工厂代码不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  bitbtn3.SetFocus;
  exit;
 end;

if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('支票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if strtofloat(edit8.Text)=0 then
 begin
  showmessage('付款金额必需大于零');
  self.PageControl1.ActivePageIndex:=0;
  edit8.SetFocus;
  exit;
 end;

if trim(edit9.Text)='' then
 begin
  messagedlg('贷项备忘不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit9.SetFocus;
  exit;
 end;

 dm.ADOsp04.Close;
 dm.ADOsp04.Open;
 if (dm.ADOsp04SEED_FLAG.Value<>1) and
    (edit_flag=0) then
if not (edit9.Text[length(trim(edit9.Text))] in ['0'..'9']) then
  begin
   messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
   self.PageControl1.ActivePageIndex:=0;
   edit9.SetFocus;
   exit;
  end;

if trim(edit4.Text)='' then
 begin
  showmessage('供应商代码不允许为空!');
  self.PageControl1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

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

{  if strtocurr(formatfloat('0.00',strtocurr(edit8.Text)*
                                  strtocurr(edit6.Text)
                          ))<>
     strtocurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目贷方金额与发票发生额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;  }

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
    self.PageControl1.ActivePageIndex:=1;
    edit_date.SetFocus;
    exit;
   end;

 end;

end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if self.edit_flag=0 then
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

if self.find_debit_error(trim(edit9.Text)) then
 begin
  dm.adosp04.close;
  dm.adosp04.Open;
  if dm.ADOsp04SEED_FLAG.Value<>1 then
   if messagedlg('借项备忘编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
    begin
     edit9.Text:=dm.ADOsp04SEED_VALUE.Value;
    end
   else
    begin
     edit9.SetFocus;
     exit;
    end
  else
   begin
    messagedlg('借项备忘编号重复可能多人同时新增!请手工修改',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit9.SetFocus;
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
 IF self.bank_ptr>0 then
 dm.ADO129BANK_PTR.Value:=self.bank_ptr;

 dm.ADO129TDATE.Value:=self.dtpk1.Date;
 dm.ADO129STATUS.Value:=1;
 dm.ADO129TTYPE.Value:=self.ComboBox1.ItemIndex+1;
 dm.ADO129SRCE_PTR.Value:=self.supp_ptr;  //指向供应商
 dm.ADO129EMPL_PTR.Value:=strtoint(user_ptr);
 dm.ADO129CURR_PTR.Value:=self.curr_ptr;
 dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
 dm.ADO129REMARK.Value:=edit15.Text;
 dm.ADO129warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO129.Post;
 if self.bank_ptr>0 then
 self.update_128(trim(edit1.Text));

 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=dm.ADO129RKEY.Value;
 dm.ADO132.Open;
 dm.ADO132.Append;
 dm.ADO132MEMO_NUMBER.Value := trim(edit9.Text);
 dm.ADO132SUPP_PTR.Value := dm.ADO129SRCE_PTR.Value;
 dm.ADO132SRCE_PTR.Value := dm.ADO129RKEY.Value;
 dm.ADO132MEMO_TP.Value := 4;   //借项预付备忘
 dm.ADO132EMPL_PTR.Value := strtoint(user_ptr);
 dm.ADO132MEMO_DATE.Value := self.dtpk1.Date;
 dm.ADO132ENT_DATE.Value := self.dtpk1.Date;
 dm.ADO132AMOUNT.Value := strtofloat(edit8.Text);
 dm.ADO132AVL_AMT.Value := dm.ADO132AMOUNT.Value;
 dm.ADO132CURRENCY_PTR.Value := self.curr_ptr;
 dm.ADO132EX_RATE.Value := strtofloat(edit6.Text);
 dm.ADO132REF_NUMBER.Value := edit10.Text;
 dm.ADO132warehouse_ptr.Value:=self.warehouse_ptr;
 dm.ADO132.Post;

 self.update_04(trim(edit9.Text));

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
     self.PageControl1.ActivePageIndex:=0;
     edit1.SetFocus;
    end;
 end;
end
else   //编辑
 begin
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
                                strtocurr(edit8.Text);
     dm.ADO128.Post;
    end;
   dm.ADO129.Edit;
   dm.ADO129CHECK_NUMBER.Value:=trim(edit1.Text);
   dm.ADO129TDATE.Value:=self.dtpk1.Date;
   dm.ADO129EX_RATE.AsString:=self.Edit6.Text;
   dm.ADO129REMARK.Value := edit15.Text;
   dm.ADO129AMOUNT.Value:=strtocurr(edit8.Text);
   dm.ADO129EMPL_PTR.Value:=strtoint(user_ptr);
   dm.ADO129.Post;

   dm.ADO132.Close;
   dm.ADO132.Parameters[0].Value:=dm.ADO129RKEY.Value;
   dm.ADO132.Open;
   dm.ADO132.Edit;
   dm.ADO132MEMO_NUMBER.Value := trim(edit9.Text);
   dm.ADO132EMPL_PTR.Value := strtoint(user_ptr);
   dm.ADO132MEMO_DATE.Value := self.dtpk1.Date;
   dm.ADO132ENT_DATE.Value := self.dtpk1.Date;
   dm.ADO132AMOUNT.Value := strtofloat(edit8.Text);
   dm.ADO132AVL_AMT.Value := dm.ADO132AMOUNT.Value;
   dm.ADO132EX_RATE.Value := strtofloat(edit6.Text);
   dm.ADO132REF_NUMBER.Value := edit10.Text;
   dm.ADO132.Post;

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
     open;
    end;
    if not dm.ado105.isempty then dm.ado105.Delete;
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
     self.PageControl1.ActivePageIndex:=0;
     edit1.SetFocus;
    end;
  end;
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

procedure TForm4.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm4.SGrid1Exit(Sender: TObject);
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

procedure TForm4.SGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm4.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm4.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm4.N4Click(Sender: TObject);
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

        if self.curr_ptr= form_acct.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1] := edit6.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1] :=
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

procedure TForm4.N5Click(Sender: TObject);
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

procedure TForm4.N11Click(Sender: TObject);
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
      if self.curr_ptr= form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit6.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=
                         form_curr.ADOQuery1BASE_TO_OTHER.AsString;
      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
      self.re_calculate;
     end;
  end;
finally
 form_curr.Free;
end;
end;

procedure TForm4.N7Click(Sender: TObject);
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

procedure TForm4.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm4.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm4.PopupMenu3Popup(Sender: TObject);
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

procedure TForm4.FormActivate(Sender: TObject);
var
 i:integer;
begin
sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';

if edit_flag<>0 then //检查或者编辑
 begin
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

  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value:=dm.Aq129RKEY.Value;
  dm.ADO132.Open;
  edit9.Text:=dm.ADO132MEMO_NUMBER.Value;
  edit10.Text:=dm.ADO132REF_NUMBER.Value;

  dm.ADO129.Close;
  dm.ADO129.Parameters[0].Value:=dm.AQ129RKEY.Value;
  dm.ADO129.Open;

  bank_ptr := dm.ADO129BANK_PTR.Value;
  warehouse_ptr := dm.ADO129warehouse_ptr.Value;
  supp_ptr := dm.ADO129SRCE_PTR.Value;
  curr_ptr := dm.ADO129CURR_PTR.Value;
  accsupp_gl_ptr := dm.AQ129ACC_PAYABLE_PTR.Value;
  accbank_gl_ptr := dm.AQ129GL_ACCT_PTR.Value;

  if edit_flag=1 then //编辑
   begin
    if curr_ptr<>1 then
     edit6.Enabled:=true
    else
     edit6.Enabled:=false;
   end
  else
   edit6.Enabled:=false;

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

procedure TForm4.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin

if (self.edit_flag=0) or (trim(edit_number.Text)='') then
if (self.supp_ptr>0) and
(strtocurr(edit8.Text)*StrToFloat(edit6.Text)<>
 strtocurr(RemoveInvalid(statictext1.Caption))) then
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

 if strtocurr(edit8.Text) > 0 then    //借方应付帐款
 begin
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
         Formatfloat('0.00',strtocurr(edit8.Text)*StrToFloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;       //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;       //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;  //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr)//货币指针;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=self.curr_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;       //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;  //原币金额
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
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+        //发票编号加供应商代码加简称
                         edit4.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);

      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                        formatfloat('0.00',strtocurr(edit8.Text)*StrToFloat(edit6.Text));
      if self.accsupp_gl_ptr>0 then
      sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.accsupp_gl_ptr)
      else
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;

      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;     //处理借方应付帐款
      end;
   end;
//==============================================================处理贷方银行存款
  mt_error:=true;
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
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;    //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.curr_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=curr_ptr then
        begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit6.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;    //原币金额
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
       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit1.Text+ '['+        //发票编号加供应商代码加简称
                         edit4.Text+
                         ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
        Formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit6.Text));

       if self.accbank_gl_ptr>0 then
        sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(accbank_gl_ptr)
       else
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;     //处理贷方银行存款
      end;
   end;
  end;
  //=============================
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

procedure TForm4.Edit_dateExit(Sender: TObject);
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

procedure TForm4.Edit_dateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm4.SpeedButton9Click(Sender: TObject);
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

procedure TForm4.Edit_ATTACHEDKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

end.
