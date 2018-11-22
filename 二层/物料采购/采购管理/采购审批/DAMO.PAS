unit damo;

interface

uses
  SysUtils,Classes,Variants,DB,ADODB, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO70: TADOQuery;
    DataSource1: TDataSource;
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
    ADO70FEDERAL_TAX: TFloatField;
    ADO70SUB_TOTAL: TFloatField;
    ADO70CONFIRMATION_NUMBER: TStringField;
    ADO70SHIPPING_METHOD: TStringField;
    ADO70PO_DATE: TDateTimeField;
    ADO70SUPPIER_CONTACT: TStringField;
    ADO70CONTACT_PHONE: TStringField;
    ADO70DISCOUNT_AMOUNT: TFloatField;
    ADO70DATE_EDITED: TDateTimeField;
    ADO70PO_TYPE: TStringField;
    a: TStringField;
    ADO70MISC_CHARGE: TFloatField;
    ADO70PRINT_DATE: TDateTimeField;
    ADO70PRINT_TIME: TDateTimeField;
    ADO70MULTIPLE_FACTOR: TFloatField;
    ADO70CITY_AMOUNT: TFloatField;
    ADO70COUNTY_AMOUNT: TFloatField;
    ADO70COLLECT_PREPAID: TStringField;
    ADO70STATE_SHIP_TAX_FLAG: TStringField;
    ADO70STATE_MISC_TAX_FLAG: TStringField;
    ADO70STATE_INVT_TAX_FLAG: TStringField;
    ADO70CURRENCY_PTR: TIntegerField;
    ADO70SECOND_WHSE_PTR: TIntegerField;
    ADO70PO_REV_NO: TStringField;
    ADO70PAYMENT_TERMS: TSmallintField;
    ADO70CASH_DISCOUNT: TFloatField;
    ADO70DISCOUNT_DAYS: TSmallintField;
    ADO70CASH_DISCOUNT2: TFloatField;
    ADO70DISCOUNT2_DAYS: TSmallintField;
    ADO70PURCHASE_ORDER_TYPE: TWordField;
    ADO70EXPIRED_DATE: TDateTimeField;
    ADO70ANALYSIS_CODE_1: TStringField;
    ADO70ANALYSIS_CODE_2: TStringField;
    ADO70ANALYSIS_CODE_3: TStringField;
    ADO70ANALYSIS_CODE_4: TStringField;
    ADO70ANALYSIS_CODE_5: TStringField;
    ADO70code: TStringField;
    ADO70FACTORY_LOCATION: TStringField;
    ADO70warehouse_code: TStringField;
    ADO70warehouse_name: TStringField;
    ADO70curr_code: TStringField;
    ADO70curr_name: TStringField;
    ADO70empl_code: TStringField;
    ADO70employee_name: TStringField;
    ADO70v_status: TStringField;
    ADO70v_type: TStringField;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO71: TADOQuery;
    ADO71RKEY: TAutoIncField;
    ADO71PO_PTR: TIntegerField;
    ADO71INVT_PTR: TIntegerField;
    ADO71QUAN_ORD: TFloatField;
    ADO71QUAN_RECD: TFloatField;
    ADO71QUAN_IN_INSP: TFloatField;
    ADO71QUAN_RETN: TFloatField;
    ADO71QUAN_INVD: TFloatField;
    ADO71PRICE: TFloatField;
    ADO71TAX_2: TFloatField;
    ADO71DISCOUNT: TFloatField;
    ADO71REQ_DATE: TDateTimeField;
    ADO71QUAN_REJD: TFloatField;
    ADO71WO_PTR: TIntegerField;
    ADO71PURCHASE_UNIT_PTR: TIntegerField;
    ADO71CONVERSION_FACTOR: TFloatField;
    ADO71PRINTED_DATE: TDateTimeField;
    ADO71sim_total: TFloatField;
    ADO71tax_total: TFloatField;
    ADO72: TADOQuery;
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
    ADO200: TADOQuery;
    ADO200RKEY: TAutoIncField;
    ADO200POPTR: TIntegerField;
    ADO200MISC_CHARGE_PTR: TIntegerField;
    ADO200AMOUNT: TFloatField;
    ADO71inv_part_number: TStringField;
    ADO71inv_part_description: TStringField;
    ADO200TAXABLE: TStringField;
    adosp: TADOStoredProc;
    ADO70auth_date: TDateTimeField;
    ADO70ranking: TWordField;
    DataSource4: TDataSource;
    ASP78: TADOStoredProc;
    ASP78user_id: TStringField;
    ASP78user_full_name: TStringField;
    ASP78auth_date: TDateTimeField;
    ASP78ranking: TWordField;
    ASP78user_ptr: TIntegerField;
    ASP78auth_type: TStringField;
    ADO72GUI_GE: TStringField;
    ADO70in_out: TStringField;
    ADO70SHIPTO_ADDRESS: TStringField;
    ADO70PURCHASE_TYPE: TStringField;
    ADO70STATE_TAX: TIntegerField;
    ADO71reason: TStringField;
    ADO72reason: TStringField;
    ADO71partnumber: TStringField;
    ADO71zaitu: TADOQuery;
    ADO71zaituINVT_PTR: TIntegerField;
    ADO71zaituDSDesigner: TFloatField;
    ADO71quantity_zaitu: TFloatField;
    ADO70user_ptr: TIntegerField;
    ADO71tax_price: TFloatField;
    ADO72tax_price: TFloatField;
    ADO71unit_code: TStringField;
    ADO71unit_name: TStringField;
    ADO72unit_code: TStringField;
    ADO72unit_name: TStringField;
    ADO70auth_flag: TStringField;
    ASP78auth_flag: TStringField;
    ASP78remark: TStringField;
    ADO71rohs: TStringField;
    ADO72rohs: TStringField;
    ADO71quantity_stock: TFloatField;
    ADO71avl_flag: TStringField;
    ADO71CRITICAL_MATL: TStringField;
    ADO71IF_urgency: TBooleanField;
    ADO71extra_req: TStringField;
    ADO71IF_CAF: TWideStringField;
    ADO72IF_urgency: TBooleanField;
    ADO71PO_REQ_NUMBER: TStringField;
    ADO71DEPT_NAME: TStringField;
    ADO71EMPLOYEE_NAME: TStringField;
    ADO72PO_REQ_NUMBER: TStringField;
    ADO72EMPLOYEE_NAME: TStringField;
    ADO72DEPT_NAME: TStringField;
    ADO70DSDesigner: TStringField;
    ADO71so_total: TBCDField;
    fltfldADO72so_total: TFloatField;
    qryFile: TADOQuery;
    dsFile: TDataSource;
    qryFileFileName: TStringField;
    qryFileFtp_FileName: TStringField;
    qryFileFtp_ptr: TIntegerField;
    qryFileUploadTime: TDateTimeField;
    qryFileEMPLOYEE_NAME: TStringField;
    ADO71vmi_qty: TBCDField;
    procedure ADO70CalcFields(DataSet: TDataSet);
    procedure ADO71CalcFields(DataSet: TDataSet);
    procedure ADO72CalcFields(DataSet: TDataSet);
    procedure ASP78CalcFields(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
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

procedure TDM.ADO70CalcFields(DataSet: TDataSet);
begin
 if dm.ado70auth_date.AsVariant=null then
  dm.ado70v_status.Value := '待审批'
 else
  dm.ado70v_status.Value := '批准';

 if dm.Ado70PO_TYPE.Value = 'S' then
  dm.Ado70v_type.Value := '编码物料'
 else
  if dm.Ado70PO_TYPE.Value = 'M' then
   dm.Ado70v_type.Value := '杂项物料';

 if dm.ADO70DISCOUNT2_DAYS.Value=0 then
  dm.ADO70in_out.Value := '格式一'
 else
  dm.ADO70in_out.Value := '格式二';
  
end;

procedure TDM.ADO71CalcFields(DataSet: TDataSet);
begin
 dm.ADO71sim_total.Value := dm.ADO71QUAN_ORD.Value*dm.ADO71PRICE.Value;
 dm.ADO71tax_total.Value := dm.ADO71sim_total.Value*dm.ADO71TAX_2.Value*0.01;
end;

procedure TDM.ADO72CalcFields(DataSet: TDataSet);
begin
 dm.ADO72sim_total.Value := dm.ADO72QUAN_ORD.Value*dm.ADO72UNIT_PRICE.Value;
 dm.ADO72tax_total.Value := dm.ADO72sim_total.Value*dm.ADO72STATE_TAX.Value*0.01;
end;

procedure TDM.ASP78CalcFields(DataSet: TDataSet);
begin
 if dm.asp78auth_date.AsVariant<>null then
  dm.asp78auth_type.Value:='已审批'
 else
  dm.asp78auth_type.Value:='未审批';
end;

procedure TDM.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if dm.Ado70PO_TYPE.Value = 'M' then
  begin
   form1.DBGrid3.Visible:=true;
   form1.DBGrid2.Visible:=false;
  end
 else
  begin
   form1.DBGrid3.Visible:=false;
   form1.DBGrid2.Visible:=true;
  end;
end;

end.
