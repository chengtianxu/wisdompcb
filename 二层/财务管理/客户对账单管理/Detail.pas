unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBCtrls,
  Mask, Menus,DateUtils,DB, ADODB,Excel2000,OleServer,ComObj;

type
  TForm_Detail = class(TForm)
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
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    EXCEL2: TMenuItem;
    EXCEL1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure StringGrid2Exit(Sender: TObject);
  private
    acc_ptr,newrow,newcol,newrow_1,newcol_1:integer;
    abbrname:string;
    function get_voucher(invoice_date: tdatetime): string;
    function return_vifrkey(sgrid: tstringgrid;pd_col,col: integer;v_if:byte): string;
    function vo_number(number: string): boolean;
    procedure update_64_98(rkey236:integer);
    procedure append_invoice_dedit(rkey236:integer);
    procedure append_ship_rma(rkey236:integer);
    procedure update_sgrid1();
    procedure re_calculate_qty;
    procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
  public
    { Public declarations }
    State:byte;     //1:新增,2:编辑,3:检查
    procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);//从Excel中读取数据到 Grid
    function find_excelerror(rkey,v_type,qty:Integer):Boolean;
  end;

var
  Form_Detail: TForm_Detail;

implementation

uses Demo,Pick_Item_Single ,ConstVar,common,Math, misctooliv, ASSIGN, rma;

{$R *.dfm}

procedure TForm_Detail.BitBtn6Click(Sender: TObject);
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

procedure TForm_Detail.BitBtn4Click(Sender: TObject);
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

procedure TForm_Detail.FormActivate(Sender: TObject);
var
 i:integer;
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
StringGrid1.Cells[10,0]:='对帐金额';
stringgrid1.Cells[11,0]:='税票日期';
stringgrid1.Cells[12,0]:='税票号';
stringgrid1.ColWidths[11]:=-1;
stringgrid1.ColWidths[12]:=-1;
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
stringgrid2.Cells[7,0]:='对帐数量';
stringgrid2.Cells[8,0]:='税率%';
StringGrid2.Cells[9,0]:='标识列';
StringGrid2.Cells[10,0]:='批次';
StringGrid2.Cells[11,0]:='报关单号';
StringGrid2.Cells[12,0]:='出或退';
//stringgrid2.ColWidths[12]:=-1;
stringgrid2.Cells[13,0]:='销售价格';
stringgrid2.Cells[14,0]:='含税金额';
stringgrid2.Cells[15,0]:='工厂简称';
//StringGrid2.Cells[10,stringgrid2.RowCount-1]:='0';
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
    stringgrid2.PopupMenu:=nil;
  //  dtpk1.Enabled:=false;
   end;
  edit8.Text:=dm.ADS236VOUCHER.Value;
  edit10.Text:=dm.ADS236BATCH_NUMBER.Value;
  edit11.Text:=dm.ADS236ENTERED_DT.AsString;
  edit13.Text:=dm.ADS236FYEAR.AsString;
  edit14.Text:=dm.ADS236PERIOD.AsString;
  edit1.Text:=dm.ADS236CUST_CODE.Value;
  label19.Caption:=dm.ADS236CUSTOMER_NAME.Value;
  edit5.Text:=dm.ADS236CURR_CODE.Value;
  label20.Caption:=dm.ADS236CURR_NAME.Value;
  edit1.Tag:=dm.ADS236CUSTOMER_PTR.Value;
  edit5.Tag:=dm.ADS236CURRENCY_PTR.Value;
  Edit3.Text:=dm.ADS236TOOL_AMOUNT.AsString;
  Edit4.Text:=dm.ADS236OTHERS_AMOUNT.AsString;
  Edit6.Text:=dm.ADS236SHIP_AMOUNT.AsString;
  Edit7.Text:=dm.ADS236TAX_AMOUNT.AsString;
  Edit9.Text:=DM.ADS236RECEIVABLE_AMOUNT.AsString;
  if edit5.Tag=1 then
   edit2.ReadOnly:=true
  else
  edit2.ReadOnly:=false;
  edit2.Text:=dm.ADS236EXCHANGE_RATE.AsString;
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
            'data0237.recon_amount,' +#13+
            'Data0112.INVOICE_TOTAL-Data0112.recon_amount+data0237.recon_amount as all_amount,'+#13+
            'POSTED_DATE,data0015.abbr_name FROM Data0112 inner join data0237 on data0112.rkey=data0237.INVOICE_PTR'+#13+
            'left outer join data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
            'where data0237.rkey236_ptr='+dm.ADS236RKEY.AsString+#13+
            'union'+#13+
            'SELECT  Data0116.RKEY, MEMO_NUMBER as invoice_number, RMA_DATE as INVOICE_DATE,'+#13+
           ' 0 as TOOLING_CHARGES, 0 AS ship_tax_amount, AMOUNT as INVOICE_TOTAL,'+#13+
           '  CASE MEMO_TP '+#13+
           ' WHEN 1 THEN ''预收备忘'' '+#13+
           ' WHEN 4 THEN ''退货备忘'' '+#13+
            'WHEN 3 THEN ''无退货'' END AS 类型,'+#13+
            ' GOODS_AMT+SHIPPING+TOOLING_CHARGE as ship_amount,'+#13+
            ' FED_TAX as FED_TAX_AMOUNT,'+#13+
            'data0237.recon_amount,' +#13+
            'Data0116.AMOUNT-Data0116.recon_amount+data0237.recon_amount as all_amount,'+#13+
            'MEMO_DATE as POSTED_DATE,data0015.abbr_name '+#13+
            'FROM Data0116 inner join data0237 on data0116.rkey=data0237.DEBIT_PTR'+#13+
            'left outer join data0015 on data0116.warehouse_ptr=data0015.rkey'+#13+
            'where data0237.rkey236_ptr='+dm.ADS236RKEY.AsString;
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
      stringgrid1.Cells[10,stringgrid1.RowCount-1]:=fieldbyname('recon_amount').AsString;  //对帐金额

