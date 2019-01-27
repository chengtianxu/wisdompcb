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
    AQY0025REACH: TBooleanField;
    ADO31FLOW_QTY: TStringField;
    aq31FLOW_QTY: TStringField;
    ADS31FLOW_QTY: TStringField;
    qryTmp: TADOQuery;
    intgrfldADS38PPC_CYCLE_TIME: TIntegerField;
    strngfldads494outp_spfc_flag: TStringField;
    AQY0025layers_image: TBlobField;
    AQY0025flod_number: TIntegerField;
    AQY0025ZDR_TYPE: TWideStringField;
    strngfldAQY0025grade_code: TStringField;
    ads82: TADODataSet;
    ds82: TDataSource;
    strngfldads82grade_code: TStringField;
    intgrfldads494dept_ptr: TIntegerField;
    wdstrngfldADS38grade_note: TWideStringField;
    strngfldAQY0025ORIG_CUSTOMER: TStringField;
    ADS25ORIG_CUSTOMER: TStringField;
    ADS25ORIG_CUST_CODE: TStringField;
    ADS38rkey: TAutoIncField;
    AQY0025CustFileName: TStringField;
    AQY0025CPJS: TStringField;
    cmd1: TADOCommand;
    ads494Parameter_Readonly: TStringField;
    ads494Parameter_DESC_ReadOnly: TStringField;
    ads502rkey: TAutoIncField;
    ads502seet_szie: TStringField;
    ADS25ENG_NOTE: TStringField;
    ADS25REMARK: TStringField;
    ADS25memo_text: TStringField;
    qryFtp: TADOQuery;
    dsFile: TDataSource;
    qryFileList: TADOQuery;
    qryFtpIDKey: TStringField;
    qryFtpFileName: TStringField;
    qryFtpFtp_Ptr: TIntegerField;
    qryFtpFtpDir: TStringField;
    qryFtpFtp_fileName: TStringField;
    qryFtpUploadTime: TDateTimeField;
    qryFtpUploadUser_d05ptr: TIntegerField;
    qryFtpGroupIDKey: TStringField;
    qryFtpBEnable: TBooleanField;
    qryFile: TADOQuery;
    qryFileFileName: TStringField;
    qryFileEMPLOYEE_NAME: TStringField;
    qryFileUploadTime: TDateTimeField;
    qryFilefiletype: TWordField;
    qryFilestrType: TStringField;
    qryFileIDKey: TStringField;
    qryFileFtp_fileName: TStringField;
    fltfldads494TaskTopLimt: TFloatField;
    fltfldads494TaskLowLimt: TFloatField;
    fltfldads494InnerTopLimt: TFloatField;
    fltfldads494InnerLowLimt: TFloatField;
    ads494DATA_TYPE: TWordField;
    ads494SpecialNote: TStringField;
    AQY0025RegNum: TIntegerField;
    qryFtp2: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    BooleanField1: TBooleanField;
    dsFile2: TDataSource;
    qryFileList2: TADOQuery;
    qryFile2: TADOQuery;
    qryFile2FileName: TStringField;
    qryFile2EMPLOYEE_NAME: TStringField;
    qryFile2UploadTime: TDateTimeField;
    qryFile2filetype: TWordField;
    qryFile2IDKey: TStringField;
    qryFile2Ftp_fileName: TStringField;
    qryFile2DEPT_CODE: TStringField;
    AQY0025MinRing: TBCDField;
    qryPress: TADOQuery;
    dsPress: TDataSource;
    qryPressrkey: TAutoIncField;
    qryPressrkey25: TIntegerField;
    qryPressSeqno: TWordField;
    qryPressLayer: TStringField;
    qryPressThickness: TBCDField;
    qryPressMinThickness: TBCDField;
    qryPressMaxThickness: TBCDField;
    AQY0025DiffMark: TWideStringField;
    AQY0025ProdGrade: TWideStringField;
    ads26: TADODataSet;
    ds26: TDataSource;
    ads26RKEY: TAutoIncField;
    ads26MANU_BOM_PTR: TIntegerField;
    ads26DEPT_PTR: TIntegerField;
    ads26INVENTORY_PTR: TIntegerField;
    ads26QTY_BOM: TFloatField;
    ads26ROUTE_STEP_NO: TSmallintField;
    ads26DOC_FLAG: TStringField;
    ads26VENDOR: TStringField;
    ads26DEPT_NAME: TStringField;
    ads26INV_PART_NUMBER: TStringField;
    ads26FLOW_NO: TSmallintField;
    ads26UNIT_CODE: TStringField;
    ads26supplier_ptr: TIntegerField;
    ads26ABBR_NAME: TStringField;
    ads26INV_NAME: TStringField;
    ads26INV_DESCRIPTION: TStringField;
    ads498: TADODataSet;
    adsParamsInfo: TADODataSet;
    aqEngTable: TADOQuery;
    aqPubParams: TADOQuery;
    aqIESParams: TADOQuery;
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
    ads26GROUP_PTR: TIntegerField;
    AQY0025RoHS: TBooleanField;
    ads26D498_ptr: TIntegerField;
    ads26BOM_NAME: TStringField;
    AQY0025Compress: TStringField;
    AQY0025amp_mb: TStringField;
    aqGroupParam: TADOQuery;
    aqMaterials: TADOQuery;
    AQY0025print2dkey: TIntegerField;
    AQY0025part_level: TWordField;
    procedure ads279PARAMETER_VALUEValidate(Sender: TField);
    procedure ads494PARAMETER_VALUEValidate(Sender: TField);
    procedure ads494PARAMETER_VALUEChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure ads279PARAMETER_VALUEChange(Sender: TField);
    procedure ads494BeforePost(DataSet: TDataSet);
    procedure ADS38AfterScroll(DataSet: TDataSet);
    procedure qryFileCalcFields(DataSet: TDataSet);
  private
    { Private declarations }

    function NeedChangeAllParam(StepNo,Param_PTr,Value: string): Boolean;
    procedure UpdateAllParam(StepNo,Param_PTr,Value: string);
  public
    { Public declarations }
    FChangeAllParam: Boolean;
    procedure D279ParamChangeEventEnable(B: Boolean);
    procedure D494ParamChangeEventEnable(B: Boolean);
    procedure AllFormulaCheck;
    function CheckSpellSize(ATop25Rkey: string): Boolean;
    //设置等级标示
    function SetGrade_Code(ATop25Rkey,AGradeCode: string): Boolean;
    function CheckGrade_Code(): Boolean;
    function SqlOpen(AStr: string): Boolean;
    function SqlExec(AStr: string): Boolean;
    function CheckCostDeptSingle: Boolean;
    function GetMITreeStruct(AQry: TADOQuery;AFields: array of string) :Boolean;   
  end;

