unit misc_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls, ToolWin, DBCtrls,
  Mask, Menus,DateUtils, DB, ADODB;

type
  TForm5 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit5: TEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit15: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    abbr_name: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    function get_vouchernumber(inv_date: tdatetime): string;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function vo_number(number:string): boolean;
    function invo_number_error(number: string): boolean;
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure re_calculate;
    procedure FormActivate(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure save_note();
    procedure update_04(v_seed: string);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Exit(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }

   invoice_note: tstringlist;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
   function returen_tax(rkey10:Integer):Currency;
  public
    { Public declarations }
   acc_gl_ptr:integer;
  end;

var
  Form5: TForm5;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;
implementation

uses customer_search, damo, curr_search, main, AcctSearch, note,
  voucher_report, voucher_dictionary,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

function TForm5.get_col5(row: integer): currency;
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

function TForm5.get_col6(row: integer): currency;
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

function TForm5.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
 voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
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

procedure TForm5.re_calculate;
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

function TForm5.get_gltp(rkey103: string): integer;
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

function TForm5.get_glcurr_ptr(rkey103: string): integer;
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

function TForm5.vo_number(number: string): boolean;
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

function TForm5.invo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0112');
  sql.Add('where invoice_number='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm5.save_note();
begin
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=112 and file_pointer='+dm.ADO112rkey.AsString);
    open;
   end;
 if (not dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)<>'') then
  begin //原记录有记事本
   dm.ADOquery1.Edit;
   dm.ADOquery1.fieldbyname('memo_text').AsString:=invoice_note.Text;
   dm.ADOquery1.Post;
  end
 else
  if (not dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)='') then
   dm.ADOquery1.Delete   //如果原记录有记事本但被删除了
  else
   if (dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)<>'') then
    begin           //如果原记录没有记事本，但新增了记事本
     dm.ADOquery1.Append;
     dm.ADOquery1.FieldByName('file_pointer').AsString:=dm.ADO112rkey.AsString;
     dm.ADOquery1.Fieldvalues['source_type']:=112;
     dm.ADOquery1.fieldbyname('memo_text').asstring:=invoice_note.Text;
     dm.ADOquery1.Post;
    end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm5.update_04(v_seed: string);
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
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

procedure TForm5.BitBtn6Click(Sender: TObject);
var
 v_year,v_month,v_day:integer;
begin
try
 form_customer:=tform_customer.Create(application);
 if form_customer.ShowModal=mrok then
  begin
   edit1.Text:=form_customer.ADOQuery1CUST_CODE.Value;
   label19.Caption:=form_customer.ADOQuery1CUSTOMER_NAME.Value;
   edit5.Text:=form_customer.ADOQuery1CURR_CODE.Value;
   label20.Caption:=form_customer.ADOQuery1CURR_NAME.Value;
   dm.ADO112CUSTOMER_PTR.Value:=form_customer.ADOQuery1rkey.Value;
   dm.ADO112CURRENCY_PTR.Value:=form_customer.ADOQuery1CURRENCY_PTR.Value;
   dm.ADO112EXCHANGE_RATE.Value:=form_customer.ADOQuery1base_to_other.Value;
   dm.ADO112ship_tax.Value:=returen_tax(dm.ADO112CUSTOMER_PTR.Value);
  if (form_customer.ADOQuery1EDI_FLAG_CREDIT_MEMO.Value > 0) and
     (form_customer.ADOQuery1EDI_FLAG_CREDIT_MEMO.Value <= 28) then
   v_day:=form_customer.ADOQuery1EDI_FLAG_CREDIT_MEMO.Value            //结帐日
  else
   v_day:=1;
  if form_customer.ADOQuery1REG_TAX_FIXED_UNUSED.AsInteger=1 then    //发票到期计算方法为货到
   dm.ADO112net_pay.Value := form_customer.ADOQuery1NET_PAY.Value         //付款天数         6
  else                                             //发票到期计算方法为月结
   if dayof(dm.ADO112POSTED_DATE.Value) > v_day then
    begin
     if MonthOf(dm.ADO112POSTED_DATE.Value)+1 <= 12 then
      begin
       v_month:=MonthOf(dm.ADO112POSTED_DATE.Value)+1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value);
      end
     else
      begin
       v_month:=1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value)+1;
      end;
     dm.ADO112net_pay.Value:=
     DaysBetween(EncodeDate(v_year,v_month,v_day),
                 dm.ADO112POSTED_DATE.Value)+form_customer.ADOQuery1NET_PAY.Value;
    end
   else
    dm.ADO112net_pay.Value := v_day-dayof(dm.ADO112POSTED_DATE.Value)+
                               form_customer.ADOQuery1NET_PAY.Value;

   dm.ADO112DUE_DATE.Value:=dm.ADO112POSTED_DATE.Value+dm.ADO112net_pay.Value;
   self.acc_gl_ptr:=form_customer.ADOQuery1ACC_REC_PTR.Value;
   abbr_name.Caption:=form_customer.adoquery1abbr_name.value;
  if dm.ADO112.State=dsinsert then  //新增
   with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=2010 and file_pointer='+dm.ADO112CUSTOMER_PTR.AsString);
    open;
    invoice_note.Assign(fieldbyname('memo_text'));
   end;
   self.PageControl1Change(sender);
  end;
