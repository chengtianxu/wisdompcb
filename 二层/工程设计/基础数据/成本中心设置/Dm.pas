unit Dm;

interface

uses
  SysUtils, Classes, ADODB, DB,variants, Provider, DBClient;

type
  TdmCon = class(TDataModule)
    adsMainMatrl: TADODataSet;
    adsMainMatrlRKEY: TAutoIncField;
    adsMainMatrlMtrl_Group_Name: TStringField;
    adsMainMatrlMtrl_Group_Desc: TStringField;
    dsMainMatrl: TDataSource;
    adsMaster: TADODataSet;
    dsMaster: TDataSource;
    adsIESParams: TADODataSet;
    dsIESParams: TDataSource;
    adsSecondaryMatrl: TADODataSet;
    dsSecondaryMatrl: TDataSource;
    adsSecondaryMatrlRKEY: TAutoIncField;
    adsSecondaryMatrlDEPT_PTR: TIntegerField;
    adsSecondaryMatrlINVENT_PTR: TIntegerField;
    adsSecondaryMatrlSEQ_NO: TSmallintField;
    adsSecondaryMatrlGroupName: TStringField;
    adsSecondaryMatrlINV_PART_NUMBER: TStringField;
    adsSecondaryMatrlINV_PART_DESCRIPTION: TStringField;
    adsSecondaryMatrlUnitCode: TStringField;
    aqMatrlGroup: TADOQuery;
    aqMatrl: TADODataSet;
    aqIESParamsList: TADOQuery;
    adsMainMatrlINV_GROUP_PTR: TIntegerField;
    adsMainMatrlDEPT_PTR: TIntegerField;
    adsMainMatrlBOM_NAME: TStringField;
    adsMainMatrlDOC_FLAG: TStringField;
    adsMainMatrlSEQ_NO: TWordField;
    adsMainMatrlFORMULA: TMemoField;
    ADOConnection1: TADOConnection;
    cdsTmp: TADODataSet;
    qryTmp: TADOQuery;
    adsMainMatrlrequired: TStringField;
    adsMasterRKEY: TAutoIncField;
    adsMasterDEPT_CODE: TStringField;
    adsMasterTTYPE: TStringField;
    adsMasterOUT_SOURCE: TWordField;
    adsMasterDEPT_NAME: TStringField;
    adsMasterACTIVE_FLAG: TWordField;
    adsMasterSUPERVISOR_PTR: TIntegerField;
    adsMasterPCS_AS_UNIT: TWordField;
    adsMasterUNIT_PTR: TIntegerField;
    adsMasterBIG_DEPT_PTR: TIntegerField;
    adsMasterDEPT_PTR: TIntegerField;
    adsMasterGROUP_PTR: TIntegerField;
    adsMasterIS_COST_DEPT: TWordField;
    adsMasterCOST_DEPT_PTR: TIntegerField;
    adsMasterDEF_ROUT_INST: TStringField;
    adsMasterSCHEDULE_FLAG: TStringField;
    adsMasterSEQ_NO: TIntegerField;
    adsMasterBARCODE_ENTRY_FLAG: TStringField;
    adsMasterALLOW_SPLIT_LOTS: TStringField;
    adsMasterPRINTING_RESOURCE: TStringField;
    adsMasterSETUP_TIME_PER_LOT: TStringField;
    adsMasterQUEUE_TIME: TStringField;
    adsMasterPROCESS_TIME: TStringField;
    adsMasterPROCESS_TIME_B: TStringField;
    adsMasterIS_CYCLE: TWordField;
    adsMasterCYCLE_TIME: TStringField;
    adsMasterOVERHEAD_FORMULA: TStringField;
    adsMasterOVERHEAD2_FORMULA: TStringField;
    adsMasterOVERHEAD3_FORMULA: TStringField;
    adsMasterInst_Flag: TStringField;
    adsMasterEQUIPMENT_PTR: TIntegerField;
    adsMasterQTY_EQP_LIMIT: TIntegerField;
    adsMasterSETUP_SYS: TBCDField;
    adsMasterQUEUE_SYS: TBCDField;
    adsMasterPROCESS_SYS: TBCDField;
    adsMasterPROCESS_SYS_B: TBCDField;
    adsMasterCYCLE_TIME_SYS: TBCDField;
    adsMasterSEQ_NR: TIntegerField;
    adsMasterPPC_TIME: TDateTimeField;
    adsMasterPPC_BOM: TIntegerField;
    adsMasterPPC_CYCLE_TIME: TIntegerField;
    adsMasterPPC_CYCLE_LOT: TFloatField;
    adsMasterPPC_LAST_LOT: TIntegerField;
    adsMasterPPC_STATUS: TWordField;
    adsMasterPR_ID: TStringField;
    adsMasterSPEC_FLAG: TWordField;
    adsMasterPERMIT_SPLIT_LOT: TWordField;
    adsMasterVISIBLE_IN_MI: TWordField;
    adsMasterWO_DAYS: TIntegerField;
    adsMastermatl_cost_per_sq: TFloatField;
    adsMasterGL_ACCT_PTR: TIntegerField;
    adsMasteroutput_flag: TWordField;
    adsMastermatcost_flag: TWordField;
    adsMastercost_name: TStringField;
    adsMasterwage_flag: TBooleanField;
    adsMasterWork_Para: TStringField;
    adsMasterOVERHEAD4_FORMULA: TStringField;
    adsMasterOVERHEAD5_FORMULA: TStringField;
    adsSecondaryMatrlQTY_BOM_PER_SQFT: TFloatField;
    procedure adsSecondaryMatrlCalcFields(DataSet: TDataSet);
    procedure adsMasterAfterScroll(DataSet: TDataSet);
    procedure adsMainMatrlSEQ_NOValidate(Sender: TField);
    procedure adsMainMatrlBeforeDelete(DataSet: TDataSet);
    procedure adsMainMatrlBeforeEdit(DataSet: TDataSet);
    procedure dsMasterStateChange(Sender: TObject);
    procedure adsMainMatrlBeforePost(DataSet: TDataSet);
    procedure adsMainMatrlNewRecord(DataSet: TDataSet);
    procedure adsMainMatrlBeforeInsert(DataSet: TDataSet);
    procedure adsMainMatrlAfterOpen(DataSet: TDataSet);
    procedure adsSecondaryMatrlNewRecord(DataSet: TDataSet);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure adsSecondaryMatrlBeforeEdit(DataSet: TDataSet);
    procedure adsMainMatrlAfterScroll(DataSet: TDataSet);
    procedure adsMainMatrlSEQ_NOChange(Sender: TField);
  private
    { Private declarations }
    MSeqNo:integer;
  public
    { Public declarations }
    Max_SeqNo:integer;
    function Check_Before_Post:boolean; //保存前数据检验
    procedure saveData;
  end;

