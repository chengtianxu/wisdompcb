unit ysdetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBCtrls,
  Mask, Menus,DateUtils,DB, ADODB,Excel2000,OleServer,ComObj;

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
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label26: TLabel;
    Edit12: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    Label25: TLabel;
    Panel2: TPanel;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Panel3: TPanel;
    dtpk1: TDateTimePicker;
    N14: TMenuItem;
    Panel4: TPanel;
    dtpk2: TDateTimePicker;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit5: TEdit;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    CheckBox2: TCheckBox;
    EXCEL1: TMenuItem;
    EXCEL2: TMenuItem;
    N15: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu4: TPopupMenu;
    EXCEL3: TMenuItem;
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
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure dtpk1Change(Sender: TObject);
    procedure dtpk1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N14Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure dtpk2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpk2Change(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1Exit(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
  private
    { Private declarations }
    acc_ptr,newrow,newcol,newrow_1,newcol_1:integer;
    abbrname:string;

    function get_voucher(invoice_date: tdatetime): string;
    procedure re_calculate;
    procedure re_calculate_qty;
    function RemoveInvalid(where: string): string;
    function get_col5(row: integer): currency;
    function get_col6(row: integer): currency;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function find_employee(rkey:integer):string;
    procedure open_glcnumber(rkey103,dflt_acctptr:integer);
    function vo_number(number: string): boolean;
    function return_vifrkey(sgrid: tstringgrid;pd_col,col: integer;v_if:byte): string;
    function find_excelerror(rkey,v_type,qty,rowNo:Integer):Boolean;
    procedure change_bitbtn();
    procedure update_64_98(rkey105:integer);
    procedure update_sgrid1();
    procedure get_price_diff();
    procedure append_invoice_dedit(rkey105:integer);
    procedure append_ship_rma(rkey105:integer);
    procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
    procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);
    function CheckExcelLoadUnique(rkey,iType,rowno:integer):boolean;//验证Excel导入是否有重复的记录
  public
    { Public declarations }
    State:byte;     //1:新增,2:编辑,3:检查
  end;

var
  Form_ysdetail: TForm_ysdetail;

implementation

uses damo,Pick_Item_Single ,ConstVar,common,  misctooliv,
  AcctSearch, curr_search, voucher_dictionary, ASSIGN, voucher_report, rma,
  Math;

{$R *.dfm}
procedure TForm_ysdetail.GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
const
 TheSeparator = '@'; // Define the Separator
var
 CountItem, I, J, K, ThePosition : Integer;
 MyList : TStringList;
 MyString, TempString : String;
begin
 CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-2 do
  begin
    GenStrGrid.Cells[ThatCol,i] := StringofChar('0',3-Length(GenStrGrid.Cells[ThatCol,i]))+GenStrGrid.Cells[ThatCol,i];
  end;
 MyList := TStringList.Create; //Create the List
 MyList.Sorted := False;
 try
  begin
   for I := 1 to (CountItem - 2) do
    MyList.Add(GenStrGrid.Rows[I].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[I].Text);
   Mylist.Sort;//Sort the List
   for K := 1 to Mylist.Count do
    begin
     MyString := MyList.Strings[(K - 1)];//Take the String of the line (K ? 1)
     ThePosition := Pos(TheSeparator, MyString);//Find the position of the Separator in the String
     TempString := '';
     {Eliminate the Text of the column on which we have sorted the StringGrid}
     TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
     MyList.Strings[(K - 1)] := '';
     MyList.Strings[(K - 1)] := TempString;
    end;
   for J := 1 to (CountItem - 2) do
    GenStrGrid.Rows[J].Text := MyList.Strings[(J - 1)];//Refill the StringGrid
  end;
 finally
  MyList.Free;//Free the List
 end; 
  CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-2 do
  begin
    GenStrGrid.Cells[ThatCol,i] := inttostr(strtoint(GenStrGrid.Cells[ThatCol,i]));
  end;
end;

function TForm_ysdetail.return_vifrkey(sgrid: tstringgrid;
  pd_col,col: integer;v_if:byte): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
if sgrid.RowCount > 2 then
 begin
   rkey_list:='(';
   for i:=1 to sgrid.RowCount-2 do
    if strtoint(sgrid.Cells[pd_col,i])=v_if then
     rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
   if length(rkey_list) > 1 then
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


procedure TForm_ysdetail.FormActivate(Sender: TObject);
var
 i:integer;
// ship_amout,tax_amount:Single;
begin
StringGrid1.Cells[0,0]:='入帐编号';
StringGrid1.Cells[1,0]:='类型';
StringGrid1.Cells[2,0]:='帐龄日期';
StringGrid1.Cells[3,0]:='工具费用';
StringGrid1.Cells[4,0]:='杂项费用';
StringGrid1.Cells[5,0]:='增值税';
StringGrid1.Cells[6,0]:='发票金额';

StringGrid1.Cells[7,0]:='标识列';
StringGrid1.Cells[8,0]:='发票或退货';
stringgrid1.ColWidths[8]:=-1;
StringGrid1.Cells[9,0]:='可用金额';
StringGrid1.Cells[10,0]:='开票金额';
stringgrid1.Cells[11,0]:='税票日期';
stringgrid1.Cells[12,0]:='税票号';
stringgrid1.Cells[13,0]:='发票日期';
stringgrid1.Cells[14,0]:='工厂简称';

stringgrid1.Cells[9,stringgrid1.RowCount-1]:='合计:';
stringgrid1.Cells[10,stringgrid1.RowCount-1]:='0';

stringgrid2.Cells[0,0]:='销售订单';
stringgrid2.Cells[1,0]:='本厂编号';
stringgrid2.Cells[2,0]:='客户型号';
stringgrid2.Cells[3,0]:='客户订单号';
stringgrid2.Cells[4,0]:='装箱单号';
stringgrid2.Cells[5,0]:='出货日期';
stringgrid2.Cells[6,0]:='可用数量';
stringgrid2.Cells[7,0]:='开票数量';
stringgrid2.Cells[8,0]:='税票日期';
stringgrid2.Cells[9,0]:='税票号';
stringgrid2.Cells[10,0]:='开票价格';
stringgrid2.Cells[11,0]:='税率%';
StringGrid2.Cells[12,0]:='标识列';
StringGrid2.Cells[13,0]:='批次';
StringGrid2.Cells[14,0]:='报关单号';
StringGrid2.Cells[15,0]:='出或退';
stringgrid2.ColWidths[15]:=-1;
stringgrid2.Cells[16,0]:='销售价格';
stringgrid2.Cells[17,0]:='含税金额';
stringgrid2.Cells[18,0]:='工厂简称';
stringgrid2.Cells[19,0]:='关联原客户';

StringGrid2.Cells[9,stringgrid2.RowCount-1]:='价差:';
StringGrid2.Cells[10,stringgrid2.RowCount-1]:='0';

sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';
self.PageControl1.ActivePageIndex:=0;

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
    stringgrid2.PopupMenu:=Self.PopupMenu4;
    toolbar1.Enabled:=false;
    sgrid1.PopupMenu:=nil;
    sgrid1.Options:=sgrid1.Options+[goRowselect];
    dtpk1.Enabled:=false;
    CheckBox2.Enabled:=false;
   end;
  edit8.Text:=dm.ADS105VOUCHER.Value;
  edit10.Text:=dm.ADS105BATCH_NUMBER.Value;
  edit11.Text:=dm.ADS105ENTERED_DT.AsString;
  edit13.Text:=dm.ADS105FYEAR.AsString;
  edit14.Text:=dm.ADS105PERIOD.AsString;
  edit1.Text:=dm.ADS105CUST_CODE.Value;
  label19.Caption:=dm.ADS105CUSTOMER_NAME.Value;
  edit5.Text:=dm.ads105curr_code.Value;
  label20.Caption:=dm.ADS105CURR_NAME.Value;
  edit1.Tag:=dm.ADS105CUSTOMER_PTR.Value;
  edit5.Tag:=dm.ADS105CURRENCY_PTR.Value;
  CheckBox2.Checked:=dm.ADS105REVERSE_TRANS_FLAG.Value='Y';
  if edit5.Tag=1 then
   edit2.ReadOnly:=true
  else
   edit2.ReadOnly:=false;
  edit2.Text:=dm.ADS105EXCHANGE_RATE.AsString;

  updown1.Position := dm.ADS105ATTACHED.Value;
  edit15.Text := dm.Ads105EMPLOYEE_NAME.Value;

  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT  Data0112.rkey,invoice_number,INVOICE_DATE,'+#13+
            'TOOLING_CHARGES, ship_tax_amount, INVOICE_TOTAL,'+#13+
            'CASE INVOICE_TYPE '+#13+
            'WHEN 1 THEN ''标准发票'' '+#13+
            'WHEN 2 THEN ''工具发票'' '+#13+
            'WHEN 3 THEN ''杂项发票'' END AS 类型,'+#13+
            'ship_amount,FED_TAX_AMOUNT,'+#13+
            'data0131.TAX_NO,data0131.TAX_DATE,data0131.RUSH_CHARGE,' +#13+
            'Data0112.INVOICE_TOTAL-Data0112.RUSH_CHARGE_AMOUNT+data0131.RUSH_CHARGE as all_amount,'+#13+
            'POSTED_DATE,data0015.abbr_name FROM Data0112 inner join data0131 on data0112.rkey=data0131.INVOICE_PTR'+#13+
            'left outer join data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
            'where data0131.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
            'union'+#13+
            'SELECT  Data0116.RKEY, MEMO_NUMBER as invoice_number, RMA_DATE as INVOICE_DATE,'+#13+
           ' 0 as TOOLING_CHARGES, 0 AS ship_tax_amount, AMOUNT as INVOICE_TOTAL,'+#13+
           '  CASE MEMO_TP '+#13+
           ' WHEN 1 THEN ''预收备忘'' '+#13+
           ' WHEN 4 THEN ''退货备忘'' '+#13+
            'WHEN 3 THEN ''无退货'' END AS 类型,'+#13+
            ' GOODS_AMT+SHIPPING+TOOLING_CHARGE as ship_amount,'+#13+
            ' FED_TAX as FED_TAX_AMOUNT,'+#13+
            'data0131.TAX_NO,data0131.TAX_DATE,data0131.RUSH_CHARGE,' +#13+
            'Data0116.AMOUNT-Data0116.RUSH_CHARGE+data0131.RUSH_CHARGE as all_amount,'+#13+
            'MEMO_DATE as POSTED_DATE,data0015.abbr_name '+#13+
            'FROM Data0116 inner join data0131 on data0116.rkey=data0131.DEBIT_PTR'+#13+
            'left outer join data0015 on data0116.warehouse_ptr=data0015.rkey'+#13+
            'where data0131.GL_HEADER_PTR='+dm.ADS105RKEY.AsString;
    Prepared;
    open;
    while not eof do
     begin
      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=fieldbyname('invoice_number').AsString;
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=fieldbyname('类型').AsString;
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=fieldbyname('INVOICE_DATE').AsString;

      if fieldbyname('类型').AsString='工具发票' then
       begin
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=fieldbyname('TOOLING_CHARGES').AsString;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:='0';
        stringgrid1.Cells[5,stringgrid1.RowCount-1]:=fieldbyname('ship_tax_amount').AsString;
       end
      else
       if fieldbyname('类型').AsString='杂项发票' then    //杂项发票
        begin
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:='0';
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=fieldbyname('ship_amount').AsString;
        stringgrid1.Cells[5,stringgrid1.RowCount-1]:=fieldbyname('FED_TAX_AMOUNT').AsString;
        end
       else                                //无退货备忘
         begin
          stringgrid1.Cells[3,stringgrid1.RowCount-1]:='0';
          stringgrid1.Cells[4,stringgrid1.RowCount-1]:=fieldbyname('ship_amount').AsString;
          stringgrid1.Cells[5,stringgrid1.RowCount-1]:=fieldbyname('FED_TAX_AMOUNT').AsString;
         end;
      stringgrid1.Cells[6,stringgrid1.RowCount-1]:=fieldbyname('INVOICE_TOTAL').AsString;
      stringgrid1.Cells[7,stringgrid1.RowCount-1]:=fieldbyname('rkey').AsString;

      if fieldbyname('类型').AsString='无退货' then
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:='1'
      else
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:='0';

      stringgrid1.Cells[9,stringgrid1.RowCount-1]:=fieldbyname('all_amount').AsString;  //可用金额
      stringgrid1.Cells[10,stringgrid1.RowCount-1]:=fieldbyname('RUSH_CHARGE').AsString;  //开票金额

      stringgrid1.Cells[11,stringgrid1.RowCount-1]:=fieldbyname('TAX_DATE').AsString;
      stringgrid1.Cells[12,stringgrid1.RowCount-1]:=fieldbyname('TAX_NO').AsString;
      stringgrid1.Cells[13,stringgrid1.RowCount-1]:=fieldbyname('POSTED_DATE').AsString;
      stringgrid1.Cells[14,stringgrid1.RowCount-1]:=fieldbyname('abbr_name').AsString;

      stringgrid1.RowCount:=stringgrid1.RowCount+1;
      next;
     end;
   end;
    self.update_sgrid1;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'SELECT  Data0064.RKEY, Data0060.SALES_ORDER,data0064.SHIPMENT_NO,'+#13+
     'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0097.PO_NUMBER,'+#13+
     'data0439.delivery_no, data0439.date_sailing,data0064.cust_decl,'+#13+
     'Data0064.part_price as PARTS_ALLOC, Data0064.TAX_2,'+#13+
     'Data0064.QUAN_SHIPPED- Data0064.ovsh_qty+data0131.QUANTITY as alloc_qty,'+#13+
     'data0131.QUANTITY,data0131.TAX_NO,data0131.TAX_DATE,data0131.PARTS_ALLOC as price,'+#13+
     'data0015.abbr_name,Data0025.ORIG_CUSTOMER FROM Data0064 INNER JOIN'+#13+
     ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
     '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
     '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
     '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey inner join '+#13+
     '   data0131 on data0131.SO_SHP_PTR=data0064.rkey inner join'+#13+
     '   data0015 on data0439.warehouse_ptr=data0015.rkey'+#13+
     'where data0131.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
      ' order by Data0060.SALES_ORDER,data0064.SHIPMENT_NO';
     Prepared;
     open;
     while not eof do
      begin
        stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString;       //'销售订单';
        stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
        stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString;   //'客户型号';
        stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString;        //'客户订单号';
        stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('delivery_no').AsString;      //'装箱单号';
        stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('date_sailing').AsString;     //'出货日期';
        stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString;        //'可用数量';
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString;         //'开票数量';
        stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('TAX_DATE').AsString;         //开票日期
        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_NO').AsString;           //税票号
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('price').AsString;           //'价格';
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;            //'税率%';
        stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;
        stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
        stringgrid2.Cells[14,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
        stringgrid2.Cells[15,stringgrid2.RowCount-1]:='0';
        stringgrid2.Cells[16,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString;      //'价格';
        stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('QUANTITY').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('TAX_2').AsFloat*0.01));         //'销售金额';
        stringgrid2.Cells[18,stringgrid2.RowCount-1]:=fieldbyname('abbr_name').AsString;
        stringgrid2.Cells[19,stringgrid2.RowCount-1]:=fieldbyname('ORIG_CUSTOMER').AsString;   //Jacky zhong 增加关联原客户
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        next;
      end;
    end;

     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:=
       'SELECT   dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+#13+
       'dbo.Data0025.MANU_PART_DESC, dbo.Data0097.PO_NUMBER, dbo.Data0098.RMA_NUMBER,'+#13+
       'dbo.Data0098.RMA_DATE, Data0098.QTY_RECD,Data0098.QTY_CRED,'+#13+
       'dbo.Data0098.QTY_RECD - dbo.Data0098.QTY_CRED+data0131.QUANTITY AS alloc_qty,'+#13+
       'dbo.Data0060.PARTS_ALLOC, dbo.Data0098.tax_2 as RUSH_CHARGE,'+#13+
       'dbo.Data0098.RKEY, dbo.Data0116.MEMO_NUMBER,'+#13+
       'data0131.QUANTITY,data0131.TAX_NO,data0131.TAX_DATE,data0131.PARTS_ALLOC as price,'+#13+
       'data0015.abbr_name,Data0025.ORIG_CUSTOMER FROM Data0098 INNER JOIN '+#13+
       ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN '+#13+
       '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY inner join'+#13+
       '  data0131 on data0131.RMA_PTR=data0098.rkey inner join '+#13+
       'data0015 on data0060.SHIP_REG_TAX_ID =data0015.rkey'+#13+
       'where data0131.GL_HEADER_PTR='+dm.ADS105RKEY.AsString+#13+
       ' order by Data0060.SALES_ORDER';
       Prepared;
       open;
       while not eof do
        begin
          stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString; //'销售订单';
          stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString;      //'客户订单号';
          stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('RMA_NUMBER').AsString;     //'退货单号';
          stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('RMA_DATE').AsString;       //'退货日期';
          stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString;     //'可用数量';
          stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString;     //'开票数量';
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('TAX_DATE').AsString;         //开票日期
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('TAX_NO').AsString;           //税票号
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('price').AsString; //'价格';
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('RUSH_CHARGE').AsString; //'税率%';
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;    //98.rkey
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:='退货';
          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=fieldbyname('MEMO_NUMBER').AsString;
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:='1';
          stringgrid2.Cells[16,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString;      //'价格';
          stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
            FloatToStr(fieldbyname('QUANTITY').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('RUSH_CHARGE').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[18,stringgrid2.RowCount-1]:=fieldbyname('abbr_name').AsString;
          stringgrid2.Cells[19,stringgrid2.RowCount-1]:=fieldbyname('ORIG_CUSTOMER').AsString;   //Jacky zhong 增加关联原客户
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          next;
        end;
      end;
      self.re_calculate_qty;
      self.get_price_diff;

      if  (stringgrid2.RowCount > 2) then
        CheckBox2.Enabled:=false
      else
        CheckBox2.Enabled:=True;

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

    sgrid1.Cells[4,i]:=dm.ads106yuan_amount.AsString;

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
  InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
  InputVar.Sqlstr:='SELECT data0010.rkey,Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
  'data0010.ACC_REC_PTR,data0010.CURRENCY_PTR,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.base_to_other,data0010.abbr_name'+#13+
  'FROM dbo.Data0010 inner join data0001 on'+#13+
  'data0010.CURRENCY_PTR=data0001.rkey';

  InputVar.Sqlstr:=InputVar.Sqlstr+#13+
                   'order by data0010.cust_code';
  inputvar.KeyField:='CUST_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CUST_CODE').AsString;
   label19.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_NAME').AsString;
   edit1.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   self.acc_ptr:= frmPick_Item_Single.adsPick.Fieldbyname('ACC_REC_PTR').AsInteger;
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

procedure TForm_ysdetail.update_sgrid1;
var
 i:integer;
 total:currency;
begin
total:=0;
 for i:=1 to stringgrid1.RowCount-2 do
  if  stringgrid1.Cells[8,i]='0' then
   total:=total+ strtocurr(stringgrid1.Cells[10,i])
  else
   total:=total- strtocurr(stringgrid1.Cells[10,i]);
stringgrid1.Cells[9,stringgrid1.RowCount-1]:='合计:';
stringgrid1.Cells[10,stringgrid1.RowCount-1]:=currtostr(total);
end;

procedure TForm_ysdetail.get_price_diff;
var
 i:integer;
 total:single;
begin
total:=0;
 for i:=1 to stringgrid2.RowCount-2 do
  if  stringgrid2.Cells[15,i]='0' then      //指派装运
   total:=total+(strtofloat(stringgrid2.Cells[10,i]) - strtofloat(stringgrid2.Cells[16,i]))*
                strtofloat(stringgrid2.Cells[7,i])*(1+strtofloat(stringgrid2.Cells[11,i])*0.01)
  else
   total:=total+(strtofloat(stringgrid2.Cells[16,i]) - strtofloat(stringgrid2.Cells[10,i]))*
                strtofloat(stringgrid2.Cells[7,i])*(1+strtofloat(stringgrid2.Cells[11,i])*0.01);

 StringGrid2.Cells[9,stringgrid2.RowCount-1]:='含税价差:';
 StringGrid2.Cells[10,stringgrid2.RowCount-1]:=currtostr(total);
end;

procedure TForm_ysdetail.N1Click(Sender: TObject);
var
 i:integer;
 rkey112_list,rkey116_list:string;
 curr_date:tdatetime;

begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
  form_misctooliv:= tform_misctooliv.Create(application);
  rkey112_list:= return_vifrkey(stringgrid1,8,7,0); //8列判断,7为RKEY为0代表发票
  rkey116_list:= return_vifrkey(stringgrid1,8,7,1); //8列判断,7为RKEY为1代表退货
  with  form_misctooliv.ads112 do
   begin
    close;
    CommandText:='SELECT data0112.rkey,invoice_number,  INVOICE_DATE,'+#13+
            'TOOLING_CHARGES, ship_tax_amount, INVOICE_TOTAL,'+#13+
            'CASE INVOICE_TYPE '+#13+
            'WHEN 1 THEN ''标准发票'' '+#13+
            'WHEN 2 THEN ''工具发票'' '+#13+
            'WHEN 3 THEN ''杂项发票'' END AS 类型,'+#13+
            'INVOICE_TYPE,ship_amount,FED_TAX_AMOUNT,RUSH_CHARGE_AMOUNT,'+#13+
            'INVOICE_TOTAL-RUSH_CHARGE_AMOUNT as all_amount,POSTED_DATE,data0015.abbr_name' +#13+
            'FROM  Data0112 left outer join data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
            'WHERE  (INVOICE_STATUS <> 3) AND (GLPTR_STATUS = 0) AND (INVOICE_TYPE IN (2, 3))'+#13+
              ' and (CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
              ' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
           if rkey112_list<>'' then
            CommandText:=CommandText+' and data0112.rkey not in'+ rkey112_list;
            CommandText:=CommandText+#13+
            'union'+#13+
            'SELECT data0116.RKEY, MEMO_NUMBER as invoice_number, RMA_DATE as INVOICE_DATE,'+#13+
            ' 0 as TOOLING_CHARGES, 0 AS ship_tax_amount, AMOUNT as INVOICE_TOTAL, '+#13+
           '  CASE MEMO_TP '+#13+
           ' WHEN 1 THEN ''预收备忘'' '+#13+
           ' WHEN 4 THEN ''退货备忘'' '+#13+
            'WHEN 3 THEN ''无退货'' END AS 类型,'+#13+
            ' MEMO_TP as INVOICE_TYPE,GOODS_AMT+SHIPPING+TOOLING_CHARGE as ship_amount,'+#13+
            ' FED_TAX as FED_TAX_AMOUNT,RUSH_CHARGE as RUSH_CHARGE_AMOUNT,'+#13+
            'AMOUNT-RUSH_CHARGE as all_amount,MEMO_DATE as POSTED_DATE,data0015.abbr_name' +#13+
            'FROM   Data0116 left outer join data0015 on data0116.warehouse_ptr=data0015.rkey  '+#13+
           ' WHERE    (memo_status<>3) AND (GLPTR_STATUS = 0) and (MEMO_TP = 3)'+#13+
              ' and (CUST_PTR='+inttostr(edit1.Tag)+')'+#13+
              ' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
           if rkey116_list<>'' then
            CommandText:=CommandText+' and data0116.rkey not in'+ rkey116_list;
    Prepared;
    open;
   end;

  if form_misctooliv.ShowModal=mrok then
  begin
   curr_date:=getsystem_date(dm.ADOQuery1,1);
   for i:=1 to form_misctooliv.DBGridEh1.SelectedRows.Count do
    begin
     form_misctooliv.dbgrideh1.DataSource.DataSet.Bookmark :=
                         form_misctooliv.DBGridEh1.SelectedRows.Items[i-1];

      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_misctooliv.ads112invoice_number.Value;
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_misctooliv.ads112DSDesigner.AsString;
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form_misctooliv.ads112INVOICE_DATE.AsString;
      if form_misctooliv.ads112DSDesigner.Value='工具发票' then
        begin
         stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_misctooliv.ads112TOOLING_CHARGES.AsString;
         stringgrid1.Cells[4,stringgrid1.RowCount-1]:='0';
         stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form_misctooliv.ads112ship_tax_amount.AsString;
        end
      else
       if form_misctooliv.ads112DSDesigner.Value='杂项发票' then                                              //杂项发票
        begin
         stringgrid1.Cells[3,stringgrid1.RowCount-1]:='0';
         stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form_misctooliv.ads112ship_amount.AsString;
         stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form_misctooliv.ads112FED_TAX_AMOUNT.AsString;
        end
       else                                //无退货备忘
         begin
          stringgrid1.Cells[3,stringgrid1.RowCount-1]:='0';
          stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form_misctooliv.ads112ship_amount.AsString;
          stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form_misctooliv.ads112FED_TAX_AMOUNT.AsString;
         end;
      stringgrid1.Cells[6,stringgrid1.RowCount-1]:=form_misctooliv.ads112INVOICE_TOTAL.AsString;
      stringgrid1.Cells[7,stringgrid1.RowCount-1]:=form_misctooliv.ads112rkey.AsString;

      if form_misctooliv.ads112DSDesigner.Value='无退货' then
       begin
        stringgrid1.Cells[8,stringgrid1.RowCount-1]:='1';
       end
      else
       begin
        stringgrid1.Cells[8,stringgrid1.RowCount-1]:='0';
       end;
     stringgrid1.Cells[9,stringgrid1.RowCount-1]:=form_misctooliv.ads112all_amount.AsString;   //可用金额
     stringgrid1.Cells[10,stringgrid1.RowCount-1]:=form_misctooliv.ads112all_amount.AsString;  //开票金额

     stringgrid1.Cells[11,stringgrid1.RowCount-1]:=datetostr(curr_date);
     stringgrid1.Cells[13,stringgrid1.RowCount-1]:=form_misctooliv.ads112POSTED_DATE.AsString;
     stringgrid1.Cells[14,stringgrid1.RowCount-1]:=form_misctooliv.ads112abbr_name.AsString;

     stringgrid1.RowCount:=stringgrid1.RowCount+1;
    end;
   change_bitbtn;
   self.update_sgrid1;
   self.re_calculate_qty;
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
{
if stringgrid1.Cells[8,stringgrid1.Row]='0' then   //发票
 begin
  edit3.Text:= currtostr(strtocurr(edit3.Text)-strtocurr(stringgrid1.Cells[3,stringgrid1.Row]));
  edit4.Text:= currtostr(strtocurr(edit4.Text)-strtocurr(stringgrid1.Cells[4,stringgrid1.Row]));
  edit7.Text:= currtostr(strtocurr(edit7.Text)-strtocurr(stringgrid1.Cells[5,stringgrid1.Row]));
  edit9.Text:= currtostr(strtocurr(edit9.Text)-strtocurr(stringgrid1.Cells[6,stringgrid1.Row]));
 end
else                       //无退货备忘
 begin
  edit3.Text:= currtostr(strtocurr(edit3.Text)+strtocurr(stringgrid1.Cells[3,stringgrid1.Row]));
  edit6.Text:= currtostr(strtocurr(edit6.Text)+strtocurr(stringgrid1.Cells[4,stringgrid1.Row]));
  edit7.Text:= currtostr(strtocurr(edit7.Text)+strtocurr(stringgrid1.Cells[5,stringgrid1.Row]));
  edit9.Text:= currtostr(strtocurr(edit9.Text)+strtocurr(stringgrid1.Cells[6,stringgrid1.Row]));
 end;
} 
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 change_bitbtn;
 self.update_sgrid1;
 self.re_calculate_qty;
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

procedure TForm_ysdetail.re_calculate_qty;
var
 i,ky_qty,kp_qty:integer;
 ship_amout,tax_amount,tool_charge,misc_amout,ship_tax:single;
begin
 ship_amout:=0;
 tax_amount:=0;
 tool_charge:=0;
 misc_amout:=0;
 ky_qty:=0;
 kp_qty:=0;

 for i:=1 to stringgrid2.RowCount-2 do
  begin
    if  stringgrid2.Cells[15,i]='0' then      //指派装运
     begin
      ship_amout:=ship_amout+
                  strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[16,i]);
      tax_amount:=tax_amount+strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[16,i])
                                *strtocurr(stringgrid2.Cells[11,i])*0.01;
      ky_qty:=ky_qty+ strtoint(stringgrid2.Cells[6,i]);
      kp_qty:=kp_qty+ strtoint(stringgrid2.Cells[7,i]);
     end
    else                                   //退货
     begin
      ship_amout:=ship_amout-
                  strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[16,i]);
      tax_amount:=tax_amount-strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[16,i])
                                *strtocurr(stringgrid2.Cells[11,i])*0.01;
      ky_qty:=ky_qty- strtoint(stringgrid2.Cells[6,i]);
      kp_qty:=kp_qty- strtoint(stringgrid2.Cells[7,i]);
     end;
  end;

 stringgrid2.Cells[17,StringGrid2.RowCount-1 ] :=formatfloat('0.00',ship_amout +tax_amount);
{
StringGrid1.Cells[3,0]:='工具费用';
StringGrid1.Cells[4,0]:='杂项费用';
StringGrid1.Cells[5,0]:='增值税';
StringGrid1.Cells[10,0]:='开票金额';
}
 for i:=1 to stringgrid1.RowCount-2 do
  begin
    if  stringgrid1.Cells[1,i]='工具发票' then  //工具及杂项发票
     begin
      if strtocurr(stringgrid1.Cells[3,i]) > 0 then
       ship_tax := ExRoundTo(strtocurr(stringgrid1.Cells[5,i])/strtocurr(stringgrid1.Cells[3,i]),2)
      else
       ship_tax :=0;
      tool_charge:=tool_charge + strtocurr(stringgrid1.Cells[10,i])/(1+ship_tax);
      tax_amount:=tax_amount + strtocurr(stringgrid1.Cells[10,i])*ship_tax/(1+ship_tax);
     end
    else
     if  stringgrid1.Cells[1,i]='杂项发票' then  //工具及杂项发票
       begin
        if strtocurr(stringgrid1.Cells[4,i]) > 0 then
         ship_tax := ExRoundTo(strtocurr(stringgrid1.Cells[5,i])/strtocurr(stringgrid1.Cells[4,i]),2)
        else
         ship_tax :=0;
        misc_amout:=misc_amout + strtocurr(stringgrid1.Cells[10,i])/(1+ship_tax);
        tax_amount:=tax_amount + strtocurr(stringgrid1.Cells[10,i])*ship_tax/(1+ship_tax);
       end
     else   //无退货备忘
       begin
        if strtocurr(stringgrid1.Cells[4,i]) > 0 then
         ship_tax := ExRoundTo(strtocurr(stringgrid1.Cells[5,i])/strtocurr(stringgrid1.Cells[4,i]),2)
        else
         ship_tax :=0;
       
        ship_amout:=ship_amout - strtocurr(stringgrid1.Cells[10,i])/(1+ship_tax);
        tax_amount:=tax_amount - strtocurr(stringgrid1.Cells[10,i])*ship_tax/(1+ship_tax);
       end;
  end;

 edit3.text := formatfloat('0.00',tool_charge);
 edit4.text := formatfloat('0.00',misc_amout);
 edit6.Text := formatfloat('0.00',ship_amout);
 edit7.Text := formatfloat('0.00',tax_amount);
 edit9.Text := formatfloat('0.00',ship_amout+tax_amount+tool_charge+misc_amout);

 stringgrid2.Cells[6,StringGrid2.RowCount-1 ] :=IntToStr(ky_qty) ;
 stringgrid2.Cells[7,StringGrid2.RowCount-1 ] :=IntToStr(kp_qty) ;

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
begin

