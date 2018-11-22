unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO95: TADOQuery;
    ADO210: TADOQuery;
    aq0493: TADOQuery;
    ADO22: TADOStoredProc;
    ADO22rkey: TAutoIncField;
    ADO22source_ptr: TIntegerField;
    ADO22inventory_ptr: TIntegerField;
    ADO22inv_part_number: TStringField;
    ADO22inv_part_description: TStringField;
    ADO22code: TStringField;
    ADO22supplier_name: TStringField;
    ADO22CONTACT_NAME_1: TStringField;
    ADO22BILLING_ADDRESS_1: TStringField;
    ADO22warehouse_code: TStringField;
    ADO22warehouse_name: TStringField;
    ADO22quan_to_be_shipped: TFloatField;
    ADO22quan_returned: TFloatField;
    ADO22quantity: TFloatField;
    ADO2211: TADOStoredProc;
    ADO22price: TFloatField;
    DataSource2: TDataSource;
    ADOStoredProc1: TADOStoredProc;
    ADOStoredProc1QUANTITY: TFloatField;
    ADOStoredProc1SHIPPING_METHOD: TStringField;
    ADOStoredProc1INV_PART_NUMBER: TStringField;
    ADOStoredProc1INV_PART_DESCRIPTION: TStringField;
    ADOStoredProc1EMPLOYEE_NAME: TStringField;
    ADOStoredProc1PRICE: TFloatField;
    ADOStoredProc1tran_date: TDateTimeField;
    ADOStoredProc1REFERENCE_NUMBER: TStringField;
    ADOStoredProc1rece_quan: TFloatField;
    ADOStoredProc1TDATE: TDateTimeField;
    ADOStoredProc1ABBR_NAME: TStringField;
    ADOStoredProc1CONTACT_NAME_1: TStringField;
    ADOStoredProc1BILLING_ADDRESS_1: TStringField;
    ADOStoredProc1QUAN_ORD: TFloatField;
    ADOStoredProc1SUPPLIER_NAME: TStringField;
    ADOStoredProc1UNIT_NAME: TStringField;
    ADOStoredProc1conversion_factor: TFloatField;
    ADOStoredProc1PO_NUMBER: TStringField;
    ADOStoredProc1PO_DATE: TDateTimeField;
    ADOStoredProc1TTYPE: TSmallintField;
    ADOStoredProc1rkey: TIntegerField;
    ADOStoredProc1code: TStringField;
    aq0493Company_Name: TStringField;
    aq0493Company_Name2: TStringField;
    aq0493Company_Name3: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    ADO2211NOTE_PAD_LINE_1: TStringField;
    ADO2211NOTE_PAD_LINE_2: TStringField;
    ADO2211NOTE_PAD_LINE_3: TStringField;
    ADO2211NOTE_PAD_LINE_4: TStringField;
    ADOStoredProc1rkey95: TIntegerField;
    ADO22ship_date: TDateTimeField;
    ADO22ttype: TWordField;
    ADO22barcode_id: TStringField;
    ADO22unit_name: TStringField;
    ADO22rohs: TStringField;
    ADO22SUPPLIER2: TStringField;
    ADO210RKEY: TAutoIncField;
    ADO210INVT_PTR: TIntegerField;
    ADO210PO_LINK_PTR: TIntegerField;
    ADO210D0022_PTR: TIntegerField;
    ADO210D0235_PTR: TIntegerField;
    ADO210QUANTITY: TFloatField;
    ADO210TDATE: TDateTimeField;
    ADO210DEBIT_MEMO_PTR: TIntegerField;
    ADO210empl_ptr: TIntegerField;
    ADO210type: TWordField;
    ADOStoredProc1CURR_NAME: TStringField;
    ADOStoredProc1exch_rate: TBCDField;
    DS2: TDataSource;
    ADO96: TADOQuery;
    ADO96RKEY: TAutoIncField;
    ADO96INVT_PTR: TIntegerField;
    ADO96REJ_PTR: TIntegerField;
    ADO96INV_TRAN_PTR: TIntegerField;
    ADO96EMPL_PTR: TIntegerField;
    ADO96USER_PTR: TIntegerField;
    ADO96TDATE: TDateTimeField;
    ADO96QUAN_REJD: TFloatField;
    ADO96FLAG: TStringField;
    ADO96REFERENCE_NUMBER: TStringField;
    ADO96status: TWordField;
    ADO96reject_description: TStringField;
    ADO96user_full_name: TStringField;
    ADO22quan_on_hand: TBCDField;
    ADOStoredProc1tax_2: TBCDField;
    ADOStoredProc1no_tax_price: TBCDField;
    ADOStoredProc1tax_amount: TFloatField;
    ADOStoredProc1no_tax_amount: TFloatField;
    procedure DS1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DS1DataChange(Sender: TObject; Field: TField);
begin
  ADO96.Close;
  ADO96.Parameters[0].Value:=ADO22rkey.Value;
  ADO96.Open;
end;

end.
