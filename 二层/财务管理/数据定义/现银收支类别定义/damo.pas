unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOdata0128: TADODataSet;
    ADOdata0128RKEY: TAutoIncField;
    ADOdata0128BANK_NAME: TStringField;
    ADOdata0128BANK_ANAME: TStringField;
    ADOdata0128BANK_ADDRESS_LINE1: TStringField;
    ADOdata0128BANK_ADDRESS_LINE2: TStringField;
    ADOdata0128BANK_ADDRESS_LINE3: TStringField;
    ADOdata0128BANK_ZIPCODE: TStringField;
    ADOdata0128BANK_PHONE: TStringField;
    ADOdata0128BANK_FX: TStringField;
    ADOdata0128BANK_ACCOUNT_NUMBER: TStringField;
    ADOdata0128BANK_CURRENT_CHECK: TStringField;
    ADOdata0128BANK_CONTACT1: TStringField;
    ADOdata0128BANK_CONTACT2: TStringField;
    ADOdata0128BANK_CONTACT3: TStringField;
    ADOdata0128BANK_CON_PHONE1: TStringField;
    ADOdata0128BANK_CON_PHONE2: TStringField;
    ADOdata0128BANK_CON_PHONE3: TStringField;
    ADOdata0128GL_ACCT_PTR: TIntegerField;
    ADOdata0128CURRENCY_PTR: TIntegerField;
    ADOdata0128BAL_AMOUNT: TFloatField;
    ADOdata0128GL_ACC_NUMBER: TStringField;
    ADOdata0128GL_DESCRIPTION: TStringField;
    ADOdata0128CURR_CODE: TStringField;
    ADOdata0128curr_name: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADO0520: TADOQuery;
    ADOData0520: TADODataSet;
    ADOData0520RKEY: TAutoIncField;
    ADOData0520TTYPE: TSmallintField;
    ADOData0520NAME: TStringField;
    ADOData0520DESCRIPTION: TStringField;
    ADOData0520GL_ACCT_PTR: TIntegerField;
    ADOData0520gl_acc_number: TStringField;
    ADOData0520gl_description: TStringField;
    aqtmp: TADOQuery;
    ADOData0520type: TStringField;
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
