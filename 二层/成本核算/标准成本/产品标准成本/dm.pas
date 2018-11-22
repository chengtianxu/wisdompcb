unit dm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    ads460: TADODataSet;
    adsProdLists: TADODataSet;
    dsProdLists: TDataSource;
    AQY0025: TADOQuery;
    AQY0025RKEY: TAutoIncField;
    AQY0025MANU_PART_NUMBER: TStringField;
    AQY0025MANU_PART_DESC: TStringField;
    AQY0025PARENT_PTR: TIntegerField;
    AQY0025QTY_BOM: TWordField;
    AQY0025BOM_STEP: TWordField;
    AQY0025CREATED_BY_EMPL_PTR: TIntegerField;
    AQY0025ENG_ROUTE_PTR: TIntegerField;
    AQY0025REMARK: TMemoField;
    AQY0025ENG_NOTE: TStringField;
    AQY0025memo_text: TMemoField;
    AQY0025PROD_CODE_PTR: TIntegerField;
    AQY0025OPT_LOT_SIZE: TIntegerField;
    AQY0025EST_SCRAP: TFloatField;
    AQY0025SHELF_LIFE: TIntegerField;
    AQY0025REVIEW_DAYS: TSmallintField;
    AQY0025PARTS_NUM: TIntegerField;
    AQY0025SAMPLE_NR: TStringField;
    AQY0025CUSTOMER_PTR: TIntegerField;
    AQY0025MFG_LEAD_TIME: TSmallintField;
    AQY0025LAST_SO_DATE: TDateTimeField;
    AQY0025REPORT_UNIT_VALUE1: TBCDField;
    AQY0025TSTATUS: TWordField;
    AQY0025CHECK_BY_PTR: TIntegerField;
    AQY0025CHECK_DATE: TDateTimeField;
    AQY0025AUDITED_BY_PTR: TIntegerField;
    AQY0025AUDITED_DATE: TDateTimeField;
    AQY0025ALLOW_EDIT_FLAG: TStringField;
    AQY0025ONHOLD_SALES_FLAG: TWordField;
    AQY0025ONHOLD_RELEASE_FLAG: TWordField;
    AQY0025ONHOLD_PLANNING_FLAG: TWordField;
    AQY0025CUSTPART_ENT_DATE: TDateTimeField;
    AQY0025LAST_MODIFIED_BY_PTR: TIntegerField;
    AQY0025LAST_MODIFIED_DATE: TDateTimeField;
    AQY0025ANALYSIS_CODE_2: TStringField;
    AQY0025ANALYSIS_CODE_3: TStringField;
    AQY0025LAYERS: TWordField;
    AQY0025green_flag: TStringField;
    AQY0025set_lngth: TBCDField;
    AQY0025set_width: TBCDField;
    AQY0025set_qty: TIntegerField;
    AQY0025unit_sq: TFloatField;
    AQY0025ANALYSIS_CODE_1: TStringField;
    AQY0025pcs_lngth: TBCDField;
    AQY0025pcs_width: TBCDField;
    AQY0025pcs_sq: TFloatField;
    AQY0025ANALYSIS_CODE_5: TStringField;
    AQY0025spell_lngth: TBCDField;
    AQY0025spell_width: TBCDField;
    AQY0025spell_qty: TIntegerField;
    AQY0025spell_sq: TFloatField;
    AQY0025ANALYSIS_CODE_4: TStringField;
    AQY0025SO_UNIT: TStringField;
    AQY0025ttype: TWordField;
    AQY0025layers_info: TMemoField;
    DataSource2: TDataSource;
    ads502: TADODataSet;
    ads502source_ptr: TIntegerField;
    ads502sheet_BMP: TBlobField;
    ads502pnl_bmp: TBlobField;
    ads502pnl2_bmp: TBlobField;
    ads502TOTAL_PNLS_1: TSmallintField;
    ads502TOTAL_PNLS_2: TSmallintField;
    ads502UNIT_LEN: TFloatField;
    ads502UNIT_WTH: TFloatField;
    ads502UNIT_UNIT: TWordField;
    ads502UNIT_NUM: TIntegerField;
    ads502SHT_LEN: TFloatField;
    ads502SHT_WTH: TFloatField;
    ads502TUSAGE: TBCDField;
    ads502PNL_LEN: TFloatField;
    ads502PNL_WTH: TFloatField;
    ads502UPANEL: TSmallintField;
    ads502PNL_LEN_2: TFloatField;
    ads502PNL_WTH_2: TFloatField;
    ads502UPANEL_2: TSmallintField;
    ads502minspace1: TFloatField;
    ads502minspace2: TFloatField;
    ads279: TADODataSet;
    ads279source_PTR: TIntegerField;
    ads279PARAMETER_PTR: TIntegerField;
    ads279PARAMETER_VALUE: TStringField;
    ads279IES_PROD: TSmallintField;
    ads279IES_CRP: TSmallintField;
    ads279PARAMETER_NAME: TStringField;
    ads279PARAMETER_DESC: TStringField;
    ads279SPEC_RKEY: TStringField;
    ads279UNIT_NAME: TStringField;
    ads279datatype: TStringField;
    ads279status3: TWordField;
    DataSource3: TDataSource;
    ads278: TADODataSet;
    ads278rkey: TIntegerField;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278SPEC_RKEY: TStringField;
    ads278UNIT_NAME: TStringField;
    ads278datatype: TStringField;
    ads278STATUS3: TWordField;
    ADS38: TADODataSet;
    ADS38SOURCE_PTR: TIntegerField;
    ADS38DEPT_PTR: TIntegerField;
    ADS38DEF_ROUT_INST: TStringField;
    ADS38STEP_NUMBER: TSmallintField;
    ADS38tooling_rev: TStringField;
    ADS38OUTP_SPFC: TBCDField;
    ADS38tool_old_rev: TStringField;
    ADS38DEPT_CODE: TStringField;
    ADS38DEPT_NAME: TStringField;
    ADS38BARCODE_ENTRY_FLAG: TStringField;
    DataSource4: TDataSource;
    ads34: TADODataSet;
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
    DataSource5: TDataSource;
    ads89: TADODataSet;
    ads89PARAMETER_NAME: TStringField;
    ads89PARAMETER_DESC: TStringField;
    ads89tvalue: TStringField;
    ads89UNIT_NAME: TStringField;
    ads89SPEC_RKEY: TStringField;
    ads89datatype: TStringField;
    DataSource6: TDataSource;
    aqBOMView: TADOQuery;
    aqBOMViewDept_ptr: TIntegerField;
    aqBOMViewInv_Part_Number: TStringField;
    aqBOMViewINV_Name: TStringField;
    aqBOMViewUnit_Code: TStringField;
    aqBOMViewDept_Code: TStringField;
    aqBOMViewDOC_FLAG: TStringField;
    aqBOMViewQty_BOM: TFloatField;
    aqBOMViewRoute_Step_NO: TSmallintField;
    dsBOMView: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    aqPrimaryMatl: TADOQuery;
    aqSecondaryMatl: TADOQuery;
    adsPrimaryMatl: TDataSource;
    adsSecondaryMatl: TDataSource;
    aqPrimaryMatlroute_step_no: TSmallintField;
    aqPrimaryMatldept_ptr: TIntegerField;
    aqPrimaryMatlDept_Code: TStringField;
    aqPrimaryMatlInv_Part_Number: TStringField;
    aqPrimaryMatlInv_Part_Description: TStringField;
    aqPrimaryMatlUnit_Code: TStringField;
    aqPrimaryMatlqty_bom: TFloatField;
    aqPrimaryMatlstd_cost: TFloatField;
    aqPrimaryMatlCost_Pcs: TFloatField;
    aqPrimaryMatlCost_Per_SQM: TFloatField;
    aqSecondaryMatlDept_ptr: TIntegerField;
    aqSecondaryMatlDept_Code: TStringField;
    aqSecondaryMatlstep_number: TSmallintField;
    aqSecondaryMatlInv_Part_Number: TStringField;
    aqSecondaryMatlInv_Part_Description: TStringField;
    aqSecondaryMatlUnit_Code: TStringField;
    aqSecondaryMatlqty_bom_per_sqft: TBCDField;
    aqSecondaryMatlstd_cost: TFloatField;
    aqSecondaryMatlCost_Per_Sqft: TFloatField;
    aqSecondaryMatlCost_per_Pcs: TFloatField;
    aqCostSum: TADOQuery;
    dsCostSum: TDataSource;
    aqCostSumRKEY: TIntegerField;
    aqCostSumSTEP: TSmallintField;
    aqCostSumMATL_PER_SQFT_1: TFloatField;
    aqCostSumMATL_PER_SQFT_2: TFloatField;
    aqCostSumACCU_MATL_PER_SQFT: TFloatField;
    aqCostSumTOT_ACCU_MATL_PER_SQFT: TFloatField;
    aqCostSumSub_Matl_Cost: TBCDField;
    aqCostSumDept_Code: TStringField;
    spCostUpdate: TADOStoredProc;
    aqCostSumMatl1: TFloatField;
    aqCostSumMatl2: TFloatField;
    aqCostSumSub_Cost: TFloatField;
    aqCostSumTotal_Matl_Cost: TFloatField;
    aqCostSumTotal_All: TFloatField;
    AQY0025tot_accu_matl_per_sqft: TFloatField;
    AQY0025cost_appr_by: TIntegerField;
    aqProducingCost: TADOQuery;
    dsProducingCost: TDataSource;
    aqProducingCostDEPT_CODE: TStringField;
    aqProducingCostP1_PCS: TFloatField;
    aqProducingCostP2_PCS: TFloatField;
    aqProducingCostP3_PCS: TFloatField;
    aqProducingCostStep: TSmallintField;
    aqProducingCostOverHead_Per_SQFT: TFloatField;
    aqProducingCostOverHead2_Per_SQFT: TFloatField;
    aqProducingCostOverHead3_Per_SQFT: TFloatField;
    aqCostSumOVERHEAD_PER_SQFT: TFloatField;
    aqCostSumOVERHEAD2_PER_SQFT: TFloatField;
    aqCostSumOVERHEAD3_PER_SQFT: TFloatField;
    aqCostSumTOT_ACCU_OVHD_PER_SQFT: TFloatField;
    aqCostSumProducingCost: TBCDField;
    aqCostSumPCost1: TFloatField;
    aqCostSumPCost2: TFloatField;
    aqCostSumPCost3: TFloatField;
    aqCostSumTotal: TFloatField;
    aqProducingCostTotal_pcs: TFloatField;
    aqProducingCostTotal_SQM: TFloatField;
    aqCostSumPCost: TFloatField;
    aqCostSumMCost: TFloatField;
    aqCostSumSub_Producing_Cost: TBCDField;
    aqCostSumSub_P_Cost: TBCDField;
    AQY0025LATEST_PRICE: TFloatField;
    AQY0025QTY_ON_HAND: TIntegerField;
    tmp: TADOQuery;
    adsProdListsRKEY: TAutoIncField;
    adsProdListsCUST_CODE: TStringField;
    adsProdListsCUSTPART_ENT_DATE: TDateTimeField;
    adsProdListsCUSTOMER_PTR: TIntegerField;
    adsProdListsMANU_PART_NUMBER: TStringField;
    adsProdListsABBR_NAME: TStringField;
    adsProdListsTSTATUS: TWordField;
    adsProdListsBOM_STATUS: TWordField;
    adsProdListsMANU_PART_DESC: TStringField;
    adsProdListsLAST_MODIFIED_DATE: TDateTimeField;
    adsProdListsBOM_APPR_DATE: TDateTimeField;
    adsProdListsBOM_Status_CN: TStringField;
    adsProdListsBOM_APPR_BY: TIntegerField;
    adsProdListsMI_Status: TStringField;
    adsProdListsAUDITED_BY_PTR: TIntegerField;
    adsProdListsAUDITED_DATE: TDateTimeField;
    adsProdListsCOST_APPR_BY: TIntegerField;
    adsProdListsCOST_APPR_DATE: TDateTimeField;
    adsProdListsEMPLOYEE_NAME: TStringField;
    adsProdListswarehouse_code: TStringField;
    adsProdListsabbr_name_1: TStringField;
    adsProdListsBOM_CREATENAME: TStringField;
    adsProdListsLAST_SO_DATE: TDateTimeField;
    adsProdListsbiaozhunchengben: TFloatField;
    adsProdListsxiaoshoujiage: TFloatField;
    qrytmp: TADOQuery;
    aqCostSumBOM_PTR: TIntegerField;
    aqCostSumFLOW_NO: TSmallintField;
    aqCostSumDEPT_PTR: TIntegerField;
    aqCostSumACCU_OVHD_PER_SQFT: TFloatField;
    aqCostSumsys_value: TBCDField;
    aqCostSumcost_4: TFloatField;
    aqCostSumcost_5: TFloatField;
    aqProducingCostcost_4: TFloatField;
    aqProducingCostcost_5: TFloatField;
    adsProdListsPRODUCT_NAME: TStringField;
    procedure aqPrimaryMatlCalcFields(DataSet: TDataSet);
    procedure aqSecondaryMatlCalcFields(DataSet: TDataSet);
    procedure aqProducingCostCalcFields(DataSet: TDataSet);
    procedure aqCostSumCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  SQMT2_Value:Double;
  procedure Open_Cost_Data(rkey25:integer);
    function SqlOpen(ASql: string): Boolean;overload;
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;overload;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
    function GetServerDateTime: TDateTime;
  end;

