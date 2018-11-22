unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ads491: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ads491rkey: TAutoIncField;
    ads491CUT_NO: TStringField;
    ads491SO_NO: TStringField;
    ads491PROD_CODE: TStringField;
    ads491PRODUCT_NAME: TStringField;
    ads491PRODUCT_DESC: TStringField;
    ads491PROD_TTYPE: TStringField;
    ads491TSTATUS: TWordField;
    ads491ct_type: TStringField;
    ads491PLANNED_QTY: TIntegerField;
    ads491ISSUED_QTY: TIntegerField;
    ads491ISSUE_DATE: TDateTimeField;
    ads491DEPT_NAME: TStringField;
    ads491remark492: TStringField;
    ads491APP_QUAN: TIntegerField;
    ads491EMPLOYEE_NAME: TStringField;
    ads491APP_BY_PTR: TIntegerField;
    ads491AUTH_EMPLOYEE_NAME: TStringField;
    ads491APP_DATE: TDateTimeField;
    ads491remark: TStringField;
    ads491WHOUSE_PTR: TIntegerField;
    ads491ABBR_NAME: TStringField;
    ads491CSTATUS: TStringField;
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
