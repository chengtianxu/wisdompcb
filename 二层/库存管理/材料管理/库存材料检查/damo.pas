unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADO022: TADODataSet;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADO022INV_PART_NUMBER: TStringField;
    ADO022INV_NAME: TStringField;
    ADO022INV_DESCRIPTION: TStringField;
    ADO022UNIT_NAME: TStringField;
    ADO022WAREHOUSE_CODE: TStringField;
    ADO022WAREHOUSE_NAME: TStringField;
    ADO022CODE: TStringField;
    ADO022SUPPLIER_NAME: TStringField;
    ADO022DSDesigner: TStringField;
    ADO022LOCATION: TStringField;
    ADO022PRICE: TBCDField;
    ADO022EXCHANGE_RATE: TFloatField;
    ADO022QUAN_IN_INSP: TBCDField;
    ADO022QUAN_TO_BE_SHIPPED: TBCDField;
    ADO022QUAN_SCRAPPED: TBCDField;
    ADO022TDATE: TDateTimeField;
    ADO022EXPIRE_DATE: TDateTimeField;
    ADO022rohs: TStringField;
    ADO022QUAN_ON_HAND: TBCDField;
    ADOData0095: TADODataSet;
    ADOData0096: TADODataSet;
    ADOData0017: TADODataSet;
    ADOData0095TRAN_TP: TSmallintField;
    ADOData0095INVT_PTR: TIntegerField;
    ADOData0095SRCE_PTR: TIntegerField;
    ADOData0095TRAN_BY: TIntegerField;
    ADOData0095TRAN_DATE: TDateTimeField;
    ADOData0095QUANTITY: TFloatField;
    ADOData0096INVT_PTR: TIntegerField;
    ADOData0096REJ_PTR: TIntegerField;
    ADOData0096INV_TRAN_PTR: TIntegerField;
    ADOData0096EMPL_PTR: TIntegerField;
    ADOData0096TDATE: TDateTimeField;
    ADOData0096QUAN_REJD: TFloatField;
    ADOData0096FLAG: TStringField;
    ADOData0017QUAN_ON_HAND: TFloatField;
    ADOData0017RKEY: TAutoIncField;
    ADO022INVENTORY_PTR: TIntegerField;
    ADO022RKEY: TIntegerField;
    ADOData0095rkey: TAutoIncField;
    ADOData0096rkey: TAutoIncField;
    ADO022LOCATION_PTR: TIntegerField;
    tmp: TADOQuery;
    ADO022tax_price: TBCDField;
    ADO022TAX_2: TBCDField;
    ADO022rkey15: TAutoIncField;
    ADO022reason: TStringField;
    ADO022BARCODE_ID: TStringField;
    ADO022GRN_NUMBER: TStringField;
    ADO022ship_DATE: TDateTimeField;
    ADO022QUANTITY: TFloatField;
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