var
  dmcon: Tdmcon;

implementation
uses product_MIDetail, Dialogs;
{$R *.dfm}

procedure Tdmcon.aqPrimaryMatlCalcFields(DataSet: TDataSet);
begin
  if SQMT2_Value <> 0 then
    aqPrimaryMatl.FieldByName('Cost_Per_SQM').Value :=
     aqPrimaryMatl.FieldByName('Cost_Pcs').Value/SQMT2_Value;
end;

procedure Tdmcon.aqSecondaryMatlCalcFields(DataSet: TDataSet);
begin
  if SQMT2_Value <> 0 then
    DataSet.FieldByName('Cost_per_Pcs').Value :=
      DataSet.FieldByName('Cost_Per_Sqft').Value*SQMT2_Value;
end;

procedure Tdmcon.Open_Cost_Data(rkey25: integer);
var
  aqTmp:TAdoQuery;
begin
  try
    aqTmp:= TAdoQuery.Create(self);
    aqTmp.Connection := dmcon.ADOConnection1;
    aqTmp.SQL.Clear;
    aqTmp.SQL.Add('select unit_sq from data0025 where rkey='+IntToStr(rKey25));
    aqTmp.Open;
    SQMT2_Value :=aqTmp.FieldByName('unit_sq').ASFloat;
  finally
    aqTmp.close;
    aqTmp.free;
  end;
  aqPrimaryMatl.Close;            //一类材料
  aqPrimaryMatl.Parameters[0].Value := rKey25;
  aqPrimaryMatl.Open;

  aqSecondaryMatl.Close;         //二类材料
  aqSecondaryMatl.Parameters[0].Value := rKey25;
  aqSecondaryMatl.Open;

  aqCostSum.Close;              //成本汇总
  aqCostSum.Parameters[0].Value := rKey25;
  aqCostSum.Open;

  aqProducingCost.Close;        //制造费用
  aqProducingCost.Parameters[0].Value := rKey25;
  aqProducingCost.Open;
