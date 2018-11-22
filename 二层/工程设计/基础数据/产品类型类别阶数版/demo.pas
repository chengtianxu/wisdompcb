unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS08: TADODataSet;
    ADOQuery1: TADOQuery;
    DS08: TDataSource;
    ADS08RKEY: TAutoIncField;
    ADS08PROD_CODE: TStringField;
    ADS08PRODUCT_NAME: TStringField;
    ADS08PR_GRP_POINTER: TIntegerField;
    ADS08LEAD_TIME: TSmallintField;
    ADS08OPT_LOT_SIZE: TIntegerField;
    ADS08MAX_DAYS_EARLY_BUILD: TSmallintField;
    ADS08PROD_SEEDVALUE: TStringField;
    ADS08PROD_INCREMENTBY: TSmallintField;
    ADS08ANALYSIS_CODE1: TStringField;
    ADS08ANALYSIS_CODE2: TStringField;
    ADS08ANALYSIS_CODE3: TStringField;
    ADS08ANALYSIS_CODE4: TStringField;
    ADS08ANALYSIS_CODE5: TStringField;
    ADS08G_L_POINTER: TIntegerField;
    ADS08PRECHAR1: TStringField;
    ADS08PRECHAR2: TStringField;
    ADS08EST_SCRAP: TFloatField;
    ADS08EST_SCRAP1: TFloatField;
    ADS08difficulty_grade: TIntegerField;
    ADS08difficulty_grade_value: TFloatField;
    ADS08est_scrap_ltm: TFloatField;
    ADS08est_scrap1_lmt: TFloatField;
    ADS08DG_ADJ_PTH: TBCDField;
    ADS08DG_ADJ_NPTH: TBCDField;
    ADS08batch_flag: TBooleanField;
    ADS08former_flag: TBooleanField;
    ADS08IESMODEL_PTR: TIntegerField;
    ADS08layer_pre: TIntegerField;
    ADS08REVIEW_DAYS: TSmallintField;
    ADS08category: TStringField;
    ADS08active: TBooleanField;
    ADS08PR_GRP_CODE: TStringField;
    ADS08PRODUCT_GROUP_NAME: TStringField;
    ADS08category_name: TWideStringField;
    ADO08: TADOQuery;
    DS8: TDataSource;
    ADO08RKEY: TAutoIncField;
    ADO08PROD_CODE: TStringField;
    ADO08PRODUCT_NAME: TStringField;
    ADO08PR_GRP_POINTER: TIntegerField;
    ADO08LEAD_TIME: TSmallintField;
    ADO08OPT_LOT_SIZE: TIntegerField;
    ADO08MAX_DAYS_EARLY_BUILD: TSmallintField;
    ADO08PROD_SEEDVALUE: TStringField;
    ADO08PROD_INCREMENTBY: TSmallintField;
    ADO08ANALYSIS_CODE1: TStringField;
    ADO08ANALYSIS_CODE2: TStringField;
    ADO08ANALYSIS_CODE3: TStringField;
    ADO08ANALYSIS_CODE4: TStringField;
    ADO08ANALYSIS_CODE5: TStringField;
    ADO08G_L_POINTER: TIntegerField;
    ADO08PRECHAR1: TStringField;
    ADO08PRECHAR2: TStringField;
    ADO08EST_SCRAP: TFloatField;
    ADO08EST_SCRAP1: TFloatField;
    ADO08difficulty_grade: TIntegerField;
    ADO08difficulty_grade_value: TFloatField;
    ADO08est_scrap_ltm: TFloatField;
    ADO08est_scrap1_lmt: TFloatField;
    ADO08DG_ADJ_PTH: TBCDField;
    ADO08DG_ADJ_NPTH: TBCDField;
    ADO08batch_flag: TBooleanField;
    ADO08former_flag: TBooleanField;
    ADO08IESMODEL_PTR: TIntegerField;
    ADO08layer_pre: TIntegerField;
    ADO08REVIEW_DAYS: TSmallintField;
    ADO08category: TStringField;
    ADO08active: TBooleanField;
    ADS08active2: TStringField;
    DS620: TDataSource;
    ADS620: TADODataSet;
    ADS620PROD_CODE: TStringField;
    ADS620warehouse_ptr: TIntegerField;
    ADS620EST_SCRAP: TBCDField;
    ADS620est_scrap_ltm: TBCDField;
    ADS620WAREHOUSE_CODE: TStringField;
    ADS620WAREHOUSE_NAME: TStringField;
    ADS620ABBR_NAME: TStringField;
    procedure ADS08AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ADS08AfterScroll(DataSet: TDataSet);
begin
  Frm_Main.Bar1.SimpleText := '当前记录行:'+IntToStr(DM.ADS08.RecNo)+'/总记录数:'+ IntToStr(DM.ADS08.RecordCount);
end;

end.
