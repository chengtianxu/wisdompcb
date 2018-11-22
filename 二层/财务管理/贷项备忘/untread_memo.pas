unit untread_memo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin,
  Mask, DBCtrls,DateUtils, DB, ADODB;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    abbr_name: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit5: TEdit;
    Edit4: TEdit;
    edit2: TEdit;
    edit1: TEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
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
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit16: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    Image2: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ComboBox1: TComboBox;
    Label16: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure re_calculate;
    function get_vouchernumber(inv_date: tdatetime): string;    
    function get_gltp(rkey103:string):integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function vo_number(number: string): boolean;
    function memo_number_error(number: string): boolean;
    function find_rmanumber(rma_number: string): boolean;    
    procedure update_04(v_seed: string);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
   acc_gl_ptr:integer;
   warehouse_number:array of integer;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;      
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
  function RemoveInvalid(where: string): string;

implementation

uses DAMO, main, customer_search, curr_search, AcctSearch, invoice_search,
  voucher_report, voucher_dictionary,common;

{$R *.dfm}
function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
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

function TForm2.memo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0116');
  sql.Add('where MEMO_NUMBER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
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

function TForm2.find_rmanumber(rma_number: string): boolean;
var
 i:word;
begin
result:=false;
for i:=1 to stringgrid1.RowCount-1 do
 if trim(stringgrid1.Cells[0,i])=rma_number then
  begin
   result:=true;
   break;
  end;
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

stringgrid1.Cells[0,0]:='RMA号码';
stringgrid1.Cells[1,0]:='退货日期';
stringgrid1.Cells[2,0]:='销售订单';
stringgrid1.Cells[3,0]:='本厂编号';
stringgrid1.Cells[4,0]:='客户型号';
stringgrid1.Cells[5,0]:='入库日期';

stringgrid1.Cells[6,0]:='数量';
stringgrid1.Cells[7,0]:='单价';
stringgrid1.Cells[8,0]:='税率%';
stringgrid1.Cells[9,0]:='含税';
stringgrid1.Cells[10,0]:='处理';
with dm.ADOQuery1 do
 begin
   close;
   SQL.Text:='select rkey,abbr_name from data0015 where active_flag =''Y'' order by rkey';
   open;
   setlength(warehouse_number,RecordCount);//设置数组下标个数
   for i:=0 to RecordCount-1 do
   begin
     ComboBox1.Items.Add(fieldbyname('abbr_name').AsString);
     warehouse_number[i]:=fieldbyname('rkey').AsInteger;
     Next;
   end;
 end;
 
if dm.ADo116.State=dsinsert then     //新增
  begin

  end
else           //编辑
 begin

  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.aqd116abbrname15.Value);
  
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0098.RMA_NUMBER, Data0098.RMA_DATE,');
    sql.Add('Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER,');
    sql.Add('Data0025.MANU_PART_DESC, Data0098.tax_2 as RUSH_CHARGE,data0416.sys_date,');
    sql.Add('Data0098.QTY_RECD, Data0060.PART_PRICE, Data0060.tax_in_price');
    sql.Add('FROM dbo.Data0098 INNER JOIN Data0025 ON');
    sql.Add('Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN');
    sql.Add('Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY inner join');
    sql.Add('data0416 on Data0098.RKEY = data0416.rma_ptr');
    sql.Add('where data0098.srce_ptr='+dm.ado116rkey.AsString);
    sql.Add('and Data0098.RMA_STATUS = 4');
    open;
   end;
  stringgrid1.RowCount:=dm.ADOQuery1.RecordCount+1;

  for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stringgrid1.Cells[0,i]:=dm.ADOQuery1.FieldValues['RMA_NUMBER'];  //'RMA号码';
    stringgrid1.Cells[1,i]:=dm.ADOQuery1.fieldbyname('RMA_DATE').AsString; //'退货日期';
    stringgrid1.Cells[2,i]:=dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString;//'销售订单';
    stringgrid1.Cells[3,i]:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString;//'本厂编号';
    stringgrid1.Cells[4,i]:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;//'客户型号';
    stringgrid1.Cells[5,i]:=dm.ADOQuery1.fieldbyname('sys_date').AsString;//'入库日期';
    stringgrid1.Cells[6,i]:=dm.ADOQuery1.fieldbyname('QTY_RECD').AsString;//'数量';
    stringgrid1.Cells[7,i]:=dm.ADOQuery1.fieldbyname('PART_PRICE').AsString;//'单价';
    stringgrid1.Cells[8,i]:=dm.ADOQuery1.fieldbyname('RUSH_CHARGE').AsString;//'税率%';
    stringgrid1.Cells[9,i]:=dm.ADOQuery1.fieldbyname('tax_in_price').AsString;//'含税';
    stringgrid1.Cells[10,i]:='1';
    dm.ADOQuery1.Next;
   end;
   dm.ADOQuery1.Close;
  if stringgrid1.RowCount>1 then stringgrid1.FixedRows:=1;

  if stringgrid1.RowCount>11 then
   stringgrid1.ColWidths[1]:=73
  else
   stringgrid1.ColWidths[1]:=87;

 
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO116RKEY.Value;
  dm.Aqd105.Open;
  edit11.Text:=dm.Aqd105VOUCHER.Value;
  edit12.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit14.Text:=dm.Aqd105FYEAR.AsString;
  edit15.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit16.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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

