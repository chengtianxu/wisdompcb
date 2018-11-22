unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Variants;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource4: TDataSource;
    AQ97: TADOQuery;
    AQ6011: TADOQuery;
    AQ106011: TADOQuery;
    AQ179: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery5: TADOQuery;
    AQ04: TADOStoredProc;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    aq192: TADOQuery;
    aq192artaxontax: TStringField;
    aq192aptaxontax: TStringField;
    DataSource3: TDataSource;
    DataSource5: TDataSource;
    AQ0493: TADOQuery;
    AQ0493Company_Name: TStringField;
    AQ0493ship_address: TStringField;
    AQ0493Company_Icon: TBlobField;
    AQ0493SITE_INFO_ADD_1: TStringField;
    AQ0493SITE_INFO_ADD_2: TStringField;
    AQ0493SITE_INFO_ADD_3: TStringField;
    AQ0493SITE_INFO_PHONE: TStringField;
    DataSource6: TDataSource;
    AQ0493Company_name2: TStringField;
    AQ0493Company_name3: TStringField;
    aq192QTE_control2: TWordField;
    aq192ppc_control15: TWordField;
    aq192custcitool: TStringField;
    aq192custciprod: TStringField;
    aq192suplcimat: TStringField;
    ADO360: TADOQuery;
    ADO360rkey: TAutoIncField;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    ADOSP1: TADOStoredProc;
    ADOSPprice: TADOStoredProc;
    ADOSPpoprice: TADOStoredProc;
    aq192custciship: TStringField;
    ado60: TADOStoredProc;
    ado60SALES_ORDER: TStringField;
    ado60PARTS_ORDERED: TFloatField;
    ado60PART_PRICE: TFloatField;
    ado60TOTAL_ADD_L_PRICE: TFloatField;
    ado60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ado60EXCH_RATE: TFloatField;
    ado60CURR_NAME: TStringField;
    ado60CURR_CODE: TStringField;
    ado60ent_date: TDateTimeField;
    ado60SHIPPING_METHOD: TStringField;
    Aqinfor90: TADOStoredProc;
    Aqinfor90DEPT_NAME: TStringField;
    Aqinfor90EMPLOYEE_NAME: TStringField;
    Aqinfor90auth_date: TDateTimeField;
    Aqinfor90rkey: TIntegerField;
    Aqinfor90dept_ptr: TIntegerField;
    Aqinfor90auth_flag: TStringField;
    ado90: TADOStoredProc;
    ado90rkey: TAutoIncField;
    ado90pact_ptr: TIntegerField;
    ado90dept_ptr: TIntegerField;
    ado90user_ptr: TIntegerField;
    ado90auth_date: TDateTimeField;
    ado90if_puthdate: TWordField;
    ado90puth_info: TStringField;
    ADO0278: TADOStoredProc;
    ADO0278RKEY: TIntegerField;
    ADO0278PARAMETER_NAME: TStringField;
    ADO0278PARAMETER_DESC: TStringField;
    ADO0278UNIT_NAME: TStringField;
    ado278: TADOStoredProc;
    ado278RKEY: TIntegerField;
    ado278PARAMETER_PTR: TIntegerField;
    ado278SEQ_NO: TIntegerField;
    Aq0060: TADOStoredProc;
    Aq0060SALES_ORDER: TStringField;
    Aq0060PARTS_ORDERED: TFloatField;
    Aq0060PART_PRICE: TFloatField;
    Aq0060ORIG_REQUEST_DATE: TDateTimeField;
    ADOq62: TADOStoredProc;
    ADOQ102: TADOStoredProc;
    ado06: TADOStoredProc;
    ado06CUT_NO: TStringField;
    ado06WORK_ORDER_NUMBER: TStringField;
    ado06PROD_STATUS: TSmallintField;
    ado06PLANNED_QTY: TIntegerField;
    ado06ISSUED_QTY: TIntegerField;
    ado06QUAN_SCH: TFloatField;
    ado89: TADOStoredProc;
    ado89rkey: TAutoIncField;
    ado89pact_ptr: TIntegerField;
    ado89cust_part_ptr: TIntegerField;
    ado89parameter_ptr: TIntegerField;
    ado89tvalue: TStringField;
    ado89parameter_name: TStringField;
    ado89parameter_desc: TStringField;
    ado89unit_name: TStringField;
    ADupdate50: TADOStoredProc;
    ADOupdate25: TADOStoredProc;
    AQ62: TADOStoredProc;
    AQ102: TADOStoredProc;
    ADO0278SPEC_RKEY: TStringField;
    ado89SPEC_RKEY: TStringField;
    ado60unit_sq: TFloatField;
    ado60mianji: TFloatField;
    ado60fob: TStringField;
    Aq0060ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery6: TADOQuery;
    AQ62RKEY: TAutoIncField;
    AQ62SO_PTR: TIntegerField;
    AQ62ADDL_CAT_PTR: TIntegerField;
    AQ62AMOUNT: TFloatField;
    AQ62FREE_AMOUNT: TFloatField;
    AQ62TAX_FLAG: TStringField;
    ADOq62RKEY: TAutoIncField;
    ADOq62SO_PTR: TIntegerField;
    ADOq62ADDL_CAT_PTR: TIntegerField;
    ADOq62AMOUNT: TFloatField;
    ADOq62FREE_AMOUNT: TFloatField;
    ADOq62TAX_FLAG: TStringField;
    ADOQuery1: TADODataSet;
    ADOQuery1D60RKEY: TAutoIncField;
    ADOQuery1CUST_PART_PTR: TIntegerField;
    ADOQuery1D60SALES_ORDER: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1D10CUSTOMER_NAME: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1PURCHASE_ORDER_PTR: TIntegerField;
    ADOQuery1D60STATUS: TWordField;
    ADOQuery1RMA_PTR: TIntegerField;
    ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery1CONF_DATE: TDateTimeField;
    ADOQuery1D60PROD_REL: TStringField;
    ADOQuery1MFG_ORDER_DATE: TDateTimeField;
    ADOQuery1D5EMPLOYEE_NAME: TStringField;
    ADOQuery1REFERENCE_NUMBER: TStringField;
    ADOQuery1ORIG_REQUEST_DATE: TDateTimeField;
    ADOQuery1D60DUE_DATE: TDateTimeField;
    ADOQuery1QUOTE_PRICE: TWordField;
    ADOQuery1D60SCH_DATE: TDateTimeField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1ENT_DATE: TDateTimeField;
    ADOQuery1QTY_PLANNNED: TIntegerField;
    ADOQuery1PARTS_SHIPPED: TFloatField;
    ADOQuery1PARTS_RETURNED: TFloatField;
    ADOQuery1so_style: TWordField;
    ADOQuery1CUST_SHIP_ADDR_PTR: TIntegerField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1SHIPPING_METHOD: TStringField;
    ADOQuery1parts_margin: TFloatField;
    ADOQuery1status: TStringField;
    ADOQuery1Prod_rel: TStringField;
    ADOQuery1quote_auth: TStringField;
    ADOQuery6Ordersq: TFloatField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADupdate50latest_price: TFloatField;
    ADupdate50last_so_date: TDateTimeField;
    ADupdate50onhold_sales_flag: TWordField;
    ado60manu_PART_NUMBER: TStringField;
    ado60manu_PART_DESC: TStringField;
    ADupdate50qty_on_hand: TIntegerField;
    aq192CUSTCOPROD: TStringField;
    aq192custcoTool: TStringField;
    ado06rkey: TAutoIncField;
    AQ62costfree_amount: TFloatField;
    ADOq62costfree_amount: TFloatField;
    ADOQuery1sostyle: TStringField;
    ADOQuery1sotp: TStringField;
    ADOQuery1code: TStringField;
    ADOQuery1TNUMBER: TStringField;
    AQ9711: TADOQuery;
    AQ9711RKEY: TAutoIncField;
    AQ9711FILE_POINTER: TIntegerField;
    AQ9711SOURCE_TYPE: TSmallintField;
    AQ9711NOTE_PAD_LINE_1: TStringField;
    AQ9711NOTE_PAD_LINE_2: TStringField;
    AQ9711NOTE_PAD_LINE_3: TStringField;
    AQ9711NOTE_PAD_LINE_4: TStringField;
    AQ9711memo_text: TMemoField;
    DataSource7: TDataSource;
    ado60SCH_DATE: TDateTimeField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1fob: TStringField;
    dsFindContract: TDataSource;
    aqFindContract: TADOQuery;
    aqFindContractMANU_PART_NUMBER: TStringField;
    aqFindContractContractNo: TStringField;
    aqFindContractRFQNo: TStringField;
    aqFindContractFileName: TStringField;
    aqFindContractQnty: TIntegerField;
    aqFindContractEngAmount: TBCDField;
    aqFindContractTestAmount: TBCDField;
    aqFindContractAftDiscountAmount: TBCDField;
    aqFindContractDiscount: TBCDField;
    aqTmp: TADOQuery;
    dsTmp: TDataSource;
    ADOQuery1rkey213: TIntegerField;
    ADOQuery1ORIG_CUSTOMER: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1D97PO_NUMBER: TStringField;
    ADOQuery1ttype: TWordField;
    ADOQuery4: TADOQuery;
    ADOQuery4rkey: TAutoIncField;
    ADOQuery4SALES_ORDER: TStringField;
    ADOQuery4CUSTOMER_PTR: TIntegerField;
    ADOQuery4COMM_ASSIGNED_BY_E_P: TIntegerField;
    ADOQuery4CUST_PART_PTR: TIntegerField;
    ADOQuery4CUST_SHIP_ADDR_PTR: TIntegerField;
    ADOQuery4CONF_BY_EMPL_PTR: TIntegerField;
    ADOQuery4CSI_USER_PTR: TIntegerField;
    ADOQuery4SHIP_REG_TAX_ID: TIntegerField;
    ADOQuery4ENTERED_BY_EMPL_PTR: TIntegerField;
    ADOQuery4PURCHASE_ORDER_PTR: TIntegerField;
    ADOQuery4MODIFIED_BY_EMPL_PTR: TIntegerField;
    ADOQuery4P_CODE: TWordField;
    ADOQuery4STATUS: TWordField;
    ADOQuery4PROD_REL: TStringField;
    ADOQuery4CUSTOMER_CONTACT: TStringField;
    ADOQuery4PART_PRICE: TFloatField;
    ADOQuery4set_price: TFloatField;
    ADOQuery4TOTAL_ADD_L_PRICE: TBCDField;
    ADOQuery4invd_add_l_price: TBCDField;
    ADOQuery4PARTS_ORDERED: TFloatField;
    ADOQuery4set_ordered: TIntegerField;
    ADOQuery4PARTS_SHIPPED: TFloatField;
    ADOQuery4PARTS_RETURNED: TFloatField;
    ADOQuery4PARTS_ALLOC: TFloatField;
    ADOQuery4PARTS_INVOICED: TFloatField;
    ADOQuery4EXCH_RATE: TFloatField;
    ADOQuery4DISCOUNT: TBCDField;
    ADOQuery4ENT_DATE: TDateTimeField;
    ADOQuery4DUE_DATE: TDateTimeField;
    ADOQuery4SCH_DATE: TDateTimeField;
    ADOQuery4CURR_SHIPMENT: TSmallintField;
    ADOQuery4CONF_DATE: TDateTimeField;
    ADOQuery4MODF_DATE: TDateTimeField;
    ADOQuery4STATE_PROD_TAX_FLAG: TStringField;
    ADOQuery4STATE_TOOL_TAX_FLAG: TStringField;
    ADOQuery4COMMISION_ON_TOOLING: TStringField;
    ADOQuery4FOB: TStringField;
    ADOQuery4SHIPPING_CONTACT: TStringField;
    ADOQuery4SHIPPING_METHOD: TStringField;
    ADOQuery4COD_FLAG: TStringField;
    ADOQuery4SHIP_CONTACT_PHONE: TStringField;
    ADOQuery4CURRENCY_PTR: TIntegerField;
    ADOQuery4RUSH_CHARGE: TBCDField;
    ADOQuery4TO_BE_PLANNED: TIntegerField;
    ADOQuery4TO_BE_CONFIRMED: TIntegerField;
    ADOQuery4ORIG_REQUEST_DATE: TDateTimeField;
    ADOQuery4ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery4QTY_PLANNNED: TIntegerField;
    ADOQuery4MFG_ORDER_DATE: TDateTimeField;
    ADOQuery4ANALYSIS_CODE_1: TStringField;
    ADOQuery4ANALYSIS_CODE_2: TStringField;
    ADOQuery4ANALYSIS_CODE_3: TStringField;
    ADOQuery4tax_2: TBCDField;
    ADOQuery4RUSH_CHARGE_PCT_USED: TIntegerField;
    ADOQuery4CONSUME_FORECASTS: TWordField;
    ADOQuery4BACKWARD_DAYS: TIntegerField;
    ADOQuery4FORWARD_DAYS: TIntegerField;
    ADOQuery4REFERENCE_NUMBER: TStringField;
    ADOQuery4ANALYSIS_CODE_4: TStringField;
    ADOQuery4ANALYSIS_CODE_5: TStringField;
    ADOQuery4QUOTE_PRICE: TWordField;
    ADOQuery4reg_tax_fixed_unused: TWordField;
    ADOQuery4REPUT_QTY: TIntegerField;
    ADOQuery4SUPPLIER_PTR: TIntegerField;
    ADOQuery4so_tp: TWordField;
    ADOQuery4qte_ptr: TIntegerField;
    ADOQuery4so_style: TWordField;
    ADOQuery4so_oldnew: TStringField;
    ADOQuery4COMMISION_ON_TOOLING_1: TStringField;
    ADOQuery4TAX_IN_PRICE: TStringField;
    ADOQuery4RemarkSO: TMemoField;
    ADOQuery4RemarkAudit: TMemoField;
    qrytmp: TADOQuery;
    strngfldADOQuery4bp06_ptr: TStringField;
    ADOQuery1CPJS: TStringField;
    ADOQuery1BPNO: TStringField;
    ADOQuery1TNUMBERs: TStringField;
    Aupdate50: TADODataSet;
    Aupdate50latest_price: TFloatField;
    Aupdate50last_so_date: TDateTimeField;
    Aupdate50qty_on_hand: TIntegerField;
    Aupdate50onhold_sales_flag: TWordField;
    ADOQuery1ONHOLD_SALES_FLAG: TWordField;
    Ado273_25: TADODataSet;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1maolilv_add: TBCDField;
    ADOQuery1PART_PRICE: TFloatField;
    Ado60_53: TADOQuery;
    Ado60_53MANU_PART_NUMBER: TStringField;
    Ado60_53MANU_PART_DESC: TStringField;
    Ado60_53SALES_ORDER: TStringField;
    Ado60_53ABBR_NAME: TStringField;
    Ado60_53PRODUCT_NAME: TStringField;
    Ado60_53PROD_CODE: TStringField;
    Ado60_53c_type: TStringField;
    Ado60_53TTYPE: TStringField;
    Ado60_53QTY_ON_HAND: TFloatField;
    Ado60_53so_mianji: TFloatField;
    Ado60_53MFG_DATE: TDateTimeField;
    Ado60_53LOCATION: TStringField;
    Ado60_53SCH_DATE: TDateTimeField;
    Ado60_53COMMISION_ON_TOOLING60: TStringField;
    AdoSP2: TADOQuery;
    AdoSP2cust_code: TStringField;
    AdoSP2customer_name: TStringField;
    AdoSP2CONTACT_NAME_1: TStringField;
    AdoSP2ttype: TWordField;
    AdoSP2CONTACT_NAME_2: TStringField;
    AdoSP2CONTACT_NAME_3: TStringField;
    AdoSP2CONTACT_NAME_4: TStringField;
    AdoSP2CONTACT_NAME_5: TStringField;
    AdoSP2CONTACT_NAME_6: TStringField;
    AdoSP2INTERNAL_ECN_COUNT: TSmallintField;
    AdoSP2EXTERNAL_ECN_COUNT: TSmallintField;
    AdoSP2MANU_PART_NUMBER: TStringField;
    AdoSP2MANU_PART_DESC: TStringField;
    AdoSP2FED_TAX_ID_NO: TStringField;
    AdoSP2ORIG_CUSTOMER: TStringField;
    AdoSP2qty_on_hand: TIntegerField;
    AdoSP2qty_alloc: TIntegerField;
    AdoSP2rkey: TIntegerField;
    AdoSP2po_number: TStringField;
    AdoSP2po_date: TDateTimeField;
    AdoSP2set_qty: TIntegerField;
    AdoSP2curr_code: TStringField;
    AdoSP2curr_name: TStringField;
    AdoSP2SHELF_LIFE: TIntegerField;
    AdoSP2unit_sq: TFloatField;
    AdoSP2quote_flag: TBooleanField;
    AdoSP2credit_rating: TWordField;
    AdoSP2credit_limit: TFloatField;
    AdoSP2customer_ptr: TIntegerField;
    ADOQuery4ORIG_CUSTOMER: TStringField;
    AdoSP2LEAD_TIME: TSmallintField;
    Ado04: TADOQuery;
    Ado04CONTROL_NO_LENGTH: TSmallintField;
    Ado04SEED_MEAN: TStringField;
    Ado04BIG5_SEED_MEAN: TStringField;
    Ado04SEED_VALUE: TStringField;
    Ado04SEED_FLAG: TWordField;
    Ado04table_name: TStringField;
    Ado04FieldName: TStringField;
    AdoSP2ANALYSIS_CODE_2: TStringField;
    fltfldADOQuery1sp: TFloatField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Aqinfor90CalcFields(DataSet: TDataSet);
    procedure ADOQuery6AfterOpen(DataSet: TDataSet);
    procedure ADODataSet1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1rkey213GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
   function cacl_deficiency(rkey10:integer; nowAmount: currency):currency;//计算客户所欠金额
  end;
