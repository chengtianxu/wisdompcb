unit ReportSFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, frxClass,
  frxDBSet, Datasnap.Provider, Data.Win.ADODB, frxDesgn,uBaseFrm;

type
  TfrmReportS_Mod29 = class(TfrmBase)
    repS: TfrxReport;
    cds70: TClientDataSet;
    cds71: TClientDataSet;
    frxdbdtst493: TfrxDBDataset;
    frxdbdtst70: TfrxDBDataset;
    frxdbdtst71: TfrxDBDataset;
    cds493: TClientDataSet;
    cds493Company_Name: TStringField;
    cds493Company_Name2: TStringField;
    cds493Company_Name3: TStringField;
    cds493ship_address: TStringField;
    cds493Company_Icon: TBlobField;
    cds493SITE_INFO_ADD_1: TStringField;
    cds493SITE_INFO_ADD_2: TStringField;
    cds493SITE_INFO_ADD_3: TStringField;
    cds493SITE_INFO_PHONE: TStringField;
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
    cds71RKEY: TAutoIncField;
    cds71PO_PTR: TIntegerField;
    cds71INVT_PTR: TIntegerField;
    cds71QUAN_ORD: TBCDField;
    cds71QUAN_RECD: TBCDField;
    cds71QUAN_IN_INSP: TBCDField;
    cds71QUAN_RETN: TFloatField;
    cds71QUAN_INVD: TFloatField;
    cds71PRICE: TFMTBCDField;
    cds71TAX_2: TBCDField;
    cds71DISCOUNT: TBCDField;
    cds71recd_DATE: TDateTimeField;
    cds71REQ_DATE: TDateTimeField;
    cds71QUAN_REJD: TFloatField;
    cds71WO_PTR: TIntegerField;
    cds71PURCHASE_UNIT_PTR: TIntegerField;
    cds71CONVERSION_FACTOR: TFloatField;
    cds71PRINTED_DATE: TDateTimeField;
    cds71reason: TStringField;
    cds71extra_req: TStringField;
    cds71avl_flag: TStringField;
    cds71tax_price: TBCDField;
    cds71rohs: TStringField;
    cds71IQCEMPL_PTR: TIntegerField;
    cds71IF_CAF: TWideStringField;
    cds71rkey69: TIntegerField;
    cds71IF_urgency: TBooleanField;
    cds71D70_IDKey: TStringField;
    cds71IDKey: TStringField;
    cds71TotalPrice: TFMTBCDField;
    cds71INV_PART_NUMBER: TStringField;
    cds71INV_PART_DESCRIPTION: TStringField;
    cds71UNIT_NAME: TStringField;
    frxDesignerS: TfrxDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string);
  end;

var
  frmReportS_Mod29: TfrmReportS_Mod29;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmReportS_Mod29 }

procedure TfrmReportS_Mod29.GetData(ARkey: string);
var
  LSql493,LSql70,LSql71:string;
begin
  LSql493:= cds493.CommandText;
  LSql70:= cds70.CommandText + ' WHERE DATA0070.RKEY IN ( ' + ARkey + ' ) ';
  LSql71:= cds71.CommandText + ' WHERE DATA0071.PO_PTR IN ( ' + ARkey + ' ) ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql70,LSql71]),[cds493,cds70,cds71]) then exit;
end;

end.
