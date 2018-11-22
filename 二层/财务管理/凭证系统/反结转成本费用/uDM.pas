unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    DS0508: TADODataSet;
    DS0106: TADODataSet;
    ADOQ: TADOQuery;
    DS0106RKEY: TAutoIncField;
    DS0106GL_ACCT_NO_PTR: TIntegerField;
    DS0106D_C: TStringField;
    DS0106AMOUNT: TBCDField;
    ds0103: TADOQuery;
    ds103p: TADOQuery;
    ds103pDB_CR: TStringField;
    ds103pTYR_OPEN: TBCDField;
    ds103pCURRENT_PERIOD_DEBIT: TBCDField;
    ds103pCURRENT_PERIOD_CREDIT: TBCDField;
    ds103pTYR_CLOSE: TBCDField;
    DS110: TADODataSet;
    ds103pTYR_OPEN_ORIG: TBCDField;
    ds103pCURRENT_PERIOD_DEBIT_ORIG: TBCDField;
    ds103pCURRENT_PERIOD_CREDIT_ORIG: TBCDField;
    ds103pTYR_CLOSE_ORIG: TBCDField;
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