var
  dmCon: TdmCon;

implementation
uses MyClass,SubEdit,common,ConstVar;
{$R *.dfm}

procedure TdmCon.adsSecondaryMatrlCalcFields(DataSet: TDataSet); //data0495
begin
  MyDataClass.OpenDataSetByPara(DataSet.FieldByName('INVENT_PTR').AsString,aqMatrl);
  if aqMatrl.IsEmpty then exit;
  DataSet.FieldByName('GroupName').Value := aqMatrl.fieldByName('Group_Name').Value;
  DataSet.FieldByName('INV_PART_NUMBER').Value := aqMatrl.fieldByName('INV_PART_NUMBER').Value;
  DataSet.FieldByName('INV_PART_DESCRIPTION').Value := aqMatrl.fieldByName('INV_PART_DESCRIPTION').Value;
  DataSet.FieldByName('UnitCode').Value := aqMatrl.fieldByName('Unit_Code').Value;
end;

procedure TdmCon.adsMasterAfterScroll(DataSet: TDataSet);//主表Data0034(单个生产工序(每一个生产环节)表)
begin
  MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rKey').Value,adsMainMatrl);
  MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rKey').Value,adsSecondaryMatrl);
  MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rKey').Value,adsIESParams);
end;

procedure TdmCon.adsMainMatrlSEQ_NOValidate(Sender: TField);
var
  rc:integer;
