unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS25: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADS25MANU_PART_NUMBER: TStringField;
    ADS25MANU_PART_DESC: TStringField;
    ADS25CUST_CODE: TStringField;
    ADS25ABBR_NAME: TStringField;
    ADS25PROD_CODE: TStringField;
    ADS25PRODUCT_NAME: TStringField;
    ADS25CUSTPART_ENT_DATE: TDateTimeField;
    ADS25employee_auditname: TStringField;
    ADS25AUDITED_DATE: TDateTimeField;
    ADS25employee_editname: TStringField;
    ADS25LAST_MODIFIED_DATE: TDateTimeField;
    ADS25SAMPLE_NR: TStringField;
    ADS25ANALYSIS_CODE_2: TStringField;
    ADS25overdue: TStringField;
    ADS25state: TStringField;
    ADS25batch_or_former: TStringField;
    ADS25LAYERS: TWordField;
    ADS25green_flag: TStringField;
    ADS25rkey: TIntegerField;
    ADS25employee_createname: TStringField;
    AQY0025: TADOQuery;
    AQY0025MANU_PART_NUMBER: TStringField;
    AQY0025MANU_PART_DESC: TStringField;
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
    AQY0025RKEY: TAutoIncField;
    DataSource2: TDataSource;
    AQY0025layers_info: TMemoField;
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
    ads279PARAMETER_NAME: TStringField;
    ads279PARAMETER_DESC: TStringField;
    ads279SPEC_RKEY: TStringField;
    ads279UNIT_NAME: TStringField;
    DataSource3: TDataSource;
    ads278: TADODataSet;
    ads278rkey: TIntegerField;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278SPEC_RKEY: TStringField;
    ads278UNIT_NAME: TStringField;
    ads279source_PTR: TIntegerField;
    ads279PARAMETER_PTR: TIntegerField;
    ads279PARAMETER_VALUE: TStringField;
    ads279IES_PROD: TSmallintField;
    ads278datatype: TStringField;
    ads279datatype: TStringField;
    ADS25TSTATUS: TWordField;
    ads279IES_CRP: TSmallintField;
    ADOQuery2: TADOQuery;
    ADS38: TADODataSet;
    DataSource4: TDataSource;
    ads34: TADODataSet;
    ads494: TADODataSet;
    DataSource5: TDataSource;
    ADS38SOURCE_PTR: TIntegerField;
    ADS38DEPT_PTR: TIntegerField;
    ADS38DEF_ROUT_INST: TStringField;
    ADS38STEP_NUMBER: TSmallintField;
    ADS38tooling_rev: TStringField;
    ADS38OUTP_SPFC: TBCDField;
    ads89: TADODataSet;
    DataSource6: TDataSource;
    ads89PARAMETER_NAME: TStringField;
    ads89PARAMETER_DESC: TStringField;
    ads89tvalue: TStringField;
    ads89UNIT_NAME: TStringField;
    ads89SPEC_RKEY: TStringField;
    ads89datatype: TStringField;
    ads494PARAMETER_PTR: TIntegerField;
    ads494PARAMETER_VALUE: TStringField;
    ads494custpart_ptr: TIntegerField;
    ads494step_number: TSmallintField;
    ads494seq_no: TSmallintField;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494SPEC_RKEY: TStringField;
    ads494UNIT_NAME: TStringField;
    ads494DATATYPE: TStringField;
    DataSource7: TDataSource;
    ADS279_0: TADODataSet;
    ads279_0source_ptr: TIntegerField;
    ads279_0PARAMETER_PTR: TIntegerField;
    ads279_0PARAMETER_VALUE: TStringField;
    ads279_0IES_PROD: TSmallintField;
    ads279_0IES_CRP: TSmallintField;
    ads279_0PARAMETER_NAME: TStringField;
    ads279_0PARAMETER_DESC: TStringField;
    ads279_0SPEC_RKEY: TStringField;
    ads279_0UNIT_NAME: TStringField;
    ads279_0datatype: TStringField;
    AQ280: TADOQuery;
    AQ280rkey: TIntegerField;
    AQ280ENG_TABLE_NAME: TStringField;
    AQ280DATA_TYPE: TIntegerField;
    AQ280fx_type: TWordField;
    AQ280fy_type: TWordField;
    ADOStoredProc1: TADOStoredProc;
    ADOStoredProc1tvalue: TStringField;
    ADOQuery3: TADOQuery;
    ads494Doc_Flag: TStringField;
    ads494after_flag: TStringField;
    ads494flow_spfc_flag: TStringField;
    ADS38tool_old_rev: TStringField;
    ADOQuery4: TADOQuery;
    AQY0025PARENT_PTR: TIntegerField;
    AQY0025QTY_BOM: TWordField;
    ads278STATUS3: TWordField;
    ads279status3: TWordField;
    ADS38dept_code: TStringField;
    ADS38dept_name: TStringField;
    ADS38BARCODE_ENTRY_FLAG: TStringField;
    ads502pnl_lenspace: TBCDField;
    ads502pnl_wthspace: TBCDField;
    ADS38TOOL_REMARK: TStringField;
    ADOQuery5: TADOQuery;
    AQY0025PROD_ROUTE_PTR: TIntegerField;
    ADS25PROD_ROUTE_PTR: TIntegerField;
    AQ17: TADOQuery;
    AQtmp: TADOQuery;
    DS17: TDataSource;
    ADS25QTY_ON_HAND: TIntegerField;
    AQY0025QTY_ON_HAND: TIntegerField;
    ADS25ANALYSIS_CODE_1: TStringField;
    DS20: TDataSource;
    ADO20: TADOQuery;
    ADO20RKEY: TAutoIncField;
    ADO20SOURCE_PTR: TIntegerField;
    ADO20file_content: TBlobField;
    ADO20file_name: TStringField;
    ADO20Indate: TDateTimeField;
    ADO20remark: TStringField;
    AQY0025barcode_flag: TWordField;
    AQY0025current_rev: TStringField;
    ads497: TADODataSet;
    ads497PARAMETER_PTR: TIntegerField;
    ads497PARAMETER_VALUE: TStringField;
    ads497SOURCE_PTR: TIntegerField;
    ads497ROUTE_STEP_PTR: TIntegerField;
    ads497SEQ_NO: TIntegerField;
    ads497DEPT_PTR: TIntegerField;
    ads497STEP_NUMBER: TSmallintField;
    ads278min_value: TFloatField;
    ads278max_value: TFloatField;
    ads279min_value: TFloatField;
    ads279max_value: TFloatField;
    ads494min_value: TFloatField;
    ads494max_value: TFloatField;
    ads564: TADODataSet;
    DataSource8: TDataSource;
    ads564rec_no: TIntegerField;
    ads564SOURCE_PTR: TIntegerField;
    ads564file_name: TStringField;
    ads564in_date: TDateTimeField;
    ads564remark: TStringField;
    ads564rkey: TAutoIncField;
    ADS25CHECK_DATE: TDateTimeField;
    ADS25check_emplname: TStringField;
    AQY0025QTY_PARENTBOM: TWordField;
    ds0610: TDataSource;
    ads0610: TADODataSet;
    aqy0610: TADOQuery;
    AQY0025nopb_flag: TWordField;
    AQY0025TUSAGE: TBCDField;
    AQY0025quality_status: TBooleanField;
    AQY0025quality_user: TIntegerField;
    AQY0025quality_date: TDateTimeField;
    ADO31: TADOQuery;
    ADO31SOURCE_PTR: TIntegerField;
    ADO31STEP_NUMBER: TSmallintField;
    ADO31DEPT_PTR: TIntegerField;
    ADO31QA_CONFIRMATION: TStringField;
    ADO31SCRAP_QTY_reason: TStringField;
    ADO31gaffer_confirmation: TStringField;
    ADO31rece_gaffetconfir: TStringField;
    ADO31technology_diff: TStringField;
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
    aq31: TADOQuery;
    aq31SOURCE_PTR: TIntegerField;
    aq31STEP_NUMBER: TSmallintField;
    aq31DEPT_PTR: TIntegerField;
    aq31QA_CONFIRMATION: TStringField;
    aq31SCRAP_QTY_reason: TStringField;
    aq31gaffer_confirmation: TStringField;
    aq31rece_gaffetconfir: TStringField;
    aq31technology_diff: TStringField;
    ADS25quality_status: TBooleanField;
    ADS38_1: TADODataSet;
    ADS38_1rkey: TAutoIncField;
    ADS38_1SOURCE_PTR: TIntegerField;
    ADS38_1DEPT_PTR: TIntegerField;
    ADS38_1DEF_ROUT_INST: TStringField;
    ADS38_1STEP_NUMBER: TSmallintField;
    ADS38_1tooling_rev: TStringField;
    ADS38_1OUTP_SPFC: TBCDField;
    ADS38_1tool_old_rev: TStringField;
    ads279_1: TADODataSet;
    ads279_1source_PTR: TIntegerField;
    ads279_1PARAMETER_PTR: TIntegerField;
    ads279_1PARAMETER_VALUE: TStringField;
    ads279_1IES_PROD: TSmallintField;
    ads279_1IES_CRP: TSmallintField;
    ads497_1: TADODataSet;
    ads497_1PARAMETER_PTR: TIntegerField;
    ads497_1PARAMETER_VALUE: TStringField;
    ads497_1SOURCE_PTR: TIntegerField;
    ads497_1ROUTE_STEP_PTR: TIntegerField;
    ads497_1SEQ_NO: TIntegerField;
    ads494_1: TADODataSet;
    ads494_1PARAMETER_PTR: TIntegerField;
    ads494_1PARAMETER_VALUE: TStringField;
    ads494_1custpart_ptr: TIntegerField;
    ads494_1step_number: TSmallintField;
    ads494_1seq_no: TSmallintField;
    ads494_1Doc_Flag: TStringField;
    ads494_1after_flag: TStringField;
    ads494_1flow_spfc_flag: TStringField;
    AQY0025ANCESTOR_PTR: TIntegerField;
    AQY0025REACH: TBooleanField;
    ADO31FLOW_QTY: TStringField;
    aq31FLOW_QTY: TStringField;
    ADS31FLOW_QTY: TStringField;
    AQY0025CarProd_flag: TStringField;
    qryTmp: TADOQuery;
    procedure ads279PARAMETER_VALUEValidate(Sender: TField);
    procedure ads494PARAMETER_VALUEValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses common;
{$R *.dfm}

procedure TDM.ads279PARAMETER_VALUEValidate(Sender: TField);
begin
  if (trim(Sender.AsString)<>'') and
  (ads279datatype.Value='数字') and
  not (ads279min_value.IsNull or ads279max_value.IsNull)  then
  begin
    if (Sender.AsFloat<ads279min_value.AsFloat) or
       (Sender.AsFloat>ads279max_value.AsFloat) then
    begin
       showmsg('参数值不在的合理范围之内!',1);
       abort;
    end;
  end;
end;

procedure TDM.ads494PARAMETER_VALUEValidate(Sender: TField);
begin
  if (trim(Sender.AsString)<>'') and
  (ads494datatype.Value='数字') and
  not (ads494min_value.IsNull or ads494max_value.IsNull)  then
  begin
    if (Sender.AsFloat < ads494min_value.AsFloat) or
       (Sender.AsFloat > ads494max_value.AsFloat) then
    begin
       showmsg('参数值不在的合理范围之内!',1);
       abort;
    end;
  end;
  
end;

end.
