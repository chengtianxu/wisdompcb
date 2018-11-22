unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS1: TDataSource;
    ADO213: TADOQuery;
    ADO213MANU_PART_NUMBER: TStringField;
    ADO213ANALYSIS_CODE_2: TStringField;
    ADO213MANU_PART_DESC: TStringField;
    ADO213ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO213ORIG_REQUEST_DATE: TDateTimeField;
    ADO213PARTS_ORDERED: TIntegerField;
    ADO213CURR_CODE: TStringField;
    ADO213PO_DATE: TDateTimeField;
    ADO213status: TWordField;
    ADO213user_ptr: TIntegerField;
    ADO213submit_date: TDateTimeField;
    ADO213total_case: TFloatField;
    ADO213RKEY: TAutoIncField;
    ADOQuery1: TADOQuery;
    ADO213sstatus: TStringField;
    ADOQuery2: TADOQuery;
    ADO213audit_ptr: TIntegerField;
    ADO213audit_date: TDateTimeField;
    ADO213so_oldnew: TStringField;
    ADO213is_alter: TWordField;
    ADO213lis_num: TStringField;
    AQ0493: TADOQuery;
    AQ0493Company_Name: TStringField;
    AQ0493ship_address: TStringField;
    AQ0493Company_Icon: TBlobField;
    AQ0493SITE_INFO_ADD_1: TStringField;
    AQ0493SITE_INFO_ADD_2: TStringField;
    AQ0493SITE_INFO_ADD_3: TStringField;
    AQ0493SITE_INFO_PHONE: TStringField;
    AQ0493Company_name2: TStringField;
    AQ0493Company_name3: TStringField;
    ADO213cust_code: TStringField;
    aq192: TADOQuery;
    aq192aptaxontax: TStringField;
    aq192artaxontax: TStringField;
    aq192QTE_control2: TWordField;
    aq192ppc_control15: TWordField;
    aq192custcitool: TStringField;
    aq192custciprod: TStringField;
    aq192suplcimat: TStringField;
    aq192custciship: TStringField;
    aq192CUSTCOPROD: TStringField;
    aq192custcoTool: TStringField;
    ADO213parts_area: TFloatField;
    ADO213PART_PRICE: TFloatField;
    ADO213audit_name: TStringField;
    ADO213employee_name: TStringField;
    ADO213rkey10: TAutoIncField;
    ADO213name10: TStringField;
    ADO213orig_customer: TStringField;
    ADO213customer_name: TStringField;
    ADO213abbr_name: TStringField;
    ADO213PO_NUMBER: TStringField;
    ADO213REFERENCE_NUMBER: TStringField;
    ADO213WAREHOUSE_CODE: TStringField;
    ADO213EDI_FLAG_FOR_INVOICE: TSmallintField;
    ADO213Remark: TStringField;
    ADO213UsedQuantity: TIntegerField;
    ADO213SL: TIntegerField;
    ADO213EDI_FLAG: TStringField;
    ADO213DSDesigner: TFloatField;
    ADO213so_style: TWordField;
    ADO213CUST_CODE2: TStringField;
    ADO213PROD_CODE: TStringField;
    ADO213PRODUCT_NAME: TStringField;
    adoB2B_Response: TADOQuery;
    B2B_Call_Request: TADOQuery;
    Adotmp: TADOQuery;
    B2B_Call_RequestIDKey: TGuidField;
    B2B_Call_RequestCallIDkey: TGuidField;
    B2B_Call_RequestParamIDkey: TGuidField;
    B2B_Call_RequestParamName: TStringField;
    B2B_Call_RequestParamValue: TStringField;
    Adotmp2: TADOQuery;
    ADO213operateType: TWordField;
    ADO213lineLocationId: TStringField;
    ADO213stroperateType: TStringField;
    adoB2B_Responseseqno: TIntegerField;
    adoB2B_ResponsePOCode: TStringField;
    adoB2B_ResponseANALYSIS_CODE_2: TStringField;
    adoB2B_ResponseMANU_PART_DESC: TStringField;
    adoB2B_ResponseQry: TStringField;
    adoB2B_ResponsesAddress: TStringField;
    adoB2B_ResponselineLocationId: TStringField;
    ADO213XUHAO: TLargeintField;
    ADO213Print2DKey: TIntegerField;
    tmp: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
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