finally
 form_customer.Free;
end;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   edit5.Text:=form_curr.ADOQuery1CURR_CODE.Value;
   label20.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
   dm.ADO112CURRENCY_PTR.Value:=form_curr.ADOQuery1rkey.Value;
   dm.ADO112EXCHANGE_RATE.Value:=form_curr.ADOQuery1base_to_other.Value;
  end;
finally
 form_curr.Free;
end;
end;

procedure TForm5.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin
if (dm.ADO112.State=dsbrowse) or (dm.fincontrol1='N') then exit;

if (dm.ADo112.State=dsinsert) or (edit8.Text='') then     //新增
 //在编辑时编码为空可能是先前没有金额发生编辑时发生金额,所以需要重做凭证
if (dm.ADO112CUSTOMER_PTR.Value>0) and
   (strtocurr(formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                        dm.ADO112EXCHANGE_RATE.Value))<>
     strtocurr(RemoveInvalid(statictext1.Caption))) then
 begin

  edit11.Text:=dm.ADO112POSTED_DATE.AsString;
  edit8.Text:=self.get_vouchernumber(dm.ADO112POSTED_DATE.Value);
  Edit13.Text:=inttostr(yearof(dm.ADO112POSTED_DATE.Value));   //会计年度
  Edit14.Text:=inttostr(monthof(dm.ADO112POSTED_DATE.Value));  //会计期间
  edit15.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  mt_error:=true;
  dm.ADO104.Close;
  dm.ADO104.Open;           //打开会计分录定义
  if dm.ADO112INVOICE_TOTAL.Value > 0 then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if acc_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(self.acc_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*dm.ADO112EXCHANGE_RATE.Value);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=               //货币
                         edit5.Text;
       sgrid1.Cells[3,sgrid1.RowCount-1]:=               //汇率
                         dm.ADO112EXCHANGE_RATE.AsString;
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
       sgrid2.Cells[1,sgrid2.RowCount-1]:=
                       dm.ADO112CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
         if fieldbyname('curr_ptr').AsInteger=dm.ADO112CURRENCY_PTR.Value then
          begin
           sgrid1.Cells[2,sgrid1.RowCount-1]:=               //货币
                             edit5.Text;
           sgrid1.Cells[3,sgrid1.RowCount-1]:=               //汇率
                             dm.ADO112EXCHANGE_RATE.AsString;
           sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                             formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
           sgrid2.Cells[1,sgrid2.RowCount-1]:=
                           dm.ADO112CURRENCY_PTR.AsString;
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
                         maskedit1.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                        formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      if self.acc_gl_ptr>0 then
       sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
      else
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
    //=========以上为借方====以下为贷方================================
  mt_error:=true;  
 if dm.ADO112ship_amount.Value>0 then
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
         Formatfloat('0.00',dm.ADO112ship_amount.Value*
                            dm.ADO112EXCHANGE_RATE.Value);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=               //货币
                         edit5.Text;
       sgrid1.Cells[3,sgrid1.RowCount-1]:=               //汇率
                         dm.ADO112EXCHANGE_RATE.AsString;
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112ship_amount.Value);
       sgrid2.Cells[1,sgrid2.RowCount-1]:=
                       dm.ADO112CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=dm.ADO112CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=               //货币
                           edit5.Text;
         sgrid1.Cells[3,sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112ship_amount.Value);
         sgrid2.Cells[1,sgrid2.RowCount-1]:=
                         dm.ADO112CURRENCY_PTR.AsString;
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
                           maskedit1.Text+ '['+
                           edit1.Text+
                           ABBR_NAME.Caption+']';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+
                           trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                           trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
                          formatfloat('0.00',dm.ADO112ship_amount.Value*
                          dm.ADO112EXCHANGE_RATE.Value);
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
//============================================================ 处理税金
   if dm.ADO112FED_TAX_AMOUNT.Value>0 then
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
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado112CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=               //货币
                           edit5.text;
         sgrid1.Cells[3,sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value);
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado112CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end; //end case
      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售入帐'+  //摘要
                           MaskEdit1.Text+ '['+
                           edit1.text+
                           abbr_name.caption+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+
                           trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                           trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                          formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value*
                          dm.ADO112EXCHANGE_RATE.Value);
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
     end;