if (self.State=1)  then
if (strtocurr(formatfloat('0.00',strtocurr(edit9.text)*strtofloat(edit2.Text)))<>
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

  if strtocurr(edit9.Text) <> 0 then       //借方,处理总价款
   begin
     self.open_glcnumber(self.acc_ptr,dm.ADO104DFLT_ACCT_01.Value);
     case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
       0:                 //不核算外币
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';  //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
           Formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit2.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
        end;
       2:             //核算单一外币
        begin
         if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
          begin
           sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.text;      //货币
           sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;        //汇率
           sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                             formatfloat('0.00',strtocurr(edit9.Text));
           sgrid2.Cells[1,sgrid2.RowCount-1]:=INtTOSTR(EDIT5.Tag);
          end
         else
          begin
           messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
           mt_error:=false;
          end;
        end;
     end;  // end case

     if mt_error then
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
                          formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit2.Text));
        if self.acc_ptr>0 then
         sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(self.acc_ptr)
        else
         sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
   //==========以上为借方=====处理产品销售收入=============下面处理贷方================
   mt_error:=true;
   ys_total:=strtocurr(edit4.Text)+strtocurr(edit6.Text);     //贷方,处理不含税价款

   if ys_total <> 0 then
    begin
     self.open_glcnumber(0,dm.ADO104DFLT_ACCT_02.Value);

     case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';   //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',ys_total*strtofloat(edit2.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit5.text;     //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;     //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',ys_total);
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
       sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                         Edit10.Text+ '['+edit1.text+self.abbrname+']';
       sgrid1.Cells[1, sgrid1.RowCount-1]:=              //科目
                         trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                         trim(dm.ADOQuery1.FieldValues['description_2']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=     //贷方本币金额
                        formatfloat('0.00',ys_total*strtofloat(edit2.Text));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
    end;
   //============================= 处理不含税工具费用=================================
   if strtocurr(edit3.Text) <> 0 then
    begin
     self.open_glcnumber(0,dm.ADO104DFLT_ACCT_03.Value);

      case dm.ADOQuery1.fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= 'RMB';         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit2.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
      begin
       if dm.ADOQuery1.fieldbyname('curr_ptr').AsInteger=edit5.Tag then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:= edit5.text;     //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit2.Text;        //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',strtocurr(edit3.Text));
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
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                          formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit2.Text));
        sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
    end;
