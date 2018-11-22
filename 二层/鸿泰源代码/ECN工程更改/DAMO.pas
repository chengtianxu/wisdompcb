unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ads273: TADODataSet;
    ads273RKEY: TIntegerField;
    ads273ECN_NO: TStringField;
    ads273STATUS: TSmallintField;
    ads273SOURCE: TSmallintField;
    ads273CUST_CODE: TStringField;
    ads273CUSTOMER_NAME: TStringField;
    ads273EMPLOYEE_NAME: TStringField;
    ads273ENTERED_DATE: TDateTimeField;
    ads273authemployee: TStringField;
    ads273VERIFIED_DATE: TDateTimeField;
    ads273MANU_PART_NUMBER: TStringField;
    ads273MANU_PART_DESC: TStringField;
    ads273copytonumber: TStringField;
    ads273copytodesc: TStringField;
    ads273Tooling_close: TWordField;
    ads273tstatus: TStringField;
    ads273tsource: TStringField;
    ads273ttype: TStringField;
    ADOQuery1: TADOQuery;
    ads04: TADODataSet;
    ads04CONTROL_NO_LENGTH: TSmallintField;
    ads04SEED_VALUE: TStringField;
    ads04SEED_FLAG: TWordField;
    ADOQuery2: TADOQuery;
    adsa273: TADODataSet;
    adsa273RKEY: TAutoIncField;
    adsa273CUSTOMER_PTR: TIntegerField;
    adsa273CUSTOMER_PART_PTR: TIntegerField;
    adsa273COPYFROMCUST_PTR: TIntegerField;
    adsa273ENTERED_BY: TIntegerField;
    adsa273VERIFIED_BY: TIntegerField;
    adsa273ENTERED_DATE: TDateTimeField;
    adsa273VERIFIED_DATE: TDateTimeField;
    adsa273STATUS: TSmallintField;
    adsa273SOURCE: TSmallintField;
    adsa273TEXT1: TStringField;
    adsa273TEXT2: TStringField;
    adsa273TEXT3: TStringField;
    adsa273TEXT4: TStringField;
    adsa273ECN_NO: TStringField;
    adsa273text: TStringField;
    adsa273Tooling_close: TWordField;
    adsa273remark: TStringField;
    adsa273last_modi_by_ptr: TIntegerField;
    adsa273last_modi_date: TDateTimeField;
    adsa273ECNB1: TStringField;
    adsa273ECNB2: TStringField;
    adsa273ECNB3: TStringField;
    adsa273ECNB4: TStringField;
    adsa273ECNB5: TStringField;
    adsa273ECNA1: TStringField;
    adsa273ECNA2: TStringField;
    adsa273ECNA3: TStringField;
    adsa273ECNA4: TStringField;
    adsa273ECNA5: TStringField;
    adsa273ECNSTART: TWordField;
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
    ADS38: TADODataSet;
    ADS38SOURCE_PTR: TIntegerField;
    ADS38DEPT_PTR: TIntegerField;
    ADS38DEF_ROUT_INST: TStringField;
    ADS38STEP_NUMBER: TSmallintField;
    ADS38tooling_rev: TStringField;
    ADS38OUTP_SPFC: TBCDField;
    ADS38tool_old_rev: TStringField;
    ads494: TADODataSet;
    ads494PARAMETER_PTR: TIntegerField;
    ads494PARAMETER_VALUE: TStringField;
    ads494custpart_ptr: TIntegerField;
    ads494step_number: TSmallintField;
    ads494seq_no: TSmallintField;
    ads494Doc_Flag: TStringField;
    ads494after_flag: TStringField;
    ads494flow_spfc_flag: TStringField;
    ads279: TADODataSet;
    ads279source_PTR: TIntegerField;
    ads279PARAMETER_PTR: TIntegerField;
    ads279PARAMETER_VALUE: TStringField;
    ads279IES_PROD: TSmallintField;
    ads279IES_CRP: TSmallintField;
    DataSource2: TDataSource;
    ads_ed38: TADODataSet;
    ads_ed38STEP_NUMBER: TSmallintField;
    ads_ed38DEPT_CODE: TStringField;
    ads_ed38DEPT_NAME: TStringField;
    ads_ed38tool_old_rev: TStringField;
    ads_ed38tooling_rev: TStringField;
    ads_ed38TOOL_REMARK: TStringField;
    DataSource3: TDataSource;
    ads06: TADODataSet;
    ads06RKEY: TAutoIncField;
    ads06WORK_ORDER_NUMBER: TStringField;
    ads06MANU_PART_NUMBER: TStringField;
    ads06MANU_PART_DESC: TStringField;
    ads06QTY_BACKLOG: TFloatField;
    ads06PANELS: TIntegerField;
    ads06STEP: TSmallintField;
    ads06DEPT_CODE: TStringField;
    ads06DEPT_NAME: TStringField;
    DataSource4: TDataSource;
    ads06prod_status: TSmallintField;
    ads06C_status: TStringField;
    ads_clone06: TADODataSet;
    ads_clone06RKEY: TIntegerField;
    ads_clone06WORK_ORDER_NUMBER: TStringField;
    ads_clone06prod_status: TSmallintField;
    adsa273del: TWordField;
    ads273CUSTOMER_PART_PTR: TIntegerField;
    ads497: TADODataSet;
    ads497PARAMETER_PTR: TIntegerField;
    ads497PARAMETER_VALUE: TStringField;
    ads497SOURCE_PTR: TIntegerField;
    ads497ROUTE_STEP_PTR: TIntegerField;
    ads497SEQ_NO: TIntegerField;
    ADS38rkey: TAutoIncField;
    AQY0025PROD_ROUTE_PTR: TIntegerField;
    AQY0025ANCESTOR_PTR: TIntegerField;
    AQY0025CURRENT_REV: TStringField;
    AQY0025barcode_flag: TWordField;
    ADOQuery3: TADOQuery;
    AQY0025TUSAGE: TBCDField;
    AQY0025NOPB_flag: TWordField;
    AQY0025QTY_PARENTBOM: TWordField;
    ads494outp_spfc_flag: TStringField;
    AQY0025REACH: TBooleanField;
    AQY0025flod_number: TIntegerField;
    AQY0025ZDR_TYPE: TWideStringField;
    AQY0025layers_image: TBlobField;
    AQY0025ORIG_CUSTOMER: TStringField;
    procedure ads06CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ads06CalcFields(DataSet: TDataSet);
begin
case self.ads06prod_status.Value of


 2: self.ads06C_status.Value:='待发放';
 3: self.ads06C_status.Value:='生产中';
 102: self.ads06C_status.Value:='生产前暂缓';
 103: self.ads06C_status.Value:='生产中暂缓';
     
end;
end;

end.
