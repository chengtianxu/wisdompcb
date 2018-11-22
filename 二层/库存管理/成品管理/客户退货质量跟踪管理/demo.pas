unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADO98: TADOQuery;
    ADOConnection1: TADOConnection;
    ADO98RMA_NUMBER: TStringField;
    ADO98QTY_AUTH: TIntegerField;
    ADO98RMA_STATUS: TStringField;
    ADO98srma_type: TStringField;
    ADO98RMA_DATE: TDateTimeField;
    ADO98cust_code: TStringField;
    ADO98abbr_name: TStringField;
    ADO98sales_order: TStringField;
    ADO98po_number: TStringField;
    ADO98number: TStringField;
    ADO98sys_date: TDateTimeField;
    ADO98number415: TStringField;
    ADO98date415: TDateTimeField;
    ADO98status415: TStringField;
    ADO98number414: TStringField;
    ADO98date414: TDateTimeField;
    ADO98qty_rece: TIntegerField;
    ADO98status414: TStringField;
    ADO98CUT_NO: TStringField;
    ADO98ISSUE_DATE: TDateTimeField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO98ISSUED_QTY: TIntegerField;
    ADO98confirm_time: TDateTimeField;
    ADO98employee_name: TStringField;
    ADO98rkey492: TAutoIncField;
    ADO98MANU_PART_NUMBER: TStringField;
    ADO98MANU_PART_DESC: TStringField;
    ADO98confirm_pack: TStringField;
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
