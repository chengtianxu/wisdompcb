unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS268: TADODataSet;
    DataSource2: TDataSource;
    ADS468: TADODataSet;
    ADOQuery1: TADOQuery;
    ADS268rkey: TAutoIncField;
    ADS268number: TStringField;
    ADS268dept_ptr: TIntegerField;
    ADS268DEPT_CODE: TStringField;
    ADS268DEPT_NAME: TStringField;
    ADS268DATE: TDateTimeField;
    ADS268EMPL_PTR: TIntegerField;
    ADS268EMPL_CODE: TStringField;
    ADS268EMPLOYEE_NAME: TStringField;
    ADS268status: TWordField;
    ADS268C_STATUS: TStringField;
    ADS268auth_emplptr: TIntegerField;
    ADS268auth_EMPL_CODE: TStringField;
    ADS268auth_EMPLOYEE_NAME: TStringField;
    ADS268auth_date: TDateTimeField;
    ADS268auth_ptr: TIntegerField;
    ADS268reference: TStringField;
    ADS468RKEY: TIntegerField;
    ADS468FLOW_NO: TIntegerField;
    ADS468STEP: TSmallintField;
    ADS468DEPT_PTR: TIntegerField;
    ADS468INVENT_PTR: TIntegerField;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_PART_DESCRIPTION: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    ADS468UNIT_NAME: TStringField;
    ADS468STATUS: TSmallintField;
    ADS468VENDOR: TStringField;
    qrytmp: TADOQuery;
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
