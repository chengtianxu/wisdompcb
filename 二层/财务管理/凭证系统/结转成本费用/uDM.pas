unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    ADODS0508: TADODataSet;
    DS0103: TADODataSet;
    DS0106: TADODataSet;
    DS0106RKEY: TAutoIncField;
    DS0106GL_HEADER_PTR: TIntegerField;
    DS0106GL_ACCT_NO_PTR: TIntegerField;
    DS0106REF_NUMBER: TStringField;
    DS0106DESCRIPTION: TStringField;
    DS0106SRCE_PTR: TIntegerField;
    DS0106AMOUNT: TFloatField;
    DS0106D_C: TStringField;
    DS0106FYEAR: TIntegerField;
    DS0106PERIOD: TSmallintField;
    DS0106gl_acc_number: TStringField;
    DS0106gl_description: TStringField;
    DS0105: TADODataSet;
    ADOQ: TADOQuery;
    DS103ZR: TADODataSet;
    DS0106CURR_PTR: TIntegerField;
    DS0106EXCH_RATE: TBCDField;
    DS110: TADODataSet;
    DS0103auto_trans_ptr: TIntegerField;
    DS0103GL_DESCRIPTION: TStringField;
    DS0103GL_ACC_NUMBER: TStringField;
    DS0103RKEY: TAutoIncField;
    DS0103multi_column_flag: TBooleanField;
    DS0103DB_CR: TStringField;
    DS0103PARENT_PTR: TIntegerField;
    DS0103TYR_OPEN: TBCDField;
    DS0103TYR_DEBIT: TBCDField;
    DS0103TYR_CREDIT: TBCDField;
    DS0103TYR_CLOSE: TBCDField;
    DS0103TYR_PROFIT: TBCDField;
    DS0103CURRENT_PERIOD_DEBIT: TBCDField;
    DS0103CURRENT_PERIOD_CREDIT: TBCDField;
    DS0103CURRENT_PERIOD_PROFIT: TBCDField;
    DS0103ACC_TP: TIntegerField;
    DS0103autoDES: TStringField;
    DS0103autoAcc: TStringField;
    DS0103autoPar: TIntegerField;
    DS103P: TADOCommand;
    DS103ZRDB_CR: TStringField;
    DS103ZRTYR_OPEN: TBCDField;
    DS103ZRCURRENT_PERIOD_DEBIT: TBCDField;
    DS103ZRCURRENT_PERIOD_CREDIT: TBCDField;
    DS103ZRTYR_CLOSE: TBCDField;
    DS0103TYR_CLOSE_ORIG: TBCDField;
    DS103ZRTYR_OPEN_ORIG: TBCDField;
    DS103ZRCURRENT_PERIOD_DEBIT_ORIG: TBCDField;
    DS103ZRCURRENT_PERIOD_CREDIT_ORIG: TBCDField;
    DS103ZRTYR_CLOSE_ORIG: TBCDField;
    DS0106PRICE: TBCDField;
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
