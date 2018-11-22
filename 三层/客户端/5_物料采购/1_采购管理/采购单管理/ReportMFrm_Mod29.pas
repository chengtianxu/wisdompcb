unit ReportMFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Datasnap.DBClient,
  Data.DB, Datasnap.Provider, Data.Win.ADODB, frxDesgn,uBaseFrm;

type
  TfrmReportM_Mod29 = class(TfrmBase)
    cds493: TClientDataSet;
    cds70: TClientDataSet;
    cds72: TClientDataSet;
    frxdbdtst493: TfrxDBDataset;
    frxdbdtst70: TfrxDBDataset;
    frxdbdtst72: TfrxDBDataset;
    repM: TfrxReport;
    cds493Company_Name: TStringField;
    cds493Company_Name2: TStringField;
    cds493Company_Name3: TStringField;
    cds493ship_address: TStringField;
    cds493Company_Icon: TBlobField;
    cds493SITE_INFO_ADD_1: TStringField;
    cds493SITE_INFO_ADD_2: TStringField;
    cds493SITE_INFO_ADD_3: TStringField;
    cds493SITE_INFO_PHONE: TStringField;
    cds72UNIT_CODE: TStringField;
    cds72UNIT_NAME: TStringField;
    cds72RKEY: TAutoIncField;
    cds72POPTR: TIntegerField;
    cds72DESCRIPTION: TStringField;
    cds72GUI_GE: TStringField;
    cds72QUAN_ORD: TFloatField;
    cds72QUAN_INVD: TFloatField;
    cds72UNIT_PRICE: TFloatField;
    cds72STATE_TAX: TBCDField;
    cds72GL_PTR: TIntegerField;
    cds72QUANTITY_RECEIVED: TFloatField;
    cds72DESCRIPTION2: TStringField;
    cds72DEL_DATE: TDateTimeField;
    cds72UNIT_PTR: TIntegerField;
    cds72PRINTED_DATE: TDateTimeField;
    cds72reason: TStringField;
    cds72QUAN_RETN: TFloatField;
    cds72recd_date: TDateTimeField;
    cds72tax_price: TFloatField;
    cds72rohs: TStringField;
    cds72rkey204: TIntegerField;
    cds72IF_urgency: TBooleanField;
    cds72D70_IDKey: TStringField;
    cds72IDKey: TStringField;
    cds72Total: TFloatField;
    cds72TaxPayed: TFloatField;
    cds70WAREHOUSE_NAME: TStringField;
    cds70ENG_NAME: TStringField;
    cds70FAX: TStringField;
    cds70PHONE: TStringField;
    cds70ADDRESS_LINE_1: TStringField;
    cds70EMPLOYEE_NAME: TStringField;
    cds70CURR_CODE: TStringField;
    cds70CURR_NAME: TStringField;
    cds70SUPPLIER_NAME: TStringField;
    cds70SuppPhone: TStringField;
    cds70SuppFax: TStringField;
    cds70RKEY: TAutoIncField;
    cds70PO_NUMBER: TStringField;
    cds70CSI_USER_POINTER: TIntegerField;
    cds70EMPLOYEE_POINTER: TIntegerField;
    cds70SUPPLIER_POINTER: TIntegerField;
    cds70SUPP_FAC_ADD_PTR: TIntegerField;
    cds70WAREHOUSE_POINTER: TIntegerField;
    cds70EDIT_BY_EMPL_PTR: TIntegerField;
    cds70STATUS: TSmallintField;
    cds70EXCHANGE_RATE: TFloatField;
    cds70SHIPPING_COST: TFloatField;
    cds70FEDERAL_TAX: TBCDField;
    cds70STATE_TAX: TIntegerField;
    cds70SUB_TOTAL: TFloatField;
    cds70CONFIRMATION_NUMBER: TStringField;
    cds70SHIPPING_METHOD: TStringField;
    cds70PO_DATE: TDateTimeField;
    cds70SUPPIER_CONTACT: TStringField;
    cds70CONTACT_PHONE: TStringField;
    cds70DISCOUNT_AMOUNT: TFloatField;
    cds70DATE_EDITED: TDateTimeField;
    cds70PO_TYPE: TStringField;
    cds70FOB: TStringField;
    cds70MISC_CHARGE: TFloatField;
    cds70PRINT_DATE: TDateTimeField;
    cds70PRINT_TIME: TDateTimeField;
    cds70MULTIPLE_FACTOR: TBCDField;
    cds70CITY_AMOUNT: TBCDField;
    cds70COUNTY_AMOUNT: TBCDField;
    cds70COLLECT_PREPAID: TStringField;
    cds70STATE_SHIP_TAX_FLAG: TStringField;
    cds70STATE_MISC_TAX_FLAG: TStringField;
    cds70STATE_INVT_TAX_FLAG: TStringField;
    cds70CURRENCY_PTR: TIntegerField;
    cds70SECOND_WHSE_PTR: TIntegerField;
    cds70PO_REV_NO: TStringField;
    cds70PAYMENT_TERMS: TSmallintField;
    cds70CASH_DISCOUNT: TBCDField;
    cds70DISCOUNT_DAYS: TSmallintField;
    cds70CASH_DISCOUNT2: TBCDField;
    cds70DISCOUNT2_DAYS: TSmallintField;
    cds70PURCHASE_ORDER_TYPE: TSmallintField;
    cds70EXPIRED_DATE: TDateTimeField;
    cds70ANALYSIS_CODE_1: TStringField;
    cds70ANALYSIS_CODE_2: TStringField;
    cds70ANALYSIS_CODE_3: TStringField;
    cds70ANALYSIS_CODE_4: TStringField;
    cds70ANALYSIS_CODE_5: TStringField;
    cds70SHIPTO_ADDRESS: TStringField;
    cds70PURCHASE_TYPE: TWideStringField;
    cds70Remark70: TMemoField;
    cds70Remark1070: TMemoField;
    cds70Remark2070: TMemoField;
    cds70IDKey: TStringField;
    cds70FACTORY_LOCATION: TStringField;
    cds70factory_address_1: TStringField;
    frxDesignerM: TfrxDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string);
  end;

var
  frmReportM_Mod29: TfrmReportM_Mod29;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmReportM_Mod29 }

procedure TfrmReportM_Mod29.GetData(ARkey: string);
var
  LSql493,LSql70,LSql72:string;
begin
  LSql493:= cds493.CommandText;
  LSql70:= cds70.CommandText + ' WHERE DATA0070.RKEY IN ( ' + ARkey + ' ) ';
  LSql72:= cds72.CommandText + ' WHERE DATA0072.POPTR IN ( ' + ARkey + ' ) ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql70,LSql72]),[cds493,cds70,cds72]) then exit;
end;

end.