var
  DM: TDM;

implementation

uses common, Windows, Forms, product_MIDetail;
{$R *.dfm}

procedure TDM.ads279PARAMETER_VALUEValidate(Sender: TField);
begin
  if (trim(Sender.AsString)<>'') and
  (ads279datatype.Value='数字') and
  not (ads279min_value.IsNull or ads279max_value.IsNull)  then
  begin
//    ShowMessage(ads279PARAMETER_VALUE.AsString);
    if (Sender.AsFloat<ads279min_value.AsFloat) or
       (Sender.AsFloat>ads279max_value.AsFloat) then
    begin
//       showmsg(ads279PARAMETER_DESC.ASSTRING +'参数值不在的合理范围之内!',1);
       abort;
    end;
  end;
end;

procedure TDM.ads494PARAMETER_VALUEValidate(Sender: TField);
var
  LStr: string;
  Ltmp: Double;
begin
  LStr := '步骤 ' +ads494.fieldbyname('step_number').AsString + '的参数 ' +
        ads494.fieldbyname('PARAMETER_DESC').AsString;
  if (trim(Sender.AsString)<>'') and
  (ads494datatype.Value='数字') and
  not (ads494min_value.IsNull or ads494max_value.IsNull)  then
  begin
    if not TryStrToFloat(Sender.AsString,Ltmp) then
    begin
      if MessageBox(Application.Handle,PChar(LStr + '参数类型为数字，参数值必须是数字，是否继续'),'提示',MB_YESNO) = ID_NO then
      begin
        Abort;
      end;

    end;

    if (Sender.AsFloat < ads494min_value.AsFloat) or
       (Sender.AsFloat > ads494max_value.AsFloat) then
    begin
       showmsg(LStr + ' 参数值不在的合理范围之内!',1);
       abort;
    end;
  end;

end;

procedure TDM.ads494PARAMETER_VALUEChange(Sender: TField);
var
  LStepNO,LParamPtr,LValue,DEPT_PTR: string;
  LQry: TADOQuery;
begin
  //1、联动更新制成参数
  if FChangeAllParam then
  begin
    if (dsInsert <> ads494.State) then
    begin
      LStepNO := ads494.FieldByName('step_number').AsString;
      LParamPtr := ads494.FieldByName('PARAMETER_PTR').AsString;
      LValue := Sender.AsString;
      if NeedChangeAllParam(LStepNO,LParamPtr,LValue) then
        UpdateAllParam(LStepNO,LParamPtr,LValue);
    end;

    //2、更新全局参数,触发全局联动更新
    if LParamPtr <> '' then
    begin
      LQry := TADOQuery.Create(Self);
      LQry.Connection := ADOConnection1;
      try
        DEPT_PTR := ADS38.Fieldbyname('DEPT_PTR').AsString;
        LQry.SQL.Add('SELECT formula FROM Data0506 WHERE PARAMETER_PTR = ' + LParamPtr );
        LQry.SQL.Add(' AND SOURCE_PTR = ' + DEPT_PTR);
        LQry.Open;
        if not LQry.IsEmpty and (LQry.FieldByName('formula').AsString <> '') then
        begin
          ads279.First;
          while not ads279.Eof do
          begin
            if ads279.FieldByName('PARAMETER_NAME').AsString = LQry.FieldByName('formula').AsString then
            begin
              if MessageBox(Application.Handle,PChar('是否同步更改全局参数' + LQry.FieldByName('formula').AsString),PChar('提示'),MB_YESNO) = IDYES then
              begin
                ads279.Edit;
                ads279.FieldByName('PARAMETER_VALUE').AsString := LValue;
              end;
              Break;
            end;
            ads279.Next;
          end;
        end;
      finally
        LQry.Close;
        LQry.Free;
      end;
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FChangeAllParam := True;
end;

function TDM.NeedChangeAllParam(StepNo,Param_PTr,Value: string): Boolean;
var
  tmp: Integer;
  tmpS: string;
  tmpFliter: string;
  oldChangeAllParam: Boolean;
