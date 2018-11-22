unit Dm;

interface

uses
  SysUtils, Classes, ADODB, DB,Dialogs;

type
  Tdmcon = class(TDataModule)
    adsMatrlGroupList: TADODataSet;
    adsMatrlGroupListDEPT_CODE: TStringField;
    adsMatrlGroupListDEPT_NAME: TStringField;
    adsMatrlGroupListINV_GROUP_PTR: TIntegerField;
    adsMatrlGroupListBOM_NAME: TStringField;
    adsMatrlGroupListFORMULA: TMemoField;
    adsMatrlGroupListSEQ_NO: TWordField;
    adsMatrlGroupListGROUP_DESC: TStringField;
    adsMatrlGroupListGROUP_NAME: TStringField;
    adsMatrlGroupListSTEP_NUMBER: TSmallintField;
    adsMatrlGroupListDOC_FLAG: TStringField;
    adsMatrlGroupListMGRkey: TAutoIncField;
    adsMatrlGroupListEFRkey: TAutoIncField;
    adsMatrlGroupListIS_COST_DEPT: TWordField;
    adsMatrlGroupListSPEC_RKEY: TStringField;
    adsMatrlGroupListRKey: TAutoIncField;
    dsMatrlGroupList: TDataSource;
    adsBOMParams: TADODataSet;
    adsBOMParamsRKEY: TAutoIncField;
    adsBOMParamsPARAMETER_PTR: TIntegerField;
    adsBOMParamsPARAMETER_VALUE: TStringField;
    adsBOMParamsSOURCE_PTR: TIntegerField;
    adsBOMParamsFLOW_NO: TSmallintField;
    adsBOMParamsROUTE_STEP_PTR: TIntegerField;
    adsBOMParamsSEQ_NO: TIntegerField;
    adsBOMParamsParam_Name: TStringField;
    adsBOMParamsParam_Desc: TStringField;
    adsBOMParamsDataType: TStringField;
    adsBOMParamsUnit: TStringField;
    adsBOMParamsSpec_rKey: TStringField;
    adsBOMParamsData_Type: TIntegerField;
    dsBOMParams: TDataSource;
    aqGroupParam: TADOQuery;
    aqIESParams: TADOQuery;
    aqDrillersValue: TADOQuery;
    aqMaterials: TADOQuery;
    aqEngTable: TADOQuery;
    aqPubParams: TADOQuery;
    aqParamValueList: TADOQuery;
    adsParamsInfo: TADODataSet;
    ADOConnection1: TADOConnection;
    adsBOM: TADODataSet;
    adsProdLists: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet2: TADODataSet;
    dsBOM: TDataSource;
    aqTmp: TADOQuery;
    adsBOMRKEY: TAutoIncField;
    adsBOMMANU_BOM_PTR: TIntegerField;
    adsBOMDEPT_PTR: TIntegerField;
    adsBOMINVENTORY_PTR: TIntegerField;
    adsBOMQTY_BOM: TFloatField;
    adsBOMFLOW_NO: TSmallintField;
    adsBOMROUTE_STEP_NO: TSmallintField;
    adsBOMDOC_FLAG: TStringField;
    adsBOMDeptName: TStringField;
    adsBOMPartNo: TStringField;
    adsBOMPartName: TStringField;
    adsBOMUnitCode: TStringField;
    aqBOMCalcTmp: TADODataSet;
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
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    aqBOMView: TADOQuery;
    dsBOMView: TDataSource;
    aqBOMViewDept_ptr: TIntegerField;
    aqBOMViewInv_Part_Number: TStringField;
    aqBOMViewINV_Name: TStringField;
    aqBOMViewUnit_Code: TStringField;
    aqBOMViewDept_Code: TStringField;
    aqBOMViewDOC_FLAG: TStringField;
    aqBOMViewQty_BOM: TFloatField;
    aqBOMViewRoute_Step_NO: TSmallintField;
    AQY0025QTY_ON_HAND: TIntegerField;
    AQY0025WAREHOUSE_CODE: TStringField;
    AQY0025ABBR_NAME: TStringField;
    adsMatrlGroupListRec: TIntegerField;
    tmp: TADOQuery;
    tmp1: TADOQuery;
    adsMatrlGroupListrequired: TStringField;
    AQY0025BOM_APPR_BY: TIntegerField;
    AQY0025BOM_APPR_DATE: TDateTimeField;
    AQY0025BOM_STATUS: TWordField;
    AQY0025layers_image: TBlobField;
    AQY0025MinRing: TBCDField;
    procedure adsBOMParamsNewRecord(DataSet: TDataSet);
    procedure adsMatrlGroupListAfterScroll(DataSet: TDataSet);
    procedure adsBOMParamsAfterScroll(DataSet: TDataSet);
    procedure adsBOMCalcFields(DataSet: TDataSet);
    procedure ads494BeforeEdit(DataSet: TDataSet);
    procedure adsMatrlGroupListCalcFields(DataSet: TDataSet);
    procedure adsBOMParamsPARAMETER_VALUEValidate(Sender: TField);
    procedure ads494AfterPost(DataSet: TDataSet);
  private

  public
    FTag:integer;
    FD494Modified:boolean;
    function SaveData :boolean;
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;    
  end;

