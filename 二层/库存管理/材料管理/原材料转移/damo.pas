unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, ImgList, Controls;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQ: TADOQuery;
    ADOData22: TADODataSet;
    ADOe22: TADOQuery;
    ADO027: TADOQuery;
    ADOa22: TADOQuery;
    DataSource1: TDataSource;
    ADO456: TADOQuery;
    ADO016: TADOQuery;
    ADO015: TADOQuery;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    ADO456RKEY: TAutoIncField;
    ADO456GRN_NUMBER: TStringField;
    ADO456DELIVER_NUMBER: TStringField;
    ADO456warehouse_ptr: TIntegerField;
    ADO456SUPP_PTR: TIntegerField;
    ADO456PO_PTR: TIntegerField;
    ADO456TTYPE: TSmallintField;
    ADO456STATUS: TSmallintField;
    ADO456currency_ptr: TIntegerField;
    ADO456exch_rate: TBCDField;
    ADO456CREATE_DATE: TDateTimeField;
    ADO456CREATE_BY: TIntegerField;
    ADO456ship_DATE: TDateTimeField;
    ADO456ship_BY: TStringField;
    ADO456AUDITED_BY: TIntegerField;
    ADO456AUDITED_DATE: TDateTimeField;
    ADO456REF_NUMBER: TStringField;
    ADO456PRINTED: TStringField;
    ADO456dealiv_ptr: TIntegerField;
    ImageList1: TImageList;
    ADOData22LOCATION: TStringField;
    ADOData22QUAN_ON_HAND: TBCDField;
    ADOData22RKEY: TAutoIncField;
    ADOData22GRN_PTR: TIntegerField;
    ADOData22EXPIRE_DATE: TDateTimeField;
    ADOData22rohs: TStringField;
    ADOData22INV_PART_NUMBER: TStringField;
    ADOData22INV_NAME: TStringField;
    ADOData22UNIT_NAME: TStringField;
    ADOData22SUPPLIER_NAME: TStringField;
    ADOData22CURR_NAME: TStringField;
    ADOData22key23: TAutoIncField;
    ADOData22key01: TAutoIncField;
    ADOData22PRICE: TBCDField;
    ADOData22EXCHANGE_RATE: TFloatField;
    ADOData22INV_DESCRIPTION: TStringField;
    ADOData22code: TStringField;
    ADOData22supplier2: TStringField;
    ADO027RKEY: TAutoIncField;
    ADO027D0022_TOPTR: TIntegerField;
    ADO027D0022_FROMPTR: TIntegerField;
    ADO027QUANTITY: TFloatField;
    ADO027TDATE: TDateTimeField;
    ADO027EMPL_PTR: TIntegerField;
    ADO027REF_NUMBER: TStringField;
    ADOa22RKEY: TAutoIncField;
    ADOa22INVENTORY_PTR: TIntegerField;
    ADOa22GRN_PTR: TIntegerField;
    ADOa22SOURCE_PTR: TIntegerField;
    ADOa22SUPPLIER_PTR: TIntegerField;
    ADOa22LOCATION_PTR: TIntegerField;
    ADOa22QUANTITY: TFloatField;
    ADOa22PRICE: TBCDField;
    ADOa22DISCOUNT: TFloatField;
    ADOa22QUAN_IN_INSP: TBCDField;
    ADOa22QUAN_TO_BE_SHIPPED: TBCDField;
    ADOa22QUAN_TO_BE_STOCKED: TBCDField;
    ADOa22QUAN_RETURNED: TBCDField;
    ADOa22QUAN_SCRAPPED: TBCDField;
    ADOa22TTYPE: TSmallintField;
    ADOa22TDATE: TDateTimeField;
    ADOa22STATUS: TStringField;
    ADOa22LOCATION_PTR_FROM: TIntegerField;
    ADOa22PACKING_SLIP_FLAG: TStringField;
    ADOa22QUAN_STOCKED: TFloatField;
    ADOa22QUAN_ISSUED_TO_FACT: TFloatField;
    ADOa22QUAN_RTNED_FM_FACT: TFloatField;
    ADOa22QUAN_ON_HAND: TBCDField;
    ADOa22BARCODE_ID: TStringField;
    ADOa22EXPIRE_DATE: TDateTimeField;
    ADOa22SUPPLIER2: TStringField;
    ADOa22TAX_2: TBCDField;
    ADOa22rohs: TStringField;
    ADOa22tax_price: TBCDField;
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
