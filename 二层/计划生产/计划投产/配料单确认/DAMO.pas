unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS492: TADODataSet;
    DataSource1: TDataSource;
    ADS492rkey: TAutoIncField;
    ADS492CUT_NO: TStringField;
    ADS492SO_NO: TStringField;
    ADS492EMPLOYEE_NAME: TStringField;
    ADS492MANU_PART_NUMBER: TStringField;
    ADS492MANU_PART_DESC: TStringField;
    ADS492ISSUED_QTY: TIntegerField;
    ADS492ISSUE_DATE: TDateTimeField;
    ADS492pnl1_size: TStringField;
    ADS492PANEL_1_QTY: TIntegerField;
    ADS492UPANEL1: TIntegerField;
    ADS492pnl2_size: TStringField;
    ADS492PANEL_2_QTY: TIntegerField;
    ADS492UPANEL2: TIntegerField;
    ADS492DSDesigner: TStringField;
    ADS492DSDesigner2: TStringField;
    ADS492DSDesigner3: TStringField;
    ADS468: TADODataSet;
    ADS468DEPT_CODE: TStringField;
    ADS468DEPT_NAME: TStringField;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_NAME: TStringField;
    ADS468INV_DESCRIPTION: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    ADS468UNIT_NAME: TStringField;
    ADS468QUAN_ON_HAND: TFloatField;
    DataSource2: TDataSource;
    ADS468DSDesigner: TStringField;
    ADOQuery1: TADOQuery;
    ADS492cutno: TStringField;
    ADS492tstatus: TWordField;
    ADS468step: TSmallintField;
    ADS492WAREHOUSE_CODE: TStringField;
    ADS468VENDOR: TStringField;
    ADS492con_date: TDateTimeField;
    ADS492DSDesigner4: TStringField;
    ADS468DSDesigner2: TStringField;
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
