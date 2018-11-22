unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    Qery192: TADOQuery;
    Qery5: TADOQuery;
    QeryDate: TADOQuery;
    Qery445: TADOQuery;
    Qery449: TADOQuery;
    Qery448: TADOQuery;
    SP22: TADOStoredProc;
    SP56: TADOStoredProc;
    SP53: TADOStoredProc;
    DS444: TADODataSet;
    Qery: TADOQuery;
    SP53WORK_ORDER_NUMBER: TStringField;
    SP53QTY_ON_HAND: TFloatField;
    SP53LATEST_PRICE: TFloatField;
    SP53MFG_DATE: TDateTimeField;
    SP53REFERENCE_NUMBER: TStringField;
    SP53WHSE_PTR: TIntegerField;
    SP53LOC_PTR: TIntegerField;
    SP53WORK_ORDER_PTR: TIntegerField;
    SP53CUSTOMER_PTR: TIntegerField;
    SP53CUST_PART_PTR: TIntegerField;
    SP56BOM_PTR: TIntegerField;
    SP56WORK_ORDER_NUMBER: TStringField;
    SP56CUSTOMER_PTR: TIntegerField;
    SP56LATEST_PRICE: TFloatField;
    SP56FLOW_NO: TSmallintField;
    SP56DEPT_PTR: TIntegerField;
    SP56STEP: TSmallintField;
    SP56QTY_BACKLOG: TFloatField;
    SP56INTIME: TDateTimeField;
    SP56CUT_NO: TStringField;
    SP56SO_NO: TStringField;
    SP56WO_PTR: TIntegerField;
    adoupdate: TADOStoredProc;
    SP56to_be_stocked: TFloatField;
    SP53rkey: TIntegerField;
    QeryDatevdt: TDateTimeField;
    QeryDatevd: TDateTimeField;
    SP22rkey: TIntegerField;
    SP22tdate: TDateTimeField;
    SP22inventory_ptr: TIntegerField;
    SP22quantity: TBCDField;
    SP22tax_2: TBCDField;
    SP22EXPIRE_DATE: TDateTimeField;
    AD462: TADODataSet;
    DataSource1: TDataSource;
    AD462DEPT_CODE: TStringField;
    AD462DEPT_NAME: TStringField;
    AD462INV_PART_NUMBER: TStringField;
    AD462INV_NAME: TStringField;
    AD462INV_DESCRIPTION: TStringField;
    AD462QUAN: TFloatField;
    AD462STD_PRICE: TFloatField;
    AD462UNIT_NAME: TStringField;
    AD462amount: TFloatField;
    AD462RKEY: TAutoIncField;
    AD462D0443_PTR: TIntegerField;
    AD462DEPT_PTR: TIntegerField;
    AD462INVENT_PTR: TIntegerField;
    wzpr444_7: TADOStoredProc;
    wzpr444_7rkey: TAutoIncField;
    wzpr444_7cut_date: TDateTimeField;
    DS444RKEY: TAutoIncField;
    DS444CUT_DATE: TDateTimeField;
    DS444MATL_DATE: TDateTimeField;
    DS444WIP_DATE: TDateTimeField;
    DS444SFG_DATE: TDateTimeField;
    DS444FG_DATE: TDateTimeField;
    DS444TDATE: TDateTimeField;
    DS444CUT_BY: TIntegerField;
    DS444MATL_CST_IN_STOCK_CLOSED: TBCDField;
    DS444MATL_CST_IN_DEPT_CLOSED: TBCDField;
    DS444MATL_CST_IN_WIP_CLOSED: TBCDField;
    DS444MATL_CST_IN_SFG_CLOSED: TBCDField;
    DS444MATL_CST_IN_FG_CLOSED: TBCDField;
    DS444OVHD_CST_IN_WIP_CLOSED: TBCDField;
    DS444OVHD_CST_IN_SFG_CLOSED: TBCDField;
    DS444OVHD_CST_IN_FG_CLOSED: TBCDField;
    DS444CLOSED: TStringField;
    DS444early_ptr: TIntegerField;
    SP22unit_price: TFloatField;
    SP56unit_sq: TFloatField;
    SP53unit_sq: TFloatField;
    DS444employee_name: TStringField;
    AD462warehouse_code: TStringField;
    AD462abbr_name: TStringField;
    AD462warehouse_ptr: TIntegerField;
    ADOtemp: TADOQuery;
    ADOtempSTD_PRICE: TFloatField;
    aqTmp: TADOQuery;
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
