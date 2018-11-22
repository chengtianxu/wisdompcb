unit damo;

interface

uses
  SysUtils, Classes, DB,Dialogs, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO192: TADOQuery;
    ADO0439: TADOQuery;
    DataSource3: TDataSource;
    ADO0439rkey: TAutoIncField;
    ADO0439delivery_no: TStringField;
    ADO0439customer_ptr: TIntegerField;
    ADO0439ship_addr_ptr: TIntegerField;
    ADO0439employee_ptr: TIntegerField;
    ADO0439shipping_method: TStringField;
    ADO0439fob: TStringField;
    ADO0439cartons_no: TIntegerField;
    ADO0439weight: TFloatField;
    ADO0439net_weight: TFloatField;
    ADO0439date_sailing: TDateTimeField;
    ADO0439cust_code: TStringField;
    ADO0439customer_name: TStringField;
    ADO0439location: TStringField;
    ADO0439employee_name: TStringField;
    ADO0439date_ent: TDateTimeField;
    ADO0439unit_ptr: TIntegerField;
    ADO0439charge: TFloatField;
    ADO0439reference_number: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADO0439invoice_ptr: TIntegerField;
    ADO0439currency_ptr: TIntegerField;
    ADO0439SHIP_TO_CONTACT: TStringField;
    ADO0439SHIP_TO_FAX: TStringField;
    ADO04: TADOStoredProc;
    ADO04CONTROL_NO_LENGTH: TSmallintField;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    aq43911: TADOStoredProc;
    ADOQuery4: TADOStoredProc;
    ADOQuery4rkey: TAutoIncField;
    ADOQuery4so_ptr: TIntegerField;
    ADOQuery4packing_list_ptr: TIntegerField;
    ADOQuery4packing_slip_flag: TStringField;
    ADOQuery4sales_order: TStringField;
    ADOQuery4po_number: TStringField;
    ADOQuery4po_date: TDateTimeField;
    ADOQuery4employee_name: TStringField;
    ADOQuery4DATE_SHIPPED: TDateTimeField;
    ADOQuery4QUAN_SHIPPED: TIntegerField;
    ADOQuery4ovsh_qty: TIntegerField;
    ADO0439Remark: TStringField;
    ADO0439C_N: TIntegerField;
    ADO192unit_ptr: TIntegerField;
    ADO192unit_code: TStringField;
    ADO192unit_name: TStringField;
    ADOQuery4fob: TStringField;
    ADOQuery4REFERENCE_NUMBER: TStringField;
    ADOTa64: TADOQuery;
    ADOTa64SALES_ORDER: TStringField;
    ADOTa64SCH_DATE: TDateTimeField;
    ADOTa64ITEM_NBR: TStringField;
    ADOTa64COD_FLAG: TStringField;
    ADOTa64rkey60: TAutoIncField;
    ADOTa64PARTS_ORDERED: TFloatField;
    ADOTa64PARTS_SHIPPED: TFloatField;
    ADOTa64PARTS_RETURNED: TFloatField;
    ADOTa64SHIPPING_METHOD: TStringField;
    ADOTa64CURRENCY_PTR: TIntegerField;
    ADOTa64PART_PRICE: TFloatField;
    ADOTa64STATUS: TWordField;
    ADOTa64fob: TStringField;
    ADOTa64REFERENCE_NUMBER: TStringField;
    ADOTa64CUST_CODE: TStringField;
    ADOTa64CUSTOMER_NAME: TStringField;
    ADOTa64SHIPMENT_NO: TSmallintField;
    ADOTa64ovsh_discount: TBCDField;
    ADOTa64DATE_ASSIGN: TDateTimeField;
    ADOTa64QUAN_SHIPPED: TIntegerField;
    ADOTa64DATE_SHIPPED: TDateTimeField;
    ADOTa64PACKING_SLIP_FLAG: TStringField;
    ADOTa64total_case: TFloatField;
    ADOTa64rkey64: TAutoIncField;
    ADOTa64packing_list_ptr: TIntegerField;
    ADOTa64SHIP_TO_ADDRESS_1: TStringField;
    ADOTa64SHIP_TO_CONTACT: TStringField;
    ADOTa64SHIP_TO_PHONE: TStringField;
    ADOTa64LOCATION: TStringField;
    ADOTa64STATE: TStringField;
    ADOTa64ZIP: TStringField;
    ADOTa64OPEN_SOS: TSmallintField;
    ADOTa64PO_DATE: TDateTimeField;
    ADOTa64PO_NUMBER: TStringField;
    ADOTa64CURR_CODE: TStringField;
    ADOTa64CURR_NAME: TStringField;
    ADOTa64EMPLOYEE_NAME: TStringField;
    ADOTa64CUST_SHIP_ADDR_PTR: TIntegerField;
    ADOTa64CUSTOMER_PTR: TIntegerField;
    ADOTa64PURCHASE_ORDER_PTR: TIntegerField;
    ADOTa64CUST_PART_PTR: TIntegerField;
    ADO0439print_date: TDateTimeField;
    ADOup64: TADOQuery;
    ADO6411: TADOStoredProc;
    ADO6411RKEY: TAutoIncField;
    ADO6411FILE_POINTER: TIntegerField;
    ADO6411SOURCE_TYPE: TSmallintField;
    ADO6411NOTE_PAD_LINE_1: TStringField;
    ADO6411NOTE_PAD_LINE_2: TStringField;
    ADO6411NOTE_PAD_LINE_3: TStringField;
    ADO6411NOTE_PAD_LINE_4: TStringField;
    ADO6411memo_text: TMemoField;
    ADOup64remark: TStringField;
    ADO0439fh_location: TStringField;
    ADOupdate52: TADOQuery;
    ADOTa64INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADO192custcoship: TStringField;
    ADOQuery4weigth: TFloatField;
    ADOTa64weigth: TFloatField;
    ADO0439Remark_bak: TStringField;
    ADOTa64COMMISION_ON_TOOLING: TStringField;
    ADOQuery4MANU_PART_NUMBER: TStringField;
    ADOQuery4MANU_PART_DESC: TStringField;
    ADOQuery4assigntype: TStringField;
    ADOTa64MANU_PART_NUMBER: TStringField;
    ADOTa64MANU_PART_DESC: TStringField;
    ADOTa64assigntype: TStringField;
    ADOTa64DO_SMOOTHING: TWordField;
    ADO0439APPLY_IN_TRANSIT: TWordField;
    ADO0439cod_flag: TStringField;
    ADO0439abbr_name: TStringField;
    ADO0439invoice: TStringField;
    ADOTa64rkey15: TIntegerField;
    ADOTa64abbr_name: TStringField;
    ADOTa64WAREHOUSE_CODE: TStringField;
    ADO0439warehouse_ptr: TIntegerField;
    ADO0439warehouse_code: TStringField;
    ADOTa64CUSTOMER_TYPE: TIntegerField;
    dspcmp: TDataSetProvider;
    cds439cmpold: TClientDataSet;
    cds64cmpold: TClientDataSet;
    qrytmp: TADOQuery;
    cds439cmpnow: TClientDataSet;
    cds64cmpnow: TClientDataSet;
    ADOTa64ORIG_CUSTOMER: TStringField;
    ADO0439AMOUNT: TBCDField;
    ADO0439TSTATUS: TWordField;
    ADO0439shipadvice_ptr: TIntegerField;
    ADO0439ShipRemark: TMemoField;
    ADO0439SALES_REP_PTR: TIntegerField;
    ADO0439SALES_REP_Date: TDateTimeField;
    ADO0439depotAccept_PTR: TIntegerField;
    ADO0439depotAccept_Date: TDateTimeField;
    ADO0439depotAccept_Remark: TStringField;
    ADO0439depotSubmit_PTR: TIntegerField;
    ADO0439depotSubmit_Date: TDateTimeField;
    ADO0439Finance_PTR: TIntegerField;
    ADO0439Finance_Date: TDateTimeField;
    ADO0439Finance_Remark: TStringField;
    ADO0439iStatus: TWordField;
    ADO0439overship_flag: TWordField;
  private
    { Private declarations }
  public
    { Public declarations }
