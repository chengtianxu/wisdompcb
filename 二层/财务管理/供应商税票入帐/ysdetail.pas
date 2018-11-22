unit ysdetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBCtrls,
  Mask, Menus,DateUtils,DB, ADODB, ComObj;

type
  TForm_ysdetail = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit15: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit5: TEdit;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    Label23: TLabel;
    Edit8: TEdit;
    Label24: TLabel;
    Edit11: TEdit;
    Label27: TLabel;
    Edit13: TEdit;
    Label28: TLabel;
    Edit14: TEdit;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label26: TLabel;
    Edit12: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    Label25: TLabel;
    Panel2: TPanel;
    Edit10: TEdit;
    Label9: TLabel;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    TabSheet3: TTabSheet;
    StringGrid3: TStringGrid;
    Edit16: TEdit;
    Label10: TLabel;
    Edit17: TEdit;
    Label11: TLabel;
    Edit18: TEdit;
    Label12: TLabel;
    PopupMenu4: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    BitBtn2: TBitBtn;
    N18: TMenuItem;
    Excel1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Excel1Click(Sender: TObject);
  private
    { Private declarations }
    acc_ptr:integer;
    abbrname:string;

    function get_voucher(invoice_date: tdatetime): string;
    procedure re_calculate;
    function RemoveInvalid(where: string): string;
    function get_col5(row: integer): currency;
    function get_col6(row: integer): currency;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function find_employee(rkey:integer):string;
    procedure open_glcnumber(rkey103,dflt_acctptr:integer);
    function vo_number(number: string): boolean;
    function find_error(var number:string;rkey105:integer): boolean;
    function return_rkey(sgrid:tstringgrid;col:integer):string; overload;
    function return_rkey(sgrid:tstringgrid;col,col1:integer;sType:byte):string; overload;  //根据col1列内容生成in()字符串
    function return_vifrkey(sgrid:tstringgrid;col:integer;v_if:byte):string; overload;
    function return_vifrkey(sgrid:tstringgrid;col:integer;v_if,sType:byte):string; overload;
    procedure change_bitbtn();
    function ExportStrGridToExcel(Args: array of const): Boolean;
    function GetMaxTaxMonthExpr(sgrid:tstringgrid):String;//获取最大的月份
  public
    { Public declarations }
    State:byte;     //1:新增,2:编辑,3:检查
  end;

var
  Form_ysdetail: TForm_ysdetail;

implementation

uses damo,Pick_Item_Single ,ConstVar,common,  misctooliv,
  AcctSearch, curr_search, voucher_dictionary, ASSIGN, voucher_report,
  miscmatil, taxlist;

{$R *.dfm}
function TForm_ysdetail.return_rkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
  if sgrid.RowCount>2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if i < sgrid.RowCount-2 then
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+','
      else
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+')';
     result:= rkey_list;
   end;
end;

function TForm_ysdetail.return_vifrkey(sgrid: tstringgrid;
  col: integer;v_if:byte): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
  if sgrid.RowCount>2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if strtoint(sgrid.Cells[12,i])=v_if then
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
     if length(rkey_list)>1 then
      result:= copy(rkey_list,1,length(rkey_list)-1)+')'
     else
      result:='';
   end;
end;