var
  dmcon: Tdmcon;

implementation

uses Bom_Edit,MyClass,ConstVar,common;

{$R *.dfm}

procedure Tdmcon.adsBOMParamsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('PARAMETER_PTR').Value := 0;
  DataSet.FieldByName('SOURCE_PTR').Value := adsMatrlGroupList.FieldByName('MGRkey').Value; //data0498 rKey
  DataSet.FieldByName('ROUTE_STEP_PTR').Value := adsMatrlGroupList.FieldByName('EFRkey').Value; //data0038 rKey
end;

procedure Tdmcon.adsMatrlGroupListAfterScroll(DataSet: TDataSet);
begin
  adsBOMParams.Filtered := false;
  adsBOMParams.Filter := 'SOURCE_PTR='+adsMatrlGroupList.fieldByName('MGRkey').AsString+' and ROUTE_STEP_PTR='+adsMatrlGroupList.fieldByName('EFRkey').AsString;
  adsBOMParams.Filtered := true;
end;

procedure Tdmcon.adsBOMParamsAfterScroll(DataSet: TDataSet);
begin
  if (frmbom_Edit = nil) or frmbom_Edit.v_Batch_State then exit;
  if frmbom_Edit.v_EnterMode = em_browse then exit;
  if adsBOMParams.fieldByName('parameter_ptr').IsNULL then exit;
  
  aqParamValueList.Filtered := false;
  aqParamValueList.Filter := 'parameter_ptr='+adsBOMParams.fieldByName('parameter_ptr').AsString;
  aqParamValueList.Filtered := true;
  frmbom_Edit.DBGridEh1.Columns[5].PickList.clear;
  aqParamValueList.first;
  while not aqParamValueList.Eof do begin
    frmbom_Edit.DBGridEh1.Columns[5].PickList.Add(trim(aqParamValueList.FieldByName('TValue').AsString));
    aqParamValueList.next;
  end;
end;

function Tdmcon.SaveData: boolean;
begin
  result := true;
  tmp.Close;
  tmp.SQL.Text:='select getdate()';
  tmp.Open;
  if not adsBOM.Connection.InTransaction then
    adsBOM.Connection.BeginTrans;
  try
    adsBOMParams.Filter :='';
    adsBOMParams.Filtered := false;
    if adsBOMParams.State in dsEditModes then
      adsBOMParams.Post;
    adsBOMParams.UpdateBatch(arAll);
    if adsBOM.State in dsEditModes then
      adsBOM.Post;
    adsBOM.UpdateBatch(arAll);
    adsBOM.Connection.CommitTrans;

  except
    result := false;
    adsBOM.CancelBatch(arAll);
    adsBOM.Connection.RollbackTrans;
  end;
end;