//   function cacl_pkqmout(rkey439: integer): currency;
 //  function cacl_deficiency(rkey10: integer): currency;
   function sql_codflag(rkey439: integer):boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
{
function TDM.cacl_deficiency(rkey10: integer): currency;
var
 V_defi:currency;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE)');
   sql.Add('AS total_amount FROM dbo.Data0112');
   sql.Add('where customer_ptr='+inttostr(rkey10));
   sql.Add('and invoice_status=1');
   sql.Add('group by customer_ptr');
   open;
   if not isempty then
    v_defi:= fieldvalues['total_amount']
   else
    v_defi:=0;
  end;  //计算用户所开出发票的所欠金额

 with dm.ADOQuery1 do     //计算用户贷项备忘
  begin
   close;
   sql.Clear;
   sql.Add('SELECT SUM(AVL_AMT * EX_RATE)');
   sql.Add('AS total_amount FROM dbo.Data0116');
   sql.Add('where CUST_PTR='+inttostr(rkey10));
   sql.Add('and memo_status=1');
   sql.Add('group by CUST_PTR');
   open;
   if not isempty then
    result:=fieldvalues['total_amount']-v_defi
   else
    result:=-v_defi;     //变为负钱意义为我公司欠客户的钱
  end;

end;  }

{function Tdm.cacl_pkqmout(rkey439: integer): currency;
var
 V_defi:currency;
begin
with dm.ADOQuery1 do    //送货数量价格计算
 begin
  close;
  sql.Text:=
  'SELECT ROUND(SUM((Data0064.QUAN_SHIPPED * Data0060.PARTS_ALLOC) *'+#13+
        '(1 + Data0060.RUSH_CHARGE * 0.01) / Data0060.EXCH_RATE),'+#13+
        '    2) AS amount'+#13+
  'FROM    Data0064 INNER JOIN'+#13+
  'Data0060 ON Data0064.SO_PTR = Data0060.RKEY'+#13+
  'WHERE (Data0064.packing_list_ptr ='+inttostr(rkey439)+')';
  open;
  v_defi:= fieldbyname('amount').AsCurrency;
 end;
with dm.ADOQuery1 do       //送货工具费用计算
 begin
  close;
  sql.Text:=
'SELECT     Data0060.TOTAL_ADD_L_PRICE, Data0060.tax_in_price,'+#13+
' Data0060.EXCH_RATE, Data0060.RUSH_CHARGE'+#13+
'FROM         Data0064 INNER JOIN'+#13+
'dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY'+#13+
'WHERE     (dbo.Data0064.packing_list_ptr = '+inttostr(rkey439)+')'+#13+
'GROUP BY Data0060.SALES_ORDER, Data0060.TOTAL_ADD_L_PRICE,'+#13+
'Data0060.tax_in_price, Data0060.EXCH_RATE,'+#13+
'Data0060.RUSH_CHARGE';
  open;
 end;
while not dm.ADOQuery1.Eof do
 begin
  if dm.ADOQuery1.FieldByName('tax_in_price').AsString='N' then
   v_defi:=v_defi+
   dm.ADOQuery1.FieldByName('TOTAL_ADD_L_PRICE').AsFloat*
   (1+dm.ADOQuery1.FieldByName('RUSH_CHARGE').AsFloat*0.01)/
    dm.ADOQuery1.FieldByName('EXCH_RATE').AsFloat
  else
   v_defi:=v_defi+
   dm.ADOQuery1.FieldByName('TOTAL_ADD_L_PRICE').AsFloat/
    dm.ADOQuery1.FieldByName('EXCH_RATE').AsFloat;
  dm.ADOQuery1.Next;
 end;
result:=v_defi;        //本次送货客户欠我公司的应付帐款
end;  }