function TForm_ysdetail.vo_number(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0105');
  sql.Add('where VOUCHER='''+number+'''');
  open;
  if not IsEmpty then result:=true;
 end;
end;

function TForm_ysdetail.find_error(var number:string;rkey105:integer): boolean;
var
 rkey_list:string;
begin
  result:=false;

  rkey_list:=return_rkey(stringgrid1,7,8,0);
  if rkey_list<> '' then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey,INVOICE_NO from data0107');
    sql.Add('where GLPTR_STATUS = 1');
    if rkey105 > 0 then
    sql.Add('and GL_HEADER_PTR<>'+inttostr(rkey105));
    sql.Add('and rkey in'+rkey_list);
    open;
    if not IsEmpty then
     begin
      number:=fieldbyname('INVOICE_NO').AsString;
      result:=true;
      exit;
     end;
   end;

  rkey_list:=return_rkey(stringgrid3,10);
  if rkey_list<> '' then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey,invoice_number from data0127');
    sql.Add('where GLPTR_STATUS = 1');
    if rkey105 > 0 then
    sql.Add('and GL_HEADER_PTR<>'+inttostr(rkey105));
    sql.Add('and rkey in'+rkey_list);
    open;
    if not IsEmpty then
     begin
      number:=fieldbyname('invoice_number').AsString;
      result:=true;
      exit;
     end;
   end;

  rkey_list:=return_vifrkey(stringgrid2,11,0,0);
  if rkey_list<> '' then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0456.GRN_NUMBER,data0017.INV_PART_NUMBER from data0022 inner join data0456');
    sql.Add('ON Data0022.GRN_PTR = Data0456.RKEY inner join');
    sql.Add('data0017 on data0022.INVENTORY_PTR=data0017.rkey');
    sql.Add('where data0022.GLPTR_STATUS = 1');
    if rkey105 > 0 then
    sql.Add('and data0022.GL_HEADER_PTR<>'+inttostr(rkey105));
    sql.Add('and data0022.rkey in'+rkey_list);
    open;
    if not IsEmpty then
     begin
      number:=fieldbyname('GRN_NUMBER').AsString+':'+
              fieldbyname('INV_PART_NUMBER').AsString;
      result:=true;
      exit;
     end;
   end;

  rkey_list:=return_vifrkey(stringgrid2,11,1,0);
  if rkey_list<> '' then
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0456.GRN_NUMBER,data0235.goods_name from data0235 inner join data0456');
    sql.Add('ON Data0235.GRN_PTR = Data0456.RKEY');
    sql.Add('where data0235.GLPTR_STATUS = 1');
    if rkey105 > 0 then
    sql.Add('and data0235.GL_HEADER_PTR<>'+inttostr(rkey105));
    sql.Add('and data0235.rkey in'+rkey_list);
    open;
    if not IsEmpty then
     begin
      number:=fieldbyname('GRN_NUMBER').AsString+':'+
              fieldbyname('goods_name').AsString;
      result:=true;
     end;
   end;
end;

procedure TForm_ysdetail.FormActivate(Sender: TObject);
var
 i:integer;
 ship_amout,tax_amount:Double;
begin
self.StringGrid1.Cells[0,0]:='发票编号';
self.StringGrid1.Cells[1,0]:='类型';
self.StringGrid1.Cells[2,0]:='发票日期';
self.StringGrid1.Cells[3,0]:='不含税金额';
self.StringGrid1.Cells[4,0]:='杂项费用';
self.StringGrid1.Cells[5,0]:='增值税';
self.StringGrid1.Cells[6,0]:='发票金额';
self.StringGrid1.Cells[7,0]:='rkey107';
self.StringGrid1.Cells[8,0]:='sType';
stringgrid1.ColWidths[7]:=-1;
stringgrid1.ColWidths[8]:=-1;

stringgrid2.Cells[0,0]:='材料编码';
stringgrid2.Cells[1,0]:='规格';
stringgrid2.Cells[2,0]:='入库单号';
stringgrid2.Cells[3,0]:='送货单号';
stringgrid2.Cells[4,0]:='入库日期';
stringgrid2.Cells[5,0]:='数量';
stringgrid2.Cells[6,0]:='单位';
stringgrid2.Cells[7,0]:='含税价';
stringgrid2.Cells[8,0]:='金额';
StringGrid2.Cells[9,0]:='税率%';
StringGrid2.Cells[10,0]:='税金';
StringGrid2.Cells[11,0]:='rkey';
stringgrid2.ColWidths[11]:=-1;
StringGrid2.Cells[12,0]:='22or235';  //0编码物料或者1杂项物料
stringgrid2.ColWidths[12]:=-1;
StringGrid2.Cells[13,0]:='sType';
stringgrid2.ColWidths[13]:=-1;

sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';
self.PageControl1.ActivePageIndex:=0;

stringgrid3.Cells[0,0]:='发票编码';
stringgrid3.Cells[1,0]:='发票号码';
stringgrid3.Cells[2,0]:='发票日期';
stringgrid3.Cells[3,0]:='货款年度';
stringgrid3.Cells[4,0]:='货款月份';
stringgrid3.Cells[5,0]:='不含税金额';
stringgrid3.Cells[6,0]:='税率%';
stringgrid3.Cells[7,0]:='税金';
stringgrid3.Cells[8,0]:='总计金额';
stringgrid3.Cells[9,0]:='备注';
stringgrid3.Cells[10,0]:='rkey127';
stringgrid3.ColWidths[10]:=-1;

if self.State=1 then  //新增
begin
 edit11.Text:=datetostr(common.getsystem_date(dm.ADOQuery1,1));
 edit11exit(sender);
end
else    //编辑或者检查
 begin
  if self.State=3 then  //检查
   begin
    edit10.ReadOnly:=true;
    edit11.ReadOnly:=true;
    bitbtn1.Enabled:=false;
    stringgrid1.PopupMenu:=nil;
//    stringgrid2.PopupMenu:=nil;
    begin
      stringgrid2.PopupMenu:=PopupMenu2;
      N3.Visible:=False;
      N12.Visible:=False;
      N13.Visible:=False;
      N14.Visible:=False;
    end;
    stringgrid3.PopupMenu:=nil;
    toolbar1.Enabled:=false;
    sgrid1.PopupMenu:=nil;
    sgrid1.Options:=sgrid1.Options+[goRowselect];
   end;
  edit8.Text:=dm.ADS105VOUCHER.Value;
  edit10.Text:=dm.ADS105BATCH_NUMBER.Value;
  edit11.Text:=dm.ADS105ENTERED_DT.AsString;
  edit13.Text:=dm.ADS105FYEAR.AsString;
  edit14.Text:=dm.ADS105PERIOD.AsString;
  edit1.Text:=dm.ADS105CODE.Value;
  label19.Caption:=dm.ADS105SUPPLIER_NAME.Value;
  edit5.Text:=dm.ads105curr_code.Value;
  label20.Caption:=dm.ADS105CURR_NAME.Value;
  edit1.Tag:=dm.ADS105SUPP_PTR.Value;
  edit5.Tag:=dm.ADS105CURRENCY_PTR.Value;
  if edit5.Tag=1 then
   edit2.ReadOnly:=true
  else
   edit2.ReadOnly:=false;
  edit2.Text:=dm.ADS105EXCHANGE_RATE.AsString;
  
  updown1.Position:=dm.ADS105ATTACHED.Value;
  edit15.Text:=dm.Ads105EMPLOYEE_NAME.Value;

  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT  Data0107.rkey, INVOICE_NO, INV_DATE,'+#13+
      'INV_TOTAL,MATL_TOT, FED_TAX, MISC_TOT,'+#13+
      ' CASE INV_TP'+#13+
      'WHEN 0 THEN ''标准PO'''+#13+
      'WHEN 1 THEN ''杂项PO'''+#13+
      'WHEN 2 THEN ''直接入仓'''+#13+
      'WHEN 3 THEN ''委外加工'' WHEN 4 THEN ''其它费用'' END AS 类型,'+#13+
      ' GL_HEADER_PTR, INV_TP, ''0''as sType'+#13+
      'FROM  dbo.Data0107'+#13+
      'where GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
      'UNION'+#13+
      'select Data0132.rkey,MEMO_NUMBER as INVOICE_NO,  ENT_DATE as INV_DATE,'+#13+
      '(-1)*AMOUNT as INV_TOTAL,(-1)*MATL_TOT, (-1)*FED_TAX, (-1)*MISC_TOT,'+#13+
      'CASE MEMO_TP'+#13+
      'WHEN 2 THEN ''扣款备忘'''+#13+
      'WHEN 3 THEN ''退货备忘'''+#13+
      'WHEN 4 THEN ''预付备忘'' END AS 类型,'+#13+
      'GL_HEADER_PTR, Convert(Char(1),MEMO_TP) as INV_TP, ''1'' as sType'+#13+
      'from dbo.Data0132'+#13+
      'where GL_HEADER_PTR='+dm.ADS105RKEY.AsString;
    open;
    while not eof do
     begin
      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=fieldbyname('INVOICE_NO').AsString;
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=fieldbyname('类型').AsString;
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=fieldbyname('INV_DATE').AsString;
      stringgrid1.Cells[3,stringgrid1.RowCount-1]:=fieldbyname('MATL_TOT').AsString;
       edit6.Text:= currtostr(strtocurr(edit6.Text)+fieldbyname('MATL_TOT').Value);
      stringgrid1.Cells[4,stringgrid1.RowCount-1]:=fieldbyname('MISC_TOT').AsString;
       edit4.Text:= currtostr(strtocurr(edit4.Text)+fieldbyname('MISC_TOT').Value);
      stringgrid1.Cells[5,stringgrid1.RowCount-1]:=fieldbyname('FED_TAX').AsString;
       edit7.Text:= currtostr(strtocurr(edit7.Text)+fieldbyname('FED_TAX').Value);
      stringgrid1.Cells[6,stringgrid1.RowCount-1]:=fieldbyname('INV_TOTAL').AsString;
       edit9.Text:= currtostr(strtocurr(edit9.Text)+fieldbyname('INV_TOTAL').Value); //总计
      stringgrid1.Cells[7,stringgrid1.RowCount-1]:=fieldbyname('rkey').AsString;
      stringgrid1.Cells[8,stringgrid1.RowCount-1]:=fieldbyname('sType').AsString;
      stringgrid1.RowCount:=stringgrid1.RowCount+1;
      next;
     end;
   end;
//=====================
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT rkey,invoice_number, invoice_no, invoice_date, account_date,'+#13+
      'matl_year, matl_month, MATL_amount, tax_amount, tax, INV_TOTAL, remark'+#13+
      'FROM  dbo.Data0127'+#13+
      'where GL_HEADER_PTR='+dm.ADS105RKEY.AsString+
      ' order by invoice_number';
    open;
    while not eof do
     begin
      stringgrid3.Cells[0,stringgrid3.RowCount-1]:=fieldbyname('invoice_number').AsString;  //'发票编码';
      stringgrid3.Cells[1,stringgrid3.RowCount-1]:=fieldbyname('invoice_no').AsString;      //'发票号码';
      stringgrid3.Cells[2,stringgrid3.RowCount-1]:=fieldbyname('invoice_date').AsString; //'发票日期';
      stringgrid3.Cells[3,stringgrid3.RowCount-1]:=fieldbyname('matl_year').AsString;    //'货款年度';
      stringgrid3.Cells[4,stringgrid3.RowCount-1]:=fieldbyname('matl_month').AsString;   //'货款月份';
      stringgrid3.Cells[5,stringgrid3.RowCount-1]:=fieldbyname('MATL_amount').AsString;  //'不含税金额';
      stringgrid3.Cells[6,stringgrid3.RowCount-1]:=fieldbyname('tax').AsString;          //'税率%';
      stringgrid3.Cells[7,stringgrid3.RowCount-1]:=fieldbyname('tax_amount').AsString;   //'税金';
      stringgrid3.Cells[8,stringgrid3.RowCount-1]:=fieldbyname('INV_TOTAL').AsString;    //'总计金额';
      stringgrid3.Cells[9,stringgrid3.RowCount-1]:=fieldbyname('remark').AsString;       //'备注';
      stringgrid3.Cells[10,stringgrid3.RowCount-1]:=fieldbyname('rkey').AsString;        //'rkey127';

      edit16.Text := currtostr(strtocurr(edit16.Text)+fieldbyname('MATL_amount').AsCurrency);
      edit17.Text := currtostr(strtocurr(edit17.Text)+fieldbyname('tax_amount').AsCurrency);
      edit18.Text := currtostr(strtocurr(edit18.Text)+fieldbyname('INV_TOTAL').AsCurrency);
      stringgrid3.RowCount := stringgrid3.RowCount+1;
      next;
     end;
   end;
//=====================
    ship_amout:=0;
    tax_amount:=0;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
       ' SELECT Data0022.RKEY,Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,'+#13+
       '  dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'+#13+
       '   dbo.Data0456.ship_DATE, dbo.Data0002.UNIT_NAME,'+#13+
       '    dbo.Data0022.tax_price, dbo.Data0022.TAX_2, dbo.Data0022.QUANTITY,'+#13+
       '   ROUND(dbo.Data0022.QUANTITY * dbo.Data0022.tax_price, 2) AS amount,'+#13+
       '   ROUND((dbo.Data0022.QUANTITY * dbo.Data0022.tax_price * dbo.Data0022.TAX_2 * 0.01)'+#13+
       '  / (1 + dbo.Data0022.TAX_2 * 0.01), 2) AS tax_amount'+#13+
       'FROM         dbo.Data0002 INNER JOIN'+#13+
       '   dbo.Data0022 ON dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM INNER JOIN'+#13+
       '   dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
       '   dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY'+#13+
       'where data0022.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
       ' order by Data0456.GRN_NUMBER';
     Prepared;
     open;
     while not eof do
      begin
        stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_NUMBER').AsString; //材料编码
        stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_DESCRIPTION').AsString; //规格
        stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
        stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
        stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString;    //入库日期
        stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString;     //数量
        stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString;    //单位
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('tax_price').AsString;    //价格
        stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString;       //含税金额
        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;        //税率
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  //税金
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;        //22.rkey
        stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';     //编码材料
        stringgrid2.Cells[13,stringgrid2.RowCount-1]:='0';
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
        tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
        next;
      end;
//      edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//      edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//      edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
      edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
      edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
      edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    end;

    ship_amout:=0;
    tax_amount:=0;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
       ' SELECT dbo.Data0235.RKEY,dbo.Data0235.goods_name, dbo.Data0235.goods_guige,'+#13+
       '  dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, dbo.Data0456.ship_DATE,'+#13+
       '       dbo.Data0235.QUAN_RECD,dbo.Data0002.UNIT_NAME, dbo.Data0235.unit_price,'+#13+
       '       dbo.Data0235.state_tax,'+#13+
       '  ROUND(dbo.Data0235.QUAN_RECD * dbo.Data0235.unit_price, 2) AS amount,'+#13+
       '  ROUND((dbo.Data0235.QUAN_RECD * dbo.Data0235.unit_price * dbo.Data0235.state_tax * 0.01)'+#13+
       '       / (1 + dbo.Data0235.state_tax * 0.01), 2) AS tax_amount'+#13+
       ' FROM         dbo.Data0235 INNER JOIN'+#13+
       '     dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
       '     dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'+#13+
       'where Data0235.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
       ' order by Data0456.GRN_NUMBER';
     Prepared;
     open;
     while not eof do
      begin
        stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('goods_name').AsString; //材料编码
        stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('goods_guige').AsString; //规格
        stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
        stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
        stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString; //  入库日期
        stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUAN_RECD').AsString; //   数量
        stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString; // 单位
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('unit_price').AsString; //'价格';
        stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString; //  金额
        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('state_tax').AsString;   // 税率
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  // 税金
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;     //235.rkey
        stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';     //杂项材料
        stringgrid2.Cells[13,stringgrid2.RowCount-1]:='0'; 
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
        tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
        next;
      end;
//      edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//      edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//      edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
      edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
      edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
      edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    end;

    ship_amout:=0;
    tax_amount:=0;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
      'SELECT t210.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,'+#13+
      't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
      't2.UNIT_NAME,t22.tax_price,t22.TAX_2,(-1)*t210.QUANTITY as QUANTITY,'+#13+
      'ROUND((-1)*t210.QUANTITY*t22.tax_price,2) AS amount,'+#13+
      'ROUND((-1)*(t210.QUANTITY*t22.tax_price*t22.TAX_2*0.01)/(1+t22.TAX_2*0.01),2) AS tax_amount, ''0'' AS vType'+#13+
      'FROM data0210 t210'+#13+
      'INNER JOIN data0022 t22 ON t210.D0022_PTR = t22.RKEY'+#13+
      'INNER JOIN data0017 t17 ON t22.INVENTORY_PTR = t17.RKEY'+#13+
      'INNER JOIN data0002 t2 ON t22.LOCATION_PTR_FROM = t2.RKEY'+#13+
      'INNER JOIN data0456 t456 ON t22.GRN_PTR = t456.RKEY'+#13+
      'WHERE t210.type = 0 AND t210.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13;
     sql.Text:=sql.Text+#13+'UNION'+#13+
      'SELECT t210.RKEY,t235.goods_name as INV_PART_NUMBER,t235.goods_guige as INV_PART_DESCRIPTION,'+#13+
      't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
      't2.UNIT_NAME,t235.unit_price as tax_price,t235.state_tax as TAX_2,(-1)*t210.QUANTITY as QUANTITY,'+#13+
      'ROUND((-1)*t210.QUANTITY*t235.unit_price,2) AS amount,'+#13+
      'ROUND((-1)*(t210.QUANTITY*t235.unit_price*t235.state_tax * 0.01)/(1+t235.state_tax*0.01),2) AS tax_amount, ''1'' AS vType'+#13+
      'FROM data0210 t210'+#13+
      'INNER JOIN data0235 t235 ON t210.D0235_PTR = t235.RKEY'+#13+
      'INNER JOIN data0002 t2 ON t235.unit_ptr = t2.RKEY'+#13+
      'INNER JOIN data0456 t456 ON t235.GRN_PTR = t456.RKEY'+#13+
      'WHERE t210.type = 1 AND t210.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13;
      sql.Text:=sql.Text+' order by t456.GRN_NUMBER';
     Prepared;
     open;
     while not eof do
      begin
        stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_NUMBER').AsString; //材料编码
        stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_DESCRIPTION').AsString; //规格
        stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
        stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
        stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString; //  入库日期
        stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString; //   数量
        stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString; // 单位
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('tax_price').AsString; //'价格';
        stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString; //  金额
        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;   // 税率
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  // 税金
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;     //210.rkey
        stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('vType').AsString;     //编码材料退货or杂项物料退货
        stringgrid2.Cells[13,stringgrid2.RowCount-1]:='1';     //按退货备忘
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
        tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
        next;
      end;
//      edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//      edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//      edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
      edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
      edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
      edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    end;

  dm.ads106.First;
  dm.ads106.DisableControls;
  sgrid1.RowCount:=dm.Ads106.RecordCount+2;
  sgrid2.RowCount:=sgrid1.RowCount;
  for i:=1 to dm.ads106.RecordCount do
   begin
    sgrid1.Cells[0,i]:=dm.ads106DESCRIPTION.Value;
    sgrid1.Cells[1,i]:=dm.ads106GL_ACC_NUMBER.Value+'-'+
                          dm.ads106description_2.Value;
    sgrid1.Cells[2,i]:=dm.ads106CURR_CODE.value;
    sgrid1.Cells[3,i]:=dm.ads106EXCH_RATE.AsString;
    sgrid1.Cells[4,i]:=dm.ads106price.AsString;  //原币

    sgrid2.Cells[0,i]:=dm.ads106GL_ACCT_NO_PTR.AsString;
    sgrid2.Cells[1,i]:=dm.ads106CURR_PTR.AsString;
    if dm.ads106D_C.Value='D' then
     sgrid1.Cells[5,i]:=formatfloat('0.00',dm.ads106AMOUNT.Value)
    else
     sgrid1.Cells[6,i]:=formatfloat('0.00',dm.ads106AMOUNT.Value);
    dm.ads106.Next;
   end;
    dm.ads106.First;
   dm.ads106.EnableControls;
  self.re_calculate();//重新计算借货金额
 end;

end;

procedure TForm_ysdetail.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CODE/供应商代码/110,SUPPLIER_NAME/供应商名称/251,abbr_name/简称/125';
  InputVar.Sqlstr:='SELECT data0023.rkey,Data0023.CODE, Data0023.SUPPLIER_NAME,'+#13+
  'data0023.ACC_PAYABLE_PTR,data0023.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.base_to_other,data0023.abbr_name'+#13+
  'FROM dbo.Data0023 inner join data0001 on'+#13+
  'data0023.CURRENCY_PTR=data0001.rkey';

  InputVar.Sqlstr:=InputVar.Sqlstr+#13+
                   'order by data0023.code';
  inputvar.KeyField:='CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CODE').AsString;
   label19.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('SUPPLIER_NAME').AsString;
   edit1.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   self.acc_ptr:= frmPick_Item_Single.adsPick.Fieldbyname('ACC_PAYABLE_PTR').AsInteger;
   self.abbrname:=frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').AsString;

   edit5.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
   label20.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
   edit2.Text:=frmPick_Item_Single.adsPick.Fieldbyname('base_to_other').AsString;
   edit5.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('CURRENCY_PTR').AsInteger;
   edit5.SetFocus;
   if edit5.Tag=1 then
    edit2.ReadOnly:=true
   else
    edit2.ReadOnly:=false;
  end
  else
   begin
    edit1.SetFocus;
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;


procedure TForm_ysdetail.BitBtn4Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CURR_CODE/货币代码/110,CURR_NAME/货币名称/251,base_to_other/汇率/125';
  InputVar.Sqlstr:='SELECT data0001.rkey,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.base_to_other'+#13+
  'FROM data0001';
  InputVar.Sqlstr:=InputVar.Sqlstr+#13+
                   'order by data0001.curr_code';
  inputvar.KeyField:='CUrr_CODE';
  inputvar.InPut_value:=edit5.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin

   edit5.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
   label20.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
   edit2.Text:=frmPick_Item_Single.adsPick.Fieldbyname('base_to_other').AsString;
   edit5.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   stringgrid1.SetFocus;
   if edit5.Tag=1 then
    edit2.ReadOnly:=true
   else
    edit2.ReadOnly:=false;
  end
  else
   begin
    edit5.SetFocus;
   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TForm_ysdetail.open_glcnumber(rkey103,dflt_acctptr:integer);
begin
with dm.ADOQuery1 do     //处理应收帐款净价格发票总价格不能为零
 begin
  close;
  sql.Clear;
  sql.Add(' SELECT   dbo.Data0103.RKEY,dbo.Data0103.GL_ACC_NUMBER, ');
  sql.Add('CASE WHEN data0103_3.GL_DESCRIPTION IS NOT NULL');
  sql.Add('THEN data0103_3.GL_DESCRIPTION + ''-'' + data0103_2.GL_DESCRIPTION + ''-'' +');
  sql.Add('data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION ');
  sql.Add('ELSE CASE WHEN data0103_2.GL_DESCRIPTION IS NOT NULL ');
  sql.Add('THEN data0103_2.GL_DESCRIPTION + ''-'' + data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION');
  sql.Add('ELSE CASE WHEN data0103_1.GL_DESCRIPTION IS NOT NULL ');
  sql.Add('THEN data0103_1.GL_DESCRIPTION + ''-'' + data0103.GL_DESCRIPTION');
  sql.Add('ELSE data0103.GL_DESCRIPTION ');
  sql.Add('END END  END AS description_2,dbo.Data0103.CURR_TP, dbo.Data0103.CURR_PTR');
  sql.Add('FROM    dbo.Data0103 AS Data0103_2 LEFT OUTER JOIN');
  sql.Add('dbo.Data0103 AS data0103_3 ON Data0103_2.PARENT_PTR = data0103_3.RKEY RIGHT OUTER JOIN');
  sql.Add('dbo.Data0103 AS Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN');
  sql.Add('dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR');
  if rkey103 > 0  then
   sql.Add('where Data0103.rkey='+inttostr(rkey103))
  else
   sql.Add('where Data0103.rkey='+inttostr(dflt_acctptr));
  open;
 end;
end;

function TForm_ysdetail.find_employee(rkey: integer): string;
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0005.employee_name');
    sql.Add('from data0005');
    sql.Add('where data0005.rkey='+user_ptr);
    open;
    if not eof then
      result:=fieldbyname('employee_name').AsString
    else
     result:=''
   end;
end;

function TForm_ysdetail.get_voucher(invoice_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 voucher:='TA'+copy(Edit13.Text,3,2);  //年度
 if length(Edit14.Text) < 2 then
  voucher := voucher+'0'+Edit14.Text
 else
  voucher := voucher+Edit14.Text;      //月份
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
  result:= voucher;  //凭证编号
end;

procedure TForm_ysdetail.Edit11Exit(Sender: TObject);
begin
try
 strtodate(edit11.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit11.SetFocus;
 exit;
end;
if State=1 then  //新增
 if  (Edit13.Text<>inttostr(yearof(strtodate(edit11.Text)))) or
     (Edit14.Text<>inttostr(monthof(strtodate(edit11.Text))))  then
  begin
   Edit13.Text:=inttostr(yearof(strtodate(edit11.Text)));
   Edit14.Text:=inttostr(monthof(strtodate(edit11.Text)));
   edit8.Text:=self.get_voucher(strtodate(edit11.Text));
  end;
end;

procedure TForm_ysdetail.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm_ysdetail.N1Click(Sender: TObject);
var
 i:integer;
begin
if edit1.Text='' then
 showmsg('请先输入供应商代码',1)
else
try
  form_misctooliv:= tform_misctooliv.Create(application);
  with  form_misctooliv.ads112 do
   begin
    close;
    CommandText:=CommandText+'AND (INV_TP =4) and (SUPP_PTR='+inttostr(edit1.Tag)+')'+' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if stringgrid1.RowCount>2 then
     begin
      CommandText:=CommandText+' and rkey not in'+self.return_rkey(stringgrid1,7,8,0);
     end;
    CommandText:=CommandText+#13+'UNION'
                  +#13+'SELECT rkey, MEMO_NUMBER as INVOICE_NO,  ENT_DATE as INV_DATE,'
                  +#13+'(-1)*AMOUNT as INV_TOTAL,(-1)*MATL_TOT, (-1)*FED_TAX, (-1)*MISC_TOT,'
                  +#13+'CASE MEMO_TP'
                  +#13+'WHEN 2 THEN ''扣款备忘'''
                  +#13+'WHEN 3 THEN ''退货备忘'''
                  +#13+'WHEN 4 THEN ''预付备忘'' END AS 类型,'
                  +#13+' GL_HEADER_PTR, Convert(Char(1),MEMO_TP) as INV_TP, ''1'' as sType'
                  +#13+'FROM dbo.Data0132'
                  +#13+'WHERE (memo_status <> 3) AND (GLPTR_STATUS = 0) AND (MEMO_TP = 2)'
                  +#13+'and (SUPP_PTR='+inttostr(edit1.Tag)+')'+' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if stringgrid1.RowCount>2 then
     begin
      CommandText:=CommandText+' and rkey not in'+self.return_rkey(stringgrid1,7,8,1);
     end;
    Prepared;
    open;
   end;

  if form_misctooliv.ShowModal=mrok then
  begin
   for i:=1 to form_misctooliv.DBGrid1.SelectedRows.Count do
    begin
     form_misctooliv.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_misctooliv.dbgrid1.SelectedRows.Items[i-1];

      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_misctooliv.ads112INVOICE_NO.Value;
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_misctooliv.ads112DSDesigner.AsString;
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form_misctooliv.ads112INV_DATE.AsString;

      stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_misctooliv.ads112MATL_TOT.AsString;
        edit6.Text:= currtostr(strtocurr(edit6.Text)+form_misctooliv.ads112MATL_TOT.Value);
      stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form_misctooliv.ads112MISC_TOT.AsString;
        edit4.Text:= currtostr(strtocurr(edit4.Text)+form_misctooliv.ads112MISC_TOT.Value);

      stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form_misctooliv.ads112FED_TAX.AsString;
        edit7.Text:= currtostr(strtocurr(edit7.Text)+form_misctooliv.ads112FED_TAX.Value);
      stringgrid1.Cells[6,stringgrid1.RowCount-1]:=form_misctooliv.ads112INV_TOTAL.AsString;
        edit9.Text:= currtostr(strtocurr(edit9.Text)+form_misctooliv.ads112INV_TOTAL.Value); //总计
      stringgrid1.Cells[7,stringgrid1.RowCount-1]:=form_misctooliv.ads112rkey.AsString;
      stringgrid1.Cells[8,stringgrid1.RowCount-1]:=form_misctooliv.ads112sType.AsString;
      stringgrid1.RowCount:=stringgrid1.RowCount+1;
    end;
   change_bitbtn;
  end;
finally
 form_misctooliv.Free;
end;
end;

procedure TForm_ysdetail.Edit2Exit(Sender: TObject);
begin
if edit2.Text = '' then edit2.Text := '0';
 edit2.Text := formatfloat('0.00000000',strtofloat(edit2.Text));
end;

procedure TForm_ysdetail.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit2.Text)>0  then abort;
end;

procedure TForm_ysdetail.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row= stringgrid1.RowCount-1 then
 n2.Enabled:=false
else
 n2.Enabled:=true; 
end;

procedure TForm_ysdetail.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm_ysdetail.N2Click(Sender: TObject);
var
 i:integer;
begin
edit6.Text:=
    currtostr(strtocurr(edit6.Text)-strtocurr(stringgrid1.Cells[3,stringgrid1.Row]));
  edit4.Text:=
     currtostr(strtocurr(edit4.Text)-strtocurr(stringgrid1.Cells[4,stringgrid1.Row]));
  edit7.Text:=
     currtostr(strtocurr(edit7.Text)-strtocurr(stringgrid1.Cells[5,stringgrid1.Row]));
  edit9.Text:=
     currtostr(strtocurr(edit9.Text)-strtocurr(stringgrid1.Cells[6,stringgrid1.Row]));
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 change_bitbtn;
end;

procedure TForm_ysdetail.re_calculate;
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

function TForm_ysdetail.RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm_ysdetail.get_col5(row: integer): currency;
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

function TForm_ysdetail.get_col6(row: integer): currency;
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

function TForm_ysdetail.get_gltp(rkey103: string): integer;
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

function TForm_ysdetail.get_glcurr_ptr(rkey103: string): integer;
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

procedure TForm_ysdetail.Sgrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
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

procedure TForm_ysdetail.Sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

procedure TForm_ysdetail.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm_ysdetail.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm_ysdetail.Sgrid1Exit(Sender: TObject);
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

procedure TForm_ysdetail.Sgrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm_ysdetail.N4Click(Sender: TObject);
begin
try
  if trim(edit1.Text)='' then
  begin
    showmsg('发票明细中供应商未选择，请检查!',1);
    Exit;
  end;
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
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1curr_code.Value;

        if edit5.Tag=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text
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

procedure TForm_ysdetail.N5Click(Sender: TObject);
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
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
      sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
     end;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm_ysdetail.N11Click(Sender: TObject);
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

      if edit5.Tag= form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit2.Text
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

procedure TForm_ysdetail.N6Click(Sender: TObject);
var
  i:integer;
begin
  try
  if trim(edit1.Text)='' then
  begin
    showmsg('发票明细中供应商未选择，请检查!',1);
    Exit;
  end;  
   form_acct:=tform_acct.Create(application);
   if form_acct.ShowModal=mrok then
    try
     form_curr:=tform_curr.Create(application);
     if form_curr.ShowModal=mrok then
      begin
       if (form_acct.ADOQuery1curr_tp.Value=0) and (form_curr.ADOQuery1rkey.Value>1) then
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
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;

          if edit5.Tag=form_curr.ADOQuery1rkey.Value then
           sgrid1.Cells[3,sgrid1.Row]:=edit2.Text
          else
           sgrid1.Cells[3,sgrid1.Row]:=
                            form_curr.ADOQuery1BASE_TO_OTHER.AsString;

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

procedure TForm_ysdetail.N7Click(Sender: TObject);
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

procedure TForm_ysdetail.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm_ysdetail.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm_ysdetail.SpeedButton7Click(Sender: TObject);
begin
if State=1 then  //新增
 edit8.Text:=self.get_voucher(strtodate(edit11.Text))
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm_ysdetail.PopupMenu3Popup(Sender: TObject);
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

procedure TForm_ysdetail.PageControl1Change(Sender: TObject);
var
 ys_total:single;
 mt_error:boolean;
 i:integer;
 MonthPeriod:String;
begin

if (self.State=1)  then
if (strtocurr(formatfloat('0.00',strtocurr(edit7.text)*strtofloat(edit2.Text)))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
begin

 Edit15.Text := find_employee(strtoint(user_ptr));  //制作人员
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

  if strtocurr(edit7.Text) > 0 then       //借方,处理总价款
   begin
     self.open_glcnumber(0,dm.ADO104DFLT_ACCT_01.Value);
     case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
       0:                 //不核算外币
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';  //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
           Formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit2.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
        end;
       2:             //核算单一外币
        begin
         if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
          begin
           sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.text;      //货币
           sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;        //汇率
           sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                             formatfloat('0.00',strtocurr(edit7.Text));
           sgrid2.Cells[1,sgrid2.RowCount-1]:=INtTOSTR(EDIT5.Tag);
          end
         else
          begin
           messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
           mt_error:=false;
          end;
        end;
     end;  // end case
     MonthPeriod:=GetMaxTaxMonthExpr(StringGrid2);
     if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=MonthPeriod+//'税票入帐'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']'+'材料入库暂估进项税转出到待抵扣';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                          formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit2.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //==========以上为借方=====处理产品销售收入=============================

//=============================处理贷方税金======================================
   if strtocurr(edit7.Text) > 0 then
    begin
     self.open_glcnumber(0,dm.ADO104DFLT_ACCT_02.Value);

      case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit2.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
      begin
       if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= edit5.text;     //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;       //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',strtocurr(edit7.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:=INtTOSTR(EDIT5.Tag);
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;

      if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=MonthPeriod+//'税票入帐'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']'+'材料入库暂估进项税转出到待抵扣';;
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                          formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit2.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
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

procedure TForm_ysdetail.StringGrid2MouseDown(Sender: TObject;
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

procedure TForm_ysdetail.N3Click(Sender: TObject);
var
 i:integer;
 rkey_list,rkey_list1,rkey235_list,rkey235_list1:string;
 ship_amout,tax_amount:Double;
begin
if edit1.Text='' then
 showmsg('请先输入供应商代码',1)
else
try
 form_misctooliv:= tform_misctooliv.Create(application);
 form_misctooliv.Caption:='标准发票搜索';
 with  form_misctooliv.ads112 do
  begin
    close;
    CommandText:=CommandText+'AND (INV_TP in (0,1,2)) and (SUPP_PTR='+inttostr(edit1.Tag)+')'+' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    CommandText:=CommandText+#13+'UNION'
                  +#13+'SELECT rkey, MEMO_NUMBER as INVOICE_NO,  ENT_DATE as INV_DATE,'
                  +#13+'(-1)*AMOUNT as INV_TOTAL,(-1)*MATL_TOT, (-1)*FED_TAX, (-1)*MISC_TOT,'
                  +#13+'CASE MEMO_TP'
                  +#13+'WHEN 2 THEN ''扣款备忘'''
                  +#13+'WHEN 3 THEN ''退货备忘'''
                  +#13+'WHEN 4 THEN ''预付备忘'' END AS 类型,'
                  +#13+' GL_HEADER_PTR, Convert(Char(1),MEMO_TP) as INV_TP, ''1'' as sType'
                  +#13+'FROM dbo.Data0132'
                  +#13+'WHERE (memo_status <> 3) AND (GLPTR_STATUS = 0) AND (MEMO_TP = 3)'
                  +#13+'and (SUPP_PTR='+inttostr(edit1.Tag)+')'+' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    Prepared;
    open;
  end;
 if form_misctooliv.ShowModal=mrok then
  begin
    rkey_list := return_vifrkey(stringgrid2,11,0,0);  //标准物料(应付发票)
    rkey235_list := return_vifrkey(stringgrid2,11,1,0); //杂项物料(应付发票)
    rkey_list1 := return_vifrkey(stringgrid2,11,0,1);  //标准物料(退货备忘)
    rkey235_list1 := return_vifrkey(stringgrid2,11,1,1); //杂项物料(退货备忘)
//    showmessage(rkey_list+#13+rkey235_list+#13+rkey_list1+#13+rkey235_list1);
    ship_amout:=0;
    tax_amount:=0;
    for i:=1 to form_misctooliv.DBGrid1.SelectedRows.Count do
    begin
     form_misctooliv.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_misctooliv.dbgrid1.SelectedRows.Items[i-1];
     if (form_misctooliv.ads112sType.Value='0') then  //按应付发票添加
     begin
       if (form_misctooliv.ads112INV_TP.Value<>'1') then //非杂项帐龄
       with dm.ADOQuery1 do
        begin
         close;
         sql.Text:=
         ' SELECT Data0022.RKEY,Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,'+#13+
         '  dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'+#13+
         '   dbo.Data0456.ship_DATE, dbo.Data0002.UNIT_NAME,'+#13+
         '    dbo.Data0022.tax_price, dbo.Data0022.TAX_2, dbo.Data0022.QUANTITY,'+#13+
         '   ROUND(dbo.Data0022.QUANTITY * dbo.Data0022.tax_price, 2) AS amount,'+#13+
         '   ROUND((dbo.Data0022.QUANTITY * dbo.Data0022.tax_price * dbo.Data0022.TAX_2 * 0.01)'+#13+
         '  / (1 + dbo.Data0022.TAX_2 * 0.01), 2) AS tax_amount'+#13+
         'FROM         dbo.Data0002 INNER JOIN'+#13+
         '   dbo.Data0022 ON dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM INNER JOIN'+#13+
         '   dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
         '   dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY'+#13+
         'where data0022.GLPTR_STATUS=0 and data0456.dealiv_ptr='+form_misctooliv.ads112rkey.AsString+#13;
         if rkey_list<>'' then
          sql.Text:=sql.Text+'and data0022.rkey not in'+rkey_list+#13+
           'order by Data0456.GRN_NUMBER'
         else
          sql.Text:=sql.Text+' order by Data0456.GRN_NUMBER';
         Prepared;
         open;
         while not eof do
          begin
            stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_NUMBER').AsString; //材料编码
            stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_DESCRIPTION').AsString; //规格
            stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
            stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
            stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString; //  入库日期
            stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString; //   数量
            stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString; // 单位
            stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('tax_price').AsString; //'价格';
            stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString; //  金额
            stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;   // 税率
            stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  // 税金
            stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;     //22.rkey
            stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';     //编码材料
            stringgrid2.Cells[13,stringgrid2.RowCount-1]:='0';     //按应付发票
            stringgrid2.RowCount:=stringgrid2.RowCount+1;
            ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
            tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
            next;
          end;
        end
       else            //杂项材料
       with dm.ADOQuery1 do
        begin
         close;
         sql.Text:=
         ' SELECT   dbo.Data0235.RKEY,  dbo.Data0235.goods_name, dbo.Data0235.goods_guige,'+#13+
         '  dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, dbo.Data0456.ship_DATE,'+#13+
         '       dbo.Data0235.QUAN_RECD,dbo.Data0002.UNIT_NAME, dbo.Data0235.unit_price,'+#13+
         '       dbo.Data0235.state_tax,'+#13+
         '       ROUND(dbo.Data0235.QUAN_RECD * dbo.Data0235.unit_price, 2) AS amount,'+#13+
         '       ROUND((dbo.Data0235.QUAN_RECD * dbo.Data0235.unit_price * dbo.Data0235.state_tax * 0.01)'+#13+
         '       / (1 + dbo.Data0235.state_tax * 0.01), 2) AS tax_amount'+#13+
         ' FROM         dbo.Data0235 INNER JOIN'+#13+
         '                       dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
         '                       dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'+#13+
         'where Data0235.GLPTR_STATUS=0 and data0456.dealiv_ptr='+form_misctooliv.ads112rkey.AsString+#13;
         if rkey235_list<>'' then
          sql.Text:=sql.Text+'and Data0235.rkey not in'+rkey235_list+#13+
           'order by Data0456.GRN_NUMBER'
         else
          sql.Text:=sql.Text+' order by Data0456.GRN_NUMBER';
         Prepared;
         open;
         while not eof do
          begin
            stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('goods_name').AsString; //材料编码
            stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('goods_guige').AsString; //规格
            stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
            stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
            stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString; //  入库日期
            stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUAN_RECD').AsString; //   数量
            stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString; // 单位
            stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('unit_price').AsString; //'价格';
            stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString; //  金额
            stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('state_tax').AsString;   // 税率
            stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  // 税金
            stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;     //235.rkey
            stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';     //杂项材料
            stringgrid2.Cells[13,stringgrid2.RowCount-1]:='0';     //按应付发票
            stringgrid2.RowCount:=stringgrid2.RowCount+1;
            ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
            tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
            next;
          end;
        end;
     end
     else  //按退货备忘添加
     begin
       with dm.ADOQuery1 do
        begin
         close;
         sql.Text:=
          'SELECT t210.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,'+#13+
          't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
//          't2.UNIT_NAME,t22.tax_price,t22.TAX_2,(-1)*t22.QUANTITY as QUANTITY,'+#13+
//          'ROUND((-1)*t22.QUANTITY*t22.tax_price,2) AS amount,'+#13+
//          'ROUND((-1)*(t22.QUANTITY*t22.tax_price*t22.TAX_2*0.01)/(1+t22.TAX_2*0.01),2) AS tax_amount, ''0'' AS vType'+#13+
          't2.UNIT_NAME,t22.tax_price,t22.TAX_2,(-1)*t210.QUANTITY as QUANTITY,'+#13+
          'ROUND((-1)*t210.QUANTITY*t22.tax_price,2) AS amount,'+#13+
          'ROUND((-1)*(t210.QUANTITY*t22.tax_price*t22.TAX_2*0.01)/(1+t22.TAX_2*0.01),2) AS tax_amount, ''0'' AS vType'+#13+
          'FROM data0210 t210'+#13+
          'INNER JOIN data0022 t22 ON t210.D0022_PTR = t22.RKEY'+#13+
          'INNER JOIN data0017 t17 ON t22.INVENTORY_PTR = t17.RKEY'+#13+
          'INNER JOIN data0002 t2 ON t22.LOCATION_PTR_FROM = t2.RKEY'+#13+
          'INNER JOIN data0456 t456 ON t22.GRN_PTR = t456.RKEY'+#13+
          'INNER JOIN data0132 t132 ON t210.DEBIT_MEMO_PTR = t132.RKEY'+#13+
//          'WHERE t22.GLPTR_STATUS=0 AND t210.type = 0'+#13+
          'WHERE t210.GLPTR_STATUS=0 AND t210.type = 0'+#13+
          'AND t210.DEBIT_MEMO_PTR ='+form_misctooliv.ads112rkey.AsString+#13;
         if rkey_list1<>'' then sql.Text:=sql.Text+'AND t22.RKEY not in'+rkey_list1;
         sql.Text:=sql.Text+#13+'UNION'+#13+
          'SELECT t210.RKEY,t235.goods_name as INV_PART_NUMBER,t235.goods_guige as INV_PART_DESCRIPTION,'+#13+
          't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
//          't2.UNIT_NAME,t235.unit_price as tax_price,t235.state_tax as TAX_2,(-1)*t235.QUAN_RECD as QUANTITY,'+#13+
//          'ROUND((-1)*t235.QUAN_RECD*t235.unit_price,2) AS amount,'+#13+
//          'ROUND((-1)*(t235.QUAN_RECD*t235.unit_price*t235.state_tax * 0.01)/(1+t235.state_tax*0.01),2) AS tax_amount, ''1'' AS vType'+#13+
          't2.UNIT_NAME,t235.unit_price as tax_price,t235.state_tax as TAX_2,(-1)*t210.QUANTITY as QUANTITY,'+#13+
          'ROUND((-1)*t210.QUANTITY*t235.unit_price,2) AS amount,'+#13+
          'ROUND((-1)*(t210.QUANTITY*t235.unit_price*t235.state_tax*0.01)/(1+t235.state_tax*0.01),2) AS tax_amount, ''1'' AS vType'+#13+
          'FROM data0210 t210'+#13+
          'INNER JOIN data0235 t235 ON t210.D0235_PTR = t235.RKEY'+#13+
          'INNER JOIN data0002 t2 ON t235.unit_ptr = t2.RKEY'+#13+
          'INNER JOIN data0456 t456 ON t235.GRN_PTR = t456.RKEY'+#13+
          'INNER JOIN data0132 t132 ON t210.DEBIT_MEMO_PTR = t132.RKEY'+#13+
//          'WHERE t235.GLPTR_STATUS = 0 AND t210.type = 1'+#13+
          'WHERE t210.GLPTR_STATUS=0 AND t210.type = 1'+#13+
          'AND t210.DEBIT_MEMO_PTR ='+form_misctooliv.ads112rkey.AsString+#13;
         if rkey235_list1<>'' then
          sql.Text:=sql.Text+'AND t235.rkey not in'+rkey235_list1+#13+
           'order by t456.GRN_NUMBER'
         else
          sql.Text:=sql.Text+' order by t456.GRN_NUMBER';
         Prepared;
         open;
         while not eof do
          begin
            stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_NUMBER').AsString; //材料编码
            stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('INV_PART_DESCRIPTION').AsString; //规格
            stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('GRN_NUMBER').AsString; //入库单号
            stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('DELIVER_NUMBER').AsString; //送货单号
            stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('ship_DATE').AsString; //  入库日期
            stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString; //   数量
            stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('UNIT_NAME').AsString; // 单位
            stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('tax_price').AsString; //'价格';
            stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('amount').AsString; //  金额
            stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;   // 税率
            stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('tax_amount').AsString;  // 税金
            stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;     //210.rkey
            stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('vType').AsString;     //编码材料退货or杂项物料退货
            stringgrid2.Cells[13,stringgrid2.RowCount-1]:='1';     //按退货备忘
            stringgrid2.RowCount:=stringgrid2.RowCount+1;
            ship_amout:=ship_amout+fieldbyname('amount').AsFloat-fieldbyname('tax_amount').AsFloat;
            tax_amount:=tax_amount+fieldbyname('tax_amount').AsFloat;
            next;
          end;
        end;
     end;
    end;
//    edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//    edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//    edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
    edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
    edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
    edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    change_bitbtn;
  end;
finally
 form_misctooliv.Free;
end;
end;

procedure TForm_ysdetail.N13Click(Sender: TObject);
var
 i:integer;
 ship_amout:Double;
begin
  ship_amout:=strtofloat(stringgrid2.Cells[8,stringgrid2.Row])-
                                     strtofloat(stringgrid2.Cells[10,stringgrid2.Row]);
  edit6.Text:=formatfloat('0.00',strtocurr(edit6.Text) - ship_amout);
  edit7.Text:=formatfloat('0.00',strtocurr(edit7.Text) - strtofloat(stringgrid2.Cells[10,stringgrid2.Row]));
  edit9.Text:=formatfloat('0.00',strtocurr(edit9.Text)-strtofloat(stringgrid2.Cells[8,stringgrid2.Row]));
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 change_bitbtn;
end;

procedure TForm_ysdetail.N12Click(Sender: TObject);
var
 i:integer;
 ship_amout,tax_amount:Double;
 rkey22_list,rkey22_list1:string;
begin
if edit1.Text='' then
 showmsg('请先输入供应商代码',1)
else
try
  form_assign:= tform_assign.Create(application);
  rkey22_list:= return_vifrkey(stringgrid2,11,0,0);
  rkey22_list1:= return_vifrkey(stringgrid2,11,0,1);
  with  form_assign.ads64 do
   begin
    close;
    CommandText:=CommandText+' and (data0107.SUPP_PTR='+inttostr(edit1.Tag)+')'+
               ' and (data0107.CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if rkey22_list<>'' then
      CommandText:=CommandText+' and data0022.rkey not in'+rkey22_list;

    CommandText:=CommandText+#13+'UNION'+#13+
                  'SELECT t210.RKEY,t17.INV_PART_NUMBER,t17.INV_PART_DESCRIPTION,'+#13+
                  't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
//                  't2.UNIT_NAME,t22.tax_price,t22.TAX_2,(-1)*t22.QUANTITY as QUANTITY,'+#13+
//                  'ROUND((-1)*t22.QUANTITY*t22.tax_price,2) AS amount,'+#13+
//                  'ROUND((-1)*(t22.QUANTITY*t22.tax_price*t22.TAX_2*0.01)/(1+t22.TAX_2*0.01),2) AS tax_amount,'+#13+
                  't2.UNIT_NAME,t22.tax_price,t22.TAX_2,(-1)*t210.QUANTITY as QUANTITY,'+#13+
                  'ROUND((-1)*t210.QUANTITY*t22.tax_price,2) AS amount,'+#13+
                  'ROUND((-1)*(t210.QUANTITY*t22.tax_price*t22.TAX_2*0.01)/(1+t22.TAX_2*0.01),2) AS tax_amount,'+#13+
                  't22.cust_decl,t132.MEMO_NUMBER AS INVOICE_NO,''1'' AS sType'+#13+
                  'FROM data0210 t210'+#13+
                  'INNER JOIN data0022 t22 ON t210.D0022_PTR = t22.RKEY'+#13+
                  'INNER JOIN data0017 t17 ON t22.INVENTORY_PTR = t17.RKEY'+#13+
                  'INNER JOIN data0002 t2 ON t22.LOCATION_PTR_FROM = t2.RKEY'+#13+
                  'INNER JOIN data0456 t456 ON t22.GRN_PTR = t456.RKEY'+#13+
                  'INNER JOIN data0132 t132 ON t210.DEBIT_MEMO_PTR = t132.RKEY'+#13+
                  'WHERE (t132.memo_status = 1) AND (t210.GLPTR_STATUS = 0)'+#13+
                  'AND (t132.GLPTR_STATUS = 0) AND (t210.type = 0)'+#13+'AND (t132.SUPP_PTR = '+inttostr(edit1.Tag)+') '+
                  'AND (t132.CURRENCY_PTR = '+inttostr(edit5.Tag)+')';
    if rkey22_list1<>'' then
      CommandText:=CommandText+' and t210.rkey not in'+rkey22_list1;
    Prepared;
    open;
   end;

  if form_assign.ShowModal=mrok then
  begin
    ship_amout:=0;
    tax_amount:=0;
   for i:=1 to form_assign.DBGrid1.SelectedRows.Count do
    begin
     form_assign.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_assign.dbgrid1.SelectedRows.Items[i-1];

      stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('INV_PART_NUMBER').AsString; //材料编码
      stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('INV_PART_DESCRIPTION').AsString; //规格
      stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('GRN_NUMBER').AsString; //入库单号
      stringgrid2.Cells[3,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('DELIVER_NUMBER').AsString; //送货单号
      stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('ship_DATE').AsString; //  入库日期
      stringgrid2.Cells[5,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('QUANTITY').AsString; //   数量
      stringgrid2.Cells[6,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('UNIT_NAME').AsString; // 单位
      stringgrid2.Cells[7,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('tax_price').AsString; //'价格';
      stringgrid2.Cells[8,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('amount').AsString; //  金额
      stringgrid2.Cells[9,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('TAX_2').AsString;   // 税率
      stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('tax_amount').AsString;  // 税金
      stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('rkey').AsString;     //22.rkey
      stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';     //编码材料
      stringgrid2.Cells[13,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('sType').AsString;
      
      ship_amout:=ship_amout+form_assign.ads64.fieldbyname('amount').AsFloat-
          form_assign.ads64.fieldbyname('tax_amount').AsFloat;
      tax_amount:=tax_amount+form_assign.ads64.fieldbyname('tax_amount').AsFloat;

     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;

//    edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//    edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//    edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
    edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
    edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
    edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    change_bitbtn;
  end;
finally
 form_assign.Free;
end;
end;

procedure TForm_ysdetail.BitBtn1Enter(Sender: TObject);
begin
 if sgrid1.RowCount<=2 then
  begin
    messagedlg('科目没有借贷明细!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=2;
    PageControl1Change(sender);
    sgrid1.SetFocus;
    exit;
  end;

  if strtocurr(RemoveInvalid(statictext1.Caption))<>
     strtocurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=2;
    sgrid1.SetFocus;
    exit;
   end;

  if not dm.Aqd508.Active then dm.Aqd508.Open;

  if (strtoint(Edit13.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit13.Text) <= dm.Aqd508CURR_FYEAR.Value) and
      (strtoint(Edit14.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
   end;

  if (strtoint(Edit14.Text) <> monthof(strtodate(edit11.text))) or
     (strtoint(Edit13.Text) <> yearof(strtodate(edit11.text))) then
   begin
    messagedlg('凭证年度不等于凭证日期限的会计年度请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
   end;
 
end;

procedure TForm_ysdetail.BitBtn1Click(Sender: TObject);
var
 i:integer;
 number:string;
begin

 if (strtocurr(formatfloat('0.00',strtocurr(edit7.text)*strtofloat(edit2.Text)))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
  if messagedlg('科目借方金额与发票发生额不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
   begin
    exit;
   end;
 if (strtocurr(formatfloat('0.00',strtocurr(edit7.text)*strtofloat(edit2.Text)))<>
    strtocurr(edit17.Text)) then
  if messagedlg('发票明细的税金与税票税金,不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
   begin
    exit;
   end;

if self.State=1 then      //新增
 begin
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=self.get_voucher(strtodate(edit11.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;
  if self.find_error(number,0) then
   begin
    messagedlg('保存时遇到错误,多人操作了同一数据标识号:'+number,mterror,[mbcancel],0);
    exit;
   end;
  try
   dm.ADOConnection1.BeginTrans;
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=0;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit8.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=edit10.Text;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=12;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);              //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);               //会计期间
     dm.ADO105SUPP_PTR.Value:=edit1.Tag;                      //供应商
     dm.ADO105CURRENCY_PTR.Value:=edit5.Tag;
     dm.ADO105EXCHANGE_RATE.AsString:=edit2.Text;
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
    dm.ado106REF_NUMBER.Value:=edit10.Text;
    dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
    dm.ADO106PRICE.AsString:=sgrid1.Cells[4,i];  //原币
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
 //=================================================
   number:=return_rkey(stringgrid1,7,8,0);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0107'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
 //=================================================
   number:=return_rkey(stringgrid1,7,8,1);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0132'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
 //=================================================
   number:=return_rkey(stringgrid3,10);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0127'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
 //=================================================
   number:=return_vifrkey(stringgrid2,11,0,0); //编码物料
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0022'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '        dbo.data0456 ON dbo.Data0022.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE   (dbo.Data0022.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)'+#13+
     ' and rkey not in(SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '                      dbo.data0456 ON dbo.Data0022.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE     (dbo.Data0022.GLPTR_STATUS = 0) AND (dbo.data0456.dealiv_ptr IN'+#13+
     '  (SELECT     data0456_1.dealiv_ptr'+#13+
     '   FROM          dbo.Data0022 AS Data0022_1 INNER JOIN'+#13+
     '   dbo.data0456 AS data0456_1 ON Data0022_1.GRN_PTR = data0456_1.rkey'+#13+
     '   WHERE      (Data0022_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0456_1.dealiv_ptr))'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)';
     ExecSQL;
    end;
   end;
 //=================================================
   number:=return_vifrkey(stringgrid2,11,0,1); //编码物料(退货备忘)
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0210'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '        dbo.data0210 ON dbo.Data0022.RKEY = dbo.data0210.D0022_PTR'+#13+
     'WHERE  (dbo.data0210.type=0) AND (dbo.data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)'+#13+
     ' and rkey not in(SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '                      dbo.data0210 ON dbo.Data0022.RKEY = dbo.data0210.D0022_PTR'+#13+
     'WHERE (dbo.data0210.type=0) AND (dbo.Data0210.GLPTR_STATUS = 0) AND (dbo.data0210.DEBIT_MEMO_PTR IN'+#13+
     '  (SELECT     data0210_1.DEBIT_MEMO_PTR'+#13+
     '   FROM          dbo.Data0022 AS Data0022_1 INNER JOIN'+#13+
     '   dbo.data0210 AS data0210_1 ON Data0022_1.RKEY = data0210_1.D0022_PTR'+#13+
     '   WHERE (data0210_1.type=0) AND (data0210_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0210_1.DEBIT_MEMO_PTR))'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
   end;

 //=================================================
   number:=return_vifrkey(stringgrid2,11,1,0); //杂项物料
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0235'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.data0235 INNER JOIN'+#13+
     '        dbo.data0456 ON dbo.data0235.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE   (dbo.data0235.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)'+#13+
     ' and rkey not in(SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM    dbo.data0235 INNER JOIN'+#13+
     '      dbo.data0456 ON dbo.data0235.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE     (dbo.data0235.GLPTR_STATUS = 0) AND (dbo.data0456.dealiv_ptr IN'+#13+
     '  (SELECT     data0456_1.dealiv_ptr'+#13+
     '   FROM          dbo.data0235 AS data0235_1 INNER JOIN'+#13+
     '   dbo.data0456 AS data0456_1 ON data0235_1.GRN_PTR = data0456_1.rkey'+#13+
     '   WHERE  (data0235_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0456_1.dealiv_ptr))'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)';
     ExecSQL;
    end;
   end;

   number:=return_vifrkey(stringgrid2,11,1,1); //杂项物料(退货备忘)
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0210'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.data0235 INNER JOIN'+#13+
     '        dbo.data0210 ON dbo.data0235.RKEY = dbo.data0210.D0235_PTR'+#13+
     'WHERE  (dbo.data0210.type=1) AND (dbo.data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)'+#13+
     ' and rkey not in(SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM    dbo.data0235 INNER JOIN'+#13+
     '      dbo.data0210 ON dbo.data0235.RKEY = dbo.data0210.D0235_PTR'+#13+
     'WHERE  (dbo.data0210.type=1) AND (dbo.data0210.GLPTR_STATUS = 0) AND (dbo.data0210.DEBIT_MEMO_PTR IN'+#13+
     '  (SELECT     data0210_1.DEBIT_MEMO_PTR'+#13+
     '   FROM          dbo.data0235 AS data0235_1 INNER JOIN'+#13+
     '   dbo.data0210 AS data0210_1 ON data0235_1.RKEY = data0210.D0235_PTR'+#13+
     '   WHERE (data0210_1.type=1) AND (data0210_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0210_1.DEBIT_MEMO_PTR))'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
   end;
 //=================================================

   dm.ADOConnection1.CommitTrans;
   if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
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
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

 end
else        //编辑
 begin
  if self.find_error(number,dm.ADS105RKEY.Value) then
   begin
    messagedlg('保存时遇到错误,多人操作了同一数据标识号:'+number,mterror,[mbcancel],0);
    exit;
   end;
  with dm.ado105 do                                        //增加会计凭证总表
   begin
    close;
    dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
    open;
   end;
  if (dm.ADO105STATUS.Value<>0) or (dm.ADO105.IsEmpty) then
   begin
    messagedlg('保存时遇到错误,凭证状态已发生变化!',mterror,[mbcancel],0);
    exit;
   end;

  try
   dm.ADOConnection1.BeginTrans;
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     edit;
     dm.ado105BATCH_NUMBER.Value:=edit10.Text;               //参考发票号
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);       //附件张数
     dm.ADO105EXCHANGE_RATE.AsString:=edit2.Text;            //汇率
     post;                                                  
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    while not dm.ADO106.Eof do  dm.ADO106.Delete;
    for i:=1 to SGrid2.RowCount-2 do
     begin
      dm.ado106.Append;
      dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
      dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
      dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
      dm.ADO106EXCH_RATE.AsString:=
      Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
      dm.ado106REF_NUMBER.Value:=edit10.Text;
      dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
      dm.ADO106PRICE.AsString:=sgrid1.Cells[4,i];  //原币
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
//==================================================================
   with dm.ADOQuery1 do          //杂项费用107
    begin
     close;
     sql.Text:='update data0107'+#13+
              'set glptr_status=0,GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR ='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0132'+#13+
              'set glptr_status=0,GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR ='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
   number:=return_rkey(stringgrid1,7,8,0);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0107'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
   number:=return_rkey(stringgrid1,7,8,1);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0132'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
//==================================================================
   with dm.ADOQuery1 do          //增值税票127
    begin
     close;
     sql.Text:='update data0127'+#13+
              'set glptr_status=0,GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR ='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;

   number:=return_rkey(stringgrid3,10);
   if number<> '' then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0127'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
//==================================================================
    with dm.ADOQuery1 do        //编码
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=0'+#13+      //更新帐龄为未开票
     'where rkey in (SELECT  data0456.dealiv_ptr'+#13+
     'FROM     Data0022 INNER JOIN'+#13+
     '    data0456 ON Data0022.grn_ptr = dbo.data0456.rkey'+#13+
     'WHERE   (Data0022.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0456.dealiv_ptr)';
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=0'+#13+      //更新帐龄为未开票
     'where rkey in (SELECT data0210.DEBIT_MEMO_PTR'+#13+
     'FROM     Data0022 INNER JOIN'+#13+
     '    data0210 ON Data0022.RKEY = dbo.data0210.D0022_PTR'+#13+
     'WHERE (data0210.type=0) and (data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0022'+#13+
              'set glptr_status=0 , GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0210'+#13+
              'set glptr_status=0 , GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
//==================================================================
    with dm.ADOQuery1 do           //杂项
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=0'+#13+      //更新帐龄为未开票
     'where rkey in (SELECT  data0456.dealiv_ptr'+#13+
     'FROM     Data0235 INNER JOIN'+#13+
     '    data0456 ON Data0235.grn_ptr = dbo.data0456.rkey'+#13+
     'WHERE   (Data0235.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0456.dealiv_ptr)';
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=0'+#13+      //更新帐龄为未开票
     'where rkey in (SELECT  data0210.DEBIT_MEMO_PTR'+#13+
     'FROM     Data0235 INNER JOIN'+#13+
     '    data0210 ON Data0235.RKEY = dbo.data0210.D0235_PTR'+#13+
     'WHERE (data0210.type=1) and (data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update Data0235'+#13+
              'set glptr_status=0 , GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update Data0210'+#13+
              'set glptr_status=0 , GL_HEADER_PTR=null'+#13+
              'where GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
//==================================================================
   number:=return_vifrkey(stringgrid2,11,0,0);
   if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0022'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '        dbo.data0456 ON dbo.Data0022.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE   (dbo.Data0022.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)'+#13+
     ' and rkey not in(SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '                      dbo.data0456 ON dbo.Data0022.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE     (dbo.Data0022.GLPTR_STATUS = 0) AND (dbo.data0456.dealiv_ptr IN'+#13+
     '  (SELECT     data0456_1.dealiv_ptr'+#13+
     '   FROM          dbo.Data0022 AS Data0022_1 INNER JOIN'+#13+
     '   dbo.data0456 AS data0456_1 ON Data0022_1.GRN_PTR = data0456_1.rkey'+#13+
     '   WHERE      (Data0022_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0456_1.dealiv_ptr))'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)';
     ExecSQL;
    end;
   end;
 //=================================================
   number:=return_vifrkey(stringgrid2,11,0,1);
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0210'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '        dbo.data0210 ON dbo.Data0022.RKEY = dbo.data0210.D0022_PTR'+#13+
     'WHERE  (dbo.data0210.type=0) AND (dbo.data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)'+#13+
     ' and rkey not in(SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.Data0022 INNER JOIN'+#13+
     '                      dbo.data0210 ON dbo.Data0022.RKEY = dbo.data0210.D0022_PTR'+#13+
     'WHERE (dbo.data0210.type=0) AND (dbo.data0210.GLPTR_STATUS = 0) AND (dbo.data0210.DEBIT_MEMO_PTR IN'+#13+
     '  (SELECT     data0210_1.DEBIT_MEMO_PTR'+#13+
     '   FROM          dbo.Data0022 AS Data0022_1 INNER JOIN'+#13+
     '   dbo.data0210 AS data0210_1 ON Data0022_1.RKEY = data0210_1.D0022_PTR'+#13+
     '   WHERE (data0210_1.type=0) AND (data0210_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0210_1.DEBIT_MEMO_PTR))'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
   end;
//==================================================================
   number:=return_vifrkey(stringgrid2,11,1,0);
   if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0235'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0107'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM         dbo.data0235 INNER JOIN'+#13+
     '        dbo.data0456 ON dbo.data0235.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE   (dbo.data0235.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)'+#13+
     ' and rkey not in(SELECT  dbo.data0456.dealiv_ptr'+#13+
     'FROM    dbo.data0235 INNER JOIN'+#13+
     '      dbo.data0456 ON dbo.data0235.GRN_PTR = dbo.data0456.rkey'+#13+
     'WHERE     (dbo.data0235.GLPTR_STATUS = 0) AND (dbo.data0456.dealiv_ptr IN'+#13+
     '  (SELECT     data0456_1.dealiv_ptr'+#13+
     '   FROM   dbo.data0235 AS data0235_1 INNER JOIN'+#13+
     '   dbo.data0456 AS data0456_1 ON data0235_1.GRN_PTR = data0456_1.rkey'+#13+
     '   WHERE  (data0235_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0456_1.dealiv_ptr))'+#13+
     'GROUP BY dbo.data0456.dealiv_ptr)';
     ExecSQL;
    end;
   end;
//==================================================================
   number:=return_vifrkey(stringgrid2,11,1,1); //杂项物料(退货备忘)
  if number<> '' then
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0210'+#13+
              'set glptr_status=1 , GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'where rkey in'+number;
     ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0132'+#13+
     'set glptr_status=1'+#13+      //更新帐龄为已开票
     'where rkey in (SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM         dbo.data0235 INNER JOIN'+#13+
     '        dbo.data0210 ON dbo.data0235.RKEY = dbo.data0210.D0235_PTR'+#13+
     'WHERE  (dbo.data0210.type=1) AND (dbo.data0210.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)'+#13+
     ' and rkey not in(SELECT  dbo.data0210.DEBIT_MEMO_PTR'+#13+
     'FROM    dbo.data0235 INNER JOIN'+#13+
     '      dbo.data0210 ON dbo.data0235.RKEY = dbo.data0210.D0235_PTR'+#13+
     'WHERE  (dbo.data0210.type=1) AND (dbo.data0210.GLPTR_STATUS = 0) AND (dbo.data0210.DEBIT_MEMO_PTR IN'+#13+
     '  (SELECT     data0210_1.DEBIT_MEMO_PTR'+#13+
     '   FROM          dbo.data0235 AS data0235_1 INNER JOIN'+#13+
     '   dbo.data0210 AS data0210_1 ON data0235_1.RKEY = data0210.D0235_PTR'+#13+
     '   WHERE (data0210_1.type=1) AND (data0210_1.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     '   GROUP BY data0210_1.DEBIT_MEMO_PTR))'+#13+
     'GROUP BY dbo.data0210.DEBIT_MEMO_PTR)';
     ExecSQL;
    end;
   end;
//==================================================================
   dm.ADOConnection1.CommitTrans;
   if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
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

procedure TForm_ysdetail.change_bitbtn;
begin
if (stringgrid1.RowCount > 2) or (stringgrid2.RowCount > 2)
    or (stringgrid3.RowCount > 2) then
 begin
  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;
 end;

 if (stringgrid1.RowCount = 2) and (stringgrid2.RowCount = 2)
    and (stringgrid3.RowCount = 2) then
 begin
  bitbtn6.Enabled:=true;
  bitbtn4.Enabled:=true;
 end;
end;

procedure TForm_ysdetail.PopupMenu2Popup(Sender: TObject);
begin
if stringgrid2.Row= stringgrid2.RowCount-1 then
 n13.Enabled:=false
else
 n13.Enabled:=true;
end;

procedure TForm_ysdetail.N14Click(Sender: TObject);
var
 i:integer;
 ship_amout,tax_amount:Double;
 rkey235_list,rkey235_list1:string;
begin
if edit1.Text='' then
 showmsg('请先输入供应商代码',1)
else
try
  Form_miscmatil:= tForm_miscmatil.Create(application);
  rkey235_list:= return_vifrkey(stringgrid2,11,1,0);
  rkey235_list1:= return_vifrkey(stringgrid2,11,1,1);
  with  Form_miscmatil.ads235 do
   begin
    close;
    CommandText:=CommandText+' and (data0107.SUPP_PTR='+inttostr(edit1.Tag)+')'+
               ' and (data0107.CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if rkey235_list<>'' then
      CommandText:=CommandText+' and data0235.rkey not in'+rkey235_list;

    CommandText:=CommandText+#13+'UNION'+#13+
                  'SELECT t210.RKEY,t235.goods_name,t235.goods_guige,'+#13+
                  't456.GRN_NUMBER,t456.DELIVER_NUMBER,t456.ship_DATE,'+#13+
//                  '(-1)*t235.QUAN_RECD AS QUAN_RECD,t2.UNIT_NAME,t235.unit_price,t235.state_tax,'+#13+
//                  'ROUND((-1)*t235.QUAN_RECD*t235.unit_price,2) AS amount,'+#13+
//                  'ROUND((-1)*(t235.QUAN_RECD*t235.unit_price*t235.state_tax * 0.01)/(1+t235.state_tax*0.01),2) AS tax_amount,'+#13+
                  '(-1)*t210.QUANTITY AS QUAN_RECD,t2.UNIT_NAME,t235.unit_price,t235.state_tax,'+#13+
                  'ROUND((-1)*t210.QUANTITY*t235.unit_price,2) AS amount,'+#13+
                  'ROUND((-1)*(t210.QUANTITY*t235.unit_price*t235.state_tax*0.01)/(1+t235.state_tax*0.01),2) AS tax_amount,'+#13+
                  't132.MEMO_NUMBER AS INVOICE_NO,t235.goods_type,''1'' AS sType'+#13+
                  'FROM data0210 t210'+#13+
                  'INNER JOIN data0235 t235 ON t210.D0235_PTR = t235.RKEY'+#13+
                  'INNER JOIN data0002 t2 ON t235.unit_ptr = t2.RKEY'+#13+
                  'INNER JOIN data0456 t456 ON t235.GRN_PTR = t456.RKEY'+#13+
                  'INNER JOIN data0132 t132 ON t210.DEBIT_MEMO_PTR = t132.RKEY'+#13+
                  'WHERE (t132.memo_status = 1) AND (t210.GLPTR_STATUS = 0)'+#13+
                  'AND (t132.GLPTR_STATUS = 0) AND (t210.type = 1)'+#13+'and (t132.SUPP_PTR='+inttostr(edit1.Tag)+') '+
                  'AND (t132.CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if rkey235_list1<>'' then
      CommandText:=CommandText+' and t210.rkey not in'+rkey235_list1;
    Prepared;
    open;
   end;

  if Form_miscmatil.ShowModal=mrok then
   begin
    ship_amout:=0;
    tax_amount:=0;
   for i:=1 to Form_miscmatil.DBGrid1.SelectedRows.Count do
    begin
     Form_miscmatil.dbgrid1.DataSource.DataSet.Bookmark :=
                         Form_miscmatil.dbgrid1.SelectedRows.Items[i-1];
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('goods_name').AsString; //材料编码
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('goods_guige').AsString; //规格
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('GRN_NUMBER').AsString; //入库单号
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('DELIVER_NUMBER').AsString; //送货单号
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('ship_DATE').AsString; //  入库日期
     stringgrid2.Cells[5,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('QUAN_RECD').AsString; //   数量
     stringgrid2.Cells[6,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('UNIT_NAME').AsString; // 单位
     stringgrid2.Cells[7,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('unit_price').AsString; //'价格';
     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('amount').AsString; //  金额
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('state_tax').AsString;   // 税率
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('tax_amount').AsString;  // 税金
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('rkey').AsString;     //235.rkey
     stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';     //杂项材料
     stringgrid2.Cells[13,stringgrid2.RowCount-1]:=Form_miscmatil.ads235.fieldbyname('sType').AsString;
     
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
     ship_amout:=ship_amout+Form_miscmatil.ads235.fieldbyname('amount').AsFloat-
              Form_miscmatil.ads235.fieldbyname('tax_amount').AsFloat;
     tax_amount:=tax_amount+Form_miscmatil.ads235.fieldbyname('tax_amount').AsFloat;
    end;

//    edit6.Text:=currtostr(strtocurr(edit6.Text)+ExRoundTo(ship_amout,2));
//    edit7.Text:=currtostr(strtocurr(edit7.Text)+ExRoundTo(tax_amount,2));
//    edit9.Text:=currtostr(strtocurr(edit9.Text)+ExRoundTo(ship_amout,2)+ExRoundTo(tax_amount,2));
    edit6.Text:=currtostr(strtocurr(edit6.Text)+ship_amout);
    edit7.Text:=currtostr(strtocurr(edit7.Text)+tax_amount);
    edit9.Text:=currtostr(strtocurr(edit9.Text)+ship_amout+tax_amount);
    change_bitbtn;
   end;
finally
 Form_miscmatil.Free;
end;
end;

procedure TForm_ysdetail.N15Click(Sender: TObject);
var
 i:integer;
begin
if edit1.Text='' then
 showmsg('请先输入供应商代码',1)
else
try
  form_taxlist:= tform_taxlist.Create(application);
  with  form_taxlist.ads127 do
   begin
    close;
    CommandText:=CommandText+' and (SUPP_PTR='+inttostr(edit1.Tag)+')';
    if stringgrid3.RowCount>2 then
     begin
      CommandText:=CommandText+' and rkey not in'+self.return_rkey(stringgrid3,10);
     end;
    Prepared;
    open;
   end;

  if form_taxlist.ShowModal=mrok then
  begin
   for i:=1 to form_taxlist.DBGrid1.SelectedRows.Count do
    begin
     form_taxlist.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_taxlist.dbgrid1.SelectedRows.Items[i-1];
      stringgrid3.Cells[0,stringgrid3.RowCount-1]:=form_taxlist.ads127invoice_number.Value;  //'发票编码';
      stringgrid3.Cells[1,stringgrid3.RowCount-1]:=form_taxlist.ads127invoice_no.Value;      //'发票号码';
      stringgrid3.Cells[2,stringgrid3.RowCount-1]:=form_taxlist.ads127invoice_date.AsString; //'发票日期';
      stringgrid3.Cells[3,stringgrid3.RowCount-1]:=form_taxlist.ads127matl_year.AsString;    //'货款年度';
      stringgrid3.Cells[4,stringgrid3.RowCount-1]:=form_taxlist.ads127matl_month.AsString;   //'货款月份';
      stringgrid3.Cells[5,stringgrid3.RowCount-1]:=form_taxlist.ads127MATL_amount.AsString;  //'不含税金额';
      stringgrid3.Cells[6,stringgrid3.RowCount-1]:=form_taxlist.ads127tax.AsString;          //'税率%';
      stringgrid3.Cells[7,stringgrid3.RowCount-1]:=form_taxlist.ads127tax_amount.AsString;   //'税金';
      stringgrid3.Cells[8,stringgrid3.RowCount-1]:=form_taxlist.ads127INV_TOTAL.AsString;    //'总计金额';
      stringgrid3.Cells[9,stringgrid3.RowCount-1]:=form_taxlist.ads127remark.AsString;       //'备注';
      stringgrid3.Cells[10,stringgrid3.RowCount-1]:=form_taxlist.ads127rkey.AsString;        //'rkey127';

      edit16.Text:= currtostr(strtocurr(edit16.Text)+form_taxlist.ads127MATL_amount.Value);
      edit17.Text:= currtostr(strtocurr(edit17.Text)+form_taxlist.ads127tax_amount.Value);
      edit18.Text:= currtostr(strtocurr(edit18.Text)+form_taxlist.ads127INV_TOTAL.Value);
      stringgrid3.RowCount:=stringgrid3.RowCount+1;
    end;
   change_bitbtn;
  end;
finally
 form_taxlist.Free;
end;
end;

procedure TForm_ysdetail.N16Click(Sender: TObject);
var
 i:integer;
begin
edit16.Text:=
    currtostr(strtocurr(edit16.Text)-strtocurr(stringgrid3.Cells[5,stringgrid3.Row]));

  edit17.Text:=
     currtostr(strtocurr(edit17.Text)-strtocurr(stringgrid3.Cells[7,stringgrid3.Row]));
  edit18.Text:=
     currtostr(strtocurr(edit18.Text)-strtocurr(stringgrid3.Cells[8,stringgrid3.Row]));

 for i:=stringgrid3.Row to stringgrid3.RowCount-2 do
  stringgrid3.Rows[i].Text:=stringgrid3.Rows[i+1].Text;
 stringgrid3.RowCount:=stringgrid3.RowCount-1;
 change_bitbtn;
end;

procedure TForm_ysdetail.BitBtn2Click(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid3,'税票明细');
end;

function TForm_ysdetail.return_rkey(sgrid: tstringgrid; col,col1: integer;
  sType: byte): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
  if sgrid.RowCount>2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if i < sgrid.RowCount-2 then
      begin
        if sgrid.Cols[col1].Strings[i]=inttostr(sType) then
          rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+','
      end
      else
      begin
        if sgrid.Cols[col1].Strings[i]=inttostr(sType) then
          rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+')'
        else
          rkey_list:=copy(rkey_list,1,length(rkey_list)-1)+')';
      end;
      if rkey_list = ')' then rkey_list:='(-1)';
     result:= rkey_list;
   end;
end;

procedure TForm_ysdetail.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if StringGrid1.Cells[8,ARow]='1' then
  begin
    StringGrid1.Canvas.Brush.Color := clRed;
    StringGrid1.Canvas.FillRect(Rect);
    StringGrid1.Canvas.textout(Rect.left+1,Rect.Top,StringGrid1.cells[ACol,ARow]);
  end;
end;

procedure TForm_ysdetail.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if StringGrid2.Cells[13,ARow]='1' then
  begin
    StringGrid2.Canvas.Brush.Color := clRed;
    StringGrid2.Canvas.FillRect(Rect);
    StringGrid2.Canvas.textout(Rect.left+1,Rect.Top,StringGrid2.cells[ACol,ARow]);
  end;
end;

function TForm_ysdetail.return_vifrkey(sgrid: tstringgrid; col: integer;
  v_if, sType: byte): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
  if sgrid.RowCount>2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if ((strtoint(sgrid.Cells[12,i])=v_if) and (strtoint(sgrid.Cells[13,i])=sType)) then
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
     if length(rkey_list)>1 then
      result:= copy(rkey_list,1,length(rkey_list)-1)+')'
     else
      result:='';
   end;
end;

function TForm_ysdetail.ExportStrGridToExcel(Args: array of const): Boolean;
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  I: Integer;
begin
  Result := False;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    with TStringGrid(Args[I].VObject) do
    begin 
      XLApp.WorkBooks[1].WorkSheets[I+1].Name := Name;
      Sheet := XLApp.Workbooks[1].WorkSheets[Name];

      for jCount := 0 to RowCount - 1 do
      begin
        for iCount := 0 to ColCount - 1 do
        begin
          Sheet.Cells[jCount + 1, iCount + 1] := Cells[iCount, jCount];
        end;
      end;
    end;
  end;
  XlApp.Visible := True;  
end;

procedure TForm_ysdetail.Excel1Click(Sender: TObject);
begin
  ExportStrGridToExcel([StringGrid2]);
end;

function TForm_ysdetail.GetMaxTaxMonthExpr(sgrid:tstringgrid): String;
var
  MaxDate:TDateTime;
  i:Integer;
begin
  MaxDate:=date-10000;
  if sgrid.RowCount>2 then
  begin
    for i:=1 to sgrid.RowCount-2 do
      if sgrid.Cells[4,i]<>'' then
      begin
        if MaxDate < StrToDatetime(sgrid.Cells[4,i]) then
          MaxDate:=StrToDatetime(sgrid.Cells[4,i]);
      end;
  end;
  Result:=FormatDateTime('yymm', MaxDate)+'月';
end;

end.
