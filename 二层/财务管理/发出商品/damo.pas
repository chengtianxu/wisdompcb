unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS105: TADODataSet;
    ADS105RKEY: TIntegerField;
    ADS105VOUCHER: TStringField;
    ADS105TRANS_TYPE: TSmallintField;
    ADS105ENTERED_DT: TDateTimeField;
    ADS105STATUS: TSmallintField;
    ADS105FYEAR: TIntegerField;
    ADS105PERIOD: TSmallintField;
    ADS105EMPLOYEE_NAME: TStringField;
    ADS105ATTACHED: TSmallintField;
    ADS105ENTERED_BY_EMPL_PTR: TIntegerField;
    ADS105BATCH_NUMBER: TStringField;
    ADS105CUSTOMER_PTR: TIntegerField;
    ADS105CURRENCY_PTR: TIntegerField;
    ADS105ABBR_NAME: TStringField;
    ADS105CUST_CODE: TStringField;
    ADS105CUSTOMER_NAME: TStringField;
    ADS105v_status: TStringField;
    ads106: TADODataSet;
    DataSource2: TDataSource;
    ads106GL_ACC_NUMBER: TStringField;
    ads106GL_DESCRIPTION: TStringField;
    ads106CURR_NAME: TStringField;
    ads106CURR_CODE: TStringField;
    ads106GL_HEADER_PTR: TIntegerField;
    ads106RKEY: TIntegerField;
    ads106GL_ACCT_NO_PTR: TIntegerField;
    ads106REF_NUMBER: TStringField;
    ads106DESCRIPTION: TStringField;
    ads106AMOUNT: TBCDField;
    ads106D_C: TStringField;
    ads106FYEAR: TIntegerField;
    ads106PERIOD: TSmallintField;
    ads106CURR_PTR: TIntegerField;
    ads106description_2: TStringField;
    ADOQuery1: TADOQuery;
    ADO104: TADOQuery;
    ADO104RKEY: TIntegerField;
    ADO104JOURNAL_TITLE: TStringField;
    ADO104DFLT_ACCT_01: TIntegerField;
    ADO104DFLT_ACCT_02: TIntegerField;
    ADO104DFLT_ACCT_03: TIntegerField;
    ADO104DFLT_ACCT_04: TIntegerField;
    ADO104DFLT_ACCT_05: TIntegerField;
    ADO104DFLT_ACCT_06: TIntegerField;
    ADO104DFLT_ACCT_07: TIntegerField;
    ADO104DFLT_ACCT_08: TIntegerField;
    ADO104DFLT_ACCT_09: TIntegerField;
    ADO104DFLT_ACCT_10: TIntegerField;
    Aqd508: TADODataSet;
    Aqd508CURR_FYEAR: TIntegerField;
    Aqd508CURR_PERIOD: TSmallintField;
    ADO105: TADOQuery;
    ADO105RKEY: TAutoIncField;
    ADO105VOUCHER: TStringField;
    ADO105BATCH_NUMBER: TStringField;
    ADO105STATUS: TSmallintField;
    ADO105VOU_TYPE: TSmallintField;
    ADO105TRANS_TYPE: TSmallintField;
    ADO105SOURCE_PTR: TIntegerField;
    ADO105ENTERED_BY_EMPL_PTR: TIntegerField;
    ADO105AUDITED_BY_EMPL_PTR: TIntegerField;
    ADO105POSTED_BY_EMPL_PTR: TIntegerField;
    ADO105ENTERED_DT: TDateTimeField;
    ADO105POSTED_DT: TDateTimeField;
    ADO105REOCCURING_TRANS_FLG: TStringField;
    ADO105REVERSE_TRANS_FLAG: TStringField;
    ADO105DATA0105_PTR_REVERSE: TIntegerField;
    ADO105SPECIAL_POSTING: TStringField;
    ADO105ATTACHED: TSmallintField;
    ADO105FYEAR: TIntegerField;
    ADO105PERIOD: TSmallintField;
    ADO105CUSTOMER_PTR: TIntegerField;
    ADO105casher_ptr: TIntegerField;
    ADO105supervisor_ptr: TIntegerField;
    ADO106: TADOQuery;
    ADO105CURRENCY_PTR: TIntegerField;
    ADS105CURR_CODE: TStringField;
    ADS105CURR_NAME: TStringField;
    ads106EXCH_RATE: TFloatField;
    ADO105EXCHANGE_RATE: TFloatField;
    ADO106gl_header_ptr: TIntegerField;
    ADO106gl_acct_no_ptr: TIntegerField;
    ADO106ref_number: TStringField;
    ADO106description: TStringField;
    ADO106amount: TFloatField;
    ADO106d_c: TStringField;
    ADO106curr_ptr: TIntegerField;
    ADO106exch_rate: TFloatField;
    ADS105EXCHANGE_RATE: TFloatField;
    ads106yuan_amount: TFloatField;
    ads106price: TFloatField;
    ADO106price: TFloatField;
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
