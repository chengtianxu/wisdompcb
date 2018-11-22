unit edadd_dealinvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, Menus, ExtCtrls, ToolWin,DateUtils;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StringGrid1: TStringGrid;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    StringGrid2: TStringGrid;
    ComboBox1: TComboBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label25: TLabel;
    Panel1: TPanel;
    Label18: TLabel;
    Label23: TLabel;
    Edit_employee: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    sgrid2: TStringGrid;
    Label16: TLabel;
    Label17: TLabel;
    Edit_fyear: TEdit;
    Edit_number: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit_PERIOD: TEdit;
    Edit_date: TEdit;
    Label21: TLabel;
    report_Check: TCheckBox;
    Edit_ATTACHED: TEdit;
    UpDown1: TUpDown;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    abbr_name: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    function find_grn(rkey456:integer):boolean;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1Exit(Sender: TObject);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Edit_dateExit(Sender: TObject);
    procedure Edit_dateKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   tax_amount:currency;
   tax_date:tdatetime;
   tax_remark:string;
    function find_deliveryerror(): boolean;
    function find_invoerror(number:string):boolean;
    procedure update_04(v_seed:string);
    procedure update_456_22(inv_tp:integer);
    procedure update_70status(inv_tp,rkey107:integer);
    function get_vouchernumber(inv_date: tdatetime): string;
    function find_accterror(rkey103:integer):boolean;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function vo_number(number: string): boolean;
    function get_col5(row:integer):currency;
    function get_col6(row:integer):currency;
    procedure re_calculate;
    function find_supperror(rkey23:integer):boolean;    
  public
    { Public declarations }
    warehouse_ptr,supp_ptr,currency_ptr,acc_gl_ptr,ttype:integer;
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
  function RemoveInvalid(where: string): string;
implementation

uses main, datamd, supp_invtrecept, tax_invoice, AcctSearch, curr_search,
  voucher_dictionary, voucher_report,common;

{$R *.dfm}
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