//      stringgrid1.Cells[11,stringgrid1.RowCount-1]:=fieldbyname('TAX_DATE').AsString;
//      stringgrid1.Cells[12,stringgrid1.RowCount-1]:=fieldbyname('TAX_NO').AsString;
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
     'Data0060.PARTS_ALLOC, Data0064.TAX_2,Data0060.PART_PRICE,'+#13+
     'Data0064.QUAN_SHIPPED- Data0064.recon_qty+data0237.QUANTITY as alloc_qty,'+#13+
     'data0237.QUANTITY,'+#13+
     'data0015.abbr_name FROM Data0064 INNER JOIN'+#13+
     ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
     '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
     '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
     '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey inner join '+#13+
     '   data0237 on data0237.SO_SHP_PTR=data0064.rkey inner join'+#13+
     '   data0015 on data0439.warehouse_ptr=data0015.rkey'+#13+
     'where data0237.rkey236_ptr='+dm.ADS236RKEY.AsString+#13+
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
        stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('QUANTITY').AsString;         //'对帐数量';
        stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString;            //'税率%';
        stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('rkey').AsString;
        stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
        stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
        stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';
        stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('PART_PRICE').AsString;      //'价格';
        stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('QUANTITY').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('TAX_2').AsFloat*0.01));         //'销售金额';
        stringgrid2.Cells[15,stringgrid2.RowCount-1]:=fieldbyname('abbr_name').AsString;
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
       'dbo.Data0098.QTY_RECD - dbo.Data0098.recon_qty+data0237.QUANTITY AS alloc_qty,'+#13+
       'dbo.Data0060.PARTS_ALLOC, dbo.Data0060.RUSH_CHARGE,Data0060.PART_PRICE,'+#13+
       'dbo.Data0098.RKEY, dbo.Data0116.MEMO_NUMBER,'+#13+
       'data0237.QUANTITY,'+#13+
       'data0015.abbr_name FROM Data0098 INNER JOIN '+#13+
       ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN '+#13+
       '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY inner join'+#13+
       '  data0237 on data0237.RMA_PTR=data0098.rkey inner join '+#13+
       'data0015 on data0060.SHIP_REG_TAX_ID =data0015.rkey'+#13+
       'where data0237.rkey236_ptr='+dm.ADS236RKEY.AsString+#13+
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
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('RUSH_CHARGE').AsString; //'税率%';
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;    //98.rkey
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:='退货';
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('MEMO_NUMBER').AsString;
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('PART_PRICE').AsString;      //'价格';
          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
            FloatToStr(fieldbyname('QUANTITY').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('RUSH_CHARGE').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:=fieldbyname('abbr_name').AsString;
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          next;
        end;
      end;
      self.re_calculate_qty;
 end;

end;

procedure TForm_Detail.Edit11Exit(Sender: TObject);
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

procedure TForm_Detail.update_sgrid1;
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

procedure TForm_Detail.re_calculate_qty;
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
    if  stringgrid2.Cells[12,i]='0' then      //指派装运
     begin
      ship_amout:=ship_amout+
                  strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[13,i]);
      tax_amount:=tax_amount+strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[13,i])
                                *strtocurr(stringgrid2.Cells[8,i])*0.01;
      ky_qty:=ky_qty+ strtoint(stringgrid2.Cells[6,i]);
      kp_qty:=kp_qty+ strtoint(stringgrid2.Cells[7,i]);
     end
    else                                   //退货
     begin
      ship_amout:=ship_amout-
                  strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[13,i]);
      tax_amount:=tax_amount-strtoint(stringgrid2.Cells[7,i])*strtofloat(stringgrid2.Cells[13,i])
                                *strtocurr(stringgrid2.Cells[8,i])*0.01;
      ky_qty:=ky_qty- strtoint(stringgrid2.Cells[6,i]);
      kp_qty:=kp_qty- strtoint(stringgrid2.Cells[7,i]);
     end;
  end;

 stringgrid2.Cells[14,StringGrid2.RowCount-1 ] :=formatfloat('0.00',ship_amout +tax_amount);
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