begin
  if Sender.IsNull then
  begin
    ShowMsg('序号不能为空','提示',1);
    abort;
  end;
  if adsMainMatrl.State = dsInsert then exit;

  if MSeqNo= Sender.Value then exit;

//  cdsTmp.Clone(adsMainMatrl);
  cdsTmp.Filter := 'seq_No='+Sender.AsString;
  cdsTmp.Filtered := true;
  rc:=  cdsTmp.RecordCount;
  cdsTmp.Filtered := false;
  if rc > 0 then
  begin
    ShowMsg('序号不能重复,请重新设置','提示',1);
    abort;
  end;
  if cdsTmp.Locate('SEQ_NO',VarAsType(MSeqNo,varString),[]) then
  begin
    cdsTmp.edit;
    cdsTmp.FieldByName('Seq_No').Value := Sender.value;
  end;
end;

procedure TdmCon.adsMainMatrlBeforeDelete(DataSet: TDataSet);
begin
  adsMaster.Edit;
end;

procedure TdmCon.adsMainMatrlBeforeEdit(DataSet: TDataSet);
begin
  adsMaster.Edit;
end;

procedure TdmCon.dsMasterStateChange(Sender: TObject);
begin
  if frmSubEdit = nil then exit;
  with frmSubEdit do begin
    btnSave.Enabled := adsMaster.State in dsEditModes;
    btnCancel.Enabled := btnSave.Enabled;
  end;
end;

procedure TdmCon.adsMainMatrlBeforePost(DataSet: TDataSet);
var strExpr:string;
tmp:string;
begin
  if DataSet.FieldByName('Seq_No').IsNull then
  begin
    ShowMsg('序号不能为空!','提示',1);
    abort;
  end;

  tmp:='';
  strExpr:= dmcon.adsMainMatrl.fieldbyName('FORMULA').AsString;
  if not Part_Cost_Formula_Verify(dmcon.adsMainMatrl.fieldbyName('Dept_ptr').AsInteger,dmcon.adsMainMatrl.fieldbyName('Inv_Group_ptr').AsInteger, strExpr,dmcon.ADOConnection1,tmp) then
    abort;
end;

procedure TdmCon.adsMainMatrlNewRecord(DataSet: TDataSet);
begin
  adsMainMatrl.FieldByName('INV_GROUP_PTR').Asinteger := 0;
  adsMainMatrl.FieldByName('DEPT_PTR').Asinteger := adsMaster.FieldByName('rkey').asinteger;
  adsMainMatrl.FieldByName('Seq_No').asinteger := Max_SeqNo+1;
end;

procedure TdmCon.adsMainMatrlBeforeInsert(DataSet: TDataSet);
begin
  adsMaster.Edit;
  Max_SeqNo := Get_Max_SeqNo(DataSet,'Seq_No');
end;

procedure TdmCon.adsMainMatrlAfterOpen(DataSet: TDataSet);
begin
  cdsTmp.Clone(adsMainMatrl);
end;

procedure TdmCon.adsSecondaryMatrlNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('INVENT_PTR').Asinteger := 0;
  DataSet.FieldByName('DEPT_PTR').Asinteger := adsMaster.FieldByName('rkey').asinteger;
  DataSet.FieldByName('QTY_BOM_PER_SQFT').Asinteger := 0;
end;

procedure TdmCon.saveData;
begin
  if not Check_Before_Post then abort;
  if not ADOConnection1.InTransaction then
    ADOConnection1.BeginTrans;
  try
    if adsMainMatrl.State in dsEditModes then
      adsMainMatrl.Post;
    adsMainMatrl.UpdateBatch();
    if adsSecondaryMatrl.State in dsEditModes then
      adsSecondaryMatrl.Post;
    adsSecondaryMatrl.UpdateBatch();
    if adsMaster.State in dsEditModes then
      adsMaster.Post;
    adsMaster.UpdateBatch();
    ADOConnection1.CommitTrans;
  except
    ADOConnection1.RollbackTrans;
    ShowMsg('保存数据失败!','提示',1);
  end;
