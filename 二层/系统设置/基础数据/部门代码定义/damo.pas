unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS34: TADODataSet;
    ADS34DEPT_CODE: TStringField;
    ADS34DEPT_NAME: TStringField;
    ADS34PRINTING_RESOURCE: TStringField;
    ADS34PR_ID: TStringField;
    ADS34SEQ_NR: TIntegerField;
    ADS34PCS_AS_UNIT: TWordField;
    ADS34OUT_SOURCE: TWordField;
    ADS34GL_ACC_NUMBER: TStringField;
    ADS34BIG_DEPT_PTR: TIntegerField;
    ADS34GL_ACCT_PTR: TIntegerField;
    ADS34gl_desc: TStringField;
    ADS34rkey: TIntegerField;
    ADS34vttype: TStringField;
    AQ34: TADOQuery;
    AQ34rkey: TAutoIncField;
    AQ34DEPT_CODE: TStringField;
    AQ34DEPT_NAME: TStringField;
    AQ34PRINTING_RESOURCE: TStringField;
    AQ34PR_ID: TStringField;
    AQ34SEQ_NR: TIntegerField;
    AQ34PCS_AS_UNIT: TWordField;
    AQ34OUT_SOURCE: TWordField;
    AQ34BIG_DEPT_PTR: TIntegerField;
    AQ34GL_ACCT_PTR: TIntegerField;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    AQ34ttype: TStringField;
    ADS34bumeicode: TStringField;
    AQ34ACTIVE_FLAG: TWordField;
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
