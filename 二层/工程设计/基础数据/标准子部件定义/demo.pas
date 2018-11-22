unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO37: TADOQuery;
    ADO37part_name: TStringField;
    ADO37if_select: TBooleanField;
    ADO37OPT_LOT_SIZE: TIntegerField;
    ADO37LAYERS: TIntegerField;
    DataSource1: TDataSource;
    ADO42: TADOQuery;
    ADO42part_name: TStringField;
    ADO42STEP_NUMBER: TSmallintField;
    ADO42DEPT_PTR: TIntegerField;
    ADO42DEF_ROUT_INST: TStringField;
    DataSource2: TDataSource;
    ADO037: TADOQuery;
    ADO037part_name: TStringField;
    ADO037if_select: TBooleanField;
    ADO037OPT_LOT_SIZE: TIntegerField;
    ADO037LAYERS: TIntegerField;
    ADS42: TADODataSet;
    ADS42part_name: TStringField;
    ADS42STEP_NUMBER: TSmallintField;
    ADS42DEF_ROUT_INST: TStringField;
    ADO34: TADOQuery;
    ADO34RKEY: TAutoIncField;
    ADO34DEPT_CODE: TStringField;
    ADO34TTYPE: TStringField;
    ADO34OUT_SOURCE: TWordField;
    ADO34DEPT_NAME: TStringField;
    ADO34ACTIVE_FLAG: TWordField;
    ADO34SUPERVISOR_PTR: TIntegerField;
    ADO34PCS_AS_UNIT: TWordField;
    ADO34UNIT_PTR: TIntegerField;
    ADO34BIG_DEPT_PTR: TIntegerField;
    ADO34DEPT_PTR: TIntegerField;
    ADO34GROUP_PTR: TIntegerField;
    ADO34IS_COST_DEPT: TWordField;
    ADO34COST_DEPT_PTR: TIntegerField;
    ADO34DEF_ROUT_INST: TStringField;
    ADO34SCHEDULE_FLAG: TStringField;
    ADO34SEQ_NO: TIntegerField;
    ADO34BARCODE_ENTRY_FLAG: TStringField;
    ADO34ALLOW_SPLIT_LOTS: TStringField;
    ADO34PRINTING_RESOURCE: TStringField;
    ADO34SETUP_TIME_PER_LOT: TStringField;
    ADO34QUEUE_TIME: TStringField;
    ADO34PROCESS_TIME: TStringField;
    ADO34PROCESS_TIME_B: TStringField;
    ADO34IS_CYCLE: TWordField;
    ADO34CYCLE_TIME: TStringField;
    ADO34OVERHEAD_FORMULA: TStringField;
    ADO34OVERHEAD2_FORMULA: TStringField;
    ADO34OVERHEAD3_FORMULA: TStringField;
    ADO34Inst_Flag: TStringField;
    ADO34EQUIPMENT_PTR: TIntegerField;
    ADO34QTY_EQP_LIMIT: TIntegerField;
    ADO34SETUP_SYS: TBCDField;
    ADO34QUEUE_SYS: TBCDField;
    ADO34PROCESS_SYS: TBCDField;
    ADO34PROCESS_SYS_B: TBCDField;
    ADO34CYCLE_TIME_SYS: TBCDField;
    ADO34SEQ_NR: TIntegerField;
    ADO34PPC_TIME: TDateTimeField;
    ADO34PPC_BOM: TIntegerField;
    ADO34PPC_CYCLE_TIME: TIntegerField;
    ADO34PPC_CYCLE_LOT: TFloatField;
    ADO34PPC_LAST_LOT: TIntegerField;
    ADO34PPC_STATUS: TWordField;
    ADO34PR_ID: TStringField;
    ADO34SPEC_FLAG: TWordField;
    ADO34PERMIT_SPLIT_LOT: TWordField;
    ADO34VISIBLE_IN_MI: TWordField;
    ADO34WO_DAYS: TIntegerField;
    ADO34matl_cost_per_sq: TFloatField;
    ADO34GL_ACCT_PTR: TIntegerField;
    ADO34output_flag: TWordField;
    ADO34matcost_flag: TWordField;
    ADO34cost_name: TStringField;
    ADO34wage_flag: TBooleanField;
    ADS42DEPT_PTR: TIntegerField;
    ADS42DEPT_CODE: TStringField;
    ADS42DEPT_NAME: TStringField;
    ADS42BARCODE_ENTRY_FLAG: TStringField;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
