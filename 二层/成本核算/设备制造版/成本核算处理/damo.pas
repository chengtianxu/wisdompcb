unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    AqD451: TADODataSet;
    AqD451RKEY: TIntegerField;
    AqD451FM_DATE: TDateTimeField;
    AqD451END_DATE: TDateTimeField;
    AqD451ACTUAL_FM_DATE: TDateTimeField;
    AqD451ACTUAL_END_DATE: TDateTimeField;
    AqD451EMPLOYEE_NAME: TStringField;
    AqD451CLOSED_DATE: TDateTimeField;
    ADOQuery1: TADOQuery;
    ADO451: TADOQuery;
    ADO451RKEY: TAutoIncField;
    ADO451FM_DATE: TDateTimeField;
    ADO451END_DATE: TDateTimeField;
    ADO451ACTUAL_FM_DATE: TDateTimeField;
    ADO451ACTUAL_END_DATE: TDateTimeField;
    ADO451MATL_CST_IN_STOCK_OPEN: TBCDField;
    ADO451MATL_CST_IN_STOCK_CLOSED: TBCDField;
    ADO451DMATL_CST_OUT: TBCDField;
    ADO451DMATL_CST_IN_DEPT_OPEN: TBCDField;
    ADO451DMATL_CST_IN_DEPT_CLOSED: TBCDField;
    ADO451IDMATL_CST_OUT: TBCDField;
    ADO451IDMATL_CST_IN_DEPT_OPEN: TBCDField;
    ADO451IDMATL_CST_IN_DEPT_CLOSED: TBCDField;
    ADO451MATL_CST_IN_WIP_OPEN: TBCDField;
    ADO451MATL_CST_IN_WIP_CLOSED: TBCDField;
    ADO451MATL_CST_IN_SFG_OPEN: TBCDField;
    ADO451MATL_CST_IN_SFG_CLOSED: TBCDField;
    ADO451MATL_CST_IN_FG_OPEN: TBCDField;
    ADO451MATL_CST_IN_FG_CLOSED: TBCDField;
    ADO451TOTAL_MATL_CST: TBCDField;
    ADO451OVHD_CST_IN_WIP_OPEN: TBCDField;
    ADO451OVHD_CST_IN_WIP_CLOSED: TBCDField;
    ADO451OVHD_CST_IN_WIP_OCCURED: TBCDField;
    ADO451OVHD_CST_IN_SFG_OPEN: TBCDField;
    ADO451OVHD_CST_IN_SFG_CLOSED: TBCDField;
    ADO451OVHD_CST_IN_FG_OPEN: TBCDField;
    ADO451OVHD_CST_IN_FG_CLOSED: TBCDField;
    ADO451TOTAL_OVHD_CST: TBCDField;
    ADO451YIELD_IN_SQFT: TFloatField;
    ADO451YIELD_IN_AMOUNT: TBCDField;
    ADO451CLOSED_BY: TIntegerField;
    ADO451CLOSED_DATE: TDateTimeField;
    ADO451SELECTED: TSmallintField;
    ADO451YLD_IN_AMT_REJUST: TFloatField;
    ADO451YLD_IN_SQFT_REJUST: TFloatField;
    ADO451MATL_GL_DATE: TDateTimeField;
    ADO451MATL_GL_PTR: TIntegerField;
    ADO451MATL_GL_BY: TIntegerField;
    ADO451WIP_GL_DATE: TDateTimeField;
    ADO451WIP_GL_PTR: TIntegerField;
    ADO451WIP_GL_BY: TIntegerField;
    ADO451FG_GL_DATE: TDateTimeField;
    ADO451FG_GL_PTR: TIntegerField;
    ADO451FG_GL_BY: TIntegerField;
    ADO451wo_closed: TStringField;
    ADO451stock_matl_cost: TBCDField;
    ADO451stock_matl_in_wip_cost: TBCDField;
    ADO451purchased_matl_cost: TBCDField;
    ADO451misc_used_matl_cost: TBCDField;
    ADO451closed_stock_matl_cost: TBCDField;
    ADO451closed_stock_matl_in_wip_cost: TBCDField;
    ADO451ovhd1_cost: TBCDField;
    ADO451ovhd2_cost: TBCDField;
    ADO451ovhd3_cost: TBCDField;
    ADO451open_wip_cost: TBCDField;
    ADO451closed_wip_cost: TBCDField;
    ADO451open_fg_cost: TBCDField;
    ADO451closed_fg_cost: TBCDField;
    ADO451closed_stock_matl_in_wip_cost1: TBCDField;
    ADO451SFG_GL_DATE: TDateTimeField;
    ADO451wo_ptr: TIntegerField;
    ADO451returned_matl_cost: TBCDField;
    aqdupdate: TADOStoredProc;
    ADS410: TADODataSet;
    ADS410WO_PTR: TIntegerField;
    ADS410STEP: TIntegerField;
    ADS410QTY: TIntegerField;
    ADS410bring_matl_pcs: TFloatField;
    ADS410bring_ovhd_pcs: TFloatField;
    ADS489: TADODataSet;
    ADSSUM410: TADODataSet;
    ADSSUM410matl: TFloatField;
    ADSSUM410ovhd: TFloatField;
    AqD451CLOSED: TStringField;
    ADOD424: TADODataSet;
    ADOD424dept_code: TStringField;
    ADOD424dept_name: TStringField;
    ADOD424RKEY: TAutoIncField;
    ADOD424D0451_PTR: TIntegerField;
    ADOD424DEPT_PTR: TIntegerField;
    ADOD424OVHD_1: TBCDField;
    ADOD424OVHD_2: TBCDField;
    ADOD424OVHD_3: TBCDField;
    ADOD424yield_sqft: TBCDField;
    ADOD424yield_amount: TBCDField;
    ADOD424STD_OVHD_1: TBCDField;
    ADOD424STD_OVHD_2: TBCDField;
    ADOD424STD_OVHD_3: TBCDField;
    ADOD424STD_MTAL_1: TBCDField;
    ADOD424STD_MTAL_2: TBCDField;
    ADOD424OVHD_MTAL_1: TBCDField;
    ADS489WO_PTR: TIntegerField;
    ADS489STEP: TIntegerField;
    ADS489QTY: TIntegerField;
    ADS489bring_matl_pcs: TFloatField;
    ADS489bring_ovhd_pcs: TFloatField;
    tmp: TADOQuery;
    ADOD424abbr_name: TStringField;
    AqD451NO: TIntegerField;
    AqD451CLOSED_BY: TIntegerField;
    procedure AqD451CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AqD451CalcFields(DataSet: TDataSet);
begin
if AqD451.RecNo<0 then
 self.AqD451NO.Value:=1
else
 self.AqD451NO.Value:=self.AqD451.RecNo;
end;

end.
