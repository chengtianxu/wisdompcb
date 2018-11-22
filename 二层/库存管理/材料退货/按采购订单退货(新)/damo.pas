unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS22: TDataSource;
    ADS22: TADODataSet;
    aqtmp: TADOQuery;
    AQ22: TADOQuery;
    ADS22inv_part_number: TStringField;
    ADS22quantity: TFloatField;
    ADS22quan_on_hand: TBCDField;
    ADS22quan_to_be_shipped: TBCDField;
    ADS22QUAN_RETURNED: TBCDField;
    ADS22unit_code: TStringField;
    ADS22tdate: TDateTimeField;
    ADS22BARCODE_ID: TStringField;
    ADS22CODE: TStringField;
    ADS22SUPPLIER_NAME: TStringField;
    ADS22po_number: TStringField;
    ADS22rkey: TAutoIncField;
    ADS22inventory_ptr: TIntegerField;
    ADS22abbr_name: TStringField;
    ADS22location: TStringField;
    ADS22INV_part_description: TStringField;
    ADS22confirmation_number: TStringField;
    ADS22warehouse_code: TStringField;
    DSQ22: TDataSource;
    AQ22RKEY: TAutoIncField;
    AQ22INVENTORY_PTR: TIntegerField;
    AQ22GRN_PTR: TIntegerField;
    AQ22SOURCE_PTR: TIntegerField;
    AQ22LOCATION_PTR: TIntegerField;
    AQ22QUANTITY: TFloatField;
    AQ22PRICE: TBCDField;
    AQ22DISCOUNT: TFloatField;
    AQ22QUAN_IN_INSP: TBCDField;
    AQ22QUAN_TO_BE_SHIPPED: TBCDField;
    AQ22QUAN_TO_BE_STOCKED: TBCDField;
    AQ22QUAN_RETURNED: TBCDField;
    AQ22QUAN_SCRAPPED: TBCDField;
    AQ22TTYPE: TSmallintField;
    AQ22TDATE: TDateTimeField;
    AQ22STATUS: TStringField;
    AQ22LOCATION_PTR_FROM: TIntegerField;
    AQ22PACKING_SLIP_FLAG: TStringField;
    AQ22QUAN_STOCKED: TFloatField;
    AQ22QUAN_ISSUED_TO_FACT: TFloatField;
    AQ22QUAN_RTNED_FM_FACT: TFloatField;
    AQ22QUAN_ON_HAND: TBCDField;
    AQ22BARCODE_ID: TStringField;
    AQ22EXPIRE_DATE: TDateTimeField;
    AQ22SUPPLIER2: TStringField;
    AQ22TAX_2: TBCDField;
    AQ22rohs: TStringField;
    AQ22tax_price: TBCDField;
    DS96: TDataSource;
    AQ96: TADOQuery;
    AQ96employee_name: TStringField;
    AQ96tdate: TDateTimeField;
    AQ96reject_description: TStringField;
    AQ96quan_rejd: TFloatField;
    AQ96reference_number: TStringField;
    aqtmp1: TADOQuery;
    AQ96rkey: TAutoIncField;
    AQ96v_status: TStringField;
    AQ96ttype: TStringField;
    ADS22po_date: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
