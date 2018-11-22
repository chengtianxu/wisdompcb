unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,math;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQDS451: TADODataSet;
    AQDSAP451: TADODataSet;
    AQDSAP451RKEY: TAutoIncField;
    AQDSAP451FM_DATE: TDateTimeField;
    AQDSAP451END_DATE: TDateTimeField;
    AQDSAP451ACTUAL_FM_DATE: TDateTimeField;
    AQDSAP451ACTUAL_END_DATE: TDateTimeField;
    AQDSAP451MATL_CST_IN_STOCK_OPEN: TBCDField;
    AQDSAP451MATL_CST_IN_STOCK_CLOSED: TBCDField;
    AQDSAP451DMATL_CST_OUT: TBCDField;
    AQDSAP451DMATL_CST_IN_DEPT_OPEN: TBCDField;
    AQDSAP451DMATL_CST_IN_DEPT_CLOSED: TBCDField;
    AQDSAP451IDMATL_CST_OUT: TBCDField;
    AQDSAP451IDMATL_CST_IN_DEPT_OPEN: TBCDField;
    AQDSAP451IDMATL_CST_IN_DEPT_CLOSED: TBCDField;
    AQDSAP451MATL_CST_IN_WIP_OPEN: TBCDField;
    AQDSAP451MATL_CST_IN_WIP_CLOSED: TBCDField;
    AQDSAP451MATL_CST_IN_SFG_OPEN: TBCDField;
    AQDSAP451MATL_CST_IN_SFG_CLOSED: TBCDField;
    AQDSAP451MATL_CST_IN_FG_OPEN: TBCDField;
    AQDSAP451MATL_CST_IN_FG_CLOSED: TBCDField;
    AQDSAP451TOTAL_MATL_CST: TBCDField;
    AQDSAP451OVHD_CST_IN_WIP_OPEN: TBCDField;
    AQDSAP451OVHD_CST_IN_WIP_CLOSED: TBCDField;
    AQDSAP451OVHD_CST_IN_WIP_OCCURED: TBCDField;
    AQDSAP451OVHD_CST_IN_SFG_OPEN: TBCDField;
    AQDSAP451OVHD_CST_IN_SFG_CLOSED: TBCDField;
    AQDSAP451OVHD_CST_IN_FG_OPEN: TBCDField;
    AQDSAP451OVHD_CST_IN_FG_CLOSED: TBCDField;
    AQDSAP451TOTAL_OVHD_CST: TBCDField;
    AQDSAP451YIELD_IN_SQFT: TFloatField;
    AQDSAP451YIELD_IN_AMOUNT: TBCDField;
    AQDSAP451CLOSED_BY: TIntegerField;
    AQDSAP451CLOSED_DATE: TDateTimeField;
    AQDSAP451SELECTED: TSmallintField;
    AQDSAP451YLD_IN_AMT_REJUST: TFloatField;
    AQDSAP451YLD_IN_SQFT_REJUST: TFloatField;
    AQDSAP451MATL_GL_DATE: TDateTimeField;
    AQDSAP451MATL_GL_PTR: TIntegerField;
    AQDSAP451MATL_GL_BY: TIntegerField;
    AQDSAP451WIP_GL_DATE: TDateTimeField;
    AQDSAP451WIP_GL_PTR: TIntegerField;
    AQDSAP451WIP_GL_BY: TIntegerField;
    AQDSAP451FG_GL_DATE: TDateTimeField;
    AQDSAP451FG_GL_PTR: TIntegerField;
    AQDSAP451FG_GL_BY: TIntegerField;
    AQDSAP451wo_closed: TStringField;
    AQDSAP451stock_matl_cost: TBCDField;
    AQDSAP451stock_matl_in_wip_cost: TBCDField;
    AQDSAP451purchased_matl_cost: TBCDField;
    AQDSAP451misc_used_matl_cost: TBCDField;
    AQDSAP451closed_stock_matl_cost: TBCDField;
    AQDSAP451closed_stock_matl_in_wip_cost: TBCDField;
    AQDSAP451ovhd1_cost: TBCDField;
    AQDSAP451ovhd2_cost: TBCDField;
    AQDSAP451ovhd3_cost: TBCDField;
    AQDSAP451open_wip_cost: TBCDField;
    AQDSAP451closed_wip_cost: TBCDField;
    AQDSAP451open_fg_cost: TBCDField;
    AQDSAP451closed_fg_cost: TBCDField;
    AQDSAP451closed_stock_matl_in_wip_cost1: TBCDField;
    AQDSAP451SFG_GL_DATE: TDateTimeField;
    AQDSAP451wo_ptr: TIntegerField;
    AQDSAP451returned_matl_cost: TBCDField;
    AQDS451no: TIntegerField;
    AQDS451EMPLOYEE_NAME: TStringField;
    AQDS451RKEY: TIntegerField;
    AQDS451FM_DATE: TDateTimeField;
    AQDS451END_DATE: TDateTimeField;
    AQDS451ACTUAL_FM_DATE: TDateTimeField;
    AQDS451ACTUAL_END_DATE: TDateTimeField;
    AQDS451MATL_CST_IN_STOCK_OPEN: TBCDField;
    AQDS451MATL_CST_IN_STOCK_CLOSED: TBCDField;
    AQDS451DMATL_CST_OUT: TBCDField;
    AQDS451DMATL_CST_IN_DEPT_OPEN: TBCDField;
    AQDS451DMATL_CST_IN_DEPT_CLOSED: TBCDField;
    AQDS451IDMATL_CST_OUT: TBCDField;
    AQDS451IDMATL_CST_IN_DEPT_OPEN: TBCDField;
    AQDS451IDMATL_CST_IN_DEPT_CLOSED: TBCDField;
    AQDS451MATL_CST_IN_WIP_OPEN: TBCDField;
    AQDS451MATL_CST_IN_WIP_CLOSED: TBCDField;
    AQDS451MATL_CST_IN_SFG_OPEN: TBCDField;
    AQDS451MATL_CST_IN_SFG_CLOSED: TBCDField;
    AQDS451MATL_CST_IN_FG_OPEN: TBCDField;
    AQDS451MATL_CST_IN_FG_CLOSED: TBCDField;
    AQDS451TOTAL_MATL_CST: TBCDField;
    AQDS451OVHD_CST_IN_WIP_OPEN: TBCDField;
    AQDS451OVHD_CST_IN_WIP_CLOSED: TBCDField;
    AQDS451OVHD_CST_IN_WIP_OCCURED: TBCDField;
    AQDS451OVHD_CST_IN_SFG_OPEN: TBCDField;
    AQDS451OVHD_CST_IN_SFG_CLOSED: TBCDField;
    AQDS451OVHD_CST_IN_FG_OPEN: TBCDField;
    AQDS451OVHD_CST_IN_FG_CLOSED: TBCDField;
    AQDS451TOTAL_OVHD_CST: TBCDField;
    AQDS451YIELD_IN_SQFT: TFloatField;
    AQDS451YIELD_IN_AMOUNT: TBCDField;
    AQDS451CLOSED_BY: TIntegerField;
    AQDS451CLOSED_DATE: TDateTimeField;
    AQDS451SELECTED: TSmallintField;
    AQDS451YLD_IN_AMT_REJUST: TFloatField;
    AQDS451YLD_IN_SQFT_REJUST: TFloatField;
    AQDS451MATL_GL_DATE: TDateTimeField;
    AQDS451MATL_GL_PTR: TIntegerField;
    AQDS451MATL_GL_BY: TIntegerField;
    AQDS451WIP_GL_DATE: TDateTimeField;
    AQDS451WIP_GL_PTR: TIntegerField;
    AQDS451WIP_GL_BY: TIntegerField;
    AQDS451FG_GL_DATE: TDateTimeField;
    AQDS451FG_GL_PTR: TIntegerField;
    AQDS451FG_GL_BY: TIntegerField;
    AQDS451wo_closed: TStringField;
    AQDS451stock_matl_cost: TBCDField;
    AQDS451stock_matl_in_wip_cost: TBCDField;
    AQDS451purchased_matl_cost: TBCDField;
    AQDS451misc_used_matl_cost: TBCDField;
    AQDS451closed_stock_matl_cost: TBCDField;
    AQDS451closed_stock_matl_in_wip_cost: TBCDField;
    AQDS451ovhd1_cost: TBCDField;
    AQDS451ovhd2_cost: TBCDField;
    AQDS451ovhd3_cost: TBCDField;
    AQDS451open_wip_cost: TBCDField;
    AQDS451closed_wip_cost: TBCDField;
    AQDS451open_fg_cost: TBCDField;
    AQDS451closed_fg_cost: TBCDField;
    AQDS451closed_stock_matl_in_wip_cost1: TBCDField;
    AQDS451SFG_GL_DATE: TDateTimeField;
    AQDS451wo_ptr: TIntegerField;
    AQDS451returned_matl_cost: TBCDField;
    DataSource1: TDataSource;
    AQDSAP451SALES_COST: TCurrencyField;
    aqd453: TADODataSet;
    aqd453DEPT_CODE: TStringField;
    aqd453DEPT_NAME: TStringField;
    aqd453BUDGET_COST: TBCDField;
    aqd453ACTUAL_COST: TBCDField;
    aqd453YIELD_SQFT: TFloatField;
    aqd424: TADODataSet;
    aqd424ovhd: TBCDField;
    aqd424std_ovhd: TBCDField;
    aqd424YIELD_SQFT: TBCDField;
    aqd424DEPT_CODE: TStringField;
    aqd424DEPT_NAME: TStringField;
    aqd452: TADODataSet;
    aqd452GROUP_NAME: TStringField;
    aqd452GROUP_DESC: TStringField;
    aqd452BUDGET_COST: TBCDField;
    aqd452ACTUAL_COST: TBCDField;
    AD441: TADODataSet;
    AD441D0451_PTR: TIntegerField;
    AD441YIELD_IN_SQFT: TFloatField;
    AD441YIELD_IN_AMOUNT: TBCDField;
    AD441quantity: TIntegerField;
    AD441sqft: TFloatField;
    AD441rej_cost: TBCDField;
    AD441sqft_bl: TFloatField;
    AD441amount_bl: TBCDField;
    AQDSAP451cost_scale: TCurrencyField;
    procedure AQDSAP451CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQDSAP451CalcFields(DataSet: TDataSet);