end;

procedure Tdmcon.aqProducingCostCalcFields(DataSet: TDataSet);
begin
  if SQMT2_Value <> 0 then
  begin
//    DataSet.FieldByName('P1_Pcs').Value :=
//       DataSet.FieldByName('OverHead_Per_SQFT').Value*SQMT2_Value;
//    DataSet.FieldByName('P2_Pcs').Value :=
//      DataSet.FieldByName('OverHead2_Per_SQFT').Value*SQMT2_Value;
//    DataSet.FieldByName('P3_Pcs').Value :=
//      DataSet.FieldByName('OverHead3_Per_SQFT').Value*SQMT2_Value;

    DataSet.FieldByName('Total_SQM').Value :=
    (DataSet.FieldByName('OverHead_Per_SQFT').Value +
     DataSet.FieldByName('OverHead2_Per_SQFT').Value+
     DataSet.FieldByName('OverHead3_Per_SQFT').Value+
     DataSet.FieldByName('cost_4').Value+
     DataSet.FieldByName('cost_5').Value);
     
//    DataSet.FieldByName('Total_PCS').Value :=
//    (DataSet.FieldByName('OverHead_Per_SQFT').Value +
//     DataSet.FieldByName('OverHead2_Per_SQFT').Value+
//     DataSet.FieldByName('OverHead3_Per_SQFT').Value)*SQMT2_Value;
  end;
