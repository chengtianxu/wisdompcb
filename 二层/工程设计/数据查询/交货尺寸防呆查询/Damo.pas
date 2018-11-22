unit Damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS25: TDataSource;
    DS25_1: TDataSource;
    ADO25: TADOQuery;
    ADO25_1: TADODataSet;
    ADO25_1RKEY: TIntegerField;
    ADO25_1MANU_PART_NUMBER: TStringField;
    ADO25_1MANU_PART_DESC: TStringField;
    ADO25_1CUST_CODE: TStringField;
    ADO25_1ABBR_NAME: TStringField;
    ADO25_1PROD_CODE: TStringField;
    ADO25_1PRODUCT_NAME: TStringField;
    ADO25_1ANALYSIS_CODE_1: TStringField;
    ADO25_1employee_createname: TStringField;
    ADO25_1CUSTPART_ENT_DATE: TDateTimeField;
    ADO25_1PROD_ROUTE_PTR: TIntegerField;
    ADO25_1quality_status: TBooleanField;
    ADO25_1employee_auditname: TStringField;
    ADO25_1AUDITED_DATE: TDateTimeField;
    ADO25_1TSTATUS: TWordField;
    ADO25_1employee_editname: TStringField;
    ADO25_1REMARK: TStringField;
    ADO25_1ENG_NOTE: TStringField;
    ADO25_1memo_text: TStringField;
    ADO25_1LAST_MODIFIED_DATE: TDateTimeField;
    ADO25_1SAMPLE_NR: TStringField;
    ADO25_1ORIG_CUSTOMER: TStringField;
    ADO25_1ANALYSIS_CODE_2: TStringField;
    ADO25_1QTY_ON_HAND: TIntegerField;
    ADO25_1LAYERS: TWordField;
    ADO25_1green_flag: TStringField;
    ADO25_1overdue: TStringField;
    ADO25_1state: TStringField;
    ADO25_1batch_or_former: TStringField;
    ADO25_1CHECK_DATE: TDateTimeField;
    ADO25_1check_emplname: TStringField;
    ADO25_1ORIG_CUST_CODE: TStringField;
    ADODataSet1: TADODataSet;
    ADODataSet1RKEY: TIntegerField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1PROD_CODE: TStringField;
    ADODataSet1PRODUCT_NAME: TStringField;
    ADODataSet1ANALYSIS_CODE_1: TStringField;
    ADODataSet1employee_createname: TStringField;
    ADODataSet1CUSTPART_ENT_DATE: TDateTimeField;
    ADODataSet1PROD_ROUTE_PTR: TIntegerField;
    ADODataSet1quality_status: TBooleanField;
    ADODataSet1employee_auditname: TStringField;
    ADODataSet1AUDITED_DATE: TDateTimeField;
    ADODataSet1TSTATUS: TWordField;
    ADODataSet1employee_editname: TStringField;
    ADODataSet1REMARK: TStringField;
    ADODataSet1ENG_NOTE: TStringField;
    ADODataSet1memo_text: TStringField;
    ADODataSet1LAST_MODIFIED_DATE: TDateTimeField;
    ADODataSet1SAMPLE_NR: TStringField;
    ADODataSet1ORIG_CUSTOMER: TStringField;
    ADODataSet1ANALYSIS_CODE_2: TStringField;
    ADODataSet1QTY_ON_HAND: TIntegerField;
    ADODataSet1LAYERS: TWordField;
    ADODataSet1green_flag: TStringField;
    ADODataSet1overdue: TStringField;
    ADODataSet1state: TStringField;
    ADODataSet1batch_or_former: TStringField;
    ADODataSet1CHECK_DATE: TDateTimeField;
    ADODataSet1check_emplname: TStringField;
    ADODataSet1ORIG_CUST_CODE: TStringField;
    ADO25ANALYSIS_CODE_1: TStringField;
    ADO25set_lngth: TBCDField;
    ADO25set_width: TBCDField;
    ADO25COLUMN1: TIntegerField;
    ADODataSet1set_qty: TIntegerField;
    ADODataSet1failsafe_remark: TWideStringField;
    ADODataSet1pcs_lngth: TBCDField;
    ADODataSet1pcs_width: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
