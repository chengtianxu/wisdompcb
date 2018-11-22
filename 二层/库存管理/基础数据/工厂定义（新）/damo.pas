unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS15: TADODataSet;
    DataSource1: TDataSource;
    ADS15RKEY: TAutoIncField;
    ADS15WAREHOUSE_CODE: TStringField;
    ADS15WAREHOUSE_NAME: TStringField;
    ADS15ENG_NAME: TStringField;
    ADS15ABBR_NAME: TStringField;
    ADS15ADDRESS_LINE_1: TStringField;
    ADS15ADDRESS_LINE_2: TStringField;
    ADS15STATE: TStringField;
    ADS15ADDRESS_LINE_3: TStringField;
    ADS15ZIP: TStringField;
    ADS15PHONE: TStringField;
    ADS15FAX: TStringField;
    ADS15WEB: TStringField;
    ADS15TELEX: TStringField;
    ADS15EMPLOYEE_PTR_1: TIntegerField;
    ADS15EMPLOYEE_PTR_2: TIntegerField;
    ADS15EMPLOYEE_PTR_3: TIntegerField;
    ADS15WAREHOUSE_TYPE: TStringField;
    ADS15o_warehouse_name: TStringField;
    ADS15o_address_1: TStringField;
    ADS15o_eng_name: TStringField;
    ADS15o_address_2: TStringField;
    ADS15o_address_3: TStringField;
    ADS15o_state: TStringField;
    ADS15o_zip: TStringField;
    ADS15o_phone: TStringField;
    ADS15o_fax: TStringField;
    ADS15o_telex: TStringField;
    ADS15o_web: TStringField;
    ADS15purchase_order: TStringField;
    ADS15o_purchase_order: TStringField;
    ADS15picture: TBlobField;
    ADS15o_picture: TBlobField;
    ADS15part_batch: TStringField;
    ADS15part_templet: TStringField;
    AQ04: TADOQuery;
    AQ04seed_value: TStringField;
    AQ04seed_flag: TWordField;
    ADS15active_flag: TStringField;
    ADOQuery1: TADOQuery;
    ADS05: TADOQuery;
    ADS15date_area: TFloatField;
    ADS15date_quantity: TIntegerField;
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
