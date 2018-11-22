unit DmUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    TemADOQuery1: TADOQuery;
    ADOQS0056: TADOQuery;
    ADOQS0056MANU_PART_NUMBER: TStringField;
    ADOQS0056MANU_PART_DESC: TStringField;
    ADOQS0056qty: TFloatField;
    ADOQD0056: TADOQuery;
    ADOQD0056MANU_PART_NUMBER: TStringField;
    ADOQD0056MANU_PART_DESC: TStringField;
    ADOQD0056WORK_ORDER_NUMBER: TStringField;
    ADOQD0056EMPLOYEE_NAME: TStringField;
    ADOQD0056tobestock_date: TDateTimeField;
    ADOQD0056TO_BE_STOCKED: TFloatField;
    ADOQD0056qty_backlog: TFloatField;
    ADOQD0056rkey: TAutoIncField;
    ADOQALL2: TADODataSet;
    ADOQALL2MANU_PART_NUMBER: TStringField;
    ADOQALL2MANU_PART_DESC: TStringField;
    ADOQALL2WORK_ORDER_NUMBER: TStringField;
    ADOQALL2DEPT_NAME: TStringField;
    ADOQALL2INTIME: TDateTimeField;
    ADOQALL2QTY_BACKLOG: TFloatField;
    ADOQALL2RKEY: TAutoIncField;
    ADOQALL2FLOW_NO: TSmallintField;
    ADOQALL2STEP: TSmallintField;
    ADOQALL2data0025_rkey: TAutoIncField;
    ADOQALL2TO_BE_STOCKED: TFloatField;
    ADOQALL2tobestock_date: TDateTimeField;
    ADOQALL2EMPLOYEE_PTR: TIntegerField;
    ADOQALL2ANCESTOR_PTR: TIntegerField;
    ADOQALL2WO_PTR: TIntegerField;
    ADOQALL2DEPT_PTR: TIntegerField;
    ADOQALL2own: TFloatField;
    ADOQALL2ttype: TWordField;
    ADOQALL2QUAN_ALLREJ: TIntegerField;
    ADOQALL2TO_BE_CANCD: TIntegerField;
    ADOQALL2QUAN_ALLPNL: TIntegerField;
    ADOQALL2PANELS: TIntegerField;
    ADOQD0056to_be_cancd: TIntegerField;
    ADOQS0056qty_panel: TIntegerField;
    ADOQD0056panels: TIntegerField;
    ADOQALL2QTYBACKLOG: TFloatField;
    ADOQALL2allPANELS: TIntegerField;
    ADOQALL2PARTS_PER_PANEL: TFloatField;
    ADOQALL2abbr_name: TStringField;
    ADOQD0056abbr_name: TStringField;
    ADOQALL2REFERENCE: TStringField;
    ADOQALL2Sq: TFloatField;
    ADOQS0056sq: TFloatField;
    ADOQALL2sales_order: TStringField;
    ADO53: TADOQuery;
    DataSource1: TDataSource;
    ADOQALL2PO_NUMBER: TStringField;
    ADOQALL2cut_no: TStringField;
    ADOQALL2issued_qty: TIntegerField;
    ADOQALL2FG_QTY: TIntegerField;
    ADOQALL2WIP_QTY: TIntegerField;
    ADOQALL2QTY_reject: TIntegerField;
    ADOQALL2waitfor_release: TIntegerField;
    ADOQALL2PLANNED_QTY: TIntegerField;
    ADOQD0056po_number: TStringField;
    ADOQD0056REFERENCE: TStringField;
    ADOQS0056po_number: TStringField;
    ADOQALL2po_number56: TStringField;
    ADOQD0056REPORT_UNIT_VALUE1: TBCDField;
    ADOQALL2REPORT_UNIT_VALUE1: TBCDField;
    ADOQALL2ORD_REQ_QTY: TIntegerField;
    ADOQALL2rkey60: TAutoIncField;
    ADOQALL2UNIT_PTR: TIntegerField;
    ADOQD0056UNIT_PTR: TIntegerField;
    ADOQALL2cust_code: TStringField;
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