procedure Tdmcon.adsBOMCalcFields(DataSet: TDataSet);
var
  sqlstr:string;
begin
  if (frmbom_Edit = nil) or frmbom_Edit.v_Batch_State then exit;//如果BOM编辑界面没有激活或者在BOM计算时候，就跳出事件
  if aqBOMCalcTmp.Locate('Mrkey',DataSet.FieldByName('INVENTORY_PTR').value,[loCaseInsensitive]) then
  begin
    DataSet.FieldByName('PartNo').Asstring := aqBOMCalcTmp.fieldByname('Inv_Part_Number').AsString;
    DataSet.FieldByName('PartName').Asstring := aqBOMCalcTmp.fieldByname('INV_Name').AsString;
    DataSet.FieldByName('UnitCode').Asstring := aqBOMCalcTmp.fieldByname('Unit_Code').AsString;
  end
  else
  begin
    if not DataSet.FieldByName('INVENTORY_PTR').IsNull then
    begin
      sqlstr:='select M.rkey,Inv_Part_Number,Inv_Part_Description,U.Unit_Code from data0017 M inner join data0002 U on M.STOCK_UNIT_PTR=U.rKey where M.rKey='+DataSet.FieldByName('INVENTORY_PTR').Asstring;
      MyDataClass.OpenQuery(aqTmp,sqlstr);
      if not aqTmp.IsEmpty then
      begin
        DataSet.FieldByName('PartNo').Asstring := aqTmp.fieldByname('Inv_Part_Number').AsString;
        DataSet.FieldByName('PartName').Asstring := aqTmp.fieldByname('Inv_Part_Description').AsString;
        DataSet.FieldByName('UnitCode').Asstring := aqTmp.fieldByname('Unit_Code').AsString;

        aqBOMCalcTmp.Append;
        aqBOMCalcTmp.fieldByname('Unit_Code').value := aqTmp.fieldByname('Unit_Code').value;
        aqBOMCalcTmp.fieldByname('Inv_Part_Number').value := aqTmp.fieldByname('Inv_Part_Number').value;
        aqBOMCalcTmp.fieldByname('INV_Name').value := aqTmp.fieldByname('Inv_Part_Description').value;
        aqBOMCalcTmp.fieldByname('Mrkey').value := aqTmp.fieldByname('rkey').value;
        aqBOMCalcTmp.Post;
      end;
    end;
  end;
  if not DataSet.FieldByName('DEPT_PTR').IsNull then
  begin
    sqlstr:='select Dept_Code  from data0034 where Rkey='+DataSet.FieldByName('DEPT_PTR').Asstring;
    MyDataClass.OpenQuery(aqTmp,sqlstr);
    if not aqTmp.IsEmpty then
      DataSet.FieldByName('DeptName').Asstring := aqTmp.fieldByname('Dept_Code').AsString;
  end;
end;

procedure Tdmcon.ads494BeforeEdit(DataSet: TDataSet);
begin
  if DataSet.FieldByName('after_flag').AsString <> 'Y' then abort;
end;

procedure Tdmcon.adsMatrlGroupListCalcFields(DataSet: TDataSet);
begin
  if (adsMatrlGroupList.RecNo=-1) then
    adsMatrlGroupListRec.Value:=1
  else
    adsMatrlGroupListRec.Value:=adsMatrlGroupList.RecNo;
end;

procedure Tdmcon.adsBOMParamsPARAMETER_VALUEValidate(Sender: TField);
var f:real;
begin
  if (adsBOMParamsData_Type.Value=1) and (Sender.AsString<>'') then
  try
    f:=strtofloat(Sender.AsString);
  except
    showmessage('工序'+adsMatrlGroupListDEPT_CODE.AsString+','+trim(adsBOMParamsParam_Name.Value)+'参数值='+Sender.AsString+'不正确,请检查工程参数!');
    //abort;
  end;
end;

procedure Tdmcon.ads494AfterPost(DataSet: TDataSet);
begin
  FD494Modified:=true;
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

end.