begin
  oldChangeAllParam := FChangeAllParam;
  FChangeAllParam := False;
  tmp := ads494.RecNo;
  tmpFliter := ads494.Filter;
  ads494.Filtered := False;
  Result := False;
  ads494.DisableControls;
  try
    ads494.First;
    while not ads494.Eof do
    begin
      if (ads494.FieldByName('step_number').AsString <> StepNo) and
        (ads494.FieldByName('PARAMETER_PTR').AsString = Param_PTr) //and
        //(ads494.FieldByName('PARAMETER_VALUE').AsString <> Value)
      then
      begin
        tmps := tmpS +'第 ' +  ads494.FieldByName('step_number').AsString +
          ' 步工序 参数中包含 "' + ads494.FieldByName('PARAMETER_DESC').AsString + '"' + #13;
      end;
      ads494.Next;
    end;
  finally
    ads494.Filter := tmpFliter;
    ads494.Filtered := True;
    ads494.RecNo := tmp;
    ads494.EnableControls;
    FChangeAllParam := oldChangeAllParam;
  end;
  if tmpS <> '' then
  begin
    tmps := #13 + tmpS + ' 是否同步更改上述参数的值?';
    if MessageBox(Application.Handle,PChar(tmps),Pchar('同步参数'),MB_YESNO) = IDYES then
    begin
      Result := True;
    end else
    begin
      Result := False;
    end;
  end;  
end;

procedure TDM.UpdateAllParam(StepNo,Param_PTr,Value: string);
var
  tmp: Integer;
  tmpFilter: string;
begin
  tmp := ads494.RecNo;
  tmpFilter := ads494.Filter;
  ads494.Filtered := False;
  FChangeAllParam := False;
  ads494.DisableControls;
  try
    ads494.First;
    while not ads494.Eof do
    begin
      if (ads494.FieldByName('step_number').AsString <> StepNo) and
        (ads494.FieldByName('PARAMETER_PTR').AsString = Param_PTr) and
        (ads494.FieldByName('PARAMETER_VALUE').AsString <> Value)
      then
      begin
        ads494.Edit;
        ads494.FieldByName('PARAMETER_VALUE').AsString := Value;
      end;
      ads494.Next;
    end;
  finally
    ads494.filter := tmpFilter;
    ads494.Filtered := True;
    ads494.RecNo := tmp;
    ads494.EnableControls;
    FChangeAllParam := True;
  end;
end;


procedure TDM.ads279PARAMETER_VALUEChange(Sender: TField);
var
  tmp,tmp2: Integer;
  tmpFilter: string;
  LQry: TADOQuery;
  tmpS: string;
  LQuanJuParam,LValue: string;
begin
  tmp := ads494.RecNo;
  tmpFilter := ads494.Filter;
  ads494.DisableControls;
  ads494.Filtered := False;
  LQry := TADOQuery.Create(Self);
  LQry.Connection := ADOConnection1;
  try
    LQry.SQL.Add(' SELECT D506.PARAMETER_PTR,D506.formula, D38.STEP_NUMBER, D506.TValue FROM Data0506 D506 ');
    LQry.SQL.Add(' INNER JOIN Data0034 D34 ON D34.RKey = D506.SOURCE_PTR ');
    LQry.SQL.Add(' INNER JOIN Data0278 D278 ON D278.RKey = D506.PARAMETER_PTR ');
    LQry.SQL.Add(' INNER JOIN Data0038 D38 ON D38.DEPT_PTR = D34.RKey ');
    LQry.SQL.Add(' WHERE D38.SOURCE_PTR = ' + dm.AQY0025RKEY.AsString);
    LQry.SQL.Add(' AND len(D506.formula) <> 0');
    LQry.Open;
    ads494.First;
    while not ads494.Eof do
    begin
      if LQry.Locate('PARAMETER_PTR',ads494.fieldbyname('PARAMETER_PTR').AsString,[]) then
      begin
        if LQry.FieldByName('STEP_NUMBER').AsInteger = ads494.FieldByName('step_number').AsInteger then
        begin
