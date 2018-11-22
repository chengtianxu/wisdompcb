unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOCon: TADOConnection;
    temp: TADOQuery;
    ADO574: TADOQuery;
    ADO574rkey: TAutoIncField;
    ADO574allocate_number: TStringField;
    ADO574fasset_ptr: TIntegerField;
    ADO574allocate_date: TDateTimeField;
    ADO574user_ptr: TIntegerField;
    ADO574ent_date: TDateTimeField;
    ADO574ORIGINAL_VALUE: TFloatField;
    ADO574SUMMED_DEPRE: TFloatField;
    ADO574NET_VALUE: TFloatField;
    ADO574EXPECTED_LIFE_MONTHS: TFloatField;
    ADO574DEPRED_MONTHS: TFloatField;
    ADO574outdeptname_empl: TStringField;
    ADO574out_equipment: TStringField;
    ADO574warehouse_user: TIntegerField;
    ADO574financial_user: TIntegerField;
    ADO574manage_user: TIntegerField;
    ADO574warehouse_date: TDateTimeField;
    ADO574financial_date: TDateTimeField;
    ADO574manage_date: TDateTimeField;
    ADO574status: TWordField;
    ADO574remark: TStringField;
    ADO574detection_remark: TStringField;
    ADO574scrap_remark: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS574: TADODataSet;
    ADS574rkey: TAutoIncField;
    ADS574allocate_number: TStringField;
    ADS574fasset_ptr: TIntegerField;
    ADS574allocate_date: TDateTimeField;
    ADS574user_ptr: TIntegerField;
    ADS574ent_date: TDateTimeField;
    ADS574ORIGINAL_VALUE: TFloatField;
    ADS574SUMMED_DEPRE: TFloatField;
    ADS574NET_VALUE: TFloatField;
    ADS574EXPECTED_LIFE_MONTHS: TFloatField;
    ADS574DEPRED_MONTHS: TFloatField;
    ADS574out_equipment: TStringField;
    ADS574outdeptname_empl: TStringField;
    ADS574warehouse_user: TIntegerField;
    ADS574financial_user: TIntegerField;
    ADS574manage_user: TIntegerField;
    ADS574warehouse_date: TDateTimeField;
    ADS574manage_date: TDateTimeField;
    ADS574financial_date: TDateTimeField;
    ADS574status: TWordField;
    ADS574remark: TStringField;
    ADS574detection_remark: TStringField;
    ADS574scrap_remark: TStringField;
    ADS574FASSET_CODE: TStringField;
    ADS574FASSET_NAME: TStringField;
    ADS574FASSET_DESC: TStringField;
    ADS574status_u: TStringField;
    ADS574employee_name: TStringField;
    ADS574employee_name_1: TStringField;
    ADS574employee_name_2: TStringField;
    ADS574employee_name_3: TStringField;
    ADO517: TADOQuery;
    ADO517RKEY: TAutoIncField;
    ADO517FASSET_CODE: TStringField;
    ADO517FASSET_NAME: TStringField;
    ADO517FASSET_DESC: TStringField;
    ADO517FASSET_TYPE_PTR: TSmallintField;
    ADO517DEPT_PTR: TIntegerField;
    ADO517ALT_TYPE_PTR: TSmallintField;
    ADO517STATUS_PTR: TSmallintField;
    ADO517ORIGINAL_VALUE: TFloatField;
    ADO517SUMMED_DEPRE: TFloatField;
    ADO517NET_VALUE: TFloatField;
    ADO517LOCATION: TStringField;
    ADO517BOOK_DATE: TDateTimeField;
    ADO517SURPLUS_RATE: TFloatField;
    ADO517SURPLUS: TFloatField;
    ADO517DEPRE_MTHD_PTR: TSmallintField;
    ADO517EXPECTED_LIFE_MONTHS: TFloatField;
    ADO517DEPRED_MONTHS: TFloatField;
    ADO517LOADING_UNIT: TStringField;
    ADO517MONTH_DEPRE_RATE: TFloatField;
    ADO517MONTH_DEPRE_AMT: TBCDField;
    ADO517DEPRE_ACCT_PTR: TIntegerField;
    ADO517YEAR_ORGI_VALUE_OPEN: TFloatField;
    ADO517YEAR_ORGI_VALUE_INCREASE: TFloatField;
    ADO517YEAR_ORGI_VALUE_DECREASE: TFloatField;
    ADO517YEAR_DEPRE_SUMMED_OPEN: TFloatField;
    ADO517YEAR_DEPRE_SUMMED_INCREASE: TFloatField;
    ADO517YEAR_DEPRE_SUMMED_DECREASE: TFloatField;
    ADO517REMARK: TStringField;
    ADO517active_flag: TBooleanField;
    ADO517fasset_gl_ptr: TIntegerField;
    ADO517faccu_depr_gl_ptr: TIntegerField;
    ADO517depr_rate_method: TWordField;
    ADO517voucher_ptr: TIntegerField;
    ADO517id_code: TStringField;
    ADO517ORIG_SUMMED_DEPRE: TFloatField;
    ADO517orig_original_value: TFloatField;
    ADO517USER_DATE: TDateTimeField;
    ADO517warehouse_ptr: TIntegerField;
    ADO517VOUCHER: TStringField;
    ADO517supplier_name: TStringField;
    ADOQuery1: TADOQuery;
    ADS574warehouse_code: TStringField;
    ADS574abbr_name: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;
  rkey574:integer;
implementation

{$R *.dfm}

end.