end;

function TdmCon.Check_Before_Post: boolean;
begin
  result := true;
  if adsMaster.FieldByName('IS_COST_DEPT').Value = 1 then
    if adsMaster.FieldByName('Cost_Dept_ptr').IsNull then
    begin
      ShowMsg('成本中心不能为空','提示',1);
      result := false;
      exit;
    end;
  if not IS_Float(adsMaster.FieldByName('OVERHEAD_FORMULA').AsString) then
  begin
    ShowMsg('费用一必须为数值型','提示',1);
    result := false;
    exit;
  end
  else if not IS_Float(adsMaster.FieldByName('OVERHEAD2_FORMULA').AsString) then
  begin
    ShowMsg('费用二必须为数值型','提示',1);
    result := false;
    exit;
  end
  else if not IS_Float(adsMaster.FieldByName('OVERHEAD3_FORMULA').AsString) then
  begin
    ShowMsg('费用三必须为数值型','提示',1);
    result := false;
    exit;
  end;
end;

procedure TdmCon.dsMasterDataChange(Sender: TObject; Field: TField);
var  QryTmp:TAdoQuery;
begin
  if Field= adsMaster.FieldByName('IS_COST_DEPT') then
  begin
    if Field.AsInteger=1 then  //是成本中心
    begin
      if dmcon.adsMaster.FieldByName('Cost_Dept_ptr').IsNull then //需要设置成本中心
      begin
        adsMaster.Edit;
        adsMaster.FieldByName('Cost_Dept_ptr').Asstring := adsMaster.FieldByName('rKey').Asstring;
        adsMaster.FieldByName('cost_name').Value :=adsMaster.fieldByName('Dept_Name').Value;
        frmSubEdit.edt_Cost_Dept_Code.Text := adsMaster.fieldByName('Dept_Code').Asstring;
      end;
      frmSubEdit.DBCheckBox10.Enabled := true;
    end
    else
    begin
      adsMaster.Edit;
      adsMaster.FieldByName('Cost_Dept_ptr').Value := NULL;
      adsMaster.FieldByName('cost_name').Value :=Null;
      adsMaster.FieldByName('Inst_Flag').Value :='N';
      frmSubEdit.edt_Cost_Dept_Code.Text := '';
      frmSubEdit.DBCheckBox10.Enabled := false;
    end;
  end;
end;

procedure TdmCon.adsSecondaryMatrlBeforeEdit(DataSet: TDataSet);
begin
  adsMaster.Edit;
end;

procedure TdmCon.adsMainMatrlAfterScroll(DataSet: TDataSet);
var  str_Seq_No:string;
begin
  MSeqNo:= adsMainMatrl.FieldByName('Seq_No').AsInteger;

  aqIESParamsList.Close;
  aqIESParamsList.Parameters[0].Value := adsMainMatrlINV_GROUP_PTR.Value;
  aqIESParamsList.Open;

  //非编辑模式不显示局部参数
  if frmsubEdit.enterMode = em_browse then exit;
  if frmSubEdit= nil then exit;
  try
    frmSubEdit.ComboBox2.Items.Clear;
    while not aqIESParamsList.Eof do begin
      frmSubEdit.ComboBox2.Items.Add('BOM.'+trim(aqIESParamsList.fieldByName('Parameter_Name').AsString));
      aqIESParamsList.next;
    end;
  finally
    aqIESParamsList.first;
  end;
end;

procedure TdmCon.adsMainMatrlSEQ_NOChange(Sender: TField);
begin
  if Sender.IsNull then exit;
  if adsMainMatrl.State = dsInsert then exit;
  MSeqNo:=Sender.Value;
end;

end.