self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;

end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
form_customer:=tform_customer.Create(application);
if form_customer.ShowModal=mrok then
 begin
  dm.ado116CUST_PTR.Value:=form_customer.ADOQuery1rkey.Value;
  edit1.Text:=form_customer.ADOQuery1CUST_CODE.Value;
  label14.Caption:=form_customer.ADOQuery1CUSTOMER_NAME.Value;
  self.acc_gl_ptr:=form_customer.ADOQuery1ACC_REC_PTR.Value;
  abbr_name.Caption:=form_customer.ADOQuery1abbr_name.Value;
  edit2.Text:=form_customer.ADOQuery1CURR_CODE.Value;
  label15.Caption:=form_customer.ADOQuery1CURR_NAME.Value;
  edit5.Text:=form_customer.ADOQuery1base_to_other.AsString;
  dm.ado116CURRENCY_PTR.Value:=form_customer.ADOQuery1CURRENCY_PTR.Value;
  if dm.ado116CURRENCY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
finally
 form_customer.Free;
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  edit2.Text:=form_curr.ADOQuery1CURR_CODE.Value;
  label15.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
  edit5.Text:=form_curr.ADOQuery1base_to_other.AsString;
  dm.ado116CURRENCY_PTR.Value:=form_curr.ADOQuery1rkey.Value;
  if dm.ado116CURRENCY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
form_curr.Free;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i:integer;
begin
if (trim(edit1.Text)='') or (ComboBox1.ItemIndex < 0)  then
 messagedlg('请首先确定客户,货币,工厂!',mterror,[mbcancel],0)