var
  dm: Tdm;
implementation

uses   main;
{$R *.dfm}
procedure Tdm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  form1.Edit2.Text:=inttostr(dm.ADOQuery1.RecordCount);
end;

procedure Tdm.Aqinfor90CalcFields(DataSet: TDataSet);
begin
 if dm.aqinfor90auth_date.AsVariant=null then
  dm.aqinfor90auth_flag.Value := '待审批'
 else
  dm.aqinfor90auth_flag.Value := '已评审';
end;

procedure Tdm.ADOQuery6AfterOpen(DataSet: TDataSet);
begin
 if self.ADOQuery6.FieldValues['ordersq']<>null  then
  form1.Edit3.Text:=floattostr(self.ADOQuery6.FieldValues['ordersq'])
 else
  form1.Edit3.Text:='';
end;

procedure Tdm.ADODataSet1CalcFields(DataSet: TDataSet);
begin
 case adoquery1.FieldValues['d60status'] of
  1: adoquery1.FieldValues['status']:='有效的';
  2: adoquery1.FieldValues['status']:='暂缓';
  3: adoquery1.FieldValues['status']:='已关闭';
  4: adoquery1.FieldValues['status']:='已完成';
  5: adoquery1.FieldValues['status']:='已取消';
  6: adoquery1.FieldValues['status']:='未提交';
 end;
 case adoquery1.FieldValues['d60prod_rel'] of
  1: adoquery1.FieldValues['Prod_rel']:='未确认';
  2: adoquery1.FieldValues['Prod_rel']:='已确认';
  3: adoquery1.FieldValues['Prod_rel']:='已投产';
  4: adoquery1.FieldValues['Prod_rel']:='已取消';
 end;
 case adoquery1.FieldValues['quote_price'] of
  0: adoquery1.FieldValues['quote_auth']:='未评审';
  1: adoquery1.FieldValues['quote_auth']:='已评审';
  2: adoquery1.FieldValues['quote_auth']:='被退回';
  3: adoquery1.FieldValues['quote_auth']:='不评审';
 end;