//============================================================


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

procedure TForm5.DBEdit5Exit(Sender: TObject);
begin
if dbedit5.Text='' then dm.ADO112net_pay.Value:=0;
dm.ADO112DUE_DATE.Value:=dm.ADO112POSTED_DATE.Value+
                         dm.ADO112net_pay.Value;
end;

procedure TForm5.DBEdit4Exit(Sender: TObject);
begin
dm.ADO112DUE_DATE.Value:=dm.ADO112POSTED_DATE.Value+dm.ADO112net_pay.Value;
end;

procedure TForm5.FormActivate(Sender: TObject);
var
 i:word;
begin
sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';
if dm.ADo112.State=dsinsert then     //新增
  begin

  end
else           //编辑
 begin
  with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=112 and file_pointer='+dm.ADO112rkey.AsString);
    open;
    if not isempty then
     invoice_note.Assign(fieldbyname('memo_text'));
   end;

  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO112RKEY.Value;
  dm.Aqd105.Open;
  edit8.Text:=dm.Aqd105VOUCHER.Value;
  edit11.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit13.Text:=dm.Aqd105FYEAR.AsString;
  edit14.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit15.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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
    sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString;
    sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value);
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

 self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;

end;

procedure TForm5.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm5.Sgrid1Exit(Sender: TObject);
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

procedure TForm5.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm5.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm5.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm5.PopupMenu3Popup(Sender: TObject);
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

procedure TForm5.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
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
        sgrid1.Cells[2,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1curr_code.Value;

        if dm.ado112CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=dbedit3.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=form_curr.ADOQuery1base_to_other.AsString;

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

procedure TForm5.N5Click(Sender: TObject);
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

procedure TForm5.N11Click(Sender: TObject);
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
      if dm.ado112CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=dbedit3.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
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

procedure TForm5.N7Click(Sender: TObject);
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

procedure TForm5.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1];  
end;

