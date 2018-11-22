unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado439: TADOQuery;
    Ado439delivery_no: TStringField;
    Ado439shipping_method: TStringField;
    Ado439date_sailing: TDateTimeField;
    Ado439cartons_no: TIntegerField;
    Ado439Remark_bak: TStringField;
    Ado439Remark: TStringField;
    Ado439print_date: TDateTimeField;
    Ado439iStatus: TWordField;
    Ado439cust_code: TStringField;
    Ado439customer_name: TStringField;
    Ado439APPLY_IN_TRANSIT: TWordField;
    Ado439location: TStringField;
    Ado439SHIP_TO_CONTACT: TStringField;
    Ado439cod_flag: TStringField;
    Ado439employee_name: TStringField;
    Ado439SHIP_TO_FAX: TStringField;
    Ado439warehouse_code: TStringField;
    Ado439invoice: TStringField;
    Ado439print_date2: TStringField;
    Ado439iStatusTxt: TStringField;
    Ado439SALES_REP_PTR: TIntegerField;
    Ado439SALES_REP_Date: TDateTimeField;
    Ado439depotAccept_PTR: TIntegerField;
    Ado439depotAccept_Date: TDateTimeField;
    Ado439depotAccept_Remark: TStringField;
    Ado439depotSubmit_PTR: TIntegerField;
    Ado439depotSubmit_Date: TDateTimeField;
    Ado439Finance_PTR: TIntegerField;
    Ado439Finance_Date: TDateTimeField;
    Ado439Finance_Remark: TStringField;
    Ado64: TADOQuery;
    Ado439Rkey: TAutoIncField;
    Ado64SALES_ORDER: TStringField;
    Ado64COMMISION_ON_TOOLING: TStringField;
    Ado64SCH_DATE: TDateTimeField;
    Ado64ITEM_NBR: TStringField;
    Ado64COD_FLAG: TStringField;
    Ado64rkey60: TIntegerField;
    Ado64PARTS_ORDERED: TFloatField;
    Ado64PARTS_SHIPPED: TFloatField;
    Ado64PARTS_RETURNED: TFloatField;
    Ado64SHIPPING_METHOD: TStringField;
    Ado64CURRENCY_PTR: TIntegerField;
    Ado64PART_PRICE: TFloatField;
    Ado64STATUS: TWordField;
    Ado64fob: TStringField;
    Ado64REFERENCE_NUMBER: TStringField;
    Ado64CUST_SHIP_ADDR_PTR: TIntegerField;
    Ado64CUSTOMER_PTR: TIntegerField;
    Ado64PURCHASE_ORDER_PTR: TIntegerField;
    Ado64CUST_PART_PTR: TIntegerField;
    Ado64rkey15: TIntegerField;
    Ado64WAREHOUSE_CODE: TStringField;
    Ado64abbr_name: TStringField;
    Ado64MANU_PART_NUMBER: TStringField;
    Ado64MANU_PART_DESC: TStringField;
    Ado64CUST_CODE: TStringField;
    Ado64CUSTOMER_NAME: TStringField;
    Ado64DO_SMOOTHING: TWordField;
    Ado64INVOICE_NOTE_PAD_PTR: TIntegerField;
    Ado64CUSTOMER_TYPE: TIntegerField;
    Ado64SHIPMENT_NO: TSmallintField;
    Ado64QUAN_SHIPPED: TIntegerField;
    Ado64DATE_ASSIGN: TDateTimeField;
    Ado64ovsh_discount: TBCDField;
    Ado64DATE_SHIPPED: TDateTimeField;
    Ado64PACKING_SLIP_FLAG: TStringField;
    Ado64total_case: TFloatField;
    Ado64rkey64: TIntegerField;
    Ado64packing_list_ptr: TIntegerField;
    Ado64weigth: TBCDField;
    Ado64assigntype: TStringField;
    Ado64SHIP_TO_ADDRESS_1: TStringField;
    Ado64SHIP_TO_CONTACT: TStringField;
    Ado64ZIP: TStringField;
    Ado64SHIP_TO_PHONE: TStringField;
    Ado64LOCATION: TStringField;
    Ado64STATE: TStringField;
    Ado64OPEN_SOS: TSmallintField;
    Ado64PO_DATE: TDateTimeField;
    Ado64PO_NUMBER: TStringField;
    Ado64CURR_CODE: TStringField;
    Ado64CURR_NAME: TStringField;
    Ado64EMPLOYEE_NAME: TStringField;
    ADOQuery1: TADOQuery;
    Ado439Sel: TBooleanField;
    Ado439name1: TStringField;
    Ado439name2: TStringField;
    Ado439name3: TStringField;
    Ado439name4: TStringField;
    Ado439name5: TStringField;
    Ado439abbr_name: TStringField;
    Ado439ABBR_NAME2: TStringField;
    tmp: TADOQuery;
    Ado439ANALYSIS_CODE5: TStringField;
    Ado439DSDesigner: TStringField;
    Ado439DSDesigner2: TStringField;
    dtmfldAdo439DSDesigner3: TDateTimeField;
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
