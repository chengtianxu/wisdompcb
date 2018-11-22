unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS60: TADODataSet;
    ADS60SALES_ORDER: TStringField;
    ADS60MANU_PART_NUMBER: TStringField;
    ADS60MANU_PART_DESC: TStringField;
    ADS60CUST_CODE: TStringField;
    ADS60PO_NUMBER: TStringField;
    ADS60PROD_CODE: TStringField;
    ADS60PRODUCT_NAME: TStringField;
    ADS60PARTS_ORDERED: TFloatField;
    ADS60TO_BE_PLANNED: TIntegerField;
    ADS60SCH_DATE: TDateTimeField;
    ADS60so_oldnew: TStringField;
    ADS60planned_date: TDateTimeField;
    ADS60sostyle: TStringField;
    ADS60prodrel: TStringField;
    ADS60auth_style: TStringField;
    ADS60MyBOM_STATUS: TStringField;
    ADS60MI_status: TStringField;
    ADS60PROD_REL: TStringField;
    ADS60ONHOLD_PLANNING_FLAG: TWordField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADS60rkey: TIntegerField;
    ADS60ent_date: TDateTimeField;
    ADS60PURCHASE_ORDER_PTR: TIntegerField;
    ADS60CUST_PART_PTR: TIntegerField;
    ADS60REFERENCE_NUMBER: TStringField;
    ADOQuery2: TADOQuery;
    ADS60SHIP_REG_TAX_ID: TIntegerField;
    ADS60OPT_LOT_SIZE: TIntegerField;
    ADS60EST_SCRAP: TFloatField;
    AQY492: TADOQuery;
    AQY492rkey: TAutoIncField;
    AQY492TTYPE: TWordField;
    AQY492CUT_NO: TStringField;
    AQY492SO_NO: TStringField;
    AQY492BOM_PTR: TIntegerField;
    AQY492PLANNED_QTY: TIntegerField;
    AQY492ISSUED_QTY: TIntegerField;
    AQY492SCH_COMPL_DATE: TDateTimeField;
    AQY492ISSUE_DATE: TDateTimeField;
    AQY492CREATED_BY_PTR: TIntegerField;
    AQY492UPANEL1: TIntegerField;
    AQY492PANEL_1_QTY: TIntegerField;
    AQY492UPANEL2: TIntegerField;
    AQY492PANEL_2_QTY: TIntegerField;
    AQY492remark: TStringField;
    AQY492ORD_REQ_QTY: TIntegerField;
    AQY492TSTATUS: TWordField;
    AQY492mrb_ptr: TIntegerField;
    AQY492Con_Flag: TSmallintField;
    AQY492pnl1_size: TStringField;
    AQY492pnl2_size: TStringField;
    AQY492analysis_code_3: TStringField;
    AQY492WHOUSE_PTR: TIntegerField;
    aqy04: TADOQuery;
    aqy04CONTROL_NO_LENGTH: TSmallintField;
    aqy04SEED_FLAG: TWordField;
    aqy04SEED_VALUE: TStringField;
    AQY06: TADOQuery;
    AQY06WORK_ORDER_NUMBER: TStringField;
    AQY06CUT_NO: TStringField;
    AQY06PANEL_A_B: TIntegerField;
    AQY06BOM_PTR: TIntegerField;
    AQY06PROD_STATUS: TSmallintField;
    AQY06QUAN_SCH: TFloatField;
    AQY06PANELS: TIntegerField;
    AQY06ENT_DATETIME: TDateTimeField;
    AQY06SCH_COMPL_DATE: TDateTimeField;
    AQY06PARTS_PER_PANEL: TFloatField;
    AQY06panel_ln: TFloatField;
    AQY06panel_wd: TFloatField;
    AQY06pnl_size: TStringField;
    AQY06WIPMAT_STATUS: TSmallintField;
    AQY468: TADOQuery;
    AQY468CUT_NO: TStringField;
    AQY468SO_NO: TStringField;
    AQY468STEP: TSmallintField;
    AQY468DEPT_PTR: TIntegerField;
    AQY468INVENT_PTR: TIntegerField;
    AQY468QUAN_BOM: TFloatField;
    AQY468STATUS: TSmallintField;
    AQY468VENDOR: TStringField;
    AQY468Invent_or: TSmallintField;
    AQY468printit: TStringField;
    AQY06BEGIN_STEP_NO: TSmallintField;
    AQY06RELEASE_DATE: TDateTimeField;
    AQY06rkey: TAutoIncField;
    AQY06employee_ptr: TIntegerField;
    AQY492waitfor_release: TIntegerField;
    AQY492wip_qty: TIntegerField;
    AQY06remark_pnls: TFloatField;
    ADS60compl_date: TDateTimeField;
    ADS60QTY_ON_HAND: TIntegerField;
    ADS60warehouse_code: TStringField;
    AQY06ppc_flag: TSmallintField;
    ADS60spell_sq: TFloatField;
    AQY06WHOUSE_PTR: TIntegerField;
    AQY492COMPLETED: TIntegerField;
    ADS60CUSTOMER_PTR: TIntegerField;
    AQY06LOT_NUMBER: TStringField;
    ADOQuery3: TADOQuery;
    ADO279: TADOQuery;
    ADOQuery4: TADOQuery;
    ADO279PARAMETER_DESC: TStringField;
    ADO279PRODUCTION_FLAG: TIntegerField;
    ADO279spec_rkey: TStringField;
    DataSource2: TDataSource;
    AQY06CUTNO_WO: TStringField;
    DataSource5: TDataSource;
    ads494: TADODataSet;
    ads494PARAMETER_PTR: TIntegerField;
    ads494PARAMETER_VALUE: TStringField;
    ads494custpart_ptr: TIntegerField;
    ads494step_number: TSmallintField;
    ads494seq_no: TSmallintField;
    ads494Doc_Flag: TStringField;
    ads494after_flag: TStringField;
    ads494flow_spfc_flag: TStringField;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494SPEC_RKEY: TStringField;
    ads494UNIT_NAME: TStringField;
    ads494DATATYPE: TStringField;
    ads494min_value: TFloatField;
    ads494max_value: TFloatField;
    ads278: TADODataSet;
    ads278rkey: TIntegerField;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278SPEC_RKEY: TStringField;
    ads278UNIT_NAME: TStringField;
    ads278datatype: TStringField;
    ads278STATUS3: TWordField;
    ads278min_value: TFloatField;
    ads278max_value: TFloatField;
    DataSource3: TDataSource;
    AQ0499: TADODataSet;
    AQ0499PARAMETER_PTR: TIntegerField;
    AQ0499DEF_VALUE: TStringField;
    AQ0499SEQ_NO: TSmallintField;
    AQ0499PARAMETER_NAME: TStringField;
    AQ0499PARAMETER_DESC: TStringField;
    AQ0499UNIT_NAME: TStringField;
    AQ0499inv_group_ptr: TIntegerField;
    aqQnty: TADOQuery;
    aqQntyMANU_PART_NUMBER: TStringField;
    aqQntySALES_ORDER: TStringField;
    aqQntyQTY_ON_HAND: TFloatField;
    ADS60parts_margin: TFloatField;
    aqQnty1: TADOQuery;
    aqQnty1RKEY: TAutoIncField;
    aqQnty1MANU_PART_NUMBER: TStringField;
    aqQnty1SALES_ORDER: TStringField;
    aqQnty1QTY_ON_HAND: TFloatField;
    aqQnty1WAREHOUSE_CODE: TStringField;
    aqQnty1ABBR_NAME: TStringField;
    aqQnty1LOCATION: TStringField;
    aqQnty1MFG_DATE: TDateTimeField;
    aqQnty1PO_NUMBER: TStringField;
    aqQnty1spec_place: TStringField;
    aqQnty1sType: TStringField;
    dsQnty1: TDataSource;
    cdsQnty1: TClientDataSet;
    dspQnty1: TDataSetProvider;
    cdsQnty1RKEY: TAutoIncField;
    cdsQnty1MANU_PART_NUMBER: TStringField;
    cdsQnty1SALES_ORDER: TStringField;
    cdsQnty1QTY_ON_HAND: TFloatField;
    cdsQnty1WAREHOUSE_CODE: TStringField;
    cdsQnty1ABBR_NAME: TStringField;
    cdsQnty1LOCATION: TStringField;
    cdsQnty1MFG_DATE: TDateTimeField;
    cdsQnty1PO_NUMBER: TStringField;
    cdsQnty1spec_place: TStringField;
    cdsQnty1sType: TStringField;
    aqQnty1IsSelected: TWordField;
    cdsQnty1IsSelected: TSmallintField;
    aqTmp: TADOQuery;
    ADS60order_sq: TFloatField;
    ADS60SAMPLE_NR: TStringField;
    aqQnty1youxiaoqi: TDateTimeField;
    cdsQnty1youxiaoqi: TDateTimeField;
    ADS60ORIG_CUSTOMER: TStringField;
    ADS60state: TStringField;
    qrytmp: TADOQuery;
    ADS60rkey25: TIntegerField;
    AQY492cite_qryonhand: TIntegerField;
    AQY492operation_rate: TBCDField;
    ADS60SpellTogether: TSmallintField;
    AQY06SUB_LEVELS: TSmallintField;
    ADS60DSDesigner: TStringField;
    ADOQuery9: TADOQuery;
    ADOQuery9MANU_PART_NUMBER: TStringField;
    ADOQuery10: TADOQuery;
    ADOQuery10ReturnQ: TIntegerField;
    ADOQuery11: TADOQuery;
    ADOQuery11ReturnT: TIntegerField;
    ADOQuery5: TADOQuery;
    ADOQuery8: TADOQuery;
    ADOQuery8MANU_PART_NUMBER: TStringField;
    ADOQuery8PNL_LEN: TFloatField;
    ADOQuery8PNL_WTH: TFloatField;
    ADOQuery6: TADOQuery;
    ADOQuery6ReturnQ: TIntegerField;
    TemADOQuery1: TADOQuery;
    ADOQuery5RKEY: TAutoIncField;
    ADOQuery5INV_PART_NUMBER: TStringField;
    ADOQuery5INV_NAME: TStringField;
    ADOQuery5INV_DESCRIPTION: TStringField;
    ADOQuery5GROUP_PTR: TIntegerField;
    ADOQuery5code: TStringField;
    ADOQuery5rkey23: TAutoIncField;
    ADOQuery5QUAN_ON_HAND2: TIntegerField;
    ADOQuery5UNIT_NAME: TStringField;
    ADOQuery5ABBR_NAME: TStringField;
    ADOQuery5LOCATION: TStringField;
    ADOQuery5REMARK: TStringField;
    ADOQuery5remark_1: TStringField;
    ADOQuery5XY_1: TStringField;
    ADOQuery5QUAN_ON_HAND2_1: TIntegerField;
    ADOQuery5LEN_SIZE: TBCDField;
    ADOQuery5WEI_SIZE: TBCDField;
    ADOQuery7: TADOQuery;
    ADOQuery5MANU_PART_NUMBER: TStringField;
    ADOQuery5spec_rkey: TStringField;
    ADOQuery5PARAMETER_VALUE: TStringField;
    ADOQuery12: TADOQuery;
    ADOQuery6MANU_PART_NUMBER: TStringField;
    ADOQuery6spec_rkey: TStringField;
    ADOQuery6PARAMETER_VALUE: TStringField;
    AQY468supplier_ptr: TIntegerField;
    AQY468offcut_qty: TIntegerField;
  private
    { Private declarations }
  public
    ads494SQL:string;
    { Public declarations }
    function find_wip_code():string;
    procedure update_25lot(rkey25:integer);
    procedure SqlOpen(ASql: string);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

function TDM.find_wip_code: string;
begin
with adoquery1 do
 begin
  close;
  sql.Text:='select top 1 wip_code from data0400 where status=0';
  open;
  if not isempty then
   result:=fieldbyname('wip_code').AsString
  else
   result:='';
  close;
 end;
end;

procedure TDM.SqlOpen(ASql: string);
begin
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(ASql);
  qrytmp.Open;
end;

procedure TDM.update_25lot(rkey25: integer);
begin
with adoquery1 do
 begin
  close;
  sql.Text:='update data0025 '+
  'set LAST_SO_DATE= getdate() '+
  'where rkey='+inttostr(rkey25);
  ExecSQL;
 end;
end;

end.