procedure TForm5.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO112.State=dsinsert then  //新增
 begin
  edit8.Text:=self.get_vouchernumber(strtodate(edit11.Text));
  Edit13.Text:=inttostr(yearof(strtodate(edit11.Text)));
  Edit14.Text:=inttostr(monthof(strtodate(edit11.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm5.N2Click(Sender: TObject);
begin
if dm.ADo112customer_ptr.Value>0 then
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='客户记事本:'+edit1.Text;
  with edit_note do
   begin
    bitbtn1.Enabled:=false;
    button1.Visible:=false;
    button2.Visible:=false;
    button3.Visible:=true;
    memo1.ReadOnly:=true;
    memo1.Color:=cl3dlight;
   end;
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=2010 and file_pointer='+dm.ADo112customer_ptr.AsString);
    open;
   if not isempty then
    edit_note.Memo1.Lines.Assign(fieldbyname('memo_text'));
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end
else
 showmsg('请首先选择客户代码！',1); 
end;

procedure TForm5.N3Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='发票记事本:'+maskedit1.Text;
  if bitbtn1.Enabled = false then
   with edit_note do
    begin
     bitbtn1.Enabled:=false;
     button1.Visible:=false;
     button2.Visible:=false;
     button3.Visible:=true;
     memo1.ReadOnly:=true;
     memo1.Color:=cl3dlight;
    end;
  edit_note.Memo1.Lines.Assign(invoice_note);
 if edit_note.ShowModal=mrok then
   invoice_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 invoice_note:=tstringlist.Create;
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
 invoice_note.free;
end;

procedure TForm5.BitBtn1Enter(Sender: TObject);
begin
if trim(maskedit1.Text)='' then
 begin
  messagedlg('发票编号不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  maskedit1.SetFocus;
  exit;
 end;
 
if trim(edit2.Text)='' then
 begin
  messagedlg('工厂不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit2.SetFocus;
  exit;
 end;

if trim(edit1.Text)='' then
 begin
  messagedlg('客户不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if not dm.ADOd04.Active then dm.ADOd04.Open;
 if (dm.ADOd04SEED_FLAG.Value<>1) and (dm.ADO112.State=dsinsert) then
  if not (maskedit1.Text[length(trim(maskedit1.Text))] in ['0'..'9']) then
   begin
    messagedlg('发票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    maskedit1.SetFocus;
    exit;
   end;

 if dm.ADO112INVOICE_TOTAL.Value<=0 then
  begin
    messagedlg('发票金额不能少于零',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    dbedit8.SetFocus;
    exit;
  end;

  if sgrid1.RowCount=2 then
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

  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit13.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit13.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit14.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit11.SetFocus;
    exit;
   end;

  if (strtoint(Edit14.Text) <> monthof(strtodate(edit11.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit11.SetFocus;
    exit;
   end;

 end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if sgrid1.RowCount>2 then
  if strtocurr(formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*dm.ADO112EXCHANGE_RATE.Value))<>
     strtocurr(RemoveInvalid(statictext1.Caption)) then
   begin
    if messagedlg('科目借方金额与发票发生额不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
     begin
      self.PageControl1.ActivePageIndex:=1;
      sgrid1.SetFocus;
      exit;
     end;
   end;

if dm.ADO112.State=dsInsert then //新增
 begin
  if self.invo_number_error(trim(maskedit1.Text)) then
   begin
    dm.ADOD04.Close;
    dm.ADOD04.Open;
    if dm.ADOD04SEED_FLAG.Value<>1 then
     begin
      MaskEdit1.Text:=dm.ADOD04SEED_VALUE.Value;
      messagedlg('发票编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
     end
    else
     begin
      messagedlg('发票编号重复!请手工重新输入',mterror,[mbok],0);
      self.PageControl1.ActivePageIndex:=0;
      maskedit1.SetFocus;
      exit;
     end;
   end;
  if sgrid1.RowCount>2 then
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=get_vouchernumber(strtodate(edit11.Text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO112invoice_number.Value:=maskedit1.Text;
   dm.ADO112INVOICE_TOTAL.AsString:=
      formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
   dm.ADO112GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
   dm.ADO112.Post;
   self.save_note();
   //==================保存新增发票及送货价格等==============
   dm.ADOD04.Close;
   dm.ADOD04.Open;
   if dm.ADOD04SEED_FLAG.Value<>1 then
    self.update_04(trim(dm.ADOD04SEED_VALUE.Value));
   //=================更新初始值================
   if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO112RKEY.Value;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit8.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO112invoice_number.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO112RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO112EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);           //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);             //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ADO112CUSTOMER_PTR.value;
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
    dm.ado106REF_NUMBER.Value:=dm.ADO112invoice_number.Value;
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
   //============================保存凭证===================
   dm.ADOConnection1.CommitTrans;
  if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
  begin
   form_voucherreport:=Tform_voucherreport.Create(application);
   form_voucherreport.ppReport1.Reset;
   form_voucherreport.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
   form_voucherreport.ppReport1.Template.LoadFromFile;
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
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end
else    //编辑
 begin
   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO112RKEY.Value;
     open;
    end;
  if dm.ADO105STATUS.Value>0 then
   begin
    common.ShowMsg('凭证状态发生变化,编辑不能进行请取消保存重试!',1)
   end
  else
  try
   dm.ADOConnection1.BeginTrans;
   dm.ADO112invoice_number.Value:=maskedit1.Text;
   dm.ADO112INVOICE_TOTAL.AsString:=
      formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
   dm.ADO112GLPTR_STATUS.Value:=(dm.fincontrol1='Y');   
   dm.ADO112.Post;
   self.save_note();
   if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     edit;
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ADO105CUSTOMER_PTR.Value:=dm.ADO112CUSTOMER_PTR.Value;
     post;
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    while not dm.ADO106.Eof do dm.ADO106.Delete;
    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
    dm.ado106REF_NUMBER.Value:=dm.ADO112invoice_number.Value;
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

   dm.ADOConnection1.CommitTrans;
   if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
     form_voucherreport:=Tform_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
     form_voucherreport.ppReport1.Template.LoadFromFile;
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
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;
end;

procedure TForm5.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm5.Edit11Exit(Sender: TObject);
begin
try
 strtodate(edit11.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit11.SetFocus;
 exit;
end;
if dm.ADO112.State=dsinsert then  //新增
 begin
  edit8.Text:=self.get_vouchernumber(strtodate(edit11.Text));
  Edit13.Text:=inttostr(yearof(strtodate(edit11.Text)));
  Edit14.Text:=inttostr(monthof(strtodate(edit11.Text)));
 end;  
end;

procedure TForm5.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm5.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm5.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm5.DBEdit7Exit(Sender: TObject);
begin
//if trim(dbedit7.Text)='' then dm.ADO112ship_amount.Value:=0;
  if trim((Sender as TDBEdit).Text)='' then
          (Sender as TDBEdit).Field.Value :=0;
          
dm.ADO112FED_TAX_AMOUNT.Value:=  ExRoundTo(dm.ADO112ship_amount.Value*
                                 dm.ADO112ship_tax.Value*0.01,2);

dm.ADO112INVOICE_TOTAL.Value:= ExRoundTo(dm.ADO112ship_amount.Value+
                               dm.ADO112FED_TAX_AMOUNT.Value,2);
end;

procedure TForm5.DBEdit9Exit(Sender: TObject);
begin
if trim(dbedit9.Text)='' then dm.ADO112FED_TAX_AMOUNT.Value:=0;

if dm.ADO112ship_amount.Value > 0 then
 dm.ADO112ship_tax.Value:= ExRoundTo((dm.ADO112FED_TAX_AMOUNT.Value*100)/dm.ADO112ship_amount.Value,2);

dm.ADO112INVOICE_TOTAL.Value:= ExRoundTo(dm.ADO112ship_amount.Value+
                               dm.ADO112FED_TAX_AMOUNT.Value,2);
end;

procedure TForm5.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then  //如果是小数点
  if pos('.',(sender as tdbedit).Text)>0 then  //小数点不能重复
   abort;
end;

procedure TForm5.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
    InputVar.Sqlstr := 'select rkey,warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label13.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit2.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      dm.ADO112warehouse_ptr.Value:= frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

function TForm5.returen_tax(rkey10: Integer): Currency;
begin
with DM.ADOQuery1 do
 begin
   close;
   sql.Text:='SELECT  top 1 dbo.Data0189.STATE_TAX '+
             'FROM     dbo.Data0012 INNER JOIN '+
             'dbo.Data0189 ON dbo.Data0012.SHIP_CTAX_PTR = dbo.Data0189.RKEY '+
             'where data0012.CUSTOMER_PTR='+inttostr(rkey10);
   open;
   if not IsEmpty then
    Result:=fieldbyname('STATE_TAX').AsCurrency
   else
    Result:=0;
 end;
end;

end.
