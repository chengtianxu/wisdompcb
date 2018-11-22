unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO60: TADOQuery;
    DataSource1: TDataSource;
    ado06: TADOQuery;
    DataSource2: TDataSource;
    ado06CUT_NO: TStringField;
    ado06WORK_ORDER_NUMBER: TStringField;
    ado06PROD_STATUS: TSmallintField;
    ado06PLANNED_QTY: TIntegerField;
    ado06ISSUED_QTY: TIntegerField;
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
    ado25: TADOQuery;
    ado25MANU_PART_NUMBER: TStringField;
    ado25MANU_PART_DESC: TStringField;
    ado25RKEY: TIntegerField;
    ado0006: TADOQuery;
    ado0006rkey: TAutoIncField;
    ado0006bom_ptr: TIntegerField;
    ADO492: TADOQuery;
    ADO492rkey: TAutoIncField;
    ADO492bom_ptr: TIntegerField;
    DataSource4: TDataSource;
    ado25cp_rev: TStringField;
    ADOQuery1: TADOQuery;
    Append60: TADOQuery;
    Append90: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOtemp60: TADOQuery;
    ADOS6011memo_text: TMemoField;
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
    ADOQuery3tax_in_price: TStringField;
    ADOQuery3set_ordered: TIntegerField;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3PO_DATE: TDateTimeField;
    ADOQuery3REFERENCE_NUMBER: TStringField;
    ADOQuery3PRODUCT_NAME: TStringField;
    ADOQuery3CURR_NAME: TStringField;
    ADOQuery3ABBR_NAME: TStringField;
    ADOQuery3ORIG_REQUEST_DATE: TDateTimeField;
    ADOQuery3ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery3PARTS_SHIPPED: TFloatField;
    ADOQuery3PURCHASE_ORDER_PTR: TIntegerField;
    ADOQuery3CUST_PART_PTR: TIntegerField;
    ADOQuery3RUSH_CHARGE_PCT_USED: TIntegerField;
    ADOQuery3FOB: TStringField;
    ADOQuery3so_tp: TWordField;
    ADOQuery3CODE: TStringField;
    ADOQuery3SUPPLIER_NAME: TStringField;
    ADOQuery3orders_sqft: TFloatField;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3MANU_PART_DESC: TStringField;
    ADOQuery3set_qty: TIntegerField;
    ADOQuery3STATUS: TStringField;
    ADO60RKEY: TAutoIncField;
    ADO60SALES_ORDER: TStringField;
    ADO60rkey10: TAutoIncField;
    ADO60CUST_CODE: TStringField;
    ADO60customer_name: TStringField;
    ADO60ship_to_address_1: TStringField;
    ADO60MANU_PART_NUMBER: TStringField;
    ADO60MANU_PART_DESC: TStringField;
    ADO60RUSH_CHARGE: TBCDField;
    ADO60PO_NUMBER: TStringField;
    ADO60EMPLOYEE_NAME: TStringField;
    ADO60TO_BE_PLANNED: TIntegerField;
    ADO60DUE_DATE: TDateTimeField;
    ADO60PARTS_RETURNED: TFloatField;
    ADO60SCH_DATE: TDateTimeField;
    ADO60CUSTOMER_PTR: TIntegerField;
    ADO60RETURNED_SHIP: TIntegerField;
    ADO60PARTS_ORDERED: TFloatField;
    ADO60PARTS_SHIPPED: TFloatField;
    ADO60QTY_PLANNNED: TIntegerField;
    ADO60STATUS: TWordField;
    ADO60PROD_REL: TStringField;
    ADO60CUST_PART_PTR: TIntegerField;
    ADO60RUSH_CHARGE_PCT_USED: TIntegerField;
    ADO60set_qty: TIntegerField;
    ADO60set_ordered: TIntegerField;
    ADO60set_price: TFloatField;
    ADO60tax_in_price: TStringField;
    ADO60ORIG_REQUEST_DATE: TDateTimeField;
    ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO60TOTAL_ADD_L_PRICE: TFloatField;
    ADO60PURCHASE_ORDER_PTR: TIntegerField;
    ADO60PO_DATE: TDateTimeField;
    ADO60EXCH_RATE: TFloatField;
    ADO60REFERENCE_NUMBER: TStringField;
    ADO60CUST_SHIP_ADDR_PTR: TIntegerField;
    ADO60ttype: TWordField;
    ADO60FOB: TStringField;
    ADO60PART_PRICE: TFloatField;
    ADO60PARTS_ALLOC: TFloatField;
    ADO60so_style: TWordField;
    ADO60so_tp: TWordField;
    ADO60QTE_PTR: TIntegerField;
    ADO60CURR_CODE: TStringField;
    ADO60CURRENCY_PTR: TIntegerField;
    ADO60COMMISION_ON_TOOLING: TStringField;
    ADO60LOCATION: TStringField;
    ADOQuery3ISSUED_QTY: TIntegerField;
    ADO60ISSUED_QTY: TIntegerField;
    aq360: TADOQuery;

    ds360: TDataSource;
    ADO60SHIPPING_CONTACT: TStringField;
    ADO60SHIP_CONTACT_PHONE: TStringField;
    ADO60REPUT_QTY: TIntegerField;
    ADO60REPUT_APPR_BY: TIntegerField;
    ADO60ENT_DATE: TDateTimeField;
    ADO60v_status: TStringField;
    ADO60sotp: TStringField;
    strngfldADO60ANALYSIS_CODE_1: TStringField;
    ADO60bp06_ptr: TStringField;
    ADO60rkey213: TIntegerField;
    ADO60quote_flag: TBooleanField;
    ADO60ONHOLD_SALES_FLAG: TWordField;
    Ado273_25: TADODataSet;
    ADO60parts_alloc1: TFloatField;
    strngfldADO60ORIG_CUSTOMER: TStringField;
    procedure ado06CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenQry(qry:TADOquery;ssql:string);
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}
procedure Tdm.OpenQry(qry:TADOquery;ssql:string);
begin
   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;
end;

procedure TDM.ado06CalcFields(DataSet: TDataSet);
begin
 case ado06.FieldValues['prod_status'] of
  1: ado06.FieldValues['v_status']:='待审批';
  2: ado06.FieldValues['v_status']:='等待生产';
  3: ado06.FieldValues['v_status']:='生产中';
  9: ado06.FieldValues['v_status']:='已完成';
  103:ado06.FieldValues['v_status']:='生产中暂缓';
  202:ado06.FieldValues['v_status']:='取消';
 end;
end;

end.