//          ShowMessage(ads494PARAMETER_VALUE.AsString);

          if Pos(ads279.FieldByName('PARAMETER_NAME').AsString,LQry.fieldbyname('formula').AsString) > 0 then
          if ((ads279.FieldByName('PARAMETER_VALUE').AsString = '') and (ads494PARAMETER_VALUE.AsString <> ''))
                or (ads279.FieldByName('PARAMETER_VALUE').AsString <> '') then
          begin
            tmpS := tmpS + ' 第 ' + LQry.FieldByName('STEP_NUMBER').AsString + ' 步工序中，参数 "' + ads494.FieldByName('PARAMETER_DESC').AsString + '"  的计算公式 ' +
              LQry.fieldbyname('formula').AsString + #13;
          end;
        end;
      end;
      ads494.Next;
    end;
    if tmpS <> '' then
    begin
      tmpS := '更改全局参数 "' + ads279.FieldByName('PARAMETER_DESC').AsString +  '"  时: ' + #13 + #13 + tmpS  + #13 + ' 引用了 "' + ads279.FieldByName('PARAMETER_DESC').AsString + '" 这个全局参数，改动此全局参数，是否同步改动或根据公式重新计算 制成参数的值？';
      tmpS := tmpS + #13 + ' 注意：同步改动或公式计算会 覆盖当前的参数值 ！！';
      if MessageBoxA(Application.Handle,PChar(tmps),PChar('提示'),MB_YESNO) = IDYEs then
      begin
        tmp2 := ads279.RecNo;
        LQuanJuParam := ads279.FieldByName('PARAMETER_NAME').AsString;
        LValue :=  ads279.FieldByName('PARAMETER_VALUE').AsString;
        ads494.First;
        FChangeAllParam := False;
        try
          ads494.First;
          while not ads494.Eof do
          begin
            if LQry.Locate('PARAMETER_PTR',ads494.fieldbyname('PARAMETER_PTR').AsString,[]) then
            begin
              if LQry.FieldByName('STEP_NUMBER').AsInteger = ads494.FieldByName('step_number').AsInteger then
              begin
                if Pos(LQuanJuParam, LQry.fieldbyname('formula').AsString) > 0 then
                  if ((LValue = '') and (ads494PARAMETER_VALUE.AsString <> '')) or (LValue <> '') then
                  begin

                    ads494.Edit;
                    ads494.FieldByName('PARAMETER_VALUE').AsString := Form2.cacl_flowpara(LQry.fieldbyname('TValue').AsString, LQry.fieldbyname('formula').AsString);
                  end;
              end;
            end;
            ads494.Next;
          end;
        finally
          FChangeAllParam := True;
          ads279.RecNo := tmp2;
        end;
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
    ads494.Filter := tmpFilter;
    ads494.Filtered := True;
    ads494.RecNo := tmp;
    ads494.EnableControls;
  end;
end;

procedure TDM.D279ParamChangeEventEnable(B: Boolean);
begin
  if not B then ads279PARAMETER_VALUE.OnChange := nil else
    ads279PARAMETER_VALUE.OnChange := ads279PARAMETER_VALUEChange;
end;

procedure TDM.D494ParamChangeEventEnable(B: Boolean);
begin
  if not B then ads494PARAMETER_VALUE.OnChange := nil else
    ads494PARAMETER_VALUE.OnChange := ads494PARAMETER_VALUEChange;
end;

procedure TDM.AllFormulaCheck;
var
  tmp279n: Integer;
  tmp494Filter: string;
  tmp38n: integer;
  tmpS: string;
  lAllFormula: TADOQuery;
begin
  tmps := 'SELECT     Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE, Data0494.step_number, Data0494.seq_no, Data0506.PARAMETER_PTR AS Expr1, ' +
          ' Data0494.custpart_ptr ,Data0506.formula,Data0506.TValue, Data0278.PARAMETER_DESC ' +
          ' FROM         Data0494 INNER JOIN ' +
          ' Data0038 ON Data0494.custpart_ptr = Data0038.SOURCE_PTR AND Data0494.step_number = Data0038.STEP_NUMBER INNER JOIN ' +
          ' Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY INNER JOIN ' +
          ' Data0506 ON Data0494.PARAMETER_PTR = Data0506.PARAMETER_PTR AND Data0034.RKEY = Data0506.SOURCE_PTR INNER JOIN ' +
          ' Data0278 ON Data0494.PARAMETER_PTR = Data0278.RKEY AND Data0506.PARAMETER_PTR = Data0278.RKEY ' + 
          ' WHERE Data0494.custpart_ptr = ' + ADS25.fieldbyname('RKey').AsString +
          ' AND (LEN(Data0506.formula) > 0) ORDER BY Data0494.step_number';
  lAllFormula := TADOQuery.Create(Self);
  try
    lAllFormula.Connection := ADOConnection1;
    lAllFormula.SQL.Add(tmpS);
    lAllFormula.Open;
    tmp279n := ads279.RecNo;
    tmpS := '';
    ads279.DisableControls;
    tmp494Filter := ads494.Filter;
    ads494.DisableControls;
    try
      ads279.First;
      while not ads279.Eof do
      begin
        lAllFormula.First;
        while not lAllFormula.Eof do
        begin
          if (Pos(ads279.FieldByName('PARAMETER_NAME').AsString,lAllFormula.fieldbyname('formula').AsString) > 0) or
             (Pos('PROJECT',lAllFormula.fieldbyname('formula').AsString) > 0)
          then
          begin
            ads494.Filter := 'step_number='+lAllFormula.fieldbyname('step_number').AsString;
            ads494.Filtered := True;
            if ads494.Locate('seq_no',lAllFormula.fieldbyname('seq_no').AsInteger,[]) then
            begin
              if ads494.FieldByName('PARAMETER_VALUE').AsString <> Form2.cacl_flowpara(lAllFormula.fieldbyname('TValue').AsString,lAllFormula.fieldbyname('formula').AsString) then
              begin
                tmpS := tmpS + ' 第 ' + lAllFormula.fieldbyname('step_number').AsString + ' 步 工序中 , 参数 "' +
                  lAllFormula.fieldbyname('PARAMETER_DESC').AsString + '" 的值跟默认计算公式不相同。' + #13;
              end;
            end;
          end;
          lAllFormula.Next;
        end;
        ads279.Next;
      end;
      if tmpS <> '' then
      begin
        tmpS := '发现以下参数的值与默认计算公式不同，请检查是否正确：' + #13#13 + tmpS + #13 + '请确认上述工序的参数值。';
        ShowMessage(tmpS);
      end;
    finally
      ads279.RecNo := tmp279n;
      ads279.EnableControls;
    end;
  finally
    lAllFormula.Close;
    lAllFormula.Free;
    ads494.Filter := tmp494Filter;
    ads494.Filtered := True;
    ads494.EnableControls;
  end;

