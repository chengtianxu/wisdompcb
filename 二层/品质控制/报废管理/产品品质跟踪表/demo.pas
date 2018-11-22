unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    AQY0025: TADOQuery;
    AQY0025RKEY: TAutoIncField;
    AQY0025MANU_PART_NUMBER: TStringField;
    AQY0025MANU_PART_DESC: TStringField;
    AQY0025PARENT_PTR: TIntegerField;
    AQY0025QTY_BOM: TWordField;
    AQY0025BOM_STEP: TWordField;
    AQY0025CREATED_BY_EMPL_PTR: TIntegerField;
    AQY0025ENG_ROUTE_PTR: TIntegerField;
    AQY0025PROD_ROUTE_PTR: TIntegerField;
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
    AQY0025QTY_ON_HAND: TIntegerField;
    AQY0025barcode_flag: TWordField;
    AQY0025current_rev: TStringField;
    AQY0025QTY_PARENTBOM: TWordField;
    AQY0025nopb_flag: TWordField;
    AQY0025TUSAGE: TBCDField;
    AQY0025quality_status: TBooleanField;
    AQY0025quality_user: TIntegerField;
    AQY0025quality_date: TDateTimeField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADO31: TADOQuery;
    ADO31SOURCE_PTR: TIntegerField;
    ADO31STEP_NUMBER: TSmallintField;
    ADO31DEPT_PTR: TIntegerField;
    ADO31QA_CONFIRMATION: TStringField;
    ADO31SCRAP_QTY_reason: TStringField;
    ADO31gaffer_confirmation: TStringField;
    ADO31rece_gaffetconfir: TStringField;
    ADO31technology_diff: TStringField;
    aq31: TADOQuery;
    aq31SOURCE_PTR: TIntegerField;
    aq31STEP_NUMBER: TSmallintField;
    aq31DEPT_PTR: TIntegerField;
    aq31QA_CONFIRMATION: TStringField;
    aq31SCRAP_QTY_reason: TStringField;
    aq31gaffer_confirmation: TStringField;
    aq31rece_gaffetconfir: TStringField;
    aq31technology_diff: TStringField;
    ADS31: TADODataSet;
    ADS31SOURCE_PTR: TIntegerField;
    ADS31STEP_NUMBER: TSmallintField;
    ADS31DEPT_PTR: TIntegerField;
    ADS31QA_CONFIRMATION: TStringField;
    ADS31SCRAP_QTY_reason: TStringField;
    ADS31gaffer_confirmation: TStringField;
    ADS31rece_gaffetconfir: TStringField;
    ADS31technology_diff: TStringField;
    ADS31dept_name: TStringField;
    ADS31MANU_PART_NUMBER: TStringField;
    DataSource2: TDataSource;
    DataSource4: TDataSource;
    ADS38: TADODataSet;
    ADS38SOURCE_PTR: TIntegerField;
    ADS38DEPT_PTR: TIntegerField;
    ADS38DEF_ROUT_INST: TStringField;
    ADS38STEP_NUMBER: TSmallintField;
    ADS38tooling_rev: TStringField;
    ADS38OUTP_SPFC: TBCDField;
    ADS38tool_old_rev: TStringField;
    ADS38TOOL_REMARK: TStringField;
    ADS38dept_code: TStringField;
    ADS38dept_name: TStringField;
    ADS38BARCODE_ENTRY_FLAG: TStringField;
    ads34: TADODataSet;
    ADO31FLOW_QTY: TStringField;
    ADS25: TADODataSet;
    ADS25rkey: TIntegerField;
    ADS25MANU_PART_NUMBER: TStringField;
    ADS25MANU_PART_DESC: TStringField;
    ADS25CUST_CODE: TStringField;
    ADS25ABBR_NAME: TStringField;
    ADS25PROD_CODE: TStringField;
    ADS25PRODUCT_NAME: TStringField;
    ADS25employee_createname: TStringField;
    ADS25CUSTPART_ENT_DATE: TDateTimeField;
    ADS25employee_auditname: TStringField;
    ADS25AUDITED_DATE: TDateTimeField;
    ADS25employee_editname: TStringField;
    ADS25LAST_MODIFIED_DATE: TDateTimeField;
    ADS25SAMPLE_NR: TStringField;
    ADS25ANALYSIS_CODE_2: TStringField;
    ADS25QTY_ON_HAND: TIntegerField;
    ADS25overdue: TStringField;
    ADS25state: TStringField;
    ADS25batch_or_former: TStringField;
    ADS25LAYERS: TWordField;
    ADS25green_flag: TStringField;
    ADS25TSTATUS: TWordField;
    ADS25PROD_ROUTE_PTR: TIntegerField;
    ADS25ANALYSIS_CODE_1: TStringField;
    ADS25CHECK_DATE: TDateTimeField;
    ADS25check_emplname: TStringField;
    ADS25quality_status: TBooleanField;
    ADS25quality_state: TStringField;
    aq31FLOW_QTY: TStringField;
    ADS31FLOW_QTY: TStringField;
    ads494: TADODataSet;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494PARAMETER_VALUE: TStringField;
    ads494UNIT_CODE: TStringField;
    ads494step_number: TSmallintField;
    ADS38grade_note: TWideStringField;
    ADS38WideStringField: TWideStringField;
    ads192: TADODataSet;
    ads192ENG_CONTROL2: TWordField;
    ads192ENG_CONTROL16: TWordField;
    ADS31WideStringField: TWideStringField;
    procedure ADS38CalcFields(DataSet: TDataSet);
    procedure ADS38BeforeOpen(DataSet: TDataSet);
    procedure ADS31CalcFields(DataSet: TDataSet);
    procedure ADS31BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADS38CalcFields(DataSet: TDataSet);