function TForm_detail.get_voucher(invoice_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 voucher:='CH'+copy(Edit13.Text,3,2);  //年度
 if length(Edit14.Text) < 2 then
  voucher := voucher+'0'+Edit14.Text
 else
  voucher := voucher+Edit14.Text;      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0236');
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
  result:= voucher;  //对帐编号
end;

function TForm_detail.return_vifrkey(sgrid: tstringgrid;
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

procedure TForm_Detail.N1Click(Sender: TObject);
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
            'INVOICE_TYPE,ship_amount,FED_TAX_AMOUNT,recon_amount,'+#13+
            'INVOICE_TOTAL-recon_amount as all_amount,POSTED_DATE,data0015.abbr_name' +#13+
            'FROM  Data0112 left outer join data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
            'WHERE  (INVOICE_STATUS <> 3) AND (INVOICE_TOTAL-recon_amount > 0) AND (INVOICE_TYPE IN (2, 3))'+#13+
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
            ' FED_TAX as FED_TAX_AMOUNT,recon_amount,'+#13+
            'AMOUNT-recon_amount as all_amount,MEMO_DATE as POSTED_DATE,data0015.abbr_name' +#13+
            'FROM   Data0116 left outer join data0015 on data0116.warehouse_ptr=data0015.rkey  '+#13+
           ' WHERE    (memo_status<>3) AND (AMOUNT-recon_amount > 0) and (MEMO_TP = 3)'+#13+
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
     stringgrid1.Cells[10,stringgrid1.RowCount-1]:=form_misctooliv.ads112all_amount.AsString;  //对帐金额

     stringgrid1.Cells[11,stringgrid1.RowCount-1]:=datetostr(curr_date);
     stringgrid1.Cells[13,stringgrid1.RowCount-1]:=form_misctooliv.ads112POSTED_DATE.AsString;
     stringgrid1.Cells[14,stringgrid1.RowCount-1]:=form_misctooliv.ads112abbr_name.AsString;

     stringgrid1.RowCount:=stringgrid1.RowCount+1;
    end;
   //change_bitbtn;
   self.update_sgrid1;
   self.re_calculate_qty;
  end;
finally
 form_misctooliv.Free;
end;
end;


procedure TForm_Detail.N2Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 //change_bitbtn;
 self.update_sgrid1;
 self.re_calculate_qty;
end;

procedure TForm_Detail.N3Click(Sender: TObject);
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
            'WHERE  (INVOICE_STATUS <> 3) AND (INVOICE_TOTAL-recon_amount > 0) AND (INVOICE_TYPE =1)'+#13+
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
           ' WHERE  (memo_status<>3) AND (AMOUNT-recon_amount > 0) and (MEMO_TP = 4)'+#13+
              ' and (CUST_PTR='+inttostr(edit1.Tag)+')'+#13+
              ' and (CURRENCY_PTR='+inttostr(edit5.Tag)+')';
    Prepared;
    open;
   end;

 if form_misctooliv.ShowModal=mrok then
  begin
   rkey64_list:= return_vifrkey(stringgrid2,12,9,0); //15判断,12列返回列为0代表指派
   rkey98_list:= return_vifrkey(stringgrid2,12,9,1); //12列为返回值1代表退货
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
       'data0439.delivery_no, data0439.date_sailing,data0064.cust_decl,Data0060.PART_PRICE,'+#13+
       'Data0064.QUAN_SHIPPED- Data0064.recon_qty as alloc_qty, Data0060.PARTS_ALLOC, Data0064.TAX_2'+#13+
       'FROM   Data0064 INNER JOIN'+#13+
       ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
       '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
       'where (Data0064.QUAN_SHIPPED- Data0064.recon_qty>0) and data0439.invoice_ptr='+form_misctooliv.ads112rkey.AsString+#13;
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
          stringgrid2.Cells[7,stringgrid2.RowCount-1]:=fieldbyname('alloc_qty').AsString; //'对帐数量';
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('TAX_2').AsString; //'税率%';
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:=fieldbyname('SHIPMENT_NO').AsString;
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('cust_decl').AsString;
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('PART_PRICE').AsString; //'销售价格';

          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('alloc_qty').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('TAX_2').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:=form_misctooliv.ads112abbr_name.Value;//工厂
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
       'dbo.Data0098.RMA_DATE, Data0098.QTY_RECD,Data0098.recon_qty,'+#13+
       'dbo.Data0098.QTY_RECD - dbo.Data0098.recon_qty AS alloc_qty,'+#13+
       'dbo.Data0060.PARTS_ALLOC, dbo.Data0060.RUSH_CHARGE,Data0060.PART_PRICE,'+#13+
       'dbo.Data0098.RKEY, dbo.Data0116.MEMO_NUMBER'+#13+
       'FROM         dbo.Data0098 INNER JOIN '+#13+
       ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
       '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN '+#13+
       '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
       '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'+#13+
       'where Data0098.QTY_RECD - Data0098.recon_qty>0 and Data0098.srce_ptr='+form_misctooliv.ads112rkey.AsString+#13;
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
          stringgrid2.Cells[8,stringgrid2.RowCount-1]:=fieldbyname('RUSH_CHARGE').AsString; //'税率%';
          stringgrid2.Cells[9,stringgrid2.RowCount-1]:=fieldbyname('RKEY').AsString;    //98.rkey
          stringgrid2.Cells[10,stringgrid2.RowCount-1]:='退货';
          stringgrid2.Cells[11,stringgrid2.RowCount-1]:=fieldbyname('MEMO_NUMBER').AsString;
          stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';
          stringgrid2.Cells[13,stringgrid2.RowCount-1]:=fieldbyname('PART_PRICE').AsString; //'销售价格';

          stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
           FloatToStr(fieldbyname('alloc_qty').AsInteger * fieldbyname('PARTS_ALLOC').AsFloat*
             (1+fieldbyname('RUSH_CHARGE').AsFloat*0.01));         //'销售金额';
          stringgrid2.Cells[15,stringgrid2.RowCount-1]:=form_misctooliv.ads112abbr_name.Value;//工厂
          stringgrid2.RowCount:=stringgrid2.RowCount+1;

          next;
        end;
      end;
    end;
    self.re_calculate_qty;
  end;
finally
 form_misctooliv.Free;
end;
end;

procedure TForm_Detail.N12Click(Sender: TObject);
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
 
  rkey64_list:= return_vifrkey(stringgrid2,12,9,0); //15列为0代表指派
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
     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('TAX_2').AsString; //'税率%';
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:=form_assign.ads64RKEY.AsString;       //标识列
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_assign.ads64SHIPMENT_NO.AsString;
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_assign.ads64cust_decl.Value;
     stringgrid2.Cells[12,stringgrid2.RowCount-1]:='0';
     stringgrid2.Cells[13,stringgrid2.RowCount-1]:=form_assign.ads64.fieldbyname('PART_PRICE').AsString; //'销售价格';

     stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
       FloatToStr(form_assign.ads64.fieldbyname('alloc_qty').AsInteger *
       form_assign.ads64.fieldbyname('PARTS_ALLOC').AsFloat*
         (1+form_assign.ads64TAX_2.Value*0.01));         //'销售金额';
     stringgrid2.Cells[15,stringgrid2.RowCount-1]:=form_assign.ads64abbr_name.Value;//工厂
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;
    self.re_calculate_qty;
  end;
finally
 form_assign.Free;
end;
end;

procedure TForm_Detail.N14Click(Sender: TObject);
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
  rkey98_list:= return_vifrkey(stringgrid2,12,9,1); //12列为1代表退货
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
     stringgrid2.Cells[8,stringgrid2.RowCount-1]:=form_rma.ads98RUSH_CHARGE.AsString; //'税率%';
     stringgrid2.Cells[9,stringgrid2.RowCount-1]:=form_rma.ads98RKEY.AsString;
     stringgrid2.Cells[10,stringgrid2.RowCount-1]:='退货';
     stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_rma.ads98MEMO_NUMBER.Value;   //备忘编号
     stringgrid2.Cells[12,stringgrid2.RowCount-1]:='1';
     stringgrid2.Cells[13,stringgrid2.RowCount-1]:=form_rma.ads98.fieldbyname('PART_PRICE').AsString; //'销售价格';

     stringgrid2.Cells[14,stringgrid2.RowCount-1]:=
      FloatToStr(form_rma.ads98.fieldbyname('alloc_qty').AsInteger *
                 form_rma.ads98.fieldbyname('PARTS_ALLOC').AsFloat*
       (1+form_rma.ads98RUSH_CHARGE.Value*0.01));         //'销售金额';
     stringgrid2.Cells[15,stringgrid2.RowCount-1]:=form_rma.ads98abbr_name.Value;//工厂
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;
    self.re_calculate_qty;
  end;
finally
 form_rma.Free;
end;
end;

procedure TForm_Detail.N13Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 self.re_calculate_qty;
end;

procedure TForm_Detail.EXCEL2Click(Sender: TObject);
var
 i:integer;
begin
if edit1.Text='' then
 showmsg('请先输入客户代码',1)
else
 begin
  if OpenDialog1.Execute then
   if  stringgrid2.RowCount > 2 then
    if messagedlg('导入新的对帐,原有对帐数据将删除,继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
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

procedure TForm_Detail.EXCEL1Click(Sender: TObject);
begin
if StringGrid2.RowCount > 2 then
 Export_Grid_to_Excel(StringGrid2,'指派明细',[0,1,2,3,4,11])
end;

procedure TForm_Detail.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if self.State=1 then  //新增
 begin
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=self.get_voucher(strtodate(edit11.text));
    messagedlg('对帐单编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;

  try
   dm.ADOConnection1.BeginTrans;
    with dm.ADO236 do                                        //增加客户对帐单总表
    begin
     close;
     dm.ADO236.Parameters[0].Value:=0;
     open;
     append;
     dm.ADO236VOUCHER.Value:=Edit8.Text;                          //对帐编号
     dm.ADO236BATCH_NUMBER.Value:=edit10.Text;                 //参考号
     dm.ADO236ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ADO236ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ADO236FYEAR.Value := strtoint(edit13.Text);               //会计年度
     dm.ADO236PERIOD.Value := strtoint(edit14.Text);              //会计期间
     dm.ADO236CUSTOMER_PTR.Value:=edit1.Tag;                      //客户
     dm.ADO236CURRENCY_PTR.Value:=edit5.Tag;                      //货币
     dm.ADO236EXCHANGE_RATE.AsString:=edit2.Text;                 //汇率
     dm.ADO236TOOL_AMOUNT.AsString:=Edit3.Text;                  //工具费用
     dm.ADO236OTHERS_AMOUNT.AsString:=Edit4.Text;                //杂项费用
     dm.ADO236SHIP_AMOUNT.AsString:=Edit6.Text;                  //出货价款
     dm.ADO236TAX_AMOUNT.AsString:=Edit7.Text;                   //增值税
     dm.ADO236RECEIVABLE_AMOUNT.AsString:=Edit9.Text;            //应收总计
     post;
    end;
   append_invoice_dedit(dm.ADO236RKEY.Value);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0112.rkey'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0112 ON DATA0237.INVOICE_PTR = data0112.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.recon_amount+data0112.recon_amount > data0112.INVOICE_TOTAL';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了应收发票数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0116.rkey'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0116 ON DATA0237.DEBIT_PTR = data0116.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.recon_amount+data0116.recon_amount > data0116.AMOUNT';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了无退货备忘数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

  append_ship_rma(dm.ADO236RKEY.Value);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0064.rkey'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0237.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.QUANTITY+data0064.recon_qty > data0064.QUAN_SHIPPED';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了指派数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0098.rkey'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0237.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.QUANTITY+data0098.recon_qty > data0098.QTY_RECD';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了退货数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   self.update_64_98(dm.ADO236RKEY.Value);

   dm.ADOConnection1.CommitTrans;
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
 
  with dm.ADO236 do                                        //增加客户对帐单总表
   begin
    close;
    dm.ADO236.Parameters[0].Value:=dm.ADS236RKEY.Value;
    open;
   end;
  if (dm.ADO236STATUS.Value=1) or (dm.ADO236.IsEmpty) then
   begin
    messagedlg('保存时遇到错误,对帐单状态已发生变化!',mterror,[mbcancel],0);
    exit;
   end;

  try
   dm.ADOConnection1.BeginTrans;
    with dm.ADO236 do                                        //增加客户对帐总表
    begin
     edit;
     dm.ADO236BATCH_NUMBER.Value:=edit10.Text;               //参考号
     dm.ADO236ENTERED_BY_EMPL_PTR.Value:=strtoint(user_ptr); //输入人员
     dm.ADO236ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ADO236EXCHANGE_RATE.AsString:=edit2.Text;            //汇率
     dm.ADO236TOOL_AMOUNT.AsString:=Edit3.Text;                  //工具费用
     dm.ADO236OTHERS_AMOUNT.AsString:=Edit4.Text;                //杂项费用
     dm.ADO236SHIP_AMOUNT.AsString:=Edit6.Text;                  //出货价款
     dm.ADO236TAX_AMOUNT.AsString:=Edit7.Text;                   //增值税
     dm.ADO236RECEIVABLE_AMOUNT.AsString:=Edit9.Text;            //应收总计
     post;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set recon_amount=data0112.recon_amount-DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0112 ON DATA0237.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉112对帐金额
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set recon_amount=data0116.recon_amount-DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0116 ON DATA0237.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉116对帐金额
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set recon_qty=data0064.recon_qty-DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0237.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉64对帐数量
    end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set recon_qty=data0098.recon_qty-DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0237.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;
    end;                 //去掉98对帐数量

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='delete data0237 '+
               'where rkey236_ptr ='+dm.ADO236RKEY.AsString;
     ExecSQL;
    end;

   append_invoice_dedit(dm.ADO236RKEY.Value);

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0112.rkey'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0112 ON DATA0237.INVOICE_PTR = data0112.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.recon_amount+data0112.recon_amount > data0112.INVOICE_TOTAL';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了应收发票数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0116.rkey'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0116 ON DATA0237.DEBIT_PTR = data0116.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.recon_amount+data0116.recon_amount > data0116.AMOUNT';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了无退货备忘数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;
    
  self.append_ship_rma(dm.ADO236RKEY.Value);
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0064.rkey'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0237.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.QUANTITY+data0064.recon_qty > data0064.QUAN_SHIPPED';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了指派数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0098.rkey'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0237.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString+#13+
              'and DATA0237.QUANTITY+data0098.recon_qty > data0098.QTY_RECD';
     open;
     if not IsEmpty then
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg('对帐失败,可能多用户同时操作了退货数据!', mterror,[mbcancel],0);
       exit;
      end;
    end;
   self.update_64_98(dm.ADO236RKEY.Value);
   
   dm.ADOConnection1.CommitTrans;
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

function TForm_detail.vo_number(number: string): boolean;
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

procedure TForm_detail.append_invoice_dedit(rkey236:integer);
var
 i:integer;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select rkey236_ptr,INVOICE_PTR,DEBIT_PTR,recon_amount '+
               'from data0237 where rkey236_ptr is null';
     open;
    end;
   for i:=1 to stringgrid1.RowCount-2 do
   if strtocurr(stringgrid1.Cells[10,i]) > 0 then
    if strtoint(stringgrid1.Cells[8,i])=0 then //发票
     dm.ADOQuery1.AppendRecord([rkey236,
                                strtoint(stringgrid1.Cells[7,i]),
                                nil,
                                strtocurr(stringgrid1.Cells[10,i])])

    else                                        //退货
     dm.ADOQuery1.AppendRecord([rkey236, nil,
                                strtoint(stringgrid1.Cells[7,i]),
                                strtocurr(stringgrid1.Cells[10,i])]);
end;

procedure TForm_detail.append_ship_rma(rkey236:integer);
var
 i:integer;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select rkey236_ptr,SO_SHP_PTR,RMA_PTR,QUANTITY '+
               'from data0237 where rkey236_ptr is null';
     open;
    end;

  for i:=1 to stringgrid2.RowCount-2 do
   if strtoint(stringgrid2.Cells[7,i]) > 0 then
    if strtoint(stringgrid2.Cells[12,i])=0 then //指派
     dm.ADOQuery1.AppendRecord([rkey236,
                                strtoint(stringgrid2.Cells[9,i]),
                                nil,
                                strtoint(stringgrid2.Cells[7,i])])

    else                                        //退货
     dm.ADOQuery1.AppendRecord([rkey236, nil,
                                strtoint(stringgrid2.Cells[9,i]),
                                strtoint(stringgrid2.Cells[7,i])]);

end;

procedure TForm_detail.update_64_98(rkey236: integer);
begin

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set recon_amount=data0112.recon_amount+DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'Data0112 ON DATA0237.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+inttostr(rkey236);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set recon_amount=data0116.recon_amount+DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'Data0116 ON DATA0237.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+inttostr(rkey236);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set recon_qty=recon_qty+DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0237.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+inttostr(rkey236);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set recon_qty=recon_qty+DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0237.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+inttostr(rkey236);
     ExecSQL;
    end;

end;

procedure TForm_Detail.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
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

procedure TForm_Detail.StringGrid1Exit(Sender: TObject);
begin
if (StringGrid1.col=10)  then
 begin
  self.update_sgrid1;
  self.re_calculate_qty;
 end;
end;

procedure TForm_Detail.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if StringGrid1.Row <> StringGrid1.RowCount-1 then
if (key=13) and (StringGrid1.Col>9) then
 StringGrid1.Row:=StringGrid1.Row+1;
end;

procedure TForm_Detail.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if (StringGrid1.Col=10)  then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row])>0  then abort;
end;

procedure TForm_Detail.StringGrid1KeyUp(Sender: TObject; var Key: Word;
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

procedure TForm_Detail.StringGrid1MouseDown(Sender: TObject;
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

procedure TForm_Detail.StringGrid1SelectCell(Sender: TObject; ACol,
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

procedure TForm_Detail.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row= stringgrid1.RowCount-1 then
 n2.Enabled:=false
else
 n2.Enabled:=true; 
end;

procedure TForm_Detail.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
{  if (ACol = 8 ) and (ARow<>stringgrid2.RowCount-1) then
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
    dtpk1.Visible :=false; }
 end;

if stringgrid2.Cells[10,ARow]='退货' then   //退货
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

procedure TForm_Detail.StringGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if StringGrid2.Row <> StringGrid2.RowCount-1 then
if (key=13) and ((StringGrid2.Col=7) or (StringGrid2.Col=9) or
   (StringGrid2.Col=8) or (StringGrid2.Col=10)) then
 StringGrid2.Row:=StringGrid2.Row+1;
end;

procedure TForm_Detail.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
 if StringGrid2.Col=7 then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid2.Cells[StringGrid2.Col,StringGrid2.Row])>0  then abort;
end;

procedure TForm_Detail.StringGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (StringGrid2.Col=7) and (StringGrid2.Row<>StringGrid2.RowCount-1) then
 begin
  if StringGrid2.Cells[7,StringGrid2.Row]='' then StringGrid2.Cells[7,StringGrid2.Row]:='0';
  if strtoint(StringGrid2.Cells[7,StringGrid2.Row])>
     strtoint(StringGrid2.Cells[6,StringGrid2.Row]) then
   StringGrid2.Cells[7,StringGrid2.Row] := StringGrid2.Cells[6,StringGrid2.Row];
 end;
end;

procedure TForm_Detail.StringGrid2MouseDown(Sender: TObject;
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
   if (Row=0) and (column in [0,1,2,3,4,5,8,12]) then
   begin
    GetSort(StringGrid2,column);
   end;
  end;
end;

procedure TForm_Detail.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if (StringGrid2.col=7)  then  //'对帐数量';
 begin
  if stringgrid2.Row<> stringgrid2.RowCount-1 then
  stringgrid2.Cells[14,stringgrid2.Row]:=
      FloatToStr(StrToInt(stringgrid2.Cells[7,stringgrid2.Row]) *
                 StrToFloat(stringgrid2.Cells[13,stringgrid2.Row])*
       (1+strtocurr(stringgrid2.Cells[8,stringgrid2.Row])*0.01));         //'销售金额';
  re_calculate_qty;
 end;
 
if ARow = StringGrid2.RowCount-1 then
 StringGrid2.Options:=StringGrid2.Options-[goEditing]
else
 if (acol=7) and (self.State<>3) then
   StringGrid2.Options:=StringGrid2.Options+[goEditing]
 else
  StringGrid2.Options:=StringGrid2.Options-[goEditing];

 newrow:=arow;
 newcol:=acol;
 StringGrid2.Refresh;
end;

procedure TForm_detail.GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
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

procedure TForm_Detail.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm_Detail.PopupMenu2Popup(Sender: TObject);
begin
if stringgrid2.Row= stringgrid2.RowCount-1 then
 n13.Enabled:=false
else
 n13.Enabled:=true;
end;

procedure TForm_Detail.load_xls_to_sgrid(fileName:String; grid:TStringGrid);
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
     ShowMessage('456');
     for iCount:=2 to 65535 do
      begin
       if trim(sheet.cells[iCount,1]) = '' then
         break
       else
        if self.find_excelerror(StrToInt(sheet.cells[iCount,1]),
                                StrToInt(sheet.cells[iCount,2]),
                                StrToInt(sheet.cells[iCount,3])) then
         begin
          ShowMsg('EXCEL中第:'+inttostr(iCount)+'行数据错误,请认真检查后再导入!',1);
          Break;
         end
       else
        begin
          ShowMessage('123');
          grid.RowCount:=grid.RowCount+1;
          grid.Cells[9,iCount-1]:=sheet.cells[iCount,1];      //标识64.rkey 或98.rkey
          grid.Cells[12,iCount-1]:=sheet.cells[iCount,2];      //0 or 1
          grid.Cells[7,iCount-1]:=sheet.cells[iCount,3];       //对帐数量
          grid.Cells[0,iCount-1]:=dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString; //'销售订单';
          grid.Cells[1,iCount-1]:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString; //本厂编号';
          grid.Cells[2,iCount-1]:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString; //'客户型号';
          grid.Cells[3,iCount-1]:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString; //'客户订单号';
          grid.Cells[4,iCount-1]:=dm.ADOQuery1.fieldbyname('delivery_no').AsString; //'装箱单号';
          grid.Cells[5,iCount-1]:=dm.ADOQuery1.fieldbyname('date_sailing').AsString; //'出货日期';
          grid.Cells[6,iCount-1]:=dm.ADOQuery1.fieldbyname('alloc_qty').AsString; //'可用数量';
          grid.Cells[8,iCount-1]:=dm.ADOQuery1.fieldbyname('TAX_2').AsString; //税率%;
          grid.Cells[10,iCount-1]:=dm.ADOQuery1.fieldbyname('SHIPMENT_NO').AsString; //批次
          grid.Cells[11,iCount-1]:=dm.ADOQuery1.fieldbyname('cust_decl').AsString;  //报关单号
          grid.Cells[13,iCount-1]:=dm.ADOQuery1.fieldbyname('PARTS_ALLOC').AsString; //'销售价格';

          grid.Cells[14,iCount-1]:=
              FloatToStr(StrToInt(grid.Cells[7,iCount-1]) *
                         dm.ADOQuery1.fieldbyname('PARTS_ALLOC').AsFloat*
                        (1+dm.ADOQuery1.fieldbyname('TAX_2').AsCurrency*0.01));         //'销售金额';

          grid.Cells[15,iCount-1]:=dm.ADOQuery1.fieldbyname('abbr_name').AsString;//工厂
        end;
      end;
     self.re_calculate_qty;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end
end;

function TForm_Detail.find_excelerror(rkey, v_type,
  qty: Integer): Boolean;
begin
 if v_type=0 then
   with dm.ADOQuery1 do
   begin
     close;
     sql.Text:=
      'SELECT dbo.Data0064.RKEY, dbo.Data0060.SALES_ORDER,'+#13+
      ' dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
      ' dbo.Data0097.PO_NUMBER, dbo.data0439.delivery_no, dbo.data0439.date_sailing,'+#13+
      'Data0064.QUAN_SHIPPED,Data0060.PARTS_ALLOC, data0064.cust_decl,'+#13+
      'Data0064.TAX_2, dbo.Data0112.invoice_number,data0064.SHIPMENT_NO,'+#13+
      ' Data0064.ovsh_qty,Data0064.QUAN_SHIPPED- Data0064.recon_qty as alloc_qty,'+#13+
      'data0015.abbr_name'+#13+
      'FROM   dbo.Data0064 INNER JOIN'+#13+
      '  dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      '  dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
      '  dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'+#13+
      '  dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RKEY left outer join'+#13+
      'data0015 on data0112.warehouse_ptr=data0015.rkey'+#13+
      'where data0064.rkey='+inttostr(rkey)+#13+
      ' and (data0112.CUSTOMER_PTR='+inttostr(edit1.Tag)+')'+#13+
      ' and (data0112.CURRENCY_PTR='+inttostr(edit5.Tag)+')'+#13+
      ' and (Data0064.QUAN_SHIPPED- Data0064.recon_qty>='+inttostr(qty)+')';
     open;
   end
 else
  with dm.ADOQuery1 do
   begin
     close;
     sql.Text:=
      'SELECT Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'+#13+
      'Data0097.PO_NUMBER, Data0098.RMA_NUMBER as delivery_no,Data0098.RMA_DATE as date_sailing, Data0098.QTY_RECD,'+#13+
      'dbo.Data0098.QTY_RECD - dbo.Data0098.recon_qty AS alloc_qty, dbo.Data0060.PARTS_ALLOC,'+#13+
      'Data0060.RUSH_CHARGE as TAX_2, data0015.abbr_name,Data0098.QTY_CRED,'+#13+
      ' Data0098.RKEY, Data0116.MEMO_NUMBER as cust_decl,''退货'' as SHIPMENT_NO'+#13+
      'FROM dbo.Data0098 INNER JOIN'+#13+
      '  dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY INNER JOIN'+#13+
      '  dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY left outer join'+#13+
      'data0015 on data0116.warehouse_ptr=data0015.rkey'+#13+
      'where data0098.rkey='+inttostr(rkey)+#13+
      ' and (data0116.CUST_PTR='+inttostr(edit1.Tag)+')'+#13+
      ' and (data0116.CURRENCY_PTR='+inttostr(edit5.Tag)+')'+#13+
      ' and (Data0098.QTY_RECD - Data0098.recon_qty>='+inttostr(qty)+')';
    Open;
   end;

  if dm.ADOQuery1.IsEmpty then
   result:=true
  else
   Result:=False;
end;
procedure TForm_Detail.StringGrid2Exit(Sender: TObject);
begin
if (StringGrid2.col=7)  then
 begin
  if stringgrid2.Row<> stringgrid2.RowCount-1 then
  stringgrid2.Cells[14,stringgrid2.Row]:=
      FloatToStr(StrToInt(stringgrid2.Cells[7,stringgrid2.Row]) *
                 StrToFloat(stringgrid2.Cells[13,stringgrid2.Row])*
       (1+strtocurr(stringgrid2.Cells[8,stringgrid2.Row])*0.01));         //'销售金额'; 
  re_calculate_qty;
 end;
end;

end.
