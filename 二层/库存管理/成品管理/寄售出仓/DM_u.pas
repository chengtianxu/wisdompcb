unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    AQ157: TADOQuery;
    AQ158: TADOQuery;
    DS2: TDataSource;
    DS1: TDataSource;
    AQ157rkey: TAutoIncField;
    AQ157PRINT_NUMBER: TStringField;
    AQ157EMPL_PTR: TIntegerField;
    AQ157ENT_DATE: TDateTimeField;
    AQ157personnel_name: TStringField;
    AQ157BRING_DATE: TDateTimeField;
    AQ157QUANTITY: TIntegerField;
    AQ157AMOUNT: TBCDField;
    AQ157REMARK: TStringField;
    AQ157receipt_number: TStringField;
    AQ157CUSTOMER_PTR: TIntegerField;
    AQ157CURRENCY_PTR: TIntegerField;
    AQ157CURR_CODE: TStringField;
    AQ157EMPLOYEE_NAME: TStringField;
    AQ157CUST_CODE: TStringField;
    AQ157ABBR_NAME: TStringField;
    AQ158RKEY: TAutoIncField;
    AQ158PRINT_PTR: TIntegerField;
    AQ158STOCK_PTR: TIntegerField;
    AQ158OUT_QTY: TIntegerField;
    AQ158RECE_NUMBER: TStringField;
    AQ158REMARK: TStringField;
    AQ158MANU_PART_NUMBER: TStringField;
    AQ158MANU_PART_DESC: TStringField;
    AQ157_1: TADOQuery;
    AQ158_1: TADOQuery;
    AQ158MFG_DATE: TDateTimeField;
    AQ158PO_NUMBER: TStringField;
    AQ158analysis_code_2: TStringField;
    AQ158Price6: TFloatField;
    AQ158PRICE: TBCDField;
    AQ158TAX_RATE: TBCDField;
    procedure AQ157AfterScroll(DataSet: TDataSet);
    procedure AQ158_1BeforeOpen(DataSet: TDataSet);
    procedure AQ158BeforeOpen(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM ;
  Frkey157:integer;
implementation

{$R *.dfm}

procedure TDM.AQ157AfterScroll(DataSet: TDataSet);
begin
  AQ158.Close;
  AQ158.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  AQ158.Open;
end;

procedure TDM.AQ158_1BeforeOpen(DataSet: TDataSet);
begin
  AQ158_1.EnableBCD:= False;
end;

procedure TDM.AQ158BeforeOpen(DataSet: TDataSet);
begin
  AQ158.EnableBCD:= False;
end;

end.
