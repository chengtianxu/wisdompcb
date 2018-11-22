unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    DSProfit: TADODataSet;
    ADOQ: TADOQuery;
    Qry508: TADOQuery;
    DS0106: TADODataSet;
    DS0106d_c: TStringField;
    DS0106amount: TBCDField;
    DS0106gl_acct_no_ptr: TIntegerField;
    ds0103: TADOQuery;
    ds103p: TADOQuery;
    ds103pDB_CR: TStringField;
    ds103pTYR_OPEN: TBCDField;
    ds103pCURRENT_PERIOD_DEBIT: TBCDField;
    ds103pCURRENT_PERIOD_CREDIT: TBCDField;
    ds103pTYR_CLOSE: TBCDField;
    DSProfitrkey: TAutoIncField;
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