end;

procedure Tdmcon.aqCostSumCalcFields(DataSet: TDataSet);
begin
  aqCostSum.FieldByName('Total').Value :=
   aqCostSum.FieldByName('Matl1').asfloat+
   aqCostSum.FieldByName('Matl2').asfloat+
   aqCostSum.FieldByName('Sub_Cost').asfloat+
   aqCostSum.FieldByName('PCost1').asfloat+
   aqCostSum.FieldByName('PCost2').asfloat+
   aqCostSum.FieldByName('PCost3').asfloat+
   aqCostSum.FieldByName('Sub_P_Cost').asfloat +
   aqCostSum.FieldByName('cost_4').asfloat +
   aqCostSum.FieldByName('cost_5').asfloat;

  aqCostSum.FieldByName('Total_All').Value :=
   (aqCostSum.FieldByName('PCost').asfloat +
    aqCostSum.FieldByName('MCost').asfloat);
end;


function TDmcon.SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误!');
    ShowLSMSG(ASQL);
  end;
end;

procedure TDmcon.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TDmcon.SqlOpen(ASql: string): Boolean;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  Try
    LS.Add(ASql);
    Result := SQLOpen(qrytmp,LS);
  finally
    LS.Free;
  end;
end;

function TDmcon.SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误');
    ShowLSMSG(ASQL);
  end;
end;


function Tdmcon.GetServerDateTime: TDateTime;
begin
  if SQLOpen('select getdate() as ldatetime') then
  begin
    Result := qrytmp.fieldbyname('ldatetime').AsDateTime;
  end else
    Result := 0;
end;

end.
