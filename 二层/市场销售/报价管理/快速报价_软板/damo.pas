unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS85: TADODataSet;
    DataSource1: TDataSource;
    ADS85TNUMBER: TStringField;
    ADS85REF_PART_NO: TStringField;
    ADS85CUST_PART_NO: TStringField;
    ADS85CUST_NAME: TStringField;
    ADS85quote_taxprice: TFloatField;
    ADS85CURR_NAME: TStringField;
    ADS85CURR_RATE: TFloatField;
    ADS85vatax: TBCDField;
    ADS85MARKUP: TFloatField;
    ADS85QTE_DATE: TDateTimeField;
    ADS85EXPIRATION_DATE: TDateTimeField;
    ADS85EMPLOYEE_NAME: TStringField;
    ADS85DSDesigner: TStringField;
    ADS85DSDesigner2: TStringField;
    ADS85rkey: TIntegerField;
    ADOQuery1: TADOQuery;
    ADSA85: TADODataSet;
    DataSource2: TDataSource;
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
    ads432: TADODataSet;
    ads432QTE_PTR: TIntegerField;
    ads432AMOUNT: TFloatField;
    ads432ADDL_CAT_PTR: TIntegerField;
    ads432FREE_AMOUNT: TFloatField;
    ads432TAX_FLAG: TStringField;
    ads431: TADODataSet;
    DataSource3: TDataSource;
    ads431QTE_PTR: TIntegerField;
    ads431UNIT_PTR: TIntegerField;
    ads431UNIT_VALUE: TStringField;
    ads278: TADODataSet;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278UNIT_NAME: TStringField;
    ads278rkey: TIntegerField;
    ads278SPEC_RKEY: TStringField;
    ads431PARAMETER_NAME: TStringField;
    ads431PARAMETER_DESC: TStringField;
    ads431SPEC_RKEY: TStringField;
    ads431UNIT_NAME: TStringField;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    ADOQuery2: TADOQuery;
    ads511: TADODataSet;
    DataSource4: TDataSource;
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
    ads278DATA_TYPE: TWordField;
    ads431DATA_TYPE: TSmallintField;
    AQ280: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    AQ280ENG_TABLE_NAME: TStringField;
    AQ280DATA_TYPE: TIntegerField;
    AQ280fx_type: TWordField;
    AQ280fy_type: TWordField;
    AQ280rkey: TIntegerField;
    ADOStoredProc1tvalue: TStringField;
    ADS85curr_code: TStringField;
    ADS85REP_CODE: TStringField;
    ADS85SALES_REP_NAME: TStringField;
    ADS85prod_code: TStringField;
    ADS85product_name: TStringField;
    ADS85code: TStringField;
    ADS85QTE_APPROV_DESC: TStringField;
    ADS85ROW_NAME: TStringField;
    ads274: TADODataSet;
    DataSource5: TDataSource;
    ads274USER_ID: TStringField;
    ads274USER_FULL_NAME: TStringField;
    ads274auth_date: TDateTimeField;
    ads274ranking: TWordField;
    ads274auth_flag: TStringField;
    ads274DSDesigner: TStringField;
    ADS85QBY_EMPL_PTR: TIntegerField;
    ADSA85APPRV_BY_PTR: TIntegerField;
    ADSA85APPRV_DATE: TDateTimeField;
    ADS85AUDITED_STATUS: TWordField;
    ADS85APPRV_BY_PTR: TIntegerField;
    ADS85apprv_date: TDateTimeField;
    ADS85cust_add2: TStringField;
    ads431ttype: TSmallintField;
    ADS85quote_type: TSmallintField;
    ads511pnl_lenspace: TBCDField;
    ads511pnl_wthspace: TBCDField;
    ADOQuery3: TADOQuery;
    ADSA85QTE_CONTROL5: TStringField;
    AQ17: TADOQuery;
    AQtmp: TADOQuery;
    DS17: TDataSource;
    ads278min_value: TFloatField;
    ads278max_value: TFloatField;
    ads431min_value: TFloatField;
    ads431max_value: TFloatField;
    ADS85SALES_DISCOUNT: TBCDField;
    ADS85DSDesigner3: TStringField;
    ADS85TUSAGE: TBCDField;
    ADS85QTE_UNITS: TFloatField;
    ADS85DSDesigner4: TFloatField;
    ADS85CUST_PART_DESC: TStringField;
    ADSA85rate_margin: TBCDField;
    ADS85rate_margin: TBCDField;
    ADSA85SALES_ORDERS_ENTERED: TIntegerField;
    ADS85mian_ji: TFloatField;
    ADS85SALES_ORDERS_ENTERED: TIntegerField;
    ads432Mould_set: TFloatField;
    ADO8501: TADOQuery;
    ADO8501rkey: TAutoIncField;
    ADO8501D0085_Ptr: TIntegerField;
    ADO8501Cost_Name: TStringField;
    ADO8501Cost: TFloatField;
    ADO8501Flag_tax: TStringField;
    ADOTmp2: TADOQuery;
    ADO8501Total_Cost: TFloatField;
    Ado578: TADOQuery;
    Ado578Rkey: TAutoIncField;
    Ado578d579_Ptr: TIntegerField;
    Ado578d60_Ptr: TIntegerField;
    Ado578Price: TFloatField;
    Ado578Remark: TStringField;
    adoS578: TADOQuery;
    Ado578d85_Ptr: TIntegerField;
    ADSA85ovhd_N_cost: TBCDField;
    ADSA85total_N_cost: TBCDField;
    ADSA85CRPEST_N_cost: TBCDField;
    ADSA85SHIPPING_N_CHARGE: TBCDField;
    ADSA85CUST_ADD2: TStringField;
    ADSA85PROMISE_SAMP_DATE: TDateTimeField;
    ADSA85PROMISE_DATE: TDateTimeField;
    ADSA85CUST_PART_NO: TStringField;
    ADSA85UPANEL: TIntegerField;
    ADSA85appd_by: TIntegerField;
    ADSA85QuoteType: TIntegerField;
    ADSA85SpecialCrafts: TStringField;
    ADSA85ORIG_CUSTOMER: TStringField;
    ADSA85ProdUsageName: TStringField;
    ADSA85ptr_242: TIntegerField;
    ads431QUOTE_FLAG: TStringField;
    ads278QUOTE_FLAG: TStringField;
    procedure ads431UNIT_VALUEValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    qte_type:byte;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.ads431UNIT_VALUEValidate(Sender: TField);
begin
  if (Sender.AsString<>'') and(ads431data_type.AsInteger=1) and not (ads431min_value.IsNull or ads431max_value.IsNull)  then
  begin
    if (Sender.AsFloat<ads431min_value.AsFloat) or (Sender.AsFloat>ads431max_value.AsFloat) then
    begin
      showmessage('参数值不在的合理范围之内!');
      abort;
    end;
  end;
end;

end.
