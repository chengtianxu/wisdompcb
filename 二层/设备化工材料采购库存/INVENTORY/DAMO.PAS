unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ17: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    AQ18: TADOQuery;
    AQ1711: TADOQuery;
    DataSource2: TDataSource;
    AQ15: TADOQuery;
    AQ0499: TADOQuery;
    DataSource3: TDataSource;
    AQ0499PARAMETER_PTR: TIntegerField;
    AQ0499DEF_VALUE: TStringField;
    AQ0499SEQ_NO: TSmallintField;
    AQ18rkey: TAutoIncField;
    AQ18whouse_ptr: TIntegerField;
    AQ18invent_ptr: TIntegerField;
    AQ18min_stock: TFloatField;
    AQ18max_stock: TFloatField;
    AQ18reorder_point: TFloatField;
    AQ18location_ptr1: TIntegerField;
    AQ18location_ptr2: TIntegerField;
    AQ18location_ptr3: TIntegerField;
    AQ18location_ptr4: TIntegerField;
    AQ18location_ptr5: TIntegerField;
    AQ17RKEY: TAutoIncField;
    AQ17INV_PART_NUMBER: TStringField;
    AQ17GROUP_PTR: TIntegerField;
    AQ17MANUFACTURER_CODE: TStringField;
    AQ17MANUFACTURER_NAME: TStringField;
    AQ17CYCLE_CODE: TStringField;
    AQ17BATCH_SERIAL_CONTROL: TStringField;
    AQ17P_M: TStringField;
    AQ17S_B_N: TStringField;
    AQ17INSPECT: TStringField;
    AQ17STOP_PURCH: TStringField;
    AQ17MIX_PARTS: TStringField;
    AQ17PHY_COUNT_METHOD: TWordField;
    AQ17BOM_FLAG: TStringField;
    AQ17COST_METHOD: TStringField;
    AQ17MODIFY_ENGG_RTE_CODE: TStringField;
    AQ17G_L_CODE_SELL_PTR: TIntegerField;
    AQ17G_L_CODE_BUY_PTR: TIntegerField;
    AQ17ENGG_ROUTE_PTR: TIntegerField;
    AQ17NOTE_PAD_PTR: TIntegerField;
    AQ17ALTERNATE_PART_PTR: TIntegerField;
    AQ17AUTHORIZED_BUYER_PTR: TIntegerField;
    AQ17STOCK_UNIT_PTR: TIntegerField;
    AQ17PURCH_UNIT_PTR: TIntegerField;
    AQ17PREF_SUPPLIER_PTR: TIntegerField;
    AQ17STOCK_PURCH: TFloatField;
    AQ17STOCK_QUOTE: TFloatField;
    AQ17STOCK_SELL: TFloatField;
    AQ17STOCK_BASE: TFloatField;
    AQ17STD_COST: TFloatField;
    AQ17ACTUAL_COST: TFloatField;
    AQ17FAILURE_RATE: TFloatField;
    AQ17SHELF_LIFE: TSmallintField;
    AQ17COUNT_INTERVAL_TRANS: TSmallintField;
    AQ17EST_SCRAP: TFloatField;
    AQ17FIXED_SCRAP_RATE: TFloatField;
    AQ17NEW_STD_COST: TFloatField;
    AQ17CATALOG_NUM: TStringField;
    AQ17OPT_LOT_SIZE: TIntegerField;
    AQ17AVL_FLAG: TStringField;
    AQ17CURRENT_ACT_ACTIVITY: TFloatField;
    AQ17CURRENT_ACT_MATERIAL: TFloatField;
    AQ17LAST_CURNT_COST_UPDT: TDateTimeField;
    AQ17LAST_STD_COST_UPDT: TDateTimeField;
    AQ17ALLOW_EDIT_FLAG: TStringField;
    AQ17STORAGE_COND_PTR: TIntegerField;
    AQ17SHELF_LIFE_PTR: TIntegerField;
    AQ17STORG_PRECATION_PTR: TIntegerField;
    AQ17CONSIGN_ONHAND_QTY: TFloatField;
    AQ17CONSIGN_QTY_IN_INSP: TFloatField;
    AQ17REPORT_VALUE1: TFloatField;
    AQ17REPORT_VALUE2: TFloatField;
    AQ17REPORT_VALUE3: TFloatField;
    AQ17MIN_LOT_SIZE_AUTOREL: TFloatField;
    AQ17AUTO_RELEASE_FLAG: TWordField;
    AQ17AUTO_PURCHASE_FLAG: TWordField;
    AQ17CRITICAL_MATL_FLAG: TWordField;
    AQ17AUTO_RELEASE_HOLDFLG: TSmallintField;
    AQ17HOLD_BY_EMPL_PTR: TIntegerField;
    AQ17ONHOLD_DATE: TDateTimeField;
    AQ17CUR_MONTH_OPEN_BAL: TFloatField;
    AQ17CONSIGNMENT_FLAG: TStringField;
    AQ17ACTIVE_FLAG: TStringField;
    AQ17LOT_NUMBER_COUNT: TIntegerField;
    AQ17ANALYSIS_CODE1: TStringField;
    AQ17ANALYSIS_CODE2: TStringField;
    AQ17ANALYSIS_CODE3: TStringField;
    AQ17ANALYSIS_CODE4: TStringField;
    AQ17ANALYSIS_CODE5: TStringField;
    AQ17IES_PARAMETER_VALUE1: TStringField;
    AQ17IES_PARAMETER_VALUE2: TStringField;
    AQ17IES_PARAMETER_VALUE3: TStringField;
    AQ17IES_PARAMETER_VALUE4: TStringField;
    AQ17IES_PARAMETER_VALUE5: TStringField;
    AQ17IES_PARAMETER_VALUE6: TStringField;
    AQ17IES_PARAMETER_VALUE7: TStringField;
    AQ17IES_PARAMETER_VALUE8: TStringField;
    AQ17IES_PARAMETER_VALUE9: TStringField;
    AQ17IES_PARAMETER_VALUE10: TStringField;
    ADO20: TADOQuery;
    DataSource4: TDataSource;
    ADO20RKEY: TAutoIncField;
    ADO20SOURCE_PTR: TIntegerField;
    ADO20PICTURE: TBlobField;
    ado496: TADOQuery;
    DataSource5: TDataSource;
    ado496group_name: TStringField;
    ado496group_desc: TStringField;
    ado496inv_group_name: TStringField;
    ado496inv_group_desc: TStringField;
    AQ17INV_NAME: TStringField;
    AQ17INV_DESCRIPTION: TStringField;
    AQ17QUAN_ON_HAND: TFloatField;
    AQ17INV_PART_DESCRIPTION: TStringField;
    ADO0017: TADOQuery;
    ADO0017inv_part_number: TStringField;
    ADO0017INV_NAME: TStringField;
    ADO0017INV_DESCRIPTION: TStringField;
    ado496mask_inv_number: TStringField;
    ado496if_flag: TWordField;
    Aq0002: TADOQuery;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    Aq0023: TADOQuery;
    AQ0499PARAMETER_NAME: TStringField;
    AQ0499PARAMETER_DESC: TStringField;
    procedure AQ17PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure AQ17AfterDelete(DataSet: TDataSet);
    procedure AQ17DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ17PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
// messagedlg('数据保存出错,请重仔细检查!',mtwarning,[mbok],0);
// abort;
end;

procedure TDM.AQ17AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.AQ17DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('不能删除该原材料,已有库存!',mtwarning,[mbcancel],0);
 abort;
end;

end.