end;

function CheckScript(AScript: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Length(AScript) do
  begin
    if not ( AScript[I] in ['0'..'9','a'..'z','A'..'Z','+','-','*','/','>','<','=','.',' ','(',')',',',#13] ) then
    begin
      ShowMessage(AScript[I]+ ' 符号无法识别');
      Result := False;
      Exit;
    end;
  end;
end;

function CalcFormulac(AScript: string): string;
var
  I: Integer;
  LSqlScript: string;
  LWord: string;
begin
  if not CheckScript(AScript) then Exit;
  for I := 1 to Length(AScript) do
  begin
    if not (AScript[I] in ['0'..'9','a'..'z','A'..'Z']) then
    begin
      ShowMessage(LWord);
      LSqlScript := LSqlScript + LWord + AScript[I];
      LWord := '';

    end else
    begin
      LWord := LWord + AScript[I];
    end;
    if I = Length(AScript) then LSqlScript := LSqlScript + LWord;
  end;
  Result := LSqlScript;
end;

function TDM.CheckSpellSize(ATop25Rkey: string): Boolean;
var
  LQry: TADOQuery;
  LSql: string;
  PCS_W,PCS_L,SET_W,SET_L,SPELL_W,SPELL_L,SET_QTY,SPELL_QTY: string;
  tmpS: string;
begin
  Result := False;
  LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty) ' +
    ' AS (SELECT RKey,1,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty ' +
    ' FROM Data0025 WHERE RKey = '+ ATop25Rkey +' UNION ALL  ' +
    ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,D25.pcs_lngth,D25.pcs_width,D25.set_lngth,D25.set_width,D25.spell_lngth,D25.spell_width,D25.set_qty,D25.spell_qty ' +
    ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv ';
  LQry := TADOQuery.Create(Self);
  try
    LQry.SQL.Add(LSql);
    LQry.Connection := ADOConnection1;
    LQry.Prepared := True;
    LQry.Open;
    LQry.First;
    while not LQry.Eof do
    begin
      if LQry.FieldByName('RKey').AsString = ATop25Rkey then
      begin
        PCS_W := LQry.fieldbyname('pcs_width').AsString;
        PCS_L := LQry.fieldbyname('pcs_lngth').AsString;
        SET_W := LQry.fieldbyname('set_width').AsString;
        SET_L := LQry.fieldbyname('set_lngth').AsString;
        SPELL_W := LQry.fieldbyname('spell_width').AsString;
        SPELL_L := LQry.fieldbyname('spell_lngth').AsString;
        SET_QTY := LQry.fieldbyname('set_qty').AsString;
        SPELL_QTY := LQry.fieldbyname('spell_qty').AsString;
      end else
      begin
        if  (PCS_W <> LQry.fieldbyname('pcs_width').AsString) or
            (PCS_L <> LQry.fieldbyname('pcs_lngth').AsString)
        then
        begin
          tmpS := tmpS + LQry.fieldbyname('MANU_PART_NUMBER').AsString + ' 拼版页面 PCS 尺寸与顶层不一致！' + #13;
        end;
        if  (SET_W <> LQry.fieldbyname('set_width').AsString) or
            (SET_L <> LQry.fieldbyname('set_lngth').AsString)
        then
        begin
          tmpS := tmpS + LQry.fieldbyname('MANU_PART_NUMBER').AsString + ' 拼版页面 Set 尺寸与顶层不一致！' + #13;
        end;
        if  (SPELL_W <> LQry.fieldbyname('spell_width').AsString) or
            (SPELL_L <> LQry.fieldbyname('spell_lngth').AsString)
        then
        begin
          tmpS := tmpS + LQry.fieldbyname('MANU_PART_NUMBER').AsString + ' 拼版页面 SPELL 尺寸与顶层不一致！' + #13;
        end;
        if (SET_QTY <> LQry.fieldbyname('set_qty').AsString) or
            (SPELL_QTY <> LQry.fieldbyname('spell_qty').AsString)
        then
        begin
          tmpS := tmpS + LQry.fieldbyname('MANU_PART_NUMBER').AsString + ' 交货板单元数 尺寸与顶层不一致！' + #13;
        end;
      end;
      LQry.Next;
    end;
    if tmpS <> '' then
    begin
      tmpS := '拼版页面尺寸不一致：' + #13#13 + tmpS + #13 + ' 请检查 ！！';
      Result := False;
      ShowMessage(tmpS);
    end else
      Result := True;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function TDM.SetGrade_Code(ATop25Rkey,AGradeCode: string): Boolean;
var
  LQrytmp, LQryGrade: TADOQuery;
  Rkey25Arr: array of Integer;
  LSql: string;
  I: Integer;
  L494OldFilter: string;
begin
  Result := False;
  LQrytmp := TADOQuery.Create(Self);
  LQrytmp.Connection := ADOConnection1;
  LQryGrade := TADOQuery.Create(Self);
  LQryGrade.Connection := ADOConnection1;
  try
    //查出等级的需求
    LSql := ' SELECT D82.grade_code, d83.dept_ptr, d83.dept_note, d84.parameter_ptr, d84.tvalue ' +
            ' FROM Data0082 d82 ' +
            ' LEFT join data0083 d83 on d82.grade_code = d83.grade_code ' +
            ' LEFT join data0084 d84 on d84.grade_code = d83.grade_code ' +
            ' where d82.grade_code = ' + QuotedStr(AGradeCode);
    LQryGrade.SQL.Add(LSql);
    LQryGrade.open;

    //先查出所有需要内层和外层
    LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty) ' +
      ' AS (SELECT RKey,1,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty ' +
      ' FROM Data0025 WHERE RKey = '+ ATop25Rkey +' UNION ALL  ' +
      ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,D25.pcs_lngth,D25.pcs_width,D25.set_lngth,D25.set_width,D25.spell_lngth,D25.spell_width,D25.set_qty,D25.spell_qty ' +
      ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv ';
    LQrytmp.SQL.Add(LSql);
    LQrytmp.Open;
    SetLength(Rkey25Arr,LQrytmp.RecordCount);
    I := 0;
    while not LQrytmp.Eof do
    begin
      Rkey25Arr[I] := LQrytmp.FieldByName('Rkey').AsInteger;
      LQrytmp.Next;
      Inc(I);
    end;
    //按层来修改等级要求值
    for I := 0 to Length(Rkey25Arr) - 1 do
    begin
      //同步工序说明
      if Rkey25Arr[I] = DM.ADS38.FieldByName('source_ptr').AsInteger then
      begin
        DM.ADS38.DisableControls;
        LQryGrade.First;
        try
          while not LQryGrade.Eof do
          begin
            DM.ADS38.First;
            while not DM.ADS38.Eof do
            begin
              if DM.ADS38.FieldByName('dept_ptr').AsInteger = LQryGrade.FieldByName('dept_ptr').AsInteger then
              begin
                dm.ADS38.Edit;
                DM.ADS38.FieldByName('grade_note').AsString := LQryGrade.fieldbyname('dept_note').AsString;
              end;
              dm.ADS38.Next;
            end;
            LQryGrade.Next;
          end;
        finally
          DM.ADS38.EnableControls;
        end;
      end else
      begin
        LQryGrade.First;
        while not LQryGrade.Eof do
        begin
          LQrytmp.Close;
          LQrytmp.SQL.Clear;
          LSql := 'update data0038 set grade_note = ' + QuotedStr(LQryGrade.fieldbyname('dept_note').AsString) +
              ' where source_ptr = ' + IntToStr(Rkey25Arr[I]) +
              ' and dept_ptr = ' + IntToStr(LQryGrade.fieldbyname('dept_ptr').asinteger);
          LQrytmp.SQL.Add(LSql);
          LQrytmp.ExecSQL;
          LQryGrade.Next;
        end;
      end;

      //下面同步参数
      //对于当前打开的层
      if Rkey25Arr[I] = dm.ads494.FieldByName('custpart_ptr').AsInteger then
      begin
        L494OldFilter := ads494.Filter;
        ads494.DisableControls;
        try
          LQryGrade.First;
          while not LQryGrade.Eof do
          begin
            ADS38.First;
            while not ADS38.Eof do
            begin
              ads494.Filter := 'step_number = ' + ADS38.fieldbyname('step_number').AsString;
              ads494.Filtered := True;
              ads494.First;
              while not ads494.Eof do
              begin
                if ads494.FieldByName('PARAMETER_PTR').AsInteger = LQryGrade.FieldByName('PARAMETER_PTR').AsInteger then
                begin
                  ads494.Edit;
                  ads494.FieldByName('PARAMETER_VALUE').AsString := LQryGrade.fieldbyname('tvalue').AsString;
                end;
                ads494.Next;
              end;
              ADS38.Next;
            end;
            LQryGrade.Next;
          end;
        finally
          ads494.Filter := L494OldFilter;
          ads494.Filtered := True;
          ads494.EnableControls;
        end;
      end else
      //对于不处于当即激活的层，则直接更改数据库
      begin
        LQryGrade.First;
        while not LQryGrade.Eof do
        begin
          LQrytmp.Close;
          LQrytmp.SQL.Clear;
          LSql :=' update data0494 set PARAMETER_VALUE = ' + QuotedStr(LQryGrade.fieldbyname('tvalue').AsString) +
                ' from data0494 d494 inner join data0038 d38 on D494.custpart_ptr = d38.SOURCE_PTR and d494.step_number = d38.step_number ' +
                ' where d494.custpart_ptr = ' + IntToStr(Rkey25Arr[I]) +
                ' and d38.dept_ptr = ' + IntToStr(LQryGrade.fieldbyname('dept_ptr').asinteger) +
                ' and d494.parameter_ptr = ' + IntToStr(LQryGrade.fieldbyname('parameter_ptr').AsInteger) ;
          LQrytmp.SQL.Add(LSql);
          LQrytmp.ExecSQL;
          //ShowMessage(IntToStr(LQrytmp.ExecSQL));
          LQryGrade.Next;
        end;
      end;

      //将内层的grade_Code赋值
      if Rkey25Arr[I] <> dm.AQY0025.FieldByName('rkey').AsInteger then
      begin
        LQrytmp.Close;
        LQrytmp.SQL.Clear;
        if LQryGrade.fieldbyname('grade_code').AsString <> '' then
          LSql := ' update data0025 set grade_code = ' + QuotedStr(LQryGrade.fieldbyname('grade_code').AsString) +
              ' where rkey = ' + IntToStr(rkey25arr[I])
        else
          LSql := ' update data0025 set grade_code = null' +
              ' where rkey = ' + IntToStr(rkey25arr[I]) ;
            //' and grade_code <> ' + QuotedStr(LQryGrade.fieldbyname('grade_code').AsString);
        LQrytmp.SQL.Add(LSql);
        LQrytmp.ExecSQL;
      end;
    end;
    Result := True;
  finally
    LQrytmp.Free;
    LQryGrade.Free;
  end;
end;

function TDM.CheckGrade_Code: Boolean;
var
  LQrytmp, LQryGrade: TADOQuery;
  Rkey25Arr: array of Integer;
  LSql: string;
  I: Integer;
  L494OldFilter: string;
begin
  Result := False;
  LQrytmp := TADOQuery.Create(Self);
  LQrytmp.Connection := ADOConnection1;
  LQryGrade := TADOQuery.Create(Self);
  LQryGrade.Connection := ADOConnection1;
  try
    //查出等级的需求
    LSql := 'SELECT D82.grade_code, d83.dept_ptr, d83.dept_note, d84.parameter_ptr, d84.tvalue, d34.DEPT_NAME, d278.PARAMETER_DESC FROM ' +
          ' Data0082 d82 inner join data0083 d83 on d82.grade_code = d83.grade_code ' +
          ' inner join data0084 d84 on d84.grade_code = d83.grade_code and d84.dept_ptr = d83.dept_ptr ' +
          ' inner join data0034 d34 on d34.rkey = d83.dept_ptr ' +
          ' inner join data0278 d278 on d278.rkey = d84.parameter_ptr ' +
          ' where d82.grade_code = ' + QuotedStr(DM.AQY0025.fieldbyname('grade_code').AsString);
    LQryGrade.SQL.Add(LSql);
    LQryGrade.open;

    //先查出所有需要内层和外层
    LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty) ' +
      ' AS (SELECT RKey,1,MANU_PART_NUMBER,pcs_lngth,pcs_width,set_lngth,set_width,spell_lngth,spell_width,set_qty,spell_qty ' +
      ' FROM Data0025 WHERE RKey = '+ AQY0025.fieldbyname('rkey').AsString +' UNION ALL  ' +
      ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,D25.pcs_lngth,D25.pcs_width,D25.set_lngth,D25.set_width,D25.spell_lngth,D25.spell_width,D25.set_qty,D25.spell_qty ' +
      ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv ';
    LQrytmp.SQL.Add(LSql);
    LQrytmp.Open;
    SetLength(Rkey25Arr,LQrytmp.RecordCount);
    I := 0;
    while not LQrytmp.Eof do
    begin
      Rkey25Arr[I] := LQrytmp.FieldByName('Rkey').AsInteger;
      LQrytmp.Next;
      Inc(I);
    end;
    //按层来修改等级要求值
    for I := 0 to Length(Rkey25Arr) - 1 do
    begin
      //下面同步参数
      //对于当前打开的层
      if (DM.ads494.Active = True) and (Rkey25Arr[I] = dm.ads494.FieldByName('custpart_ptr').AsInteger) then
      begin
        L494OldFilter := ads494.Filter;
        ads494.DisableControls;
        try
          LQryGrade.First;
          while not LQryGrade.Eof do
          begin
            ads494.Filter := 'dept_ptr=' + LQryGrade.fieldbyname('dept_ptr').AsString;
            ads494.Filtered := True;
            ads494.First;
            while not ads494.Eof do
            begin
              if ads494.FieldByName('PARAMETER_PTR').AsInteger = LQryGrade.FieldByName('PARAMETER_PTR').AsInteger then
              begin
                //ads494.Edit;
                if ads494.FieldByName('PARAMETER_VALUE').AsString <> LQryGrade.fieldbyname('tvalue').AsString then
                begin
                  ShowMessage(LQryGrade.fieldbyname('DEPT_NAME').AsString + ' 中 参数 ' + LQryGrade.fieldbyname('PARAMETER_DESC').AsString + ' 与等级要求' + LQryGrade.fieldbyname('grade_code').AsString +'不一致，请检查!');
                  Exit;
                end;
              end;
              ads494.Next;
            end;
            LQryGrade.Next;
          end;
        finally
          ads494.Filter := L494OldFilter;
          ads494.Filtered := True;
          ads494.EnableControls;
        end;
      end else
      //对于不处于当即激活的层，则直接更改数据库
      begin
        LQryGrade.First;
        while not LQryGrade.Eof do
        begin
          LQrytmp.Close;
          LQrytmp.SQL.Clear;
          LSql := ' select rkey from data0494 d494 inner join data0038 d38 on D494.custpart_ptr = d38.SOURCE_PTR and d494.step_number = d38.step_number ' +
                ' where d494.custpart_ptr = ' + IntToStr(Rkey25Arr[I]) +
                ' and d38.dept_ptr = ' + LQryGrade.fieldbyname('dept_ptr').AsString +
                ' and d494.parameter_ptr = ' + LQryGrade.fieldbyname('parameter_ptr').AsString +
                ' and d494.PARAMETER_VALUE <> ' + QuotedStr(LQryGrade.fieldbyname('tvalue').AsString);
          LQrytmp.SQL.Add(LSql);
          LQrytmp.Open;
          if not LQrytmp.IsEmpty then
          begin
            ShowMessage(LQryGrade.fieldbyname('DEPT_NAME').AsString + ' 中 参数 ' + LQryGrade.fieldbyname('PARAMETER_DESC').AsString + ' 与等级要求'+ LQryGrade.fieldbyname('grade_code').AsString +'不一致，请检查!');
            Exit;
          end;
          //ShowMessage(IntToStr(LQrytmp.ExecSQL));
          LQryGrade.Next;
        end;
      end;
    end;
    Result := True;
  finally
    LQrytmp.Free;
    LQryGrade.Free;
  end;