else
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0098.RMA_NUMBER, Data0098.RMA_DATE,');
    sql.Add('Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER,');
    sql.Add('Data0025.MANU_PART_DESC,Data0098.tax_2 as RUSH_CHARGE,data0098.Putaway_date as sys_date,');
    sql.Add('Data0098.QTY_RECD,Data0060.PART_PRICE, Data0060.tax_in_price');
    sql.Add('FROM dbo.Data0098 INNER JOIN Data0025 ON');
    sql.Add('Data0098.CUSTOMER_PART_PTR = Data0025.RKEY INNER JOIN');
    sql.Add('Data0060 ON dbo.Data0098.SO_PTR = Data0060.RKEY ');
    sql.Add('WHERE Data0098.RMA_STATUS = 3'); //已入仓
    sql.Add('and data0098.NOTE_PAD_PTR=0');   //允许扣款
    sql.Add('and data0098.customer_ptr='+dm.ado116CUST_PTR.AsString);
    sql.Add('and data0060.currency_ptr='+dm.ado116CURRENCY_PTR.AsString);
    sql.Add('and data0060.SHIP_REG_TAX_ID='+dm.ado116warehouse_ptr.AsString);
    open;
   end;
  stringgrid1.RowCount:=dm.ADOQuery1.RecordCount+1;

  for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stringgrid1.Cells[0,i]:=dm.ADOQuery1.FieldValues['RMA_NUMBER'];  //'RMA号码';
    stringgrid1.Cells[1,i]:=dm.ADOQuery1.fieldbyname('RMA_DATE').AsString; //'退货日期';
    stringgrid1.Cells[2,i]:=dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString;//'销售订单';
    stringgrid1.Cells[3,i]:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString;//'本厂编号';
    stringgrid1.Cells[4,i]:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;//'客户型号';
    stringgrid1.Cells[5,i]:=dm.ADOQuery1.fieldbyname('sys_date').AsString;//'入库日期';
    stringgrid1.Cells[6,i]:=dm.ADOQuery1.fieldbyname('QTY_RECD').AsString;//'数量';
    stringgrid1.Cells[7,i]:=dm.ADOQuery1.fieldbyname('PART_PRICE').AsString;//'单价';
    stringgrid1.Cells[8,i]:=dm.ADOQuery1.fieldbyname('RUSH_CHARGE').AsString;//'98税率%';
    stringgrid1.Cells[9,i]:=dm.ADOQuery1.fieldbyname('tax_in_price').AsString;//'价格是否含税';
    stringgrid1.Cells[10,i]:='0';
    dm.ADOQuery1.Next;
   end;

  if stringgrid1.RowCount>1 then
   begin
    stringgrid1.FixedRows:=1;
    bitbtn4.Enabled:=false;
    bitbtn5.Enabled:=false;
    ComboBox1.Enabled:=false;
    edit3.Text:='0.00';
    edit6.Text:='0.00';
    edit7.Text:='0.00';
    edit8.Text:='0.00';
    edit9.Text:='0.00';
   end;

  if stringgrid1.RowCount>11 then
   stringgrid1.ColWidths[1]:=73
  else
   stringgrid1.ColWidths[1]:=87;

   
 end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

  if acol<10 then
   begin
    Stringgrid1.Canvas.Brush.Color:= clscrollbar;
    Stringgrid1.Canvas.FillRect(rect);
    Stringgrid1.Canvas.TextRect(rect,rect.left,rect.Top, Stringgrid1.Cells[acol,aRow]);
   end;

if (acol=6) or (acol=7) or (acol=8) then
 stringgrid1.Canvas.TextRect(rect,
        rect.right-stringgrid1.Canvas.TextWidth(stringgrid1.Cells[acol,arow])-2,
        rect.Top+2,
        stringgrid1.Cells[acol,aRow]);

if (acol=10) then
 stringgrid1.Canvas.TextRect(rect,
        rect.Left+10,
        rect.Top+2,
        stringgrid1.Cells[acol,aRow]);

if (acol=10) and (arow>0) then
 IF strtoint(stringgrid1.Cells[acol,arow])=0 THEN
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image1.Picture.Graphic)
 else
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image2.Picture.Graphic);
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
IF stringgrid1.Row=0 then
 n2.Enabled:=false
else
 n2.Enabled:=true;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then
    begin
     stringgrid1.Row:=row;
     stringgrid1.col:=column;
    end;
 end
