unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ0070: TADOQuery;
    DataSource1: TDataSource;
    AQ0070rkey: TAutoIncField;
    AQ0070po_number: TStringField;
    AQ0070PO_REV_NO: TStringField;
    AQ0070po_date: TDateTimeField;
    AQ0070status: TSmallintField;
    AQ0070PO_TYPE: TStringField;
    AQ0070PURCHASE_ORDER_TYPE: TWordField;
    AQ0070employee_name: TStringField;
    AQ0070supplier_name: TStringField;
    AQ0070v_status: TStringField;
    AQ0070v_type: TStringField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADO200: TADOQuery;
    ADO71: TADOQuery;
    ADO71RKEY: TAutoIncField;
    ADO71PO_PTR: TIntegerField;
    ADO71INVT_PTR: TIntegerField;
    ADO71DISCOUNT: TFloatField;
    ADO71REQ_DATE: TDateTimeField;
    ADO71QUAN_REJD: TFloatField;
    ADO71WO_PTR: TIntegerField;
    ADO71PURCHASE_UNIT_PTR: TIntegerField;
    ADO71PRINTED_DATE: TDateTimeField;
    DataSource3: TDataSource;
    ADO71inv_part_number: TStringField;
    ADO71tax_total: TFloatField;
    AQ0015: TADOQuery;
    ADO200RKEY: TAutoIncField;
    ADO200POPTR: TIntegerField;
    ADO200MISC_CHARGE_PTR: TIntegerField;
    ADO200AMOUNT: TFloatField;
    ADO200TAXABLE: TStringField;
    ADO72: TADOQuery;
    DataSource4: TDataSource;
    ADO72RKEY: TAutoIncField;
    ADO72POPTR: TIntegerField;
    ADO72DESCRIPTION: TStringField;
    ADO72QUAN_ORD: TFloatField;
    ADO72QUAN_INVD: TFloatField;
    ADO72UNIT_PRICE: TFloatField;
    ADO72STATE_TAX: TFloatField;
    ADO72GL_PTR: TIntegerField;
    ADO72QUANTITY_RECEIVED: TFloatField;
    ADO72DESCRIPTION2: TStringField;
    ADO72DEL_DATE: TDateTimeField;
    ADO72UNIT_PTR: TIntegerField;
    ADO72PRINTED_DATE: TDateTimeField;
    ADO72sim_total: TFloatField;
    ADO72tax_total: TFloatField;
    ADO7011: TADOQuery;
    ADO107011: TADOQuery;
    ADO0450: TADOQuery;
    ADO0339: TADOQuery;
    AQ0070shipping_cost: TFloatField;
    AQ0070MISC_CHARGE: TFloatField;
    AQ0070SUPP_FAC_ADD_PTR: TIntegerField;
    AQ0070PAYMENT_TERMS: TSmallintField;
    AQ0493: TADOQuery;
    AQ0493Company_Name: TStringField;
    AQ0493ship_address: TStringField;
    AQ0493Company_Icon: TBlobField;
    AQ0493SITE_INFO_ADD_1: TStringField;
    AQ0493SITE_INFO_ADD_2: TStringField;
    AQ0493SITE_INFO_ADD_3: TStringField;
    AQ0493SITE_INFO_PHONE: TStringField;
    AQ0070sub_total: TFloatField;
    ASP362: TADOStoredProc;
    ASP362PO_REQ_NUMBER: TStringField;
    ASP362STATUS: TWordField;
    ASP362EXCHANGE_RATE: TFloatField;
    ASP362TOTAL: TFloatField;
    ASP362v_month: TSmallintField;
    ASP362USED_PERIOD_1: TFloatField;
    ASP362USED_PERIOD_2: TFloatField;
    ASP362USED_PERIOD_3: TFloatField;
    ASP362USED_PERIOD_4: TFloatField;
    ASP362USED_PERIOD_5: TFloatField;
    ASP362USED_PERIOD_6: TFloatField;
    ASP362USED_PERIOD_7: TFloatField;
    ASP362USED_PERIOD_8: TFloatField;
    ASP362USED_PERIOD_9: TFloatField;
    ASP362USED_PERIOD_10: TFloatField;
    ASP362USED_PERIOD_11: TFloatField;
    ASP362USED_PERIOD_12: TFloatField;
    AQ0070EXCHANGE_RATE: TFloatField;
    AQ0070fob: TStringField;
    ASP362flag: TStringField;
    ASP362WHSE_PTR: TIntegerField;
    ASP362CURRENY_PTR: TIntegerField;
    ASP78: TADOStoredProc;
    ASP78rkey: TAutoIncField;
    ASP78po_ptr: TIntegerField;
    ASP78user_ptr: TIntegerField;
    ASP78auth_date: TDateTimeField;
    ASP78ranking: TWordField;
    ADO71unit_name: TStringField;
    ADO72unit_name: TStringField;
    AQ0070warehouse_name: TStringField;
    ADO72GUI_GE: TStringField;
    AQ0015RKEY: TIntegerField;
    AQ0015WAREHOUSE_CODE: TStringField;
    AQ0015WAREHOUSE_NAME: TStringField;
    AQ0015ENG_NAME: TStringField;
    AQ0015ABBR_NAME: TStringField;
    AQ0015ADDRESS_LINE_1: TStringField;
    AQ0015ADDRESS_LINE_2: TStringField;
    AQ0015ADDRESS_LINE_3: TStringField;
    AQ0015STATE: TStringField;
    AQ0015ZIP: TStringField;
    AQ0015PHONE: TStringField;
    AQ0015FAX: TStringField;
    AQ0015TELEX: TStringField;
    AQ0015WEB: TStringField;
    AQ0015EMPLOYEE_PTR_1: TIntegerField;
    AQ0015EMPLOYEE_PTR_2: TIntegerField;
    AQ0015EMPLOYEE_PTR_3: TIntegerField;
    AQ0015o_warehouse_name: TStringField;
    AQ0015o_eng_name: TStringField;
    AQ0015o_address_1: TStringField;
    AQ0015o_address_2: TStringField;
    AQ0015o_address_3: TStringField;
    AQ0015o_state: TStringField;
    AQ0015o_zip: TStringField;
    AQ0015o_phone: TStringField;
    AQ0015o_fax: TStringField;
    AQ0015o_telex: TStringField;
    AQ0015o_web: TStringField;
    AQ0015purchase_order: TStringField;
    AQ0015o_purchase_order: TStringField;
    AQ0015picture: TBlobField;
    AQ0015o_picture: TBlobField;
    AQ0070discount2_days: TSmallintField;
    ADOQuery3: TADOQuery;
    AQ0070ware_name: TStringField;
    AQ0070supp_abbrname: TStringField;
    AQ0070in_out: TStringField;
    adoap68: TADOQuery;
    AP69204: TADOQuery;
    adoap68RKEY: TAutoIncField;
    adoap68PO_REQ_NUMBER: TStringField;
    adoap68USER_PTR: TIntegerField;
    adoap68REQ_BY: TIntegerField;
    adoap68BUYER_PTR: TIntegerField;
    adoap68APPD_BY: TIntegerField;
    adoap68DATA275_PTR: TIntegerField;
    adoap68AUTH_TYPE: TIntegerField;
    adoap68WHSE_PTR: TIntegerField;
    adoap68budget_ptr: TIntegerField;
    adoap68NPAD_PTR: TIntegerField;
    adoap68ENT_DATE: TDateTimeField;
    adoap68REQ_DATE: TDateTimeField;
    adoap68AUTH_DATE: TDateTimeField;
    adoap68STATUS: TWordField;
    adoap68DEPARTMENT_NAME: TStringField;
    adoap68FLAG: TStringField;
    adoap68EDITED_DATE: TDateTimeField;
    adoap68EDITED_BY_USER_PTR: TIntegerField;
    adoap68EDITED_BY_EMP_PTR: TIntegerField;
    adoap68TOTAL: TBCDField;
    adoap68CURRENY_PTR: TIntegerField;
    adoap68EXCHANGE_RATE: TFloatField;
    adoap68v_year: TSmallintField;
    adoap68v_month: TSmallintField;
    ADOQuery3tax_id_number: TStringField;
    ADOQuery3analysis_code1: TStringField;
    ADOQuery3analysis_code2: TStringField;
    ADOQuery4: TADOQuery;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3INV_PART_NUMBER: TStringField;
    ADOQuery3INV_PART_DESCRIPTION: TStringField;
    ADOQuery3QUAN_ORD: TFloatField;
    ADOQuery3QUAN_RECD: TFloatField;
    ADOQuery3rkey: TIntegerField;
    DataSource6: TDataSource;
    ADOQuery5: TADOQuery;
    ADOQuery4PO_NUMBER: TStringField;
    ADOQuery4DESCRIPTION: TStringField;
    ADOQuery4GUI_GE: TStringField;
    ADOQuery4QUAN_ORD: TFloatField;
    ADOQuery4QUANTITY_RECEIVED: TFloatField;
    ADOQuery4rkey: TIntegerField;
    ADOQuery6: TADOQuery;
    ADOQuery5GRN_NUMBER: TStringField;
    ADOQuery5QUANTITY: TFloatField;
    ADOQuery5WAREHOUSE_CODE: TStringField;
    ADOQuery5LOCATION: TStringField;
    ADOQuery5BARCODE_ID: TStringField;
    ADOQuery5EMPLOYEE_NAME: TStringField;
    DataSource7: TDataSource;
    ADOQuery7: TADOQuery;
    ADOQuery6GRN_NUMBER: TStringField;
    ADOQuery6DATE_RECD: TDateTimeField;
    ADOQuery6QUAN_RECD: TFloatField;
    ADOQuery6REF_NUMBER: TStringField;
    ADOQuery6EMPLOYEE_NAME: TStringField;
    ADO71inv_number: TStringField;
    ADO71reason: TStringField;
    ADO72reason: TStringField;
    ADO71extra_req: TStringField;
    ADO71invpart_desc: TStringField;
    ADO78: TADOStoredProc;
    DataSource5: TDataSource;
    ADO78user_id: TStringField;
    ADO78user_full_name: TStringField;
    ADO78auth_date: TDateTimeField;
    ADO78ranking: TWordField;
    ADO78user_ptr: TIntegerField;
    ADO78auth_flag: TStringField;
    AQ0070SECOND_WHSE_PTR: TIntegerField;
    AQ0070PRINT_TIME: TDateTimeField;
    AQ0070STATE_TAX: TIntegerField;
    AQ0070DATE_EDITED: TDateTimeField;
    ADO28: TADOQuery;
    ADO28PRICE_1: TFloatField;
    AQ0070fax: TStringField;
    AQ0070phone: TStringField;
    buyemp05: TADOQuery;
    AQ0070print_date: TDateTimeField;
    AQ0070if_print: TStringField;
    AQ0001: TADOStoredProc;
    aq0017: TADOStoredProc;
    AQ0024: TADOStoredProc;
    aq0002: TADOStoredProc;
    ADO0069: TADOStoredProc;
    ADO0069RKEY: TIntegerField;
    ADO0069PURCH_REQ_PTR: TIntegerField;
    ADO0069INVT_PTR: TIntegerField;
    ADO0069SUPP_PTR: TIntegerField;
    ADO0069PO_LINK_PTR: TIntegerField;
    ADO0069REQ_DATE: TDateTimeField;
    ADO0069QUANTITY: TFloatField;
    ADO0069UNIT_PRICE: TFloatField;
    ADO0069UNIT_PTR: TIntegerField;
    ADO0069CONVERSION_FACTOR: TFloatField;
    ADO0069o_i_flag: TWordField;
    ADO0069reply_date: TDateTimeField;
    ADO0069reason: TStringField;
    ADO0069extra_req: TStringField;
    ADO0069code: TStringField;
    ADO0069inv_name: TStringField;
    ADO0069inv_description: TStringField;
    ADO0069abbr_name: TStringField;
    ADO0069unit_name: TStringField;
    ADO0069curr_name: TStringField;
    ADO0204: TADOStoredProc;
    ADO0204RKEY: TIntegerField;
    ADO0204PURCHASE_REQ_PTR: TIntegerField;
    ADO0204DESCRIPTION_1: TStringField;
    ADO0204GUI_GE: TStringField;
    ADO0204DESCRIPTION_2: TStringField;
    ADO0204SUPPLIER_PTR: TIntegerField;
    ADO0204PO_LINK_PTR: TIntegerField;
    ADO0204G_L_PTR: TIntegerField;
    ADO0204QUANTITY_REQUIRED: TFloatField;
    ADO0204UNIT_PRICE: TFloatField;
    ADO0204TAX_FLAG: TStringField;
    ADO0204REQ_DATE: TDateTimeField;
    ADO0204o_i_flag: TWordField;
    ADO0204reply_date: TDateTimeField;
    ADO0204reason: TStringField;
    ADO0204code: TStringField;
    ADO0204abbr_name: TStringField;
    ADO0204curr_name: TStringField;
    ADO0204unit_name: TStringField;
    ADO04: TADOStoredProc;
    ADO04CONTROL_NO_LENGTH: TSmallintField;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    AQ0199: TADOStoredProc;
    AQ71: TADOStoredProc;
    AQ71rkey: TIntegerField;
    AQ71PO_PTR: TIntegerField;
    AQ71REQ_DATE: TDateTimeField;
    AQ72: TADOStoredProc;
    AQ72rkey: TIntegerField;
    AQ72poptr: TIntegerField;
    AQ72QUAN_ORD: TFloatField;
    AQ72UNIT_PRICE: TFloatField;
    AQ72DEL_DATE: TDateTimeField;
    ADO70: TADOStoredProc;
    ADO70RKEY: TAutoIncField;
    ADO70PO_NUMBER: TStringField;
    ADO70CSI_USER_POINTER: TIntegerField;
    ADO70EMPLOYEE_POINTER: TIntegerField;
    ADO70SUPPLIER_POINTER: TIntegerField;
    ADO70SUPP_FAC_ADD_PTR: TIntegerField;
    ADO70WAREHOUSE_POINTER: TIntegerField;
    ADO70EDIT_BY_EMPL_PTR: TIntegerField;
    ADO70STATUS: TWordField;
    ADO70EXCHANGE_RATE: TFloatField;
    ADO70SHIPPING_COST: TFloatField;
    ADO70FEDERAL_TAX: TBCDField;
    ADO70STATE_TAX: TIntegerField;
    ADO70SUB_TOTAL: TFloatField;
    ADO70CONFIRMATION_NUMBER: TStringField;
    ADO70SHIPPING_METHOD: TStringField;
    ADO70PO_DATE: TDateTimeField;
    ADO70SUPPIER_CONTACT: TStringField;
    ADO70CONTACT_PHONE: TStringField;
    ADO70DISCOUNT_AMOUNT: TFloatField;
    ADO70DATE_EDITED: TDateTimeField;
    ADO70PO_TYPE: TStringField;
    ADO70FOB: TStringField;
    ADO70MISC_CHARGE: TFloatField;
    ADO70PRINT_DATE: TDateTimeField;
    ADO70PRINT_TIME: TDateTimeField;
    ADO70MULTIPLE_FACTOR: TBCDField;
    ADO70CITY_AMOUNT: TBCDField;
    ADO70COUNTY_AMOUNT: TBCDField;
    ADO70COLLECT_PREPAID: TStringField;
    ADO70STATE_SHIP_TAX_FLAG: TStringField;
    ADO70STATE_MISC_TAX_FLAG: TStringField;
    ADO70STATE_INVT_TAX_FLAG: TStringField;
    ADO70CURRENCY_PTR: TIntegerField;
    ADO70SECOND_WHSE_PTR: TIntegerField;
    ADO70PO_REV_NO: TStringField;
    ADO70PAYMENT_TERMS: TSmallintField;
    ADO70CASH_DISCOUNT: TBCDField;
    ADO70DISCOUNT_DAYS: TSmallintField;
    ADO70CASH_DISCOUNT2: TBCDField;
    ADO70DISCOUNT2_DAYS: TSmallintField;
    ADO70PURCHASE_ORDER_TYPE: TWordField;
    ADO70EXPIRED_DATE: TDateTimeField;
    ADO70ANALYSIS_CODE_1: TStringField;
    ADO70ANALYSIS_CODE_2: TStringField;
    ADO70ANALYSIS_CODE_3: TStringField;
    ADO70ANALYSIS_CODE_4: TStringField;
    ADO70ANALYSIS_CODE_5: TStringField;
    ADO70SHIPTO_ADDRESS: TStringField;
    ADO70PURCHASE_TYPE: TStringField;
    ADO70curr_code: TStringField;
    ADO70curr_name: TStringField;
    ADO70factory_location: TStringField;
    ADO70shipping_lead_time: TIntegerField;
    ADO72tax_price: TFloatField;
    ADO72recd_date: TDateTimeField;
    ADO72QUAN_RETN: TFloatField;
    ADO71recd_DATE: TDateTimeField;
    ADO0069tax: TBCDField;
    ADO0069tax_price: TFloatField;
    ADO0204tax: TBCDField;
    ADO0204tax_price: TFloatField;
    ADO71sim_total: TCurrencyField;
    ADO71PRICE: TBCDField;
    ADO71TAX_2: TBCDField;
    ADO71QUAN_ORD: TBCDField;
    ADO71QUAN_IN_INSP: TBCDField;
    ADO71QUAN_RECD: TBCDField;
    ADO71QUAN_RETN: TBCDField;
    ADO71tax_price: TBCDField;
    ADO71CONVERSION_FACTOR: TBCDField;
    ADO0069req_quantity: TBCDField;
    ADO0069req_unit_ptr: TIntegerField;
    ADO0069BASE_TO_OTHER: TFloatField;
    ADO0204BASE_TO_OTHER: TFloatField;
    ASP78auth_flag: TStringField;
    ASP78remark: TStringField;
    ADO71INV_PART_DESCRIPTION: TStringField;
    ADO71invdesc_extra: TStringField;
    ADOQuery6ship_DATE: TDateTimeField;
    ADOQuery6DELIVER_NUMBER: TStringField;
    ADO71QUAN_INVD: TBCDField;
    AQ71QUAN_ORD: TBCDField;
    AQ71PRICE: TBCDField;
    procedure AQ0070CalcFields(DataSet: TDataSet);
    procedure ADO71CalcFields(DataSet: TDataSet);
    procedure ADO72CalcFields(DataSet: TDataSet);
    procedure ADO78CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ0070CalcFields(DataSet: TDataSet);
