unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB,Variants;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADS85: TADODataSet;
    ADS85TNUMBER: TStringField;
    ADS85REF_PART_NO: TStringField;
    ADS85CUST_PART_NO: TStringField;
    ADS85CUST_NAME: TStringField;
    ADS85quote_taxprice: TFloatField;
    ADS85curr_code: TStringField;
    ADS85CURR_NAME: TStringField;
    ADS85CURR_RATE: TFloatField;
    ADS85vatax: TBCDField;
    ADS85MARKUP: TFloatField;
    ADS85QTE_DATE: TDateTimeField;
    ADS85EXPIRATION_DATE: TDateTimeField;
    ADS85EMPLOYEE_NAME: TStringField;
    ADS85DSDesigner: TStringField;
    ADS85rkey: TIntegerField;
    ADS85REP_CODE: TStringField;
    ADS85SALES_REP_NAME: TStringField;
    ADS85prod_code: TStringField;
    ADS85product_name: TStringField;
    ADS85code: TStringField;
    ADS85QTE_APPROV_DESC: TStringField;
    ADS85ROW_NAME: TStringField;
    ADS85QBY_EMPL_PTR: TIntegerField;
    ADS85AUDITED_STATUS: TWordField;
    ADS85APPRV_BY_PTR: TIntegerField;
    ADS85apprv_date: TDateTimeField;
    ADS85cust_add2: TStringField;
    DataSource2: TDataSource;
    ADSA85: TADODataSet;
    ADSA85RKEY: TAutoIncField;
    ADSA85TTYPE: TSmallintField;
    ADSA85TNUMBER: TStringField;
    ADSA85CUST_NAME: TStringField;
    ADSA85CUST_ADD1: TStringField;
    ADSA85CUST_STATE: TStringField;
    ADSA85CUST_ZIP: TStringField;
    ADSA85CUST_PHONE: TStringField;
    ADSA85CUST_FAX: TStringField;
    ADSA85CUST_CONTACT: TStringField;
    ADSA85CUST_CONTACT_PHONE: TStringField;
    ADSA85CUST_RFQ: TStringField;
    ADSA85CUST_PTR: TIntegerField;
    ADSA85CUST_QTE_FACTOR: TFloatField;
    ADSA85CURR_PTR: TIntegerField;
    ADSA85SREP_PTR: TIntegerField;
    ADSA85QBY_EMPL_PTR: TIntegerField;
    ADSA85ENTER_DATE: TDateTimeField;
    ADSA85QTE_DATE: TDateTimeField;
    ADSA85CUST_PART_PTR: TIntegerField;
    ADSA85CUST_PART_NO: TStringField;
    ADSA85CUST_PART_DESC: TStringField;
    ADSA85REF_PART_NO: TStringField;
    ADSA85MATL_COST: TFloatField;
    ADSA85MARKUP: TFloatField;
    ADSA85CURR_RATE: TFloatField;
    ADSA85ENGR_ROUTE_PTR: TIntegerField;
    ADSA85PROD_ROUTE_PTR: TIntegerField;
    ADSA85PROD_CODE_PTR: TIntegerField;
    ADSA85QUOTE_TYPE: TSmallintField;
    ADSA85EXPIRATION_DATE: TDateTimeField;
    ADSA85EMAIL: TStringField;
    ADSA85AUDITED_STATUS: TWordField;
    ADSA85NOTE_INFO: TStringField;
    ADSA85UPANEL: TIntegerField;
    ADSA85USHEET: TBCDField;
    ADSA85QTE_USHEET: TBCDField;
    ADSA85QTE_UNIT_PTR: TIntegerField;
    ADSA85QTE_UNITS: TFloatField;
    ADSA85PAYMENT: TStringField;
    ADSA85SALES_DISCOUNT: TBCDField;
    ADSA85UNIT_LEN: TFloatField;
    ADSA85UNIT_WTH: TFloatField;
    ADSA85TUSAGE: TBCDField;
    ADSA85TUNITS: TIntegerField;
    ADSA85BASE_PRICE: TFloatField;
    ADSA85QTE_CONTROL5: TStringField;
    ADSA85ttype2: TWordField;
    ADSA85ovhd_cost: TFloatField;
    ADSA85base_pcscost: TFloatField;
    ADSA85total_cost: TFloatField;
    ADSA85comm_cost: TFloatField;
    ADSA85vatax: TBCDField;
    ADSA85quote_price: TFloatField;
    ADSA85quote_taxprice: TFloatField;
    ADSA85rej_info: TMemoField;
    ADSA85CRP_EST_QUANTITY: TBCDField;
    ADSA85SHIPPING_CHARGE: TBCDField;
    ADSA85APPRV_BY_PTR: TIntegerField;
    ADSA85APPRV_DATE: TDateTimeField;
    DataSource3: TDataSource;
    ads431: TADODataSet;
    ads431QTE_PTR: TIntegerField;
    ads431UNIT_PTR: TIntegerField;
    ads431UNIT_VALUE: TStringField;
    ads431ttype: TWordField;
    ads431PARAMETER_NAME: TStringField;
    ads431PARAMETER_DESC: TStringField;
    ads431SPEC_RKEY: TStringField;
    ads431UNIT_NAME: TStringField;
    ads431DATA_TYPE: TSmallintField;
    DataSource4: TDataSource;
    ads511: TADODataSet;
    ads511source_ptr: TIntegerField;
    ads511sheet_BMP: TBlobField;
    ads511pnl_bmp: TBlobField;
    ads511pnl2_bmp: TBlobField;
    ads511TOTAL_PNLS_1: TSmallintField;
    ads511TOTAL_PNLS_2: TSmallintField;
    ads511UNIT_LEN: TFloatField;
    ads511UNIT_WTH: TFloatField;
    ads511UNIT_UNIT: TWordField;
    ads511UNIT_NUM: TIntegerField;
    ads511SHT_LEN: TFloatField;
    ads511SHT_WTH: TFloatField;
    ads511TUSAGE: TBCDField;
    ads511PNL_LEN: TFloatField;
    ads511PNL_WTH: TFloatField;
    ads511UPANEL: TSmallintField;
    ads511PNL_LEN_2: TFloatField;
    ads511PNL_WTH_2: TFloatField;
    ads511UPANEL_2: TSmallintField;
    ads511minspace1: TFloatField;
    ads511minspace2: TFloatField;
    DataSource5: TDataSource;
    ads274: TADODataSet;
    ads274USER_ID: TStringField;
    ads274USER_FULL_NAME: TStringField;
    ads274auth_date: TDateTimeField;
    ads274ranking: TWordField;
    ads274auth_flag: TStringField;
    ads274DSDesigner: TStringField;
    ads432: TADODataSet;
    ads432QTE_PTR: TIntegerField;
    ads432ADDL_CAT_PTR: TIntegerField;
    ads432AMOUNT: TFloatField;
    ads432FREE_AMOUNT: TFloatField;
    ads432TAX_FLAG: TStringField;
    ads278: TADODataSet;
    ads278rkey: TIntegerField;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278SPEC_RKEY: TStringField;
    ads278UNIT_NAME: TStringField;
    ads278DATA_TYPE: TWordField;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADS85DSDesigner2: TStringField;
    ADS85DSDesigner3: TStringField;
    ADS85ststus_c: TStringField;
    ADS85auth_date: TDateTimeField;
    ADS85auth_flag: TStringField;
    ADS85ranking: TWordField;
    ADOQuery2: TADOQuery;
    ADS85rate_margin: TBCDField;
    ADSA85rate_margin: TBCDField;
    ADS85mian_ji: TFloatField;
    ADS85SALES_ORDERS_ENTERED: TIntegerField;
    ADSA85SALES_ORDERS_ENTERED: TIntegerField;
    ADS85ttype2: TWordField;
    ADS85orig_customer: TStringField;
    ADSA85ORIG_CUSTOMER: TStringField;
    procedure ADS85CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    qte_type:byte;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADS85CalcFields(DataSet: TDataSet);
begin
  if dm.ADS85auth_date.AsVariant=null then
   dm.ADS85ststus_c.Value:='Œ¥…Û≈˙'
  else
   dm.ADS85ststus_c.Value:='“—…Û≈˙';
end;

end.