//=============================处理贷方税金======================================
   if strtocurr(edit7.Text) <> 0 then
    begin
     self.open_glcnumber(0,dm.ADO104DFLT_ACCT_06.Value);

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
        sgrid1.Cells[0,sgrid1.RowCount-1]:='销售开票'+              //摘要
                           Edit10.Text+ '['+edit1.text+ abbrname+']';
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(dm.ADOQuery1.FieldValues['gl_acc_number'])+'-'+
                           trim(dm.ADOQuery1.FieldValues['description_2']);
        sgrid1.Cells[6,sgrid1.RowCount-1]:=        //贷方本币金额
                          formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit2.Text));
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

procedure TForm_ysdetail.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid2.Row:=row;
 end
else
 if Button=mbLeft then
  begin
   stringgrid2.MouseToCell(x,y,column,row);
   if (Row=0) and (column in [0,1,2,3,4,5,8,12,18]) then
   begin
    GetSort(StringGrid2,column);
   end;
  end;
end;

procedure TForm_ysdetail.N3Click(Sender: TObject);
var
 i:integer;
 rkey64_list,rkey98_list:string;
 ship_amout,tax_amount:Single;
 curr_date:tdatetime;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
 form_misctooliv:= tform_misctooliv.Create(application);
 form_misctooliv.Caption:='标准发票退货备忘搜索';
 form_misctooliv.DBGridEh1.Columns.Delete(8);
 form_misctooliv.DBGridEh1.Columns.Delete(8);
 form_misctooliv.ads112.Fields.Remove(form_misctooliv.ads112.Fields[10]);
 form_misctooliv.ads112.Fields.Remove(form_misctooliv.ads112.Fields[10]);
 form_misctooliv.Width:= form_misctooliv.Width-80;
  with  form_misctooliv.ads112 do
   begin
    close;
    CommandText:='SELECT data0112.rkey,invoice_number,INVOICE_DATE,'+#13+
            'TOOLING_CHARGES, ship_tax_amount, INVOICE_TOTAL,'+#13+
            'CASE INVOICE_TYPE '+#13+
            'WHEN 1 THEN ''标准发票'' '+#13+
            'WHEN 2 THEN ''工具发票'' '+#13+
            'WHEN 3 THEN ''杂项发票'' END AS 类型,'+#13+
             'INVOICE_TYPE,ship_amount,FED_TAX_AMOUNT,POSTED_DATE,data0015.abbr_name'+#13+
            'FROM Data0112 left outer join data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
            'WHERE  (INVOICE_STATUS <> 3) AND (GLPTR_STATUS = 0) AND (INVOICE_TYPE =1)'+#13+
              ' and (CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
              ' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')'+#13+
            'union'+#13+
            'SELECT data0116.RKEY, MEMO_NUMBER as invoice_number, RMA_DATE as INVOICE_DATE,'+#13+
            ' TOOLING_CHARGE as TOOLING_CHARGES, 0 AS ship_tax_amount, AMOUNT as INVOICE_TOTAL, '+#13+
            ' CASE MEMO_TP '+#13+
            ' WHEN 1 THEN ''预收备忘'''+#13+
            ' WHEN 4 THEN ''退货备忘'''+#13+
            ' WHEN 3 THEN ''无退货'' END AS 类型,'+#13+
            ' MEMO_TP as INVOICE_TYPE,GOODS_AMT+SHIPPING as ship_amount,'+#13+
            ' FED_TAX as FED_TAX_AMOUNT,MEMO_DATE as POSTED_DATE,data0015.abbr_name'+#13+
            'FROM Data0116 left outer join data0015 on data0116.warehouse_ptr=data0015.rkey'+#13+
           ' WHERE  (memo_status<>3) AND (GLPTR_STATUS = 0) and (MEMO_TP = 4)'+#13+
              ' and (CUST_PTR='+inttostr(edit1.Tag)+')'+#13+
              ' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    Prepared;
    open;
   end;

 if form_misctooliv.ShowModal=mrok then
  begin
   rkey64_list:= return_vifrkey(stringgrid2,15,12,0); //15判断,12列返回列为0代表指派
   rkey98_list:= return_vifrkey(stringgrid2,15,12,1); //12列为返回值1代表退货
   curr_date:=getsystem_date(dm.ADOQuery1,1);
    ship_amout:=0;
    tax_amount:=0;
   for i:=1 to form_misctooliv.DBGridEh1.SelectedRows.Count do
    begin
     form_misctooliv.DBGridEh1.DataSource.DataSet.Bookmark :=
                         form_misctooliv.DBGridEh1.SelectedRows.Items[i-1];
     if form_misctooliv.ads112DSDesigner.Value='标准发票' then
      with dm.ADOQuery1 do
      begin
       close;
       sql.Text:=
       'SELECT  Data0064.RKEY, Data0060.SALES_ORDER,data0064.SHIPMENT_NO,'+#13+
       'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0097.PO_NUMBER,'+#13+
       'data0439.delivery_no, data0439.date_sailing,data0064.cust_decl,'+#13+
       'Data0064.QUAN_SHIPPED- Data0064.ovsh_qty as alloc_qty, Data0064.part_price AS PARTS_ALLOC, Data0064.TAX_2'+#13+
       'FROM   Data0064 INNER JOIN'+#13+
       ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
       '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
       'where Data0064.GLPTR_STATUS=0 and (Data0064.QUAN_SHIPPED- Data0064.ovsh_qty>0) '+#13+ //如果Data0064.GLPTR_STATUS状态错误可能会造成漏开票
       'and data0439.invoice_ptr='+form_misctooliv.ads112rkey.AsString+#13;
       if rkey64_list<>'' then
        sql.Text:=sql.Text+'and data0064.rkey not in'+rkey64_list+#13+
         'order by Data0060.SALES_ORDER'
       else
        sql.Text:=sql.Text+' order by Data0060.SALES_ORDER';
       Prepared;
       open;
       while not eof do
        begin
          stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString; //'销售订单';
          stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString; //'客户订单号';
          stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('delivery_no').AsString; //'装箱单号';
          stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('date_sailing').AsString; //'出货日期';
          stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString; //'装运数量';
          stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString; //'开票数量';
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=datetostr(curr_date);
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:='';      //税票号

          stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString; //'开票价格';
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString; //'税率%';
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:='0';
          stringgrid2.Cells[16,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

          stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('alloc_qty').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('TAX_2').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[18,stringgrid2.RowCount-1]:=form_misctooliv.ads112abbr_name.Value;//工厂
          stringgrid2.RowCount:=stringgrid2.RowCount+1;

          next;
        end;
      end
     else         //退货备忘
     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:=
       'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+#13+
       'dbo.Data0025.MANU_PART_DESC, dbo.Data0097.PO_NUMBER, dbo.Data0098.RMA_NUMBER,'+#13+
       'dbo.Data0098.RMA_DATE, Data0098.QTY_RECD,Data0098.QTY_CRED,'+#13+
       'dbo.Data0098.QTY_RECD - dbo.Data0098.QTY_CRED AS alloc_qty,'+#13+
       'dbo.Data0060.PARTS_ALLOC, dbo.Data0098.tax_2 as RUSH_CHARGE,'+#13+
       'dbo.Data0098.RKEY, dbo.Data0116.MEMO_NUMBER'+#13+
       'FROM         dbo.Data0098 INNER JOIN '+#13+
       ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN '+#13+
       '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'+#13+
       'where Data0098.QTY_RECD - Data0098.QTY_CRED>0 and Data0098.srce_ptr='+form_misctooliv.ads112rkey.AsString+#13;
       if rkey98_list<>'' then
        sql.Text:=sql.Text+'and data0098.rkey not in'+rkey98_list+#13+
         'order by Data0060.SALES_ORDER'
       else
        sql.Text:=sql.Text+' order by Data0060.SALES_ORDER';
       Prepared;
       open;
       while not eof do
        begin
          stringgrid2.Cells[0,stringgrid2.RowCount-1]:=fieldbyname('SALES_ORDER').AsString; //'销售订单';
          stringgrid2.Cells[1,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          stringgrid2.Cells[2,stringgrid2.RowCount-1]:=fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          stringgrid2.Cells[3,stringgrid2.RowCount-1]:=fieldbyname('PO_NUMBER').AsString;      //'客户订单号';
          stringgrid2.Cells[4,stringgrid2.RowCount-1]:=fieldbyname('RMA_NUMBER').AsString;     //'退货单号';
          stringgrid2.Cells[5,stringgrid2.RowCount-1]:=fieldbyname('RMA_DATE').AsString;       //'退货日期';
          stringgrid2.Cells[6,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString;     //'退货数量';
          stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString;     //'开票数量';
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=datetostr(curr_date);
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:='';      //税票号
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString; //'价格';
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('RUSH_CHARGE').AsString; //'税率%';
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;    //98.rkey
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:='退货';
          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=fieldbyname('MEMO_NUMBER').AsString;
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:='1';
          stringgrid2.Cells[16,stringgrid2.RowCount-1]:=fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

          stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('alloc_qty').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('RUSH_CHARGE').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[18,stringgrid2.RowCount-1]:=form_misctooliv.ads112abbr_name.Value;//工厂
          stringgrid2.RowCount:=stringgrid2.RowCount+1;

          next;
        end;
      end;
    end;

    change_bitbtn;
    self.get_price_diff;
    self.re_calculate_qty;
  end;
finally
 form_misctooliv.Free;
end;
end;

procedure TForm_ysdetail.N13Click(Sender: TObject);
var
 i:integer;
// ship_amout,tax_amount:single;
begin
{  ship_amout:=strtoint(stringgrid2.Cells[7,stringgrid2.Row])*
                                     strtofloat(stringgrid2.Cells[16,stringgrid2.Row]);
  if stringgrid2.Cells[15,stringgrid2.Row]='0' then
   edit6.Text:=formatfloat('0.00',strtocurr(edit6.Text) - ship_amout)
  else
   edit6.Text:=formatfloat('0.00',strtocurr(edit6.Text) + ship_amout);

  tax_amount:=ship_amout*strtocurr(stringgrid2.Cells[11,stringgrid2.Row])*0.01;

  if stringgrid2.Cells[15,stringgrid2.Row]='0' then
   edit7.Text:=formatfloat('0.00',strtocurr(edit7.Text) - tax_amount)
  else
   edit7.Text:=formatfloat('0.00',strtocurr(edit7.Text) + tax_amount);
   
  if stringgrid2.Cells[15,stringgrid2.Row]='0' then
   edit9.Text:=formatfloat('0.00',strtocurr(edit9.Text)-ship_amout-tax_amount)
  else
   edit9.Text:=formatfloat('0.00',strtocurr(edit9.Text)+ship_amout+tax_amount);
}
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 change_bitbtn;
 self.get_price_diff;
 self.re_calculate_qty;
end;

procedure TForm_ysdetail.N12Click(Sender: TObject);
var
 i:integer;
// ship_amout,tax_amount:Single;
 curr_date:tdatetime;
 rkey64_list:string;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
  form_assign:= tform_assign.Create(application);
 
  rkey64_list:= return_vifrkey(stringgrid2,15,12,0); //15列为0代表指派
  with  form_assign.ads64 do
   begin
    close;
    CommandText:=CommandText+' and (data0112.CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+
               ' and (data0112.CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if rkey64_list<>'' then
      CommandText:=CommandText+' and data0064.rkey not in'+rkey64_list;
    Prepared;
    open;
   end;

  if form_assign.ShowModal=mrok then
  begin

    curr_date:=getsystem_date(dm.ADOQuery1,1);
   for i:=1 to form_assign.DBGrid1.SelectedRows.Count do
    begin
     form_assign.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_assign.dbgrid1.SelectedRows.Items[i-1];
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('SALES_ORDER').AsString; //'销售订单';
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('PO_NUMBER').AsString; //'客户订单号';
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('delivery_no').AsString; //'装箱单号';
     stringgrid2.Cells[5,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('date_sailing').AsString; //'出货日期';
     stringgrid2.Cells[6,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('alloc_qty').AsString; //'可用数量';
     stringgrid2.Cells[7,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('alloc_qty').AsString; //'开票数量';
     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=datetostr(curr_date);
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:='';      //税票号
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('PARTS_ALLOC').AsString; //'价格';
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('TAX_2').AsString; //'税率%';
     stringgrid2.Cells[12,stringgrid2.RowCount-1]:=form_assign.ads64RKEY.AsString;       //标识列
     stringgrid2.Cells[13,stringgrid2.RowCount-1]:=form_assign.ads64SHIPMENT_NO.AsString;
     stringgrid2.Cells[14,stringgrid2.RowCount-1]:=form_assign.ads64cust_decl.Value;
     stringgrid2.Cells[15,stringgrid2.RowCount-1]:='0';
     stringgrid2.Cells[16,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

     stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
       FloatToStr(form_assign.ads64.fieldbyname('alloc_qty').AsInteger *
       form_assign.ads64.fieldbyname('PARTS_ALLOC').AsFloat*
         (1+form_assign.ads64TAX_2.Value*0.01));         //'销售金额';
     stringgrid2.Cells[18,stringgrid2.RowCount-1]:=form_assign.ads64abbr_name.Value;//工厂
     stringgrid2.Cells[19,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('ORIG_CUSTOMER').AsString;   //Jacky zhong 增加关联原客户
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;

    change_bitbtn;
    self.get_price_diff;
    self.re_calculate_qty;
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
    self.PageControl1.ActivePageIndex:=1;
    PageControl1Change(sender);
    sgrid1.SetFocus;
    exit;
  end;

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
  if StrToDate(Edit11.Text)<= common.getmaxnokp_date(dm.ADOQuery1) then
  begin
    messagedlg('凭证日期不能少于最大截数日期!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=0;
    edit11.SetFocus;
    exit;
  end;
end;

procedure TForm_ysdetail.update_64_98(rkey105: integer);
begin

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set RUSH_CHARGE_AMOUNT=data0112.RUSH_CHARGE_AMOUNT+DATA0131.RUSH_CHARGE'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'Data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set glptr_status=1'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'Data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105)+#13+
              'and data0112.RUSH_CHARGE_AMOUNT=data0112.INVOICE_TOTAL';
     ExecSQL;
    end;
//===========================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set RUSH_CHARGE=data0116.RUSH_CHARGE+DATA0131.RUSH_CHARGE'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'Data0116 ON DATA0131.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set glptr_status=1'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'Data0116 ON DATA0131.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105)+#13+
              'and data0116.RUSH_CHARGE=data0116.AMOUNT';
     ExecSQL;
    end;
//===========================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set ovsh_qty=ovsh_qty+DATA0131.QUANTITY'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set GLPTR_STATUS=1'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105)+#13+
              'AND Data0064.ovsh_qty = Data0064.QUAN_SHIPPED';
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0112'+#13+
     'set glptr_status=1'+#13+      //更新应收帐龄为已开票
     'where rkey in (SELECT   dbo.data0439.invoice_ptr'+#13+
     'FROM    dbo.Data0064 INNER JOIN'+#13+
     '        dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
     ' inner join data0131 on DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY' +#13+
     'WHERE     (dbo.DATA0131.GL_HEADER_PTR = '+inttostr(rkey105)+')'+#13+
                'and (Data0064.GLPTR_STATUS=1)'+#13+
     'GROUP BY dbo.data0439.invoice_ptr)'+#13+
     ' and rkey not in(SELECT data0439.invoice_ptr'+#13+
     'FROM         Data0064 INNER JOIN'+#13+
     '             data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
     'WHERE (Data0064.GLPTR_STATUS = 0) AND (data0439.invoice_ptr IN'+#13+
     '  (SELECT     data0439_1.invoice_ptr'+#13+
     '   FROM       Data0064 AS Data0064_1 INNER JOIN'+#13+
     '     data0439 AS data0439_1 ON Data0064_1.packing_list_ptr = data0439_1.rkey'+#13+
      ' inner join data0131 as data0131_1 on DATA0131_1.SO_SHP_PTR = Data0064_1.RKEY' +#13+
     '   WHERE   (Data0131_1.GL_HEADER_PTR = '+inttostr(rkey105)+')'+#13+
            'and (Data0064_1.GLPTR_STATUS=1)'+#13+
     '   GROUP BY data0439_1.invoice_ptr))'+#13+
     'GROUP BY dbo.data0439.invoice_ptr)';
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set QTY_CRED=QTY_CRED+DATA0131.QUANTITY'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set GLPTR_STATUS=1'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+inttostr(rkey105)+#13+
              'AND Data0098.QTY_CRED = Data0098.QTY_RECD';
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0116'+#13+
     'set glptr_status=1'+#13+      //更新退货备忘为已开票
     'where rkey in (SELECT  data0098.srce_ptr'+#13+
     'FROM  data0131 INNER JOIN'+#13+
           'Data0098 on DATA0131.RMA_PTR = dbo.Data0098.RKEY' +#13+
     'WHERE (DATA0131.GL_HEADER_PTR = '+inttostr(rkey105)+')'+#13+
            'and (data0098.GLPTR_STATUS=1)'+#13+
     'GROUP BY dbo.data0098.srce_ptr)'+#13+
     ' and rkey not in(SELECT  data0098.srce_ptr'+#13+
     'FROM    Data0098 INNER JOIN'+#13+
         '(SELECT  data0098.srce_ptr'+#13+
         'FROM  data0131 INNER JOIN'+#13+
               'Data0098 on DATA0131.RMA_PTR = dbo.Data0098.RKEY' +#13+
         'WHERE (DATA0131.GL_HEADER_PTR = '+inttostr(rkey105)+')'+#13+
                'and (data0098.GLPTR_STATUS=1)'+#13+
         'GROUP BY dbo.data0098.srce_ptr) as d1 on d1.srce_ptr = Data0098.srce_ptr'+#13+
     'WHERE  (dbo.data0098.GLPTR_STATUS = 0) '+#13+
     'GROUP BY  data0098.srce_ptr)';
     ExecSQL;
    end;

end;

procedure TForm_ysdetail.BitBtn1Click(Sender: TObject);
var
 i,n,x,y:integer;
// number:string;
 ChkRepeat: array of array of string;
begin
 SetLength(ChkRepeat,StringGrid2.RowCount-2);
 for n := 0 to StringGrid2.RowCount-3 do  //设定二维数组长度
   SetLength(ChkRepeat[n],2);
 for n := 0 to StringGrid2.RowCount-3 do  //给二维数组赋值
 begin
   ChkRepeat[n][0]:= StringGrid2.Cells[12,n+1];
   ChkRepeat[n][1]:= StringGrid2.Cells[15,n+1];
 end;
 for x:=0 to StringGrid2.RowCount-3 do    //循环检查是否有重复值
 begin
   for y:=x+1 to StringGrid2.RowCount-3 do
   begin
     if (ChkRepeat[x][0]=ChkRepeat[y][0]) and (ChkRepeat[x][1]=ChkRepeat[y][1]) then
     begin
       showmessage('存在重复的指派明细或退货明细,无法保存!');
       Abort;
     end;
   end;
 end;

 if (strtocurr(formatfloat('0.00',strtocurr(edit9.text)*strtofloat(edit2.Text)))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
  if messagedlg('科目借方金额与发票发生额不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
   begin
    exit;
   end;

 if abs(strtocurr(stringgrid1.Cells[10,stringgrid1.RowCount-1])-
     strtocurr(stringgrid2.Cells[10,stringgrid2.RowCount-1]))>0.1 then
  if StringGrid2.RowCount>2 then
   begin
    ShowMsg('工具杂项备忘金额与价差金额不一致,不能保存!',1);
    exit;
   end
  else
  if not CheckBox2.Checked then
   begin
    ShowMsg('工具杂项备忘金额与价差金额不一致,未平衡解锁,不能保存!',1);
    exit;
   end;

if self.State=1 then  //新增
 begin
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=self.get_voucher(strtodate(edit11.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
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
     dm.ado105BATCH_NUMBER.Value:=edit10.Text;                 //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);            //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);               //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);              //会计期间
     dm.ado105CUSTOMER_PTR.Value:=edit1.Tag;                      //客户
     dm.ADO105CURRENCY_PTR.Value:=edit5.Tag;                      //货币
     dm.ADO105EXCHANGE_RATE.AsString:=edit2.Text;                 //汇率
     if CheckBox2.Checked then
      dm.ADO105REVERSE_TRANS_FLAG.Value:= 'Y'
     else
      dm.ADO105REVERSE_TRANS_FLAG.Value:= 'N';
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

   append_invoice_dedit(dm.ADO105RKEY.Value);

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0112.rkey'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0112 ON DATA0131.INVOICE_PTR = data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.RUSH_CHARGE+data0112.RUSH_CHARGE_AMOUNT > data0112.INVOICE_TOTAL';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了应收发票数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0116.rkey'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0116 ON DATA0131.DEBIT_PTR = data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.RUSH_CHARGE+data0116.RUSH_CHARGE > data0116.AMOUNT';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了无退货备忘数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

  append_ship_rma(dm.ADO105RKEY.Value);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0064.rkey'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.QUANTITY+data0064.ovsh_qty > data0064.QUAN_SHIPPED';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了指派数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0098.rkey'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.QUANTITY+data0098.QTY_CRED > data0098.QTY_RECD';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了退货数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   self.update_64_98(dm.ADO105RKEY.Value);

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
else    //编辑保存
 begin
 
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
     if CheckBox2.Checked then
      dm.ADO105REVERSE_TRANS_FLAG.Value:= 'Y'
     else
      dm.ADO105REVERSE_TRANS_FLAG.Value:= 'N';     
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
//==============================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set RUSH_CHARGE_AMOUNT=data0112.RUSH_CHARGE_AMOUNT-DATA0131.RUSH_CHARGE,'+#13+
              'glptr_status=0'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉112开票金额
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set RUSH_CHARGE=data0116.RUSH_CHARGE-DATA0131.RUSH_CHARGE,'+#13+
              'glptr_status=0'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0116 ON DATA0131.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉116开票金额
    end;
//=============================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set ovsh_qty=data0064.ovsh_qty-DATA0131.QUANTITY,'+#13+
              'GLPTR_STATUS=0'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉64开票数量
    end;

   with dm.ADOQuery1 do             //更新应收帐龄为未开票
    begin
     close;
     sql.Text:=
     'update data0112'+#13+
     'set glptr_status=0'+#13+     
     'where rkey in (SELECT data0439.invoice_ptr'+#13+
     'FROM    dbo.Data0064 INNER JOIN'+#13+
     '        dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
     ' inner join data0131 on DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY' +#13+
     'WHERE     (dbo.DATA0131.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0439.invoice_ptr)';
     ExecSQL;
    end;
//=============================================================================
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set QTY_CRED=data0098.QTY_CRED-DATA0131.QUANTITY,'+#13+
              'GLPTR_STATUS=0'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;                 //去掉98开票数量

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0116'+#13+
     'set glptr_status=0'+#13+      //更新退货备忘为已开票
     'where rkey in (SELECT data0098.srce_ptr'+#13+
     'FROM  data0131 INNER JOIN'+#13+
           'Data0098 on DATA0131.RMA_PTR = dbo.Data0098.RKEY' +#13+
     'WHERE (DATA0131.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0098.srce_ptr)';
     ExecSQL;
    end;                                 //去掉98开票数量
//=============================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='delete data0131 '+
               'where GL_HEADER_PTR ='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;


   append_invoice_dedit(dm.ADO105RKEY.Value);

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0112.rkey'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0112 ON DATA0131.INVOICE_PTR = data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.RUSH_CHARGE+data0112.RUSH_CHARGE_AMOUNT > data0112.INVOICE_TOTAL';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了应收发票数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0116.rkey'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0116 ON DATA0131.DEBIT_PTR = data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.RUSH_CHARGE+data0116.RUSH_CHARGE > data0116.AMOUNT';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了无退货备忘数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;
    
  self.append_ship_rma(dm.ADO105RKEY.Value);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0064.rkey'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.QUANTITY+data0064.ovsh_qty > data0064.QUAN_SHIPPED';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了指派数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0098.rkey'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString+#13+
              'and DATA0131.QUANTITY+data0098.QTY_CRED > data0098.QTY_RECD';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('开票失败,可能多用户同时操作了退货数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   self.update_64_98(dm.ADO105RKEY.Value);
   
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
if  (stringgrid2.RowCount > 2) then
 begin
  CheckBox2.Checked:=false;
  CheckBox2.Enabled:=false;
 end
else
 begin
  CheckBox2.Enabled:=True;
 end;

if (stringgrid1.RowCount > 2) or (stringgrid2.RowCount > 2) then
 begin
  bitbtn6.Enabled:=false;
  bitbtn4.Enabled:=false;
 end;

 if (stringgrid1.RowCount = 2) and (stringgrid2.RowCount = 2) then
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

procedure TForm_ysdetail.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin

if (StringGrid2.col=7)  then  //'开票数量';
 begin
  if stringgrid2.Row<> stringgrid2.RowCount-1 then
  stringgrid2.Cells[17,stringgrid2.Row]:=
      FloatToStr(StrToInt(stringgrid2.Cells[7,stringgrid2.Row]) *
                 StrToFloat(stringgrid2.Cells[16,stringgrid2.Row])*
       (1+strtocurr(stringgrid2.Cells[11,stringgrid2.Row])*0.01));         //'销售金额';

  re_calculate_qty;
 end;
 
if (StringGrid2.col=7) or (StringGrid2.col=10) then   //开票数量或者开票价格
 self.get_price_diff;

if ARow = StringGrid2.RowCount-1 then
 StringGrid2.Options:=StringGrid2.Options-[goEditing]
else
 if ((acol=7) or (acol=9) or (acol=10)) and (self.State<>3) then
   StringGrid2.Options:=StringGrid2.Options+[goEditing]
 else
  StringGrid2.Options:=StringGrid2.Options-[goEditing];

 newrow:=arow;
 newcol:=acol;
 StringGrid2.Refresh;

end;

procedure TForm_ysdetail.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 8 ) and (ARow<>stringgrid2.RowCount-1) then
   begin
    dtpk1.Left := Rect.Left+1;
    dtpk1.Top := Rect.Top+2;
    dtpk1.Width := Rect.Right - Rect.Left+3;
    dtpk1.Height := Rect.Bottom - Rect.Top;
    dtpk1.Visible := True;
    if trim(StringGrid2.Cells[acol,arow])<>'' then
    dtpk1.Date:=strtodate(StringGrid2.Cells[acol,arow]);
   end
  else
    dtpk1.Visible :=false;
 end;

if stringgrid2.Cells[15,ARow]='1' then   //退货
 begin
   StringGrid2.Canvas.Brush.Color   :=   clred;
   StringGrid2.Canvas.pen.Color:=StringGrid2.Font.Color;
   StringGrid2.canvas.fillRect(rect);
   StringGrid2.Canvas.textout(rect.left+1,rect.Top   ,StringGrid2.cells[acol,arow]);
 end;

 if (arow >= 1) and (arow <> stringgrid2.RowCount-1) then
 if arow=newrow then
  begin
   if acol=newcol then
    begin
     stringgrid2.Canvas.Brush.Color := clred;
     stringgrid2.Canvas.FrameRect(rect);
    end
   else
    begin
     stringgrid2.Canvas.Brush.Color := clblue;
     stringgrid2.Canvas.FrameRect(rect);
    end;
  end;

end;

procedure TForm_ysdetail.StringGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if (StringGrid2.Col=7) or (StringGrid2.Col=10) then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid2.Cells[StringGrid2.Col,StringGrid2.Row])>0  then abort;
end;

procedure TForm_ysdetail.dtpk1Change(Sender: TObject);
begin
stringgrid2.Cells[8,StringGrid2.Row]:=datetostr(dtpk1.Date);
end;

procedure TForm_ysdetail.dtpk1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then stringgrid2.SetFocus;
end;

procedure TForm_ysdetail.StringGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (StringGrid2.Col=7) and (StringGrid2.Row<>StringGrid2.RowCount-1) then
 begin
  if StringGrid2.Cells[7,StringGrid2.Row]='' then StringGrid2.Cells[7,StringGrid2.Row]:='0';
  if strtoint(StringGrid2.Cells[7,StringGrid2.Row])>
     strtoint(StringGrid2.Cells[6,StringGrid2.Row]) then
   StringGrid2.Cells[7,StringGrid2.Row] := StringGrid2.Cells[6,StringGrid2.Row];
 end;
if (StringGrid2.Col=10) and (StringGrid2.Row<>StringGrid2.RowCount-1) then
  if StringGrid2.Cells[10,StringGrid2.Row]='' then StringGrid2.Cells[10,StringGrid2.Row]:='0';
end;

procedure TForm_ysdetail.StringGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if StringGrid2.Row <> StringGrid2.RowCount-1 then
if (key=13) and ((StringGrid2.Col=7) or (StringGrid2.Col=9) or
   (StringGrid2.Col=8) or (StringGrid2.Col=10)) then
 StringGrid2.Row:=StringGrid2.Row+1;

 if  (StringGrid2.Col=8) or (StringGrid2.Col=9) or (StringGrid2.Col=10) then
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid2.Row > 1) and
    (self.State<>3) and (StringGrid2.Row <> StringGrid2.RowCount-1) then       //编辑状态
  begin
   stringgrid2.Cells[stringgrid2.col,stringgrid2.row]:=
                               stringgrid2.Cells[stringgrid2.col,stringgrid2.row-1];
  end;

end;

procedure TForm_ysdetail.N14Click(Sender: TObject);
var
 i:integer;
// ship_amout,tax_amount:Single;
 curr_date:tdatetime;
 rkey98_list:string;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
try
  form_rma:= tform_rma.Create(application);
  rkey98_list:= return_vifrkey(stringgrid2,15,12,1); //12列为1代表退货
  with  form_rma.ads98 do
   begin
    close;
    CommandText:=CommandText+' and (data0116.CUST_PTR='+inttostr(edit1.Tag)+')'+
                             ' and (data0116.CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    if rkey98_list<>'' then
      CommandText:=CommandText+' and data0098.rkey not in'+rkey98_list;

    Prepared;
    open;
   end;

  if form_rma.ShowModal=mrok then
  begin
 //   ship_amout:=0;
 //   tax_amount:=0;
    curr_date:=getsystem_date(dm.ADOQuery1,1);
   for i:=1 to form_rma.DBGrid1.SelectedRows.Count do
    begin
     form_rma.dbgrid1.DataSource.DataSet.Bookmark :=
                         form_rma.dbgrid1.SelectedRows.Items[i-1];
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form_rma.ads98SALES_ORDER.Value;      //'销售订单';
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form_rma.ads98MANU_PART_NUMBER.Value; //本厂编号';
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_rma.ads98MANU_PART_DESC.Value;   //'客户型号';
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=form_rma.ads98PO_NUMBER.Value;        //'客户订单号';
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form_rma.ads98RMA_NUMBER.Value;       //'退货单号';
     stringgrid2.Cells[5,stringgrid2.RowCount-1]:=form_rma.ads98RMA_DATE.AsString;      //'退货日期';
     stringgrid2.Cells[6,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('alloc_qty').AsString; //'可用数量';
     stringgrid2.Cells[7,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('alloc_qty').AsString; //'开票数量';
     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=datetostr(curr_date);
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:='';      //税票号
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('PARTS_ALLOC').AsString; //'开票价格';
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_rma.ads98RUSH_CHARGE.AsString; //'税率%';
     stringgrid2.Cells[12,stringgrid2.RowCount-1]:=form_rma.ads98RKEY.AsString;
     stringgrid2.Cells[13,stringgrid2.RowCount-1]:='退货';
     stringgrid2.Cells[14,stringgrid2.RowCount-1]:=form_rma.ads98MEMO_NUMBER.Value;   //备忘编号
     stringgrid2.Cells[15,stringgrid2.RowCount-1]:='1';
     stringgrid2.Cells[16,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

     stringgrid2.Cells[17,stringgrid2.RowCount-1]:=
      FloatToStr(form_rma.ads98.fieldbyname('alloc_qty').AsInteger *
                 form_rma.ads98.fieldbyname('PARTS_ALLOC').AsFloat*
       (1+form_rma.ads98RUSH_CHARGE.Value*0.01));         //'销售金额';
     stringgrid2.Cells[18,stringgrid2.RowCount-1]:=form_rma.ads98abbr_name.Value;//工厂
     stringgrid2.Cells[19,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('ORIG_CUSTOMER').AsString;   //Jacky zhong 增加关联原客户
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;


    change_bitbtn;
    self.get_price_diff;
    self.re_calculate_qty;
  end;
finally
 form_rma.Free;
end;
end;

procedure TForm_ysdetail.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 11 ) and (ARow <> stringgrid1.RowCount-1) then
   begin
    dtpk2.Left := Rect.Left+1;
    dtpk2.Top := Rect.Top+2;
    dtpk2.Width := Rect.Right - Rect.Left+3;
    dtpk2.Height := Rect.Bottom - Rect.Top;
    dtpk2.Visible := True;
    if trim(StringGrid1.Cells[acol,arow])<>'' then
     dtpk2.Date:=strtodate(StringGrid1.Cells[acol,arow]);
   end
  else
    dtpk2.Visible :=false;
 end;

if stringgrid1.Cells[8,ARow]='1' then   //退货
 begin
  StringGrid1.Canvas.Brush.Color   :=   clred;
  StringGrid1.Canvas.pen.Color:=StringGrid1.Font.Color;
  StringGrid1.canvas.fillRect(rect);
  StringGrid1.Canvas.textout(rect.left+1,rect.Top,StringGrid1.cells[acol,arow]);
 end;

 if (arow >= 1) and (arow <> stringgrid1.RowCount-1) then
 if arow=newrow_1 then
  begin
   if acol=newcol_1 then
    begin
     stringgrid1.Canvas.Brush.Color := clred;
     stringgrid1.Canvas.FrameRect(rect);
    end
   else
    begin
     stringgrid1.Canvas.Brush.Color := clblue;
     stringgrid1.Canvas.FrameRect(rect);
    end;
  end;

 
end;

procedure TForm_ysdetail.StringGrid2Exit(Sender: TObject);
begin
if (StringGrid2.col=7)  then
 begin
  if stringgrid2.Row<> stringgrid2.RowCount-1 then
  stringgrid2.Cells[17,stringgrid2.Row]:=
      FloatToStr(StrToInt(stringgrid2.Cells[7,stringgrid2.Row]) *
                 StrToFloat(stringgrid2.Cells[16,stringgrid2.Row])*
       (1+strtocurr(stringgrid2.Cells[11,stringgrid2.Row])*0.01));         //'销售金额'; 
  re_calculate_qty;
 end;

if (StringGrid2.col=7) or (StringGrid2.col=10) then
 self.get_price_diff;
end;

procedure TForm_ysdetail.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if ARow = StringGrid1.RowCount-1 then
 StringGrid1.Options:=StringGrid1.Options-[goEditing]
else
 if ((acol=10) or (acol=12)) and (self.State<>3) then
   StringGrid1.Options:=StringGrid1.Options+[goEditing]
 else
  StringGrid1.Options:=StringGrid1.Options-[goEditing];

if (StringGrid1.col=10)  then
 begin
  self.update_sgrid1;
  self.re_calculate_qty;
 end;

 newrow_1:=arow;
 newcol_1:=acol;
 
 StringGrid1.Refresh;

end;

procedure TForm_ysdetail.dtpk2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then stringgrid1.SetFocus;
end;

procedure TForm_ysdetail.dtpk2Change(Sender: TObject);
begin
 stringgrid1.Cells[11,StringGrid1.Row]:=datetostr(dtpk2.Date);
end;

procedure TForm_ysdetail.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if StringGrid1.Row <> StringGrid1.RowCount-1 then
if (key=13) and (StringGrid1.Col>9) then
 StringGrid1.Row:=StringGrid1.Row+1;

 if(StringGrid1.Col>10) then
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid1.Row > 1) and
    (self.State<>3) and (StringGrid1.Row <> StringGrid1.RowCount-1) then    //不是检查状态
  begin
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:=
                     stringgrid1.Cells[stringgrid1.col,stringgrid1.row-1];
   if (StringGrid1.Col=11)  then
   dtpk2.Date:=strtodate(StringGrid1.Cells[stringgrid1.col,stringgrid1.row]);
  end;
end;



procedure TForm_ysdetail.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if (StringGrid1.Col=10)  then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row])>0  then abort;
end;

procedure TForm_ysdetail.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (StringGrid1.Col=10) and (StringGrid1.Row<>StringGrid1.RowCount-1) then
 begin
  if StringGrid1.Cells[10,StringGrid1.Row]='' then StringGrid1.Cells[10,StringGrid1.Row]:='0';
  if strtocurr(StringGrid1.Cells[10,StringGrid1.Row])>
     strtocurr(StringGrid1.Cells[9,StringGrid1.Row]) then
   StringGrid1.Cells[10,StringGrid1.Row] := StringGrid1.Cells[9,StringGrid1.Row];
 end;
end;

procedure TForm_ysdetail.StringGrid1Exit(Sender: TObject);
begin
if (StringGrid1.col=10)  then
 begin
  self.update_sgrid1;
  self.re_calculate_qty;
 end;

end;

procedure TForm_ysdetail.append_invoice_dedit(rkey105:integer);
var
 i:integer;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select GL_HEADER_PTR,INVOICE_PTR,DEBIT_PTR,RUSH_CHARGE,TAX_NO,TAX_DATE '+
               'from data0131 where GL_HEADER_PTR is null';
     open;
    end;

   for i:=1 to stringgrid1.RowCount-2 do
   if strtocurr(stringgrid1.Cells[10,i]) > 0 then
    if strtoint(stringgrid1.Cells[8,i])=0 then //发票
     dm.ADOQuery1.AppendRecord([rkey105,
                                strtoint(stringgrid1.Cells[7,i]),
                                nil,
                                strtocurr(stringgrid1.Cells[10,i]),
                                stringgrid1.Cells[12,i],
                                strtodate(stringgrid1.Cells[11,i])])

    else                                        //退货
     dm.ADOQuery1.AppendRecord([rkey105, nil,
                                strtoint(stringgrid1.Cells[7,i]),
                                strtocurr(stringgrid1.Cells[10,i]),
                                stringgrid1.Cells[12,i],
                                strtodate(stringgrid1.Cells[11,i])]);
end;

procedure TForm_ysdetail.append_ship_rma(rkey105:integer);
var
 i:integer;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select GL_HEADER_PTR,SO_SHP_PTR,RMA_PTR,QUANTITY,TAX_NO,TAX_DATE,PARTS_ALLOC '+
               'from data0131 where GL_HEADER_PTR is null';
     open;
    end;

  for i:=1 to stringgrid2.RowCount-2 do
   if strtoint(stringgrid2.Cells[7,i]) > 0 then
    if strtoint(stringgrid2.Cells[15,i])=0 then //指派
     dm.ADOQuery1.AppendRecord([rkey105,
                                strtoint(stringgrid2.Cells[12,i]),
                                nil,
                                strtoint(stringgrid2.Cells[7,i]),
                                StringReplace(StringGrid2.Cells[9,i],#$D#$A,'',[rfReplaceAll]),
                                strtodate(stringgrid2.Cells[8,i]),
                                strtofloat(stringgrid2.Cells[10,i])])

    else                                        //退货
     dm.ADOQuery1.AppendRecord([rkey105, nil,
                                strtoint(stringgrid2.Cells[12,i]),
                                strtoint(stringgrid2.Cells[7,i]),
                                StringReplace(StringGrid2.Cells[9,i],#$D#$A,'',[rfReplaceAll]),
                                strtodate(stringgrid2.Cells[8,i]),
                                strtofloat(stringgrid2.Cells[10,i])]);

end;

procedure TForm_ysdetail.EXCEL1Click(Sender: TObject);
begin
if StringGrid2.RowCount > 2 then
 Export_Grid_to_Excel(StringGrid2,'指派明细',[0,1,2,3,4,9,14])
end;

function TForm_ysdetail.find_excelerror(rkey, v_type,
  qty,rowNo: Integer): Boolean;
begin
 if v_type=0 then
   with dm.ADOQuery1 do
   begin
     close;
     sql.Text:=
      'SELECT dbo.Data0064.RKEY, dbo.Data0060.SALES_ORDER,data0112.CUSTOMER_PTR as rkey10,data0112.CURRENCY_PTR as rkey01,'+#13+
      ' dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,Data0064.QUAN_SHIPPED- Data0064.ovsh_qty as QtyCanInv,Data0064.GLPTR_STATUS,'+#13+
      ' dbo.Data0097.PO_NUMBER, dbo.data0439.delivery_no, dbo.data0439.date_sailing,'+#13+
      'Data0064.QUAN_SHIPPED,Data0064.part_price as PARTS_ALLOC, data0064.cust_decl,'+#13+
      'Data0064.TAX_2, dbo.Data0112.invoice_number,data0064.SHIPMENT_NO,'+#13+
      ' Data0064.ovsh_qty,Data0064.QUAN_SHIPPED- Data0064.ovsh_qty as alloc_qty,'+#13+
      'data0015.abbr_name'+#13+
      'FROM   dbo.Data0064 INNER JOIN'+#13+
      '  dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      '  dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
      '  dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'+#13+
      '  dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RKEY left outer join'+#13+
      'data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
      'where data0064.rkey='+inttostr(rkey);//+#13+
//      ' and (data0112.CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
//      ' and (data0112.CURRENCY_PTR='+inttostr(edit5.Tag)+')'+#13+
//      'and (Data0064.GLPTR_STATUS = 0) and (Data0064.QUAN_SHIPPED- Data0064.ovsh_qty>='+inttostr(qty)+')';
     open;
   end
 else
  with dm.ADOQuery1 do
   begin
     close;
     sql.Text:=
      'SELECT Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,data0116.CUST_PTR as rkey10,data0116.CURRENCY_PTR as rkey01,'+#13+
      'Data0097.PO_NUMBER, Data0098.RMA_NUMBER as delivery_no,Data0098.RMA_DATE as date_sailing, Data0098.QTY_RECD,Data0098.QTY_RECD - Data0098.QTY_CRED as QtyCanInv,'+#13+
      'dbo.Data0098.QTY_RECD - dbo.Data0098.QTY_CRED AS alloc_qty, dbo.Data0060.PARTS_ALLOC,Data0098.GLPTR_STATUS,'+#13+
      'data0098.TAX_2, data0015.abbr_name,Data0098.QTY_CRED,'+#13+
      ' Data0098.RKEY, Data0116.MEMO_NUMBER as cust_decl,''退货'' as SHIPMENT_NO'+#13+
      'FROM dbo.Data0098 INNER JOIN'+#13+
      '  dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN'+#13+
      '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY left outer join'+#13+
      'data0015 on data0116.warehouse_ptr=data0015.rkey'+#13+
      'where data0098.rkey='+inttostr(rkey);//+#13+
  //    ' and (data0116.CUST_PTR='+inttostr(edit1.Tag)+')'+#13+
//      ' and (data0116.CURRENCY_PTR='+inttostr(edit5.Tag)+')'+#13+
//      'and (Data0098.GLPTR_STATUS = 0) and (Data0098.QTY_RECD - Data0098.QTY_CRED>='+inttostr(qty)+')';
    Open;
   end;

  if not dm.ADOQuery1.IsEmpty then
  begin
    if DM.ADOQuery1.FieldByName('GLPTR_STATUS').AsBoolean then
    begin
      ShowMsg('EXCEL中第:'+inttostr(RowNo)+'行，状态为开票完成，不能再次开票',1);
      result:=true;
    end
    else
    if DM.ADOQuery1.FieldByName('rkey10').AsInteger<>edit1.Tag then
    begin
      ShowMsg('EXCEL中第:'+inttostr(RowNo)+'行数据错误,客户不一致',1);
      result:=true;
    end
    else if DM.ADOQuery1.FieldByName('rkey01').AsInteger<>edit5.Tag then
    begin
      ShowMsg('EXCEL中第:'+inttostr(RowNo)+'行数据错误,货币不一致',1);
      result:=true;
    end
    else if qty> DM.ADOQuery1.FieldByName('QtyCanInv').AsInteger then
    begin
      ShowMsg('EXCEL中第:'+inttostr(RowNo)+'行数据错误,数量大于可开票数量',1);
      result:=true;
    end
    else if not CheckExcelLoadUnique(rkey,v_type,rowNo) then
    begin
      result:=true;
    end
    else
      result:=false;
  end
  else
  begin
     ShowMsg('EXCEL中第:'+inttostr(RowNo)+'行数据错误,数据库未找到相关的单据',1);
     Result:=true;
  end;
end;

procedure TForm_ysdetail.load_xls_to_sgrid(fileName:String; grid:TStringGrid);
var //从Excel中读取数据到 Grid
  iCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     for iCount:=2 to 65535 do
      begin
       if trim(sheet.cells[iCount,1]) = '' then
         break
       else
        if self.find_excelerror(StrToInt(sheet.cells[iCount,1]),
                                StrToInt(sheet.cells[iCount,2]),
                                StrToInt(sheet.cells[iCount,3]),iCount) then
         begin
         // ShowMsg('EXCEL中第:'+inttostr(iCount)+'行数据错误,请认真检查后再导入!',1);
          Break;
         end
       else
        begin
          grid.RowCount:=grid.RowCount+1;
          grid.Cells[12,iCount-1]:=sheet.cells[iCount,1];      //标识64.rkey 或98.rkey
          grid.Cells[15,iCount-1]:=sheet.cells[iCount,2];      //0 or 1
          grid.Cells[7,iCount-1]:=sheet.cells[iCount,3];       //开票数量
          grid.Cells[8,iCount-1]:=sheet.cells[iCount,4];       //税票日期
          grid.Cells[9,iCount-1]:=sheet.cells[iCount,5];       //税票号
          grid.Cells[10,iCount-1]:=sheet.cells[iCount,6];      //开票价格

          grid.Cells[0,iCount-1]:=dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString; //'销售订单';
          grid.Cells[1,iCount-1]:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          grid.Cells[2,iCount-1]:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          grid.Cells[3,iCount-1]:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString; //'客户订单号';
          grid.Cells[4,iCount-1]:=dm.ADOQuery1.fieldbyname('delivery_no').AsString; //'装箱单号';
          grid.Cells[5,iCount-1]:=dm.ADOQuery1.fieldbyname('date_sailing').AsString; //'出货日期';
          grid.Cells[6,iCount-1]:=dm.ADOQuery1.fieldbyname('alloc_qty').AsString; //'可用数量';
          grid.Cells[11,iCount-1]:=dm.ADOQuery1.fieldbyname('TAX_2').AsString; //税率%;
          grid.Cells[13,iCount-1]:=dm.ADOQuery1.fieldbyname('SHIPMENT_NO').AsString; //批次
          grid.Cells[14,iCount-1]:=dm.ADOQuery1.fieldbyname('cust_decl').AsString;  //报关单号
          grid.Cells[16,iCount-1]:=dm.ADOQuery1.fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

          grid.Cells[17,iCount-1]:=
              FloatToStr(StrToInt(grid.Cells[7,iCount-1]) *
                         dm.ADOQuery1.fieldbyname('PARTS_ALLOC').AsFloat*
                        (1+dm.ADOQuery1.fieldbyname('TAX_2').AsCurrency*0.01));         //'销售金额';

          grid.Cells[18,iCount-1]:=dm.ADOQuery1.fieldbyname('abbr_name').AsString;//工厂
        end;
      end;

     change_bitbtn;
     self.get_price_diff;
     self.re_calculate_qty;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end

end;

procedure TForm_ysdetail.EXCEL2Click(Sender: TObject);
var
 i:integer;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
 begin
  if OpenDialog1.Execute then
   if  stringgrid2.RowCount > 2 then
    if messagedlg('导入新的开票,原有开数据将删除,继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
     begin
      for i:=1 to stringgrid2.RowCount-2 do stringgrid2.Rows[i].Clear;
       stringgrid2.RowCount:=2;
       load_xls_to_sgrid(OpenDialog1.FileName,stringgrid2);
     end
    else
   else
     load_xls_to_sgrid(OpenDialog1.FileName,stringgrid2);
 end;
end;


function TForm_ysdetail.CheckExcelLoadUnique(rkey,
  iType,RowNo: integer): boolean;
var
  i:integer;
begin
  result:=true;
  for i:=1 to StringGrid2.RowCount-2 do    //循环检查是否有重复值
  begin
    if (StrToInt(StringGrid2.Cells[12,i]) = rkey) and (StrToInt(StringGrid2.Cells[15,i]) = iType) then
    begin
      showmessage('Excel文件第：'+IntToStr(rowno)+'行存在重复的指派明细或退货明细,无法导入!');
      Result:=false;
      Break;
    end;
   end;
end;

end.