begin
 case dm.AQ0070status.Value of
   1: dm.AQ0070v_status.Value := '待审核';
   2: dm.AQ0070v_status.Value := '被退回';
   3: dm.AQ0070v_status.Value := '已保留';
   4: dm.AQ0070v_status.Value := '已暂缓';
   5: dm.AQ0070v_status.Value := '已审核';
   6: dm.AQ0070v_status.Value := '已收货';
   7: dm.AQ0070v_status.Value := '已完成';
   8: dm.AQ0070v_status.Value := '未提交';
 end;

 if dm.AQ0070PO_TYPE.Value = 'S' then
  dm.AQ0070v_type.Value := '生产物料'
 else
  dm.AQ0070v_type.Value := '非生产物料';

 if dm.AQ0070discount2_days.Value=0 then
  dm.AQ0070in_out.Value := '国内'
 else
  dm.AQ0070in_out.Value := '国外';
  
if dm.AQ0070print_date.AsVariant=null then
 dm.AQ0070if_print.Value:='未打印'
else
 dm.AQ0070if_print.Value:='已打印';
end;

procedure TDM.ADO71CalcFields(DataSet: TDataSet);
begin
 dm.ADO71sim_total.Value := dm.ADO71QUAN_ORD.Value*dm.ADO71price.Value;   //合计含税金额

 dm.ADO71tax_total.Value :=
 dm.ADO71sim_total.Value*dm.ADO71TAX_2.Value*0.01/(1+dm.ADO71TAX_2.Value*0.01); //税金
 dm.ADO71invdesc_extra.Value:=trim(dm.ADO71invpart_desc.Value)+
                              trim(dm.ADO71extra_req.Value);//规格说明 
end;

procedure TDM.ADO72CalcFields(DataSet: TDataSet);
begin
dm.ADO72sim_total.Value :=                                     //合计金额
strtofloat(formatfloat('0.00',dm.ADO72QUAN_ORD.Value*dm.ADO72UNIT_PRICE.Value));

dm.ADO72tax_total.Value :=
dm.ADO72sim_total.Value*dm.ADO72STATE_TAX.Value*0.01/(1+dm.ADO72STATE_TAX.Value*0.01); //税金
end;

procedure TDM.ADO78CalcFields(DataSet: TDataSet);
begin
 if dm.ADO78auth_date.AsVariant<>null then
  dm.ADO78auth_flag.Value:='已审批'
 else
  dm.ADO78auth_flag.Value:='未审批';
end;

end.