end;

function TDM.SqlExec(AStr: string): Boolean;
begin
  //Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

function TDM.SqlOpen(AStr: string): Boolean;
begin
  //Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.Open;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

function TDM.CheckCostDeptSingle: Boolean;
var
  LSql: string;
  LAllDeptArr,LSameDeptArr: array of Integer;
  I: Integer;
  bAddAll: Boolean;
  lrkeyArr: string;
begin
  Result := True;
  if not ADS38.Active then Exit;
  ADS38.First;
  while not ADS38.Eof do
  begin
    bAddAll := True;
    for I := 0 to Length(LAllDeptArr) - 1 do
    begin
      if LAllDeptArr[I] = ADS38.FieldByName('dept_ptr').AsInteger then
      begin
        SetLength(LSameDeptArr,Length(LSameDeptArr)+1);
        LSameDeptArr[High(LSameDeptArr)] := ADS38.FieldByName('dept_ptr').AsInteger;
        bAddAll := False;
        Break;
      end;
    end;
    if bAddAll then
    begin
      SetLength(LAllDeptArr,Length(LAllDeptArr) + 1);
      LAllDeptArr[High(lalldeptarr)] := ADS38.fieldbyname('dept_ptr').AsInteger;
    end;
    ADS38.Next;
  end;
  lrkeyArr := '(';
  for I := 0 to Length(LSameDeptArr) - 1 do
  begin
    lrkeyArr := lrkeyArr + IntToStr(lsamedeptarr[I]) + ',';
  end;
  lrkeyArr := lrkeyArr + '0)';
  LSql := ' select rkey,dept_code from data0034 where rkey in ' + lrkeyArr ;