if self.ADOQuery1so_style.Value=0 then
 self.ADOQuery1sostyle.Value:='正式订单'  //同一析号订单报表中使用
else
 self.ADOQuery1sostyle.Value:='备品订单';

end;

function Tdm.cacl_deficiency(rkey10: integer;
  nowAmount: currency): currency;
var
  V_defi:currency;
begin
  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE)');
    sql.Add('AS total_amount FROM dbo.Data0112');
    sql.Add('where customer_ptr='+inttostr(rkey10));
    sql.Add('and invoice_status=1');
    sql.Add('group by customer_ptr');
    open;
    v_defi:= FieldByName('total_amount').AsCurrency;
  end;  //计算用户所开出发票的所欠金额

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*t64.QUAN_SHIPPED*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount ');
    sql.Add('from data0060 t60 inner join data0064 t64 on t64.SO_PTR = t60.RKEY ');
    sql.Add('left join data0439 t439 on t64.packing_list_ptr = t439.RKEY ');
    sql.Add('WHERE ((t64.packing_list_ptr is null) OR (t439.invoice_ptr is null)) ');
    sql.Add('and t60.STATUS in (1,2,4) ');
    sql.Add('and t60.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //已指派未生成账龄 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*(t60.PARTS_ORDERED-t60.PARTS_SHIPPED)*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)');
    sql.Add('as total_amount from data0060 t60');
    //sql.Add('where not exists(select 1 from data0064 t64 where t64.SO_PTR = t60.RKEY)');
    sql.Add('Where t60.STATUS in (1,2,4,6)');
    sql.Add('and t60.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //未指派 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum((TOTAL_ADD_L_PRICE-INVD_ADD_L_PRICE)*(1+RUSH_CHARGE*0.01)/EXCH_RATE)');
    sql.Add('as total_amount from data0060');
    sql.Add('where STATUS in (1,2,4,6)');
    sql.Add('and TOTAL_ADD_L_PRICE <> 0');
    sql.Add('and INVD_ADD_L_PRICE = 0');
    sql.Add('and CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //工具费用 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(AVL_AMT * EX_RATE)');
    sql.Add('AS total_amount FROM dbo.Data0116');
    sql.Add('where CUST_PTR='+inttostr(rkey10));
    sql.Add('and memo_status=1');
    sql.Add('group by CUST_PTR');
    open;
    v_defi:= v_defi-FieldByName('total_amount').AsCurrency;
  end;  //计算用户贷项备忘

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*t98.QTY_RECD*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)');
    sql.Add('as total_amount from data0098 t98, data0060 t60');
    sql.Add('where t98.SO_PTR = t60.RKEY');
    sql.Add('and t98.srce_ptr is null');
    sql.Add('and t98.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi-FieldByName('total_amount').AsCurrency;
  end;  //已退货未生成贷项备忘 Add

  result:= v_defi + nowAmount;  //本订单总额Add
end;

procedure Tdm.ADOQuery1rkey213GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if (Sender.Value=0) then Text:='';
end;

end.

