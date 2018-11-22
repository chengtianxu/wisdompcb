unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ado06: TADOQuery;
    DataSource2: TDataSource;
    ado06CUT_NO: TStringField;
    ado06WORK_ORDER_NUMBER: TStringField;
    ado06PROD_STATUS: TSmallintField;
    ado06QUAN_SCH: TFloatField;
    ado06v_status: TStringField;
    ADOS6011: TADOStoredProc;
    ADOS6011RKEY: TAutoIncField;
    ADOS6011FILE_POINTER: TIntegerField;
    ADOS6011SOURCE_TYPE: TSmallintField;
    ADOS6011NOTE_PAD_LINE_1: TStringField;
    ADOS6011NOTE_PAD_LINE_2: TStringField;
    ADOS6011NOTE_PAD_LINE_3: TStringField;
    ADOS6011NOTE_PAD_LINE_4: TStringField;
    DataSource3: TDataSource;
    ADOQuery3: TADOStoredProc;
    ADOQuery2: TADOQuery;
    ADOQuery3SALES_ORDER: TStringField;
    ADOQuery3ENT_DATE: TDateTimeField;
    ADOQuery3DUE_DATE: TDateTimeField;
    ADOQuery3SCH_DATE: TDateTimeField;
    ADOQuery3EXCH_RATE: TFloatField;
    ADOQuery3TO_BE_CONFIRMED: TIntegerField;
    ADOQuery3RUSH_CHARGE: TBCDField;
    ADOQuery3DISCOUNT: TBCDField;
    ADOQuery3TOTAL_ADD_L_PRICE: TFloatField;
    ADOQuery3RKEY: TIntegerField;
    ADOQuery3PART_PRICE: TFloatField;
    ADOQuery3PARTS_ORDERED: TFloatField;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3PO_DATE: TDateTimeField;
    ADOQuery3PRODUCT_NAME: TStringField;
    ADOQuery3CURR_NAME: TStringField;
    ADOQuery3ABBR_NAME: TStringField;
    ADOQuery3ORIG_REQUEST_DATE: TDateTimeField;
    ADOQuery3ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery3PURCHASE_ORDER_PTR: TIntegerField;
    ADOQuery3CUST_PART_PTR: TIntegerField;
    aq492: TADOQuery;
    ado0006: TADOQuery;
    ADO492: TADOQuery;
    ADO492rkey: TAutoIncField;
    ADO492bom_ptr: TIntegerField;
    DataSource4: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery3PARTS_SHIPPED: TFloatField;
    ADOQuery3set_ordered: TIntegerField;
    ADOQuery3rush_charge_pct_used: TIntegerField;
    Append60: TADOQuery;
    Append90: TADOQuery;
    Append102: TADOQuery;
    ADOtemp60: TADOQuery;
    ADOS6011memo_text: TMemoField;
    ADO492CUT_NO: TStringField;
    ADO492PLANNED_QTY: TIntegerField;
    ADO492ISSUED_QTY: TIntegerField;
    ado06MANU_PART_NUMBER: TStringField;
    ado06MANU_PART_DESC: TStringField;
    ADOQuery3tax_in_price: TStringField;
    ADOQuery3REFERENCE_NUMBER: TStringField;
    ADOQuery3FOB: TStringField;
    ADOQuery3so_tp: TWordField;
    ADOQuery3CODE: TStringField;
    ADOQuery3SUPPLIER_NAME: TStringField;
    ADOQuery3orders_sqft: TFloatField;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3MANU_PART_DESC: TStringField;
    ADOQuery3set_qty: TIntegerField;
    ADOQuery3STATUS: TStringField;
    aq492rkey: TIntegerField;
    aq492CUT_NO: TStringField;
    aq492SO_NO: TStringField;
    aq492EMPLOYEE_NAME: TStringField;
    aq492MANU_PART_NUMBER: TStringField;
    aq492MANU_PART_DESC: TStringField;
    aq492ISSUED_QTY: TIntegerField;
    aq492ISSUE_DATE: TDateTimeField;
    aq492pnl1_size: TStringField;
    aq492PANEL_1_QTY: TIntegerField;
    aq492UPANEL1: TIntegerField;
    aq492pnl2_size: TStringField;
    aq492PANEL_2_QTY: TIntegerField;
    aq492UPANEL2: TIntegerField;
    aq492DSDesigner2: TStringField;
    aq492PLANNED_QTY: TIntegerField;
    aq492DSDesigner: TStringField;
    aq492DSDesigner3: TStringField;
    aq492DSDesigner4: TStringField;
    ado06RKEY: TAutoIncField;
    ado06pnl_size: TStringField;
    ado06QUAN_REJ: TFloatField;
    ado06QUAN_PROD: TFloatField;
    ado06wip_qty: TFloatField;
    ado06BOM_PTR: TIntegerField;
    ado0006rkey: TAutoIncField;
    ado0006bom_ptr: TIntegerField;
    aq192: TADOQuery;
    aq192aptaxontax: TStringField;
    aq192artaxontax: TStringField;
    aq192QTE_control2: TWordField;
    aq192ppc_control15: TWordField;
    aq192custcitool: TStringField;
    aq192custciprod: TStringField;
    aq192suplcimat: TStringField;
    aq192custciship: TStringField;
    aq192CUSTCOPROD: TStringField;
    aq192custcoTool: TStringField;
    ADOQuery4: TADOQuery;
    ADO60: TADODataSet;
    ADO60rkey: TAutoIncField;
    ADO60SALES_ORDER: TStringField;
    ADO60CUST_CODE: TStringField;
    ADO60MANU_PART_NUMBER: TStringField;
    ADO60part_price: TFloatField;
    ADO60tax_in_price: TStringField;
    ADO60custcode: TStringField;
    ADO60PO_NUMBER: TStringField;
    ADO60EMPLOYEE_NAME: TStringField;
    ADO60to_be_planned: TIntegerField;
    ADO60DUE_DATE: TDateTimeField;
    ADO60SCH_DATE: TDateTimeField;
    ADO60CUSTOMER_PTR: TIntegerField;
    ADO60RUSH_CHARGE: TBCDField;
    ADO60PARTS_ORDERED: TFloatField;
    ADO60PARTS_SHIPPED: TFloatField;
    ADO60qty_plannned: TIntegerField;
    ADO60credit_limit: TFloatField;
    ADO60CREDIT_RATING: TWordField;
    ADO60status: TWordField;
    ADO60prod_rel: TStringField;
    ADO60CUST_PART_PTR: TIntegerField;
    ADO60RUSH_CHARGE_PCT_USED: TIntegerField;
    ADO60set_qty: TIntegerField;
    ADO60set_ordered: TIntegerField;
    ADO60set_price: TFloatField;
    ADO60MFG_LEAD_TIME: TSmallintField;
    ADO60DAYS_EARLY_SCHEDULE: TIntegerField;
    ADO60ORIG_REQUEST_DATE: TDateTimeField;
    ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO60TOTAL_ADD_L_PRICE: TFloatField;
    ADO60PURCHASE_ORDER_PTR: TIntegerField;
    ADO60po_date: TDateTimeField;
    ADO60EXCH_RATE: TFloatField;
    ADO60customer_name: TStringField;
    ADO60REFERENCE_NUMBER: TStringField;
    ADO60MANU_PART_DESC: TStringField;
    ADO60CUST_SHIP_ADDR_PTR: TIntegerField;
    ADO60v_Status: TStringField;
    aq492BOM_PTR: TIntegerField;
    ADO60ISSUED_QTY: TIntegerField;
    ado06ENGG_STATUS: TSmallintField;
    ADOQuery5: TADOQuery;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1SALES_ORDER: TStringField;
    qry1MANU_PART_NUMBER: TStringField;
    qry1SCH_DATE: TDateField;
    ds2: TDataSource;
    qry2: TADOQuery;
    fltfldqry1PARTS_ORDERED: TFloatField;
    intgrfldqry2rkey: TIntegerField;
    qry2sch_date: TDateField;
    intgrfldqry2quantity: TIntegerField;
    procedure ado06CalcFields(DataSet: TDataSet);
    procedure ADO60CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ado06CalcFields(DataSet: TDataSet);
begin
 case ado06.FieldValues['prod_status'] of
  2: ado06.FieldValues['v_status']:='等待生产';
  3: ado06.FieldValues['v_status']:='生产中';
  4: ado06.FieldValues['v_status']:='外发生产';
  5: ado06.FieldValues['v_status']:='待入仓';
  6: ado06.FieldValues['v_status']:='待分配';
  9: ado06.FieldValues['v_status']:='已完成';
  102:ado06.FieldValues['v_status']:='生产前暂缓';
  103:ado06.FieldValues['v_status']:='生产中暂缓';
  202:ado06.FieldValues['v_status']:='被取消';
 end;

end;

procedure TDM.ADO60CalcFields(DataSet: TDataSet);
begin
  case ADO60status.Value of
    1: ADO60v_Status.Value:='有效的';
    2: ADO60v_Status.Value:='暂缓';
    5: ADO60v_Status.Value:='已取消';
    6: ADO60v_Status.Value:='未提交';
  end;
end;

end.