//          ' and (IS_COST_DEPT = 1' +
//          ' or COST_DEPT_PTR is not null ' +
//          ' or COST_DEPT_PTR <> 0 )';

  if SqlOpen(LSql) then
  begin
    if qryTmp.IsEmpty then
    begin
      Result := True;
    end else
    begin
      ShowMessage(qryTmp.fieldbyname('dept_code').AsString + '重复，不可以添加重复的工序');
      Result := False;
    end
  end else
    Result := False;

end;

procedure TDM.ads494BeforePost(DataSet: TDataSet);
var
  LSql: string;
begin
  if AQY0025.FieldByName('grade_code').AsString <> '' then
  begin
    //查出等级的需求
    LSql := 'SELECT D82.grade_code, d83.dept_ptr, d83.dept_note, d84.parameter_ptr, d84.tvalue, d34.DEPT_NAME, d278.PARAMETER_DESC FROM ' +
          ' Data0082 d82 inner join data0083 d83 on d82.grade_code = d83.grade_code ' +
          ' inner join data0084 d84 on d84.grade_code = d83.grade_code and d84.dept_ptr = d83.dept_ptr ' +
          ' inner join data0034 d34 on d34.rkey = d83.dept_ptr ' +
          ' inner join data0278 d278 on d278.rkey = d84.parameter_ptr ' +
          ' inner join data0038 d38 on d38.dept_ptr = d83.dept_ptr and d38.dept_ptr = ' + ADS38.fieldbyname('dept_ptr').AsString +
          //' inner join data0038 d38 on d38.source_ptr = '  + DM.AQY0025.fieldbyname('rkey').AsString + ' and d38.STEP_NUMBER = ' + ads494.fieldbyname('STEP_NUMBER').AsString +
          //' and d38.dept_ptr = d83.dept_ptr' +
          ' where d82.grade_code = ' + QuotedStr(DM.AQY0025.fieldbyname('grade_code').AsString) +
          ' and d84.parameter_ptr = ' + DataSet.fieldbyname('parameter_ptr').AsString;
    SqlOpen(LSql);
    if not qryTmp.IsEmpty and (DataSet.State = dsInsert) then
    begin
      try
        ads494.BeforePost := nil;
        //DataSet.Edit;
        DataSet.FieldByName('PARAMETER_VALUE').Value := qryTmp.fieldbyname('tvalue').Value;
        //DataSet.Post;
      finally
        ads494.BeforePost := ads494BeforePost;
      end;
    end;
  end;
end;

procedure TDM.ADS38AfterScroll(DataSet: TDataSet);
begin
  if DM.ADS38.FieldByName('step_number').AsString <> '' then
  begin
    dm.ads494.Filtered := False;
    dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
    dm.ads494.Filtered := True;
  end;
  
end;

procedure TDM.qryFileCalcFields(DataSet: TDataSet);
begin
  if qryFile.FieldByName('filetype').IsNull then exit;
  case qryFile.FieldByName('filetype').AsInteger of
    0:  qryFile.FieldByName('strType').Value:= '外形图';
    1:  qryFile.FieldByName('strType').Value:= 'VCUT图';
    2:  qryFile.FieldByName('strType').Value:= 'ECN变更文档';
    3:  qryFile.FieldByName('strType').Value:= '其它文档';
  end;
end;

function TDM.GetMITreeStruct(AQry: TADOQuery;
  AFields: array of string): Boolean;
begin
  //
end;

end.
