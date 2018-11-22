unit UnitDataModal;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ds492_468: TDataSource;
    ads492_468: TADODataSet;
    ads492_468SO_NO: TStringField;
    ads492_468CUT_NO: TStringField;
    ads492_468TSTATUS: TWordField;
    ads492_468invent_or: TWordField;
    ads492_468STATUS: TSmallintField;
    ads492_468DEPT_NAME: TStringField;
    ads492_468PRODUCT_NAME: TStringField;
    ads492_468PRODUCT_DESC: TStringField;
    ads492_468QUAN_BOM: TFloatField;
    ads492_468QUAN_ISSUED: TFloatField;
    ads492_468UNIT_NAME: TStringField;
    ads492_468new_price: TBCDField;
    ads492_468RKEY468: TAutoIncField;
    ads492_468RKEY492: TAutoIncField;
    ds08: TDataSource;
    ads08: TADODataSet;
    ads08RKEY08: TAutoIncField;
    ads08PROD_CODE: TStringField;
    ads08PRODUCT_NAME: TStringField;
    ads08PRODUCT_DESC: TStringField;
    ads08RKEY16: TAutoIncField;
    ads08CODE: TStringField;
    ads08LOCATION: TStringField;
    ads08qty_on_hand_01: TBCDField;
    ads08qty_onhand_08: TBCDField;
    ads08UNIT_NAME: TStringField;
    ads492_468RKEY08: TAutoIncField;
    ads08RKEY01: TAutoIncField;
    aqry60: TADOQuery;
    aqry60sales_order: TStringField;
    aqry60sales_date: TDateTimeField;
    aqry60type: TWordField;
    aqry60status: TWordField;
    aqry60ship_method: TStringField;
    aqry60ent_date: TDateTimeField;
    aqry60ent_user_ptr: TIntegerField;
    aqry60currency_ptr: TIntegerField;
    aqry60total_amount: TBCDField;
    aqry60CONTACT_NAME: TStringField;
    aqry60remark: TStringField;
    aqry60MO_PTR: TIntegerField;
    aqry63: TADOQuery;
    aqry63so_ptr: TIntegerField;
    aqry63prod_ptr: TIntegerField;
    aqry63location_ptr: TIntegerField;
    aqry63D0468_PTR: TIntegerField;
    aqry63quantity: TBCDField;
    aqry63price: TBCDField;
    aqry63returen_qty: TBCDField;
    aqry63remark: TStringField;
    aqry60rkey: TAutoIncField;
    aqry63tax_rate: TBCDField;
    ads492_468PROD_CODE: TStringField;
    ads492_468qty_onhand: TBCDField;
    aqTmp: TADOQuery;
    aqry60CONF_BY_EMPL_PTR: TIntegerField;
    aqry60CONF_DATE: TDateTimeField;
    ads492_468price: TBCDField;
    Ado492: TADOQuery;
    aqry63sales_date: TDateTimeField;
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

