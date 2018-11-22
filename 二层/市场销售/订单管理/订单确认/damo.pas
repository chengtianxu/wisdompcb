unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    AQ1060: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery3: TADOStoredProc;
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
    ado89: TADOQuery;
    ado89parameter_name: TStringField;
    ado89parameter_desc: TStringField;
    ado89unit_name: TStringField;
    ado89tvalue: TStringField;
    ado89CATEGORY_DESC: TStringField;
    DataSource2: TDataSource;
    ADOQuery3PURCHASE_ORDER_PTR: TIntegerField;
    ADOQuery3CUST_PART_PTR: TIntegerField;
    DataSource3: TDataSource;
    ADOQuery3set_ordered: TIntegerField;
    ADOQuery3REFERENCE_NUMBER: TStringField;
    ADOQuery3PARTS_SHIPPED: TFloatField;
    ADOQuery3rush_charge_pct_used: TIntegerField;
    ADOQuery3fob: TStringField;
    ADOQuery3so_tp: TWordField;
    ADOQuery3CODE: TStringField;
    ADOQuery3SUPPLIER_NAME: TStringField;
    ADOQuery3tax_in_price: TStringField;
    ADOQuery3STATUS: TStringField;
    ADOQuery3orders_sqft: TFloatField;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3MANU_PART_DESC: TStringField;
    ADOQuery3set_qty: TIntegerField;
    DataSource4: TDataSource;
    ADO360: TADOQuery;
    ADO360rkey: TAutoIncField;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    ADOQuery3ORIG_CUSTOMER: TStringField;
    ADOQuery3ABBR_NAME15: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