begin
  if not dm.AQDS451.IsEmpty then
dm.AQDSAP451SALES_COST.Value:=
  dm.AQDSAP451stock_matl_cost.Value+
  dm.AQDSAP451stock_matl_in_wip_cost.Value+
  dm.AQDSAP451purchased_matl_cost.Value-
  dm.AQDSAP451returned_matl_cost.Value-
  dm.AQDSAP451misc_used_matl_cost.Value-
  dm.AQDSAP451closed_stock_matl_cost.Value-
  dm.AQDSAP451closed_stock_matl_in_wip_cost.Value+
  dm.AQDSAP451ovhd1_cost.Value+
  dm.AQDSAP451ovhd2_cost.Value+
  dm.AQDSAP451ovhd3_cost.Value+
  dm.AQDSAP451open_wip_cost.Value-
  dm.AQDSAP451closed_wip_cost.Value+
  dm.AQDSAP451open_fg_cost.Value-
  dm.AQDSAP451closed_fg_cost.Value;
//  dm.AQDSAP451MATL_CST_IN_STOCK_OPEN.Value-
//  dm.AQDSAP451MATL_CST_IN_STOCK_CLOSED.Value;

  if not dm.AQDS451.IsEmpty then
if dm.AQDSAP451YIELD_IN_AMOUNT.Value>0 then
dm.AQDSAP451cost_scale.Value:=
{  roundto((dm.AQDSAP451stock_matl_cost.Value+
  dm.AQDSAP451stock_matl_in_wip_cost.Value+
  dm.AQDSAP451purchased_matl_cost.Value-
  dm.AQDSAP451returned_matl_cost.Value-
  dm.AQDSAP451misc_used_matl_cost.Value-
  dm.AQDSAP451closed_stock_matl_cost.Value-
  dm.AQDSAP451closed_stock_matl_in_wip_cost.Value+
  dm.AQDSAP451ovhd1_cost.Value+
  dm.AQDSAP451ovhd2_cost.Value+
  dm.AQDSAP451ovhd3_cost.Value+
  dm.AQDSAP451open_wip_cost.Value-
  dm.AQDSAP451closed_wip_cost.Value+
  dm.AQDSAP451open_fg_cost.Value-
  dm.AQDSAP451closed_fg_cost.Value)/
            dm.AQDSAP451YIELD_IN_AMOUNT.Value*100,-2);
}
  roundto(dm.AQDSAP451SALES_COST.Value/dm.AQDSAP451YIELD_IN_AMOUNT.Value*100,-2);
//  dm.AQDSAP451MATL_CST_IN_STOCK_OPEN.Value-
//  dm.AQDSAP451MATL_CST_IN_STOCK_CLOSED.Value)/

end;

end.