function TForm2.find_accterror(rkey103: integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0128 where GL_ACCT_PTR='+inttostr(rkey103));
  open;
 end;
if not dm.ADOQuery1.IsEmpty then
 result:=true
else
 result:=false;
end;

function TForm2.get_vouchernumber(inv_date: tdatetime): string;
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

procedure   TForm2.update_70status(inv_tp,rkey107:integer);
begin
   case inv_tp of
    0:
     begin
      dm.ADOupdate70.Close;
      dm.ADOupdate70.Parameters[0].Value:=rkey107;
      dm.ADOupdate70.ExecSQL;
     end;
    1:
     begin
      dm.ADOupmc70.Close;
      dm.ADOupmc70.Parameters[0].Value:=rkey107;
      dm.ADOupmc70.ExecSQL;
     end;
   end;
end;

procedure TForm2.update_456_22(inv_tp:integer);
var
 i:word;
begin
 for i:=1 to stringgrid2.RowCount-2 do
  begin
   with dm.ADOQuery1 do            //修改入仓单状态已记帐
   begin
    close;
    sql.Clear;
    sql.Add('update data0456');
    sql.Add('set status=4,');
    sql.Add('dealiv_ptr='+dm.ADO107rkey.AsString);
    sql.Add('where rkey='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
  case inv_tp of
  0:
   with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0071');
    sql.Add('set QUAN_INVD=QUAN_INVD+data0022.QUANTITY');
    sql.Add('from data0022 inner join data0071');
    sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
    sql.Add('where data0022.grn_ptr='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
   1:
   with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0072');
    sql.Add('set QUAN_INVD=QUAN_INVD+data0235.QUAN_RECD');
    sql.Add('from data0235 inner join data0072');
    sql.Add('on data0235.D0072_PTR=data0072.rkey');
    sql.Add('where data0235.grn_ptr='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
   3:;        //委外加工

  end;
  end;

end;

procedure TForm2.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
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

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
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

procedure TForm2.FormActivate(Sender: TObject);
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

stringgrid1.Cells[0,0]:='材料名称';
stringgrid1.Cells[1,0]:='材料规格';
stringgrid1.Cells[2,0]:='接收数量';
stringgrid1.Cells[3,0]:='单位';
stringgrid1.Cells[4,0]:='含税价';
stringgrid1.Cells[5,0]:='税率%';
stringgrid1.Cells[6,0]:='金额';
stringgrid1.Cells[7,0]:='税金';
stringgrid1.Cells[8,0]:='grn_ptr';
stringgrid1.ColWidths[8]:=-1;
stringgrid2.Cells[0,0]:='入仓单号';
stringgrid2.Cells[1,0]:='送货单号';
stringgrid2.Cells[2,0]:='采购订单';
stringgrid2.Cells[3,0]:='送货日期';
stringgrid2.Cells[4,0]:='grn_rkey';
stringgrid2.ColWidths[4]:=-1;
if self.warehouse_ptr>0 then      //新增
 begin
  dm.ADOSP04.Close;
  dm.ADOSP04.Open;
  if dm.ADOSP04SEED_FLAG.Value<>1 then
  edit1.Text:=dm.ADOSP04SEED_VALUE.Value;
  if dm.ADOSP04SEED_FLAG.Value=4 then
   Edit1.ReadOnly:=True;
  self.tax_date:=form1.sys_shortdate;   //税票日期
 end
else                  //编辑或者检查
 begin
  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
  dm.ADO107.Open;
  self.tax_amount:=dm.Ado107tax_invoice_amt.Value;
  self.tax_date:=dm.Ado107tax_invoice_date.Value;
  self.tax_remark:=dm.Ado107tax_invoice_ref.Value;
  dm.ADO107.Close;

  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.Aq107rkey105.Value;
  dm.Aqd105.Open;
  if not dm.Aqd105.IsEmpty then
  begin
  self.Edit_number.Text:=dm.Aqd105VOUCHER.Value;
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
self.PageControl1.ActivePageIndex:=0;
end;

procedure TForm2.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid2.Row:=row;
 end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid2.Row=stringgrid2.RowCount-1 then
  begin
   n2.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TForm2.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if aRow=stringgrid2.RowCount-1 then
  begin
   speedbutton2.Enabled:=false;
  end
 else
  begin
   speedbutton2.Enabled:=true;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
 amount,tax_amount: currency;
begin
Form_suppinvtrecept:=TForm_suppinvtrecept.Create(application);
if self.warehouse_ptr>0 then//新增
with Form_suppinvtrecept.aq456 do
 begin
  close;
  Parameters[1].Value:=self.supp_ptr;
  Parameters[2].Value:=self.currency_ptr;
  Parameters[3].Value:=self.ttype;
  Parameters[4].Value:=edit5.Text;
  open;
 end
else              //编辑
with Form_suppinvtrecept.aq456 do
 begin
  close;
  Parameters[1].Value:=dm.Aq107SUPP_PTR.Value;
  Parameters[2].Value:=dm.Aq107CURRENCY_PTR.Value;
  Parameters[3].Value:=self.ttype;
  Parameters[4].Value:=dm.Aq107EX_RATE.Value;
  open;
 end;
Form_suppinvtrecept.aq22.Open;
Form_suppinvtrecept.aq235.Open;
if  Form_suppinvtrecept.aq456.IsEmpty then
 showmessage('没有找到符合条件的入仓单')
else
 if Form_suppinvtrecept.ShowModal=mrok then
  begin
   if stringgrid1.RowCount>2 then
   begin
//     showmessage(stringgrid1.Cells[5,1]);
     if strtofloat(stringgrid1.Cells[5,1])<>Form_suppinvtrecept.aq22TAX_2.Value then
     begin
       showmessage('税率不一致');
       abort;
     end;
   end;
   if self.find_grn(Form_suppinvtrecept.aq456RKEY.Value) then
    showmessage('该入仓单已经在发票里面了,不能重复增加')
   else
    begin
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456GRN_NUMBER.Value;
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456DELIVER_NUMBER.Value;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456PO_NUMBER.Value;
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456ship_DATE.AsString;
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456RKEY.AsString;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
     amount:=0;
     tax_amount:=0;
     if Form_suppinvtrecept.aq456TTYPE.Value=2 then  //杂项入仓
      begin
       Form_suppinvtrecept.aq235.First;
       while not Form_suppinvtrecept.aq235.Eof do
        begin
         stringgrid1.Cells[0,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235goods_name.Value;
         stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235goods_guige.Value;
         stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235QUAN_RECD.AsString;
         stringgrid1.Cells[3,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235UNIT_NAME.Value;
         stringgrid1.Cells[4,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235unit_price.AsString;
         stringgrid1.Cells[5,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235state_tax.AsString;
         stringgrid1.Cells[6,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235amount.AsString;
         stringgrid1.Cells[7,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235tax_amount.AsString;
         stringgrid1.Cells[8,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq235GRN_PTR.AsString;
         stringgrid1.RowCount:=stringgrid1.RowCount+1;
         amount:=amount+Form_suppinvtrecept.aq235amount.Value;
         tax_amount:=tax_amount+Form_suppinvtrecept.aq235tax_amount.Value;
         Form_suppinvtrecept.aq235.Next;
        end;
      end
     else
     begin
     Form_suppinvtrecept.aq22.First;
     while not Form_suppinvtrecept.aq22.Eof do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22INV_NAME.Value;
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22INV_DESCRIPTION.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22QUANTITY.AsString;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22UNIT_NAME.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22PRICE.AsString;
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22TAX_2.AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22amount.AsString;
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22tax_amount.AsString;
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22GRN_PTR.AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       amount:=amount+Form_suppinvtrecept.aq22amount.Value;
       tax_amount:=tax_amount+Form_suppinvtrecept.aq22tax_amount.Value;
       Form_suppinvtrecept.aq22.Next;
      end;
       end;
     edit6.Text:=floattostr(amount+strtofloat(edit6.Text));
     edit9.Text:=floattostr(tax_amount+strtofloat(edit9.Text));
     edit8.Text:=floattostr(strtofloat(edit6.Text)-
                            strtofloat(edit9.Text)-
                            strtofloat(edit7.Text));
     end;
  end;
Form_suppinvtrecept.free;
end;

function TForm2.find_grn(rkey456: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stringgrid2.RowCount-2 do
  if strtoint(stringgrid2.Cells[4,i])=rkey456 then
   begin
    result:=true;
    break;
   end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
 i,j:word;
 find_22:boolean;
begin
find_22:=true;
while find_22 do
 begin
  if stringgrid1.RowCount>2 then
   begin
    for i:=1 to stringgrid1.RowCount-2 do
    if strtoint(stringgrid1.Cells[8,i])=strtoint(stringgrid2.Cells[4,stringgrid2.row])  then
    begin
     edit6.Text:=floattostr(strtofloat(edit6.text)-
                            strtofloat(stringgrid1.Cells[6,i]));
     edit9.Text:=floattostr(strtofloat(edit9.text)-
                            strtofloat(stringgrid1.Cells[7,i]));
     edit8.Text:=floattostr(strtofloat(edit6.Text)-
                            strtofloat(edit9.Text)-
                            strtofloat(edit7.Text));
     for j:=i to stringgrid1.RowCount-2 do
      stringgrid1.Rows[j].Text:=stringgrid1.Rows[j+1].Text;
     stringgrid1.RowCount:=stringgrid1.RowCount-1;
     break;
    end
    else
     if i=stringgrid1.RowCount-2 then
      find_22:=false;
   end
  else
   find_22:=false;
 end;

 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;

end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm2.Edit7Exit(Sender: TObject);
begin
if trim(edit7.Text) = '' then edit7.Text := '0';
 edit7.Text := formatfloat('0.00',strtofloat(edit7.Text));
end;

procedure TForm2.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then
 begin
  if trim(edit7.Text) = '' then edit7.Text := '0';
  edit6.Text:=formatfloat('0.00',strtofloat(edit7.Text)+
                                 strtofloat(edit8.Text)+
                                 strtofloat(edit9.Text));
 end;
end;

procedure TForm2.DateTimePicker1Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('发票日期不能大于付款日期!');
  self.DateTimePicker1.SetFocus;
 end;
end;

procedure TForm2.DateTimePicker2Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('付款日期不能小于发票日期!');
  self.DateTimePicker2.SetFocus;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.Create(application);
form3.Edit1.Text:=floattostr(self.tax_amount);
form3.DateTimePicker1.Date:=self.tax_date;
form3.Edit2.Text:=self.tax_remark;
if not bitbtn1.Enabled then
 begin
  form3.Edit1.Enabled:=false;
  form3.DateTimePicker1.Enabled:=false;
  form3.Edit2.Enabled:=false;
 end;

if form3.ShowModal = mrok then
 begin
  self.tax_amount := strtofloat(form3.Edit1.Text);
  self.tax_date := form3.DateTimePicker1.Date;
  self.tax_remark:=form3.Edit2.Text;
 end;
form3.Free;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
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

if stringgrid2.RowCount=2 then
 begin
  showmessage('一个发票至少需要一个入库单!');
  stringgrid2.SetFocus;
  exit;
 end;
 self.PageControl1Change(sender);
if sgrid1.RowCount>2 then
 begin
  if strtofloat(RemoveInvalid(statictext1.Caption))<>
     strtofloat(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

  if strtofloat(formatfloat('0.00',strtofloat(edit6.Text)*strtofloat(edit5.Text)))<>
     strtofloat(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目贷方金额与发票发生额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;

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

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if self.warehouse_ptr>0 then      //新增
 begin
  if self.find_deliveryerror then
  begin
   showmsg('操作失败,可能多人同时操作同一送货单!',1);
   exit;
  end;
  if self.find_invoerror(trim(edit1.Text)) then
  begin
   dm.adosp04.Close;
   dm.adosp04.Open;
   if dm.adosp04SEED_FLAG.Value<>1 then
    begin
     if messagedlg('发票编号重复可能多人同时新增,是否自动更新编号为:'+
      dm.adosp04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
      Edit1.Text:=dm.adosp04SEED_VALUE.Value
     else
      begin
       PageControl1.ActivePageIndex:=0;
       edit1.SetFocus;
       exit;
      end;
    end
   else
    begin
     messagedlg('发票编号重复重复!请手工重新输入',mterror,[mbok],0);
     PageControl1.ActivePageIndex:=0;
     edit1.SetFocus;
     exit;
    end;
  end;

  if sgrid1.RowCount>2 then
  if self.vo_number(trim(self.Edit_number.Text)) then
   begin
    Edit_number.Text:=get_vouchernumber(strtodate(self.Edit_date.Text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit_number.Text,mterror,[mbcancel],0);
   end;

 if find_supperror(self.supp_ptr) then
  begin
   showmsg('数据保存出错,请与速与管理员联系!!!',1);
   exit;
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
  dm.ADO107EMPL_PTR.Value:=strtoint(user_ptr);
  dm.ADO107INV_TP.Value:=inttostr(ComboBox1.ItemIndex);
  dm.ADO107STATUS.Value:=1;
  dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);  //总计金额
  dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);   //不含税金额
  dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);    //税金
  dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);   //杂项费用
  dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
  dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
  dm.ADO107ENT_DATE.Value:=form1.sys_longdate;
  dm.ADO107tax_invoice_amt.Value:=self.tax_amount;
  dm.ADO107tax_invoice_date.Value:=self.tax_date;
  dm.ADO107tax_invoice_ref.Value:=self.tax_remark;
  dm.ADO107.Post;

   dm.adosp04.Close;
   dm.adosp04.Open;
  if dm.adosp04SEED_FLAG.Value<>1 then
   update_04(trim(dm.ADOSP04SEED_VALUE.Value)); //更新04控制码
  self.update_456_22(strtoint(dm.ADO107INV_TP.Value));
  self.update_70status(dm.ADO107INV_TP.AsInteger,dm.ADO107rkey.Value);

  if sgrid1.RowCount>2 then
   begin
    dm.ADO104.Close;
    case self.ComboBox1.ItemIndex of
     0,2,4:dm.ADO104.Parameters[0].Value:=1;
     1:dm.ADO104.Parameters[0].Value:=2;
     3:dm.ADO104.Parameters[0].Value:=12;
    end;
    dm.ADO104.Open;

    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=null;
     open;
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO107INVOICE_NO.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO107RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO107EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);      //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);         //会计期间
     dm.ado105supp_PTR.Value:=dm.ADO107SUPP_PTR.value;
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
    dm.ado106REF_NUMBER.Value:=dm.ADO107INVOICE_NO.Value;
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

    dm.ACt.CommitTrans;

   if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
    begin  //打印凭证
     form_voucherreport:=Tform_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
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
  ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ACt.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end
else           //编辑
 begin
  dm.ACt.BeginTrans;
  try
   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Edit;
   dm.ADO107INVOICE_NO.Value:=trim(edit1.Text);
   dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
   dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
   dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);
   dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);
   dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);
   dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);
   dm.ADO107tax_invoice_amt.Value:=self.tax_amount;
   dm.ADO107tax_invoice_date.Value:=self.tax_date;
   dm.ADO107tax_invoice_ref.Value:=self.tax_remark;
   dm.ADO107.Post;

   case strtoint(dm.ADO107INV_TP.Value) of
    0:
     begin
     with dm.adoquery3 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0070');   //修改70曾被修改的状态
       sql.Add('set status=6');
       sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
       sql.Add('FROM dbo.Data0456 INNER JOIN');
       sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
       sql.Add('dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR');
       sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
       sql.Add('GROUP BY dbo.Data0456.PO_PTR');
       sql.Add('HAVING (SUM(dbo.Data0071.QUAN_INVD) >= SUM(dbo.Data0071.QUAN_RECD)))');
       Parameters[0].Value:=dm.ADO107rkey.Value;
       execsql;
      end;
     with dm.ADOQuery2 do
      begin
      close;
      sql.Clear;
      sql.Add('update data0071');
      sql.Add('set QUAN_INVD = QUAN_INVD-data0022.QUANTITY');
      sql.Add('FROM dbo.Data0071 INNER JOIN');
      sql.Add('dbo.Data0022 ON dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR INNER JOIN');
      sql.Add('dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY');
      sql.Add('where data0456.dealiv_ptr='+dm.Ado107rkey.AsString);
      ExecSQL
      end;
     end;
    1:
     begin
     with dm.adoquery3 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0070');
       sql.Add('set status=6');
       sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
       sql.Add('FROM dbo.Data0456 INNER JOIN');
       sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
       sql.Add('dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR');
       sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
       sql.Add('GROUP BY dbo.Data0456.PO_PTR');
       sql.Add('HAVING (SUM(dbo.Data0072.QUAN_INVD) >= SUM(dbo.Data0072.QUANTITY_RECEIVED)))');
       Parameters[0].Value:=dm.ADO107rkey.Value;
       execsql;
      end;
      with dm.ADOQuery2 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0072');
       sql.Add('set QUAN_INVD = QUAN_INVD-data0235.QUAN_RECD');
       sql.Add('FROM dbo.Data0072 INNER JOIN');
       sql.Add('dbo.Data0235 ON dbo.Data0072.RKEY = dbo.Data0235.D0072_PTR INNER JOIN');
       sql.Add('dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY');
       sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
       ExecSQL
      end;
     end;
   end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0456');
     sql.Add('set status=3,');
     sql.Add('dealiv_ptr=null');
     sql.Add('where dealiv_ptr='+dm.Ado107rkey.AsString);
     ExecSQL
    end;

   self.update_456_22(strtoint(dm.ADO107INV_TP.Value));
   self.update_70status(dm.ADO107INV_TP.AsInteger,dm.ADO107rkey.Value);

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.Aq107rkey105.Value;
     open;
    end;
    if not dm.ado105.isempty then dm.ado105.Delete;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;

   if sgrid1.RowCount>2 then
   begin
    dm.ADO104.Close;
    case self.ComboBox1.ItemIndex of
     0,2,4:dm.ADO104.Parameters[0].Value:=1;
     1:dm.ADO104.Parameters[0].Value:=2;
     3:dm.ADO104.Parameters[0].Value:=12;
    end;
    dm.ADO104.Open;

    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=self.Edit_number.Text;             //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO107INVOICE_NO.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=dm.ADO104RKEY.Value;            //业务类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO107RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO107EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(self.Edit_date.Text);      //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(self.Edit_fyear.Text);      //会计年度
     dm.ado105PERIOD.Value := strtoint(self.Edit_PERIOD.Text);         //会计期间
     dm.ado105supp_PTR.Value:=dm.ADO107SUPP_PTR.value;
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
    dm.ado106REF_NUMBER.Value:=dm.ADO107INVOICE_NO.Value;
    dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
    dm.ADO106PRICE.AsString :=sgrid1.Cells[4,i]; //原币
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
   dm.ACt.CommitTrans;

    if (self.report_Check.Checked) and (not dm.ADO105.IsEmpty)  then
    begin  //打印凭证
     form_voucherreport:=Tform_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
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

   modalresult:=mrok;
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

function TForm2.find_deliveryerror(): boolean;
var
 i:integer;
 rkey456:string;
begin
 result := false;

 for i:=1 to stringgrid2.RowCount-2 do
 if i<>stringgrid2.RowCount-2 then
  rkey456:=rkey456+stringgrid2.Cells[4,i]+','
 else
  rkey456:=rkey456+stringgrid2.Cells[4,i];

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0456');
   sql.Add('where rkey in ('+rkey456+')');
   sql.Add('and status=4');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm2.find_invoerror(number: string): boolean;
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

procedure TForm2.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin
{ TODO -owilliam -c规格 :
凭证的的更新在下便情况下发生,第一用户是新增状态,
第二在编辑状态时因为原往为业务发生额为零没有产生凭证当
用户修改了发生额需要产生新的凭证.
编辑时如果用户修改了发生额,但业务的凭证新增已经产生,那么
凭证的发生额需要用户自已修改,系统不产生新的业务分录 }
if (self.warehouse_ptr>0) or (trim(edit_number.Text)='') then
if (strtofloat(formatfloat('0.00',strtofloat(edit6.text) * strtofloat(edit5.text)))<>
     strtofloat(RemoveInvalid(statictext2.Caption))) then
begin
 edit_date.Text:=datetostr(datetimepicker1.Date);
 edit_number.Text:=self.get_vouchernumber(datetimepicker1.Date);
 Edit_fyear.Text:=inttostr(yearof(datetimepicker1.Date));   //会计年度
 Edit_PERIOD.Text:=inttostr(monthof(datetimepicker1.Date));  //会计期间
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
  case self.ComboBox1.ItemIndex of
  0,2,4:dm.ADO104.Parameters[0].Value:=1;
  1:dm.ADO104.Parameters[0].Value:=2;
  3:dm.ADO104.Parameters[0].Value:=12;
  end;
  dm.ADO104.Open;
  if strtofloat(edit8.Text)>0 then    //不含税金额
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;
     case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtofloat(edit8.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;       //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;       //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr)//货币指针;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=self.currency_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;       //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;      //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit8.Text;      //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:= inttostr(self.currency_ptr)//货币指针;
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
                '['+edit3.Text+ABBR_NAME.Caption+']'+inttostr(monthof(datetimepicker1.date))+
                '月份材料验收入库-暂估';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(FieldValues['gl_acc_number'])+'-'+
                           trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                           trim(FieldValues['DESCRIPTION']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                          formatfloat('0.00',strtofloat(edit8.Text)*strtofloat(edit5.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
//==============处理不含税借方材料费用========================================
  mt_error:=true;
  if strtofloat(edit9.Text) > 0 then      //税金
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
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;    //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtofloat(edit9.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit9.Text;      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=currency_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit9.Text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
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
                '['+edit3.Text+ABBR_NAME.Caption+']'+inttostr(monthof(datetimepicker1.date))+
                '月份材料验收入库-暂估';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtofloat(edit9.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //=============================处理借方税金
  mt_error:=true;
  if strtofloat(edit7.Text) > 0 then      //税金
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
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;    //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtofloat(edit7.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit7.Text;      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=currency_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit7.Text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
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
                '['+edit3.Text+ABBR_NAME.Caption+']'+inttostr(monthof(datetimepicker1.date))+
                '月份材料验收入库-暂估';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtofloat(edit7.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_04.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //=============================处理借方杂项费用
  mt_error:=true;
  if strtofloat(edit6.Text) > 0 then      //总计金额
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
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;    //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtofloat(edit6.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=edit6.Text;      //原币金额
       sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=currency_ptr then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit4.Text;           //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=edit6.Text;         //原币金额
         sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(self.currency_ptr);
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
                '['+edit3.Text+ABBR_NAME.Caption+']'+inttostr(monthof(datetimepicker1.date))+
                '月份材料验收入库-暂估';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[6,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtofloat(edit6.Text)*strtofloat(edit5.Text));

    if self.acc_gl_ptr>0 then
     sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
    else
     sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //=============================处理贷方总计金额

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
  var CanSelect: Boolean);           //arow,选择之后的变量
begin                            //sgrid1.row 选择之前的变量
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
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[5,sgrid1.row])/
                                                     strtofloat(sgrid1.Cells[3,sgrid1.row]) );
     end;
    6:       //贷方
     begin
      sgrid1.Cells[5,sgrid1.Row]:='';
      sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtofloat(sgrid1.Cells[6,sgrid1.row])/
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

procedure TForm2.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  if self.find_accterror(form_acct.ADOQuery1RKEY.Value) then
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

        if currency_ptr=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
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
      sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;   //货币
      if currency_ptr=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1BASE_TO_OTHER.AsString;
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

procedure TForm2.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
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
if warehouse_ptr>0 then  //新增
 begin
  edit_number.Text:=self.get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end;
end;

procedure TForm2.Edit_dateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
if warehouse_ptr>0 then  //新增
 begin
  edit_number.Text:=self.get_vouchernumber(strtodate(Edit_date.Text));
  edit_fyear.Text:=inttostr(yearof(strtodate(Edit_date.Text)));
  edit_period.Text:=inttostr(monthof(strtodate(Edit_date.Text)));
 end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
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

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

function TForm2.find_supperror(rkey23:integer): boolean;
var
 i:integer;
begin
result:=false;
 for i:=1 to stringgrid2.RowCount-2 do
  begin
   with dm.ADOQuery1 do            //修改入仓单状态已记帐
   begin
    close;
    sql.Clear;
    sql.Add('select SUPP_PTR from data0456');
    sql.Add('where rkey='+stringgrid2.Cells[4,i]);
    open;
    if rkey23<>fieldbyname('SUPP_PTR').AsInteger then
     begin
      result:=true;
      break;
     end;
   end;
  end;
end;

end.
