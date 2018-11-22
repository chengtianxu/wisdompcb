unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    ADODS0508: TADODataSet;
    ADODT0103: TADODataSet;
    ADODS0106: TADODataSet;
    ADODSProfit: TADODataSet;
    ADODS0105: TADODataSet;
    ADOQ: TADOQuery;
    DS110: TADODataSet;
    ADODT0103rkey: TAutoIncField;
    ADODT0103DB_CR: TStringField;
    ADODT0103TYR_CLOSE: TBCDField;
    ADODS0106RKEY: TAutoIncField;
    ADODS0106GL_HEADER_PTR: TIntegerField;
    ADODS0106GL_ACCT_NO_PTR: TIntegerField;
    ADODS0106REF_NUMBER: TStringField;
    ADODS0106DESCRIPTION: TStringField;
    ADODS0106AMOUNT: TBCDField;
    ADODS0106D_C: TStringField;
    ADODS0106FYEAR: TIntegerField;
    ADODS0106PERIOD: TSmallintField;
    ADODS0106CURR_PTR: TIntegerField;
    ADODS0106EXCH_RATE: TBCDField;
    ADODT0103GL_ACC_NUMBER: TStringField;
    ADODSProfitrkey: TAutoIncField;
    ADODSProfitGL_ACC_NUMBER: TStringField;
    ADODSProfitGL_DESCRIPTION: TStringField;
    DS103P: TADOCommand;
    DS103ZR: TADODataSet;
    DS103ZRDB_CR: TStringField;
    DS103ZRTYR_OPEN: TBCDField;
    DS103ZRCURRENT_PERIOD_DEBIT: TBCDField;
    DS103ZRCURRENT_PERIOD_CREDIT: TBCDField;
    DS103ZRTYR_CLOSE: TBCDField;
    ADODSProfitTYR_CLOSE: TBCDField;
    DS103ZRTYR_OPEN_ORIG: TBCDField;
    DS103ZRCURRENT_PERIOD_DEBIT_ORIG: TBCDField;
    DS103ZRCURRENT_PERIOD_CREDIT_ORIG: TBCDField;
    DS103ZRTYR_CLOSE_ORIG: TBCDField;
    ADODS0106PRICE: TBCDField;
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