var unitcode:string;
begin
ads494.Filter:='step_number='+ADS38STEP_NUMBER.AsString;
ads494.First;

 While not ads494.Eof do
 begin
  if ads494UNIT_CODE.Value<>'无' then
   unitcode:=ads494UNIT_CODE.Value
  else
   unitcode:='';
  if trim(ads494PARAMETER_VALUE.Value)<>'' then
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      trim(ads494PARAMETER_VALUE.Value)+
                      unitcode+'    '
  else
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      '＿＿'+
                      unitcode+'    ';
  ads494.Next;

 end;
 ads38WideStringField.Value:=ads38WideStringField.Value + ADS38DEF_ROUT_INST.Value +
 '    ' + ads38.fieldbyname('grade_note').AsString;
end;

procedure TDM.ADS38BeforeOpen(DataSet: TDataSet);
begin
    DM.ads192.Open;
    DM.ads494.Close;
     DM.ads494.Parameters.ParamValues['source_ptr']:=dm.AQY0025RKEY.Value;
     if DM.ads192ENG_CONTROL2.Value=1 then       //不显示为空的制程参数
      DM.ads494.Parameters.ParamValues['value']:=''
     else DM.ads494.Parameters.ParamValues['value']:='#@#@#';
     DM.ads494.Open;
end;

procedure TDM.ADS31CalcFields(DataSet: TDataSet);
var unitcode:string;
begin
  ads494.Filter:='step_number='+ADS31STEP_NUMBER.AsString;
  ads494.First;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select * from data0038 where SOURCE_PTR='+dm.ADS31SOURCE_PTR.AsString+
    ' and STEP_NUMBER='+dm.ADS31STEP_NUMBER.AsString;
    Open;
  end;
  While not ads494.Eof do
  begin
    if ads494UNIT_CODE.Value<>'无' then
     unitcode:=ads494UNIT_CODE.Value
    else
     unitcode:='';
    if trim(ads494PARAMETER_VALUE.Value)<>'' then
     self.ads31WideStringField.Value:=ads31WideStringField.Value+
                        trim(ads494PARAMETER_DESC.Value)+':'+
                        trim(ads494PARAMETER_VALUE.Value)+
                        unitcode+'    '
    else
     self.ads31WideStringField.Value:=ads31WideStringField.Value+
                        trim(ads494PARAMETER_DESC.Value)+':'+
                        '＿＿'+
                        unitcode+'    ';
    ads494.Next;

  end;
//  ShowMessage(ADOQuery1.fieldbyname('DEF_ROUT_INST').AsString +'    ' + ADOQuery1.fieldbyname('grade_note').AsString);

  ads31WideStringField.Value:=ads31WideStringField.Value +ADOQuery1.fieldbyname('DEF_ROUT_INST').AsString +
  '    ' + ADOQuery1.fieldbyname('grade_note').AsString;
end;

procedure TDM.ADS31BeforeOpen(DataSet: TDataSet);
begin
    DM.ads192.Open;
    DM.ads494.Close;
     DM.ads494.Parameters.ParamValues['source_ptr']:=dm.AQY0025RKEY.Value;
     if DM.ads192ENG_CONTROL2.Value=1 then       //不显示为空的制程参数
      DM.ads494.Parameters.ParamValues['value']:=''
     else DM.ads494.Parameters.ParamValues['value']:='#@#@#';
     DM.ads494.Open;
end;

end.