else
 if button=mbleft then
 begin
  if (stringgrid1.Col=10) and (bitbtn2.Enabled) then
  IF strtoint(stringgrid1.Cells[stringgrid1.col,stringgrid1.row])=0 THEN //选中
   begin
    stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:='1';
    if trim(stringgrid1.Cells[9,stringgrid1.row])='N' then //价税中不含税
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row]));
      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)+
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01);
     end
    else
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01));

      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)+
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01)
                             );
     end;
    edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                            );
   end
  else        //放弃
   begin
    stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:='0';

    if trim(stringgrid1.Cells[9,stringgrid1.row])='N' then //价税中不含税
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row]));
      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01);
     end
    else
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01));

      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtofloat(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01)
                             );
     end;
    edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                            );
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
  end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if trim((sender as tedit).Text)='' then
  (sender as tedit).Text:='0';
(sender as tedit).Text:=formatfloat('0.00',
                         strtocurr(trim((sender as tedit).Text))
                                    );

edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                        );
end;

procedure TForm2.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm2.Sgrid1Exit(Sender: TObject);
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

procedure TForm2.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm2.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm2.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm2.N4Click(Sender: TObject);
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
        if dm.ado116CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
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
      sgrid1.Cells[2,sgrid1.Row]:=              //货币
               form_curr.ADOQuery1curr_code.Value;
      if dm.ado116CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:= edit5.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:= form_curr.ADOQuery1base_to_other.AsString;
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
if dm.ADO116.State=dsinsert then
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm2.Edit12Exit(Sender: TObject);
begin
try
 strtodate(edit12.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit12.SetFocus;
 exit;
end;
if dm.ADO116.State=dsinsert then  //新增
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
 end;
end;

procedure TForm2.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin
if (strtofloat(edit5.Text)=0) or (not bitbtn2.Enabled) then exit;
if (dm.fincontrol1='N') then exit;
if (dm.ADO116.State=dsinsert) or (edit11.Text='') then
if (dm.ado116CUST_PTR.Value>0) and (sgrid1.RowCount<=2) then
 begin
  edit11.Text:=self.get_vouchernumber(dm.ado116MEMO_DATE.Value);
  edit12.Text:=dm.ado116MEMO_DATE.AsString;
  Edit14.Text:=inttostr(yearof(dm.ado116MEMO_DATE.Value));   //会计年度
  Edit15.Text:=inttostr(monthof(dm.ado116MEMO_DATE.Value));  //会计期间
  edit16.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  dm.ADO104.Close;
  dm.ADO104.Open;           //打开会计分录定义
  mt_error:=true;
  if strtocurr(edit3.Text) > 0 then      //货款
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
         Formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit3.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit3.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
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
              formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit6.Text) > 0 then      //工具费用
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
         Formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit6.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
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
              formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit7.Text) > 0 then      //运输费
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
         Formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit7.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit7.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
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
              formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit8.Text) > 0 then      //税金
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
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit8.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit8.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
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
              formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //====================以上为借方====以下为贷方================================

  mt_error:=true;
  if strtocurr(edit9.Text) > 0 then      //合计
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
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_06.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit9.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit9.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
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
              formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text));
      if self.acc_gl_ptr>0 then
      sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
      else
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;

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

