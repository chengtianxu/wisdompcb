unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO97: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ado89: TADOQuery;
    DataSource2: TDataSource;
    ado89parameter_name: TStringField;
    ado89parameter_desc: TStringField;
    ado89unit_name: TStringField;
    ado89tvalue: TStringField;
    ado60: TADOQuery;
    DataSource3: TDataSource;
    ado60SALES_ORDER: TStringField;
    ado60CUSTOMER_PART_NUMBER: TStringField;
    ado60CUSTOMER_PART_DESC: TStringField;
    ado60CP_REV: TStringField;
    ado60PARTS_ORDERED: TFloatField;
    ado60PART_PRICE: TFloatField;
    ado60TOTAL_ADD_L_PRICE: TFloatField;
    ADO90: TADOQuery;
    DataSource4: TDataSource;
    ADO90DEPT_NAME: TStringField;
    ADO90EMPLOYEE_NAME: TStringField;
    ADO90auth_date: TDateTimeField;
    ADO90rkey: TAutoIncField;
    ADO90auth_flag: TStringField;
    ADO90dept_ptr: TIntegerField;
    AQ0493: TADOQuery;
    AQ0493Company_Name: TStringField;
    AQ0493ship_address: TStringField;
    AQ0493Company_Icon: TBlobField;
    AQ0493SITE_INFO_ADD_1: TStringField;
    AQ0493SITE_INFO_ADD_2: TStringField;
    AQ0493SITE_INFO_ADD_3: TStringField;
    AQ0493SITE_INFO_PHONE: TStringField;
    AQ9711: TADOQuery;
    AQ9711RKEY: TAutoIncField;
    AQ9711FILE_POINTER: TIntegerField;
    AQ9711SOURCE_TYPE: TSmallintField;
    AQ9711NOTE_PAD_LINE_1: TStringField;
    AQ9711NOTE_PAD_LINE_2: TStringField;
    AQ9711NOTE_PAD_LINE_3: TStringField;
    AQ9711NOTE_PAD_LINE_4: TStringField;
    ADO97PO_NUMBER: TStringField;
    ADO97ABBR_NAME: TStringField;
    ADO97auth_date: TDateTimeField;
    ADO97EMPLOYEE_NAME: TStringField;
    ADO97user_ptr: TIntegerField;
    ADO97SALES_ORDER: TStringField;
    ADO97PARTS_ORDERED: TFloatField;
    ADO97DUE_DATE: TDateTimeField;
    ADO97RMA_PTR: TIntegerField;
    ADO97MFG_ORDER_DATE: TDateTimeField;
    ADO97auth_flag: TStringField;
    ADO97rkey97: TAutoIncField;
    ADO97cust_part_ptr: TIntegerField;
    ADO97rkey60: TAutoIncField;
    ADO97quote_price: TWordField;
    ADO9060: TADOQuery;
    ADO9060auth_date: TDateTimeField;
    ADO9060user_ptr: TIntegerField;
    ADO9060RMA_PTR: TIntegerField;
    ADO9060MFG_ORDER_DATE: TDateTimeField;
    ADO9060QUOTE_PRICE: TWordField;
    ADO6090: TADOQuery;
    ADO6090QUOTE_PRICE: TWordField;
    ADO6090user_ptr: TIntegerField;
    ADO6090auth_date: TDateTimeField;
    ADO6090rkey60: TAutoIncField;
    Aq6090: TADOQuery;
    ADO97cust_code: TStringField;
    ADO97customer_name: TStringField;
    ADO97po_date: TDateTimeField;
    ado89CATEGORY_DESC: TStringField;
    ADO97sch_date: TDateTimeField;
    ADO6090due_date: TDateTimeField;
    ADO6090sch_date: TDateTimeField;
    ADO6090sales_order: TStringField;
    ado60_cancel: TADOQuery;
    ado60_cancelPO_NUMBER: TStringField;
    ado60_cancelABBR_NAME: TStringField;
    ado60_cancelauth_date: TDateTimeField;
    ado60_canceluser_ptr: TIntegerField;
    ado60_cancelSALES_ORDER: TStringField;
    ado60_cancelPARTS_ORDERED: TFloatField;
    ado60_cancelquote_price: TWordField;
    ado60_cancelsch_date: TDateTimeField;
    ado60_cancelpo_date: TDateTimeField;
    DataSource5: TDataSource;
    ADO97ORIG_REQUEST_DATE: TDateTimeField;
    ADO97ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO97PART_PRICE: TFloatField;
    ADO62: TADOQuery;
    DataSource6: TDataSource;
    ADO62CATEGORY: TStringField;
    ADO62AMOUNT: TFloatField;
    ADO6090ORIG_REQUEST_DATE: TDateTimeField;
    ADO62free_amount: TFloatField;
    ADO97if_puthdate: TWordField;
    ADO97puth_info: TStringField;
    ADO6090rush_charge_pct_used: TIntegerField;
    ADO6090ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO97rush_charge_pct_used: TIntegerField;
    AQ9711memo_text: TMemoField;
    ADOQuery2: TADOQuery;
    DataSource7: TDataSource;
    ADOQuery2INV_PART_NUMBER: TStringField;
    ADOQuery2INV_NAME: TStringField;
    ADOQuery2INV_DESCRIPTION: TStringField;
    ADOQuery2stand_qty: TFloatField;
    ADOQuery2UNIT_NAME: TStringField;
    ADO97ALLOW_EDIT_FLAG: TStringField;
    ADO97ONHOLD_SALES_FLAG: TSmallintField;
    ADO97ONHOLD_RELEASE_FLAG: TSmallintField;
    ADO97ONHOLD_PLANNING_FLAG: TSmallintField;
    ado60_cancelORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO38: TADOQuery;
    DataSource8: TDataSource;
    ADO38DEPT_CODE: TStringField;
    ADO38DEPT_NAME: TStringField;
    ADO38STEP_NUMBER: TSmallintField;
    ADO360: TADOQuery;
    DataSource9: TDataSource;
    ADO360rkey: TAutoIncField;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    ADO97parts_mianji: TFloatField;
    aq_total360: TADOQuery;
    aq_total360sch_date: TDateTimeField;
    aq_total360qty_total: TIntegerField;
    aq_total360qty_mianji: TFloatField;
    ado60sch_DATE: TDateTimeField;
    ado60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ado60EXCH_RATE: TFloatField;
    ado60CURR_NAME: TStringField;
    ado60CURR_CODE: TStringField;
    ado60ent_date: TDateTimeField;
    ado60SHIPPING_METHOD: TStringField;
    ado60_cancelCUST_PART_PTR: TIntegerField;
    ado60_cancelrkey97: TIntegerField;
    ado60_cancelALLOW_EDIT_FLAG: TStringField;
    ado60_cancelONHOLD_SALES_FLAG: TSmallintField;
    ado60_cancelONHOLD_RELEASE_FLAG: TSmallintField;
    ado60_cancelONHOLD_PLANNING_FLAG: TSmallintField;
    ado60_cancelparts_mianji: TFloatField;
    ado60_cancelrkey60: TAutoIncField;
    ADO97set_ordered: TIntegerField;
    ado60_cancelif_puthdate: TWordField;
    DataSource10: TDataSource;
    ADO97so_oldnew: TStringField;
    ADO97MANU_PART_NUMBER: TStringField;
    ADO97MANU_PART_DESC: TStringField;
    ADOQuery2QUAN_ON_HAND: TFloatField;
    ado60_cancelMANU_PART_NUMBER: TStringField;
    ado60_cancelMANU_PART_DESC: TStringField;
    aq_total360number: TIntegerField;
    aq_total360ABBR_NAME: TStringField;
    ADO97ent_date: TDateTimeField;
    ADO97reference_number: TStringField;
    ADO97CONSUME_FORECASTS: TWordField;
    TIMEqry1: TADOQuery;
    tmp: TADOQuery;
    aq_total360ttype: TWordField;
    aq_total360ttypetext: TStringField;
    aq_total360difficulty_grade: TIntegerField;
    ADO97SAMPLE_NR: TStringField;
    ADO97ORIG_CUSTOMER: TStringField;
    ADO62costfree_amount: TFloatField;
    ADO97CUSTPART_ENT_DATE: TDateTimeField;
    ADO97ENTERED_BY_EMPL_PTR: TIntegerField;
    ADO97barcode_flag: TWordField;
    ADO97PURCHASE_ORDER_PTR: TIntegerField;
    ds1: TDataSource;
    ADO97PARTS_ALLOC: TFloatField;
    ADO97RUSH_CHARGE: TFloatField;
    ADO97sumprice: TFloatField;
    ADO97CURR_CODE: TStringField;
    ADO97poname: TStringField;
    ADO97ANALYSIS_CODE_2: TStringField;
    qry1: TADOQuery;
    qry1cust_part_ptr: TIntegerField;
    qry1T61: TStringField;
    qry1T17: TStringField;
    qry1T69: TStringField;
    qry1T68: TStringField;
    qry1T29: TStringField;
    qry1T26: TStringField;
    qry1T28: TStringField;
    qry1T56: TStringField;
    qry1T93: TStringField;
    qry1T57: TStringField;
    qry1T27: TStringField;
    qry1T144: TStringField;
    qry1T143: TStringField;
    qry1T30: TStringField;
    ds2: TDataSource;
    qry2: TADOQuery;
    ds3: TDataSource;
    qry2SALES_ORDER: TStringField;
    qry2so_oldnew: TStringField;
    qry2ENT_DATE: TDateTimeField;
    qry2MANU_PART_NUMBER: TStringField;
    qry2PARTS_ORDERED: TFloatField;
    qry2ORIG_REQUEST_DATE: TDateTimeField;
    qry2MANU_PART_DESC: TStringField;
    qry2ANALYSIS_CODE_1: TStringField;
    qry2set_qty: TIntegerField;
    qry2SP1: TFloatField;
    qry2PO_NUMBER: TStringField;
    qry2CUST_CODE: TStringField;
    qry2LAYERS: TWordField;
    qry2set_lngth: TBCDField;
    qry2set_width: TBCDField;
    qry2PRODUCT_NAME: TStringField;
    qry2RemarkSO: TMemoField;
    qry2ttype: TStringField;
    ADO97layers: TIntegerField;
    strngfldADO97ANALYSIS_CODE_1: TStringField;
    strngfldADO97ANALYSIS_CODE_5: TStringField;
    ADO97sp2: TFloatField;
    ADO97green_flag: TSmallintField;
    ADO97NOPB_flag: TSmallintField;
    ADO97CURRENT_REV: TSmallintField;
    ADO97set_qty: TIntegerField;
    ADO97LAST_MODIFIED_DATE: TDateTimeField;
    ADO97miname: TStringField;
    qry1T8: TStringField;
    procedure ADO97CalcFields(DataSet: TDataSet);
    procedure ADO90CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO97CalcFields(DataSet: TDataSet);
begin
 if dm.ado97auth_date.AsVariant=null then
  dm.ado97auth_flag.Value := '¥˝…Û≈˙'
 else
  dm.ado97auth_flag.Value := '“—∆¿…Û';
end;

procedure TDM.ADO90CalcFields(DataSet: TDataSet);
begin
 if dm.ado90auth_date.AsVariant=null then
  dm.ado90auth_flag.Value := '¥˝…Û≈˙'
 else
  dm.ado90auth_flag.Value := '“—∆¿…Û';
end;

end.