function TDM.sql_codflag(rkey439: integer): boolean;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='SELECT top 1 Data0097.PO_NUMBER,Data0025.MANU_PART_NUMBER,'+
              'ISNULL(derivedtbl_1.qty, 0) AS qty,SUM(Data0060.PARTS_SHIPPED) AS qtyed '+
              'FROM Data0060 INNER JOIN '+
              'Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN '+
              'Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN '+
              'Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN '+
              '(SELECT Data0060_1.CUST_PART_PTR,Data0060_1.PURCHASE_ORDER_PTR '+
              'FROM   Data0064 INNER JOIN Data0060 AS Data0060_1 ON Data0064.SO_PTR = Data0060_1.RKEY '+
              'WHERE (Data0064.packing_list_ptr = '+inttostr(rkey439)+') and ((data0064.part_price>0) or (Data0060_1.TOTAL_ADD_L_PRICE>0)) '+
              'GROUP BY Data0060_1.CUST_PART_PTR,Data0060_1.PURCHASE_ORDER_PTR) AS derivedtbl_2 ON '+
              'Data0060.CUST_PART_PTR = derivedtbl_2.CUST_PART_PTR AND Data0060.PURCHASE_ORDER_PTR = derivedtbl_2.PURCHASE_ORDER_PTR LEFT OUTER JOIN '+
              '(SELECT Data0152.PO_NUMBER,Data0152.MANU_PART_NUMBER,SUM(Data0152.all_shipqty) AS qty '+
              'FROM Data0114 INNER JOIN Data0152 ON Data0152.srce_ptr=Data0114.rkey '+
              'WHERE (Data0152.all_shipqty > 0) AND (Data0114.TTYPE = 2) '+
              'GROUP BY Data0152.PO_NUMBER,Data0152.MANU_PART_NUMBER) AS derivedtbl_1 ON '+
              'Data0097.PO_NUMBER = derivedtbl_1.PO_NUMBER AND Data0025.MANU_PART_NUMBER = derivedtbl_1.MANU_PART_NUMBER '+
              'GROUP BY Data0097.PO_NUMBER,Data0025.MANU_PART_NUMBER,derivedtbl_1.qty '+
              'HAVING  (ISNULL(derivedtbl_1.qty,0) - SUM(Data0060.PARTS_SHIPPED) < 0)';
    open;
    if dm.ADOQuery1.IsEmpty then
      result:=false
    else
      result:=true;
  end;
end;

end.