procedure TForm2.BitBtn2Enter(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  messagedlg('贷项备忘不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

 dm.ADO04.Close;
 dm.ADO04.Open;
 if (dm.ADO04SEED_FLAG.Value<>1) and
    (dm.ado116.State=dsinsert) then
if not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9']) then
  begin
   messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
   self.PageControl1.ActivePageIndex:=0;
   edit4.SetFocus;
   exit;
  end;

if trim(edit1.Text)='' then
 begin
  messagedlg('客户不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

  if DBEdit3.Field.AsDateTime <= common.getmaxnokp_date(dm.ADOQuery1) then
   begin
    messagedlg('备忘日期不能少于最大的未开票截数日期!',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    DBEdit3.SetFocus;
    exit;
   end;

if sgrid1.RowCount=2 then 
self.PageControl1Change(sender);

if strtocurr(RemoveInvalid(statictext1.Caption))<>
   strtocurr(RemoveInvalid(statictext2.Caption)) then
 begin
  messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=1;
  sgrid1.SetFocus;
  exit;
 end;

{ if strtocurr(formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text)
                             ))<>   //贷方合计
    strtocurr(RemoveInvalid(statictext2.Caption)) then
  begin
   messagedlg('业务发生额与凭证发生额不一致!',mterror,[mbcancel],0);
   self.PageControl1.ActivePageIndex:=1;
   sgrid1.SetFocus;
   exit;
  end;
}
  if edit11.Text<>'' then
  begin
  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit14.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit14.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit15.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit12.SetFocus;
    exit;
   end;
  if (strtoint(Edit15.Text) <> monthof(strtodate(edit12.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit12.SetFocus;
    exit;
   end;
  end; 
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if dm.ado116.State=dsinsert then//新增
 begin
  if self.memo_number_error(trim(edit4.Text)) then
   begin
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     begin
      if messagedlg('备忘编号重复可能多人同时新增,是否自动更新编号为:'+
       dm.ADO04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
       Edit4.Text:=dm.ADO04SEED_VALUE.Value
      else
       begin
        PageControl1.ActivePageIndex:=0;
        edit4.SetFocus;
        exit;
       end;
     end
    else
     begin
      messagedlg('备忘编号重复!请手工重新输入',mterror,[mbok],0);
      PageControl1.ActivePageIndex:=0;
      edit4.SetFocus;
      exit;
     end;
   end;

  if self.vo_number(trim(edit11.Text)) then
   begin
    edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit11.Text,mterror,[mbcancel],0);
   end;

 dm.ADOConnection1.BeginTrans;
 try
  dm.ado116MEMO_NUMBER.Value:=edit4.Text;
  dm.ado116SRCE_PTR.Value:=dm.ado116CUST_PTR.Value;
  dm.ado116AMOUNT.Value:=strtocurr(edit9.text);
  dm.ado116AVL_AMT.Value:=dm.ado116AMOUNT.Value;
  dm.ado116EX_RATE.Value:=strtofloat(edit5.Text);
  dm.ado116GOODS_AMT.Value:=strtocurr(edit3.Text);
  dm.ado116TOOLING_CHARGE.Value:=strtocurr(edit6.Text);
  dm.ado116SHIPPING.Value:=strtocurr(edit7.Text);
  dm.ado116FED_TAX.Value:=strtocurr(edit8.Text);
  dm.ado116GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
  dm.ado116.Post;
  dm.ADO04.Close;
  dm.ADO04.Open;
  if dm.ADO04SEED_FLAG.Value<>1 then
    update_04(trim(dm.ADO04SEED_VALUE.Value));

 for i:=1 to stringgrid1.RowCount-1 do
  if strtoint(stringgrid1.Cells[10,i])=1 then
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('update data0098');
      sql.Add('set RMA_STATUS=4,');
      if dm.ado116GLPTR_STATUS.Value then
       sql.Add('GLPTR_STATUS=1,');
      sql.Add('srce_ptr='+dm.ado116RKEY.AsString);
      sql.Add('where RMA_NUMBER='''+trim(stringgrid1.Cells[0,i])+'''');
      ExecSQL;
     end;
   end;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO116RKEY.Value;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ado116MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=7;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO116RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado116EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit13.Text);             //附件张数
     dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ado116CUST_PTR.value;       //客户
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
else                            //编辑
 begin

  if dm.return_VOUCHER(dm.ado116RKEY.Value) <> '' then
   begin
    messagedlg('贷项备忘已被销售开票生成总帐,不能编辑!',mtinformation,[mbcancel],0);
    exit;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select AMOUNT,AVL_AMT from data0116');
    sql.Add('where rkey='+dm.ado116RKEY.AsString);
    open;
    if fieldbyname('AMOUNT').Value <> fieldbyname('AVL_AMT').Value  then
    begin
     messagedlg('贷项备忘已被使用,不能编辑!',mtinformation,[mbok],0);
     exit;
    end;
   end;

  try
  dm.ADOConnection1.BeginTrans;
  dm.ado116MEMO_NUMBER.Value:=edit4.Text;
  dm.ado116SRCE_PTR.Value:=dm.ado116CUST_PTR.Value;
  dm.ado116AMOUNT.Value:=strtocurr(edit9.text);
  dm.ado116AVL_AMT.Value:=dm.ado116AMOUNT.Value;
  dm.ado116EX_RATE.Value:=strtofloat(edit5.Text);
  dm.ado116GOODS_AMT.Value:=strtocurr(edit3.Text);
  dm.ado116TOOLING_CHARGE.Value:=strtocurr(edit6.Text);
  dm.ado116SHIPPING.Value:=strtocurr(edit7.Text);
  dm.ado116FED_TAX.Value:=strtocurr(edit8.Text);
  dm.ado116GLPTR_STATUS.Value:=(dm.fincontrol1='Y');  
  dm.ado116.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0098');
    sql.Add('set RMA_STATUS=3,');
    sql.Add('GLPTR_STATUS=0,');
    sql.Add('srce_ptr=null');
    sql.Add('where srce_ptr='+dm.ado116RKEY.AsString);
    ExecSQL;
   end;

   for i:=1 to stringgrid1.RowCount-1 do
    if strtoint(stringgrid1.Cells[10,i])=1 then
     begin
      with dm.ADOQuery1 do
       begin
        close;
        sql.Clear;
        sql.Add('update data0098');
        sql.Add('set RMA_STATUS=4,');
        if dm.ado116GLPTR_STATUS.Value then
         sql.Add('GLPTR_STATUS=1,');
        sql.Add('srce_ptr='+dm.ado116RKEY.AsString);
        sql.Add('where RMA_NUMBER='''+trim(stringgrid1.Cells[0,i])+'''');
        ExecSQL;
       end;
     end;

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO116RKEY.Value;
     open;
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    while not dm.ADO106.Eof do dm.ADO106.Delete;
    if not dm.ado105.isempty then dm.ado105.Delete;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ado116MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=7;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO116RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado116EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ado116CUST_PTR.value;       //客户
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
     dm.ado116.Edit;
    end;
  end;

 end;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 i:integer;
begin
  IF strtoint(stringgrid1.Cells[10,stringgrid1.row])=1 THEN //选中
   begin
    if trim(stringgrid1.Cells[9,stringgrid1.row])='N' then //价税中不含税
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[7,stringgrid1.row]));
      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01);
     end
    else
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[7,stringgrid1.row])/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01));

      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)-
                            strtocurr(stringgrid1.Cells[6,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[7,stringgrid1.row])*
                            strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01/
                            (1+strtocurr(stringgrid1.Cells[8,stringgrid1.row])*0.01)
                             );
     end;
    edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                            );
   end;



if stringgrid1.Row<>stringgrid1.RowCount-1 then
 for i:=stringgrid1.Row to stringgrid1.RowCount-1 do
  stringgrid1.Rows[i]:=stringgrid1.Rows[i+1]
else
 begin
  stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
 end;

 stringgrid1.RowCount:=stringgrid1.RowCount-1;

if stringgrid1.RowCount=1 then
 begin
  bitbtn5.Enabled:=true;
  bitbtn4.Enabled:=true;
  ComboBox1.Enabled:=true;
 end;
 
 if stringgrid1.RowCount>11 then
  stringgrid1.ColWidths[1]:=73
 else
  stringgrid1.ColWidths[1]:=87;

end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:integer;
begin
if (trim(edit1.Text)='') or (ComboBox1.ItemIndex < 0)  then
 messagedlg('请首先确定客户,货币,工厂!',mterror,[mbcancel],0)
else
try
form_rma:=tform_rma.Create(application);
form_rma.ADODataSet1.Close;
form_rma.ADODataSet1.Parameters[0].Value := dm.ado116CUST_PTR.Value;
form_rma.ADODataSet1.Parameters[1].Value := dm.ado116CURRENCY_PTR.Value;
form_rma.ADODataSet1.Parameters[2].Value := dm.ado116warehouse_ptr.Value;
form_rma.ADODataSet1.Open;
if form_rma.ADODataSet1.IsEmpty then
 messagedlg('没有找到符合条件的应收发票!',mtinformation,[mbok],0)
else
if form_rma.ShowModal=mrok then
 begin
  WITH form_rma DO
  BEGIN
  for i := 0 to DBGrid1.SelectedRows.Count-1 do
  BEGIN
   dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];

  if find_rmanumber(trim(form_rma.ADODataSet1RMA_NUMBER.Value)) then
   messagedlg('退货RMA编号:'+ADODataSet1RMA_NUMBER.Value+
                      '已经在可收款中,不须增加!',mtinformation,[mbok],0)
  else
   begin
    stringgrid1.RowCount:=stringgrid1.RowCount+1;
    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_rma.ADODataSet1RMA_NUMBER.Value;  //'RMA号码';
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form_rma.ADODataSet1RMA_DATE.AsString; //'退货日期';
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form_rma.ADODataSet1SALES_ORDER.AsString;//'销售订单';
    stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_rma.ADODataSet1MANU_PART_NUMBER.AsString;//'本厂编号';
    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form_rma.ADODataSet1MANU_PART_DESC.AsString;//'客户型号';
    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form_rma.ADODataSet1sys_date.AsString;//'入库日期';
    stringgrid1.Cells[6,stringgrid1.RowCount-1]:=form_rma.ADODataSet1QTY_RECD.AsString;//'数量';
    stringgrid1.Cells[7,stringgrid1.RowCount-1]:=form_rma.ADODataSet1PART_PRICE.AsString;//'单价';
    stringgrid1.Cells[8,stringgrid1.RowCount-1]:=form_rma.ADODataSet1RUSH_CHARGE.AsString;//'税率%';
    stringgrid1.Cells[9,stringgrid1.RowCount-1]:=form_rma.ADODataSet1tax_in_price.AsString;//'含税';
    stringgrid1.Cells[10,stringgrid1.RowCount-1]:='1';


    if ADODataSet1tax_in_price.Value='N' then //价税中不含税
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                            ADODataSet1QTY_RECD.Value*
                            ADODataSet1PART_PRICE.Value);
      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)+
                            ADODataSet1QTY_RECD.Value*
                            ADODataSet1PART_PRICE.Value*
                            ADODataSet1RUSH_CHARGE.Value*0.01);
     end
    else
     begin
      edit3.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                            ADODataSet1QTY_RECD.Value*
                            ADODataSet1PART_PRICE.Value/
                            (1+ ADODataSet1RUSH_CHARGE.Value*0.01));

      edit8.Text:=formatfloat('0.00',strtocurr(edit8.Text)+
                            ADODataSet1QTY_RECD.Value*
                            ADODataSet1PART_PRICE.Value*
                            ADODataSet1RUSH_CHARGE.Value*0.01/
                            (1+ADODataSet1RUSH_CHARGE.Value*0.01)
                             );
     end;

   end;

  END;
  END;

  if stringgrid1.RowCount>1 then
   begin
    stringgrid1.FixedRows:=1;
    bitbtn4.Enabled:=false;
    bitbtn5.Enabled:=false;
    ComboBox1.Enabled:=false;
   end;

  if stringgrid1.RowCount>11 then
   stringgrid1.ColWidths[1]:=73
  else
   stringgrid1.ColWidths[1]:=87;
   edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                            );
 end;
finally
form_rma.Free;
end;
end;

procedure TForm2.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm2.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
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

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 dm.ado116warehouse_ptr.Value:=
  self.warehouse_number[ComboBox1.ItemIndex];
end;

end.


