unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADO468: TADOQuery;
    ADO475: TADOQuery;
    ADO22: TADOQuery;
    DS3: TDataSource;
    ADO468INV_PART_NUMBER: TStringField;
    ADO468INV_NAME: TStringField;
    ADO468INV_DESCRIPTION: TStringField;
    ADO468DEPT_CODE: TStringField;
    ADO468DEPT_NAME: TStringField;
    ADO468PROD_CODE: TStringField;
    ADO468PRODUCT_NAME: TStringField;
    ADO468PRODUCT_DESC: TStringField;
    ADO468CUT_NO: TStringField;
    ADO468QUAN_BOM: TFloatField;
    ADO468QUAN_ISSUED: TFloatField;
    ADO468quan_alloc: TBCDField;
    ADO468VENDOR: TStringField;
    ADO468EMPLOYEE_NAME: TStringField;
    ADO468rkey: TIntegerField;
    ADO475rkey468: TIntegerField;
    ADO475rkey22: TIntegerField;
    ADO475quan_alloc: TBCDField;
    ADO475INVENTORY_PTR: TIntegerField;
    ADO475INV_PART_NUMBER: TStringField;
    ADO475INV_NAME: TStringField;
    ADO475INV_DESCRIPTION: TStringField;
    ADO22INVENTORY_PTR: TIntegerField;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22INV_NAME: TStringField;
    ADO22INV_DESCRIPTION: TStringField;
    ADO22QUAN_TO_BE_STOCKED: TBCDField;
    ADO22ValQty: TBCDField;
    ADO22RKEY: TAutoIncField;
    ADO475CREATE_DATE: TDateTimeField;
    ADO475GRN_NUMBER: TStringField;
    ADO22CREATE_DATE: TDateTimeField;
    ADO22GRN_NUMBER: TStringField;
    ADO475_1: TADOQuery;
    ADO475_1rkey468: TIntegerField;
    ADO475_1rkey22: TIntegerField;
    ADO475_1quan_alloc: TBCDField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    ADO475_1CREATE_DATE: TDateTimeField;
    ADO475_1GRN_NUMBER: TStringField;
    ADO468rkey17: TAutoIncField;
    DS4: TDataSource;
    ADO468ValQty: TBCDField;
    ADO22SUPPLIER_NAME: TStringField;
    ADO22LOCATION: TStringField;
    ADO22UNIT_CODE: TStringField;
    ADO22EXPIRE_DATE: TDateTimeField;
    ADO22QUAN_on_hand: TBCDField;
    ADO468unit_name: TStringField;
    ADO468number: TStringField;
    ADO468date: TDateTimeField;
    ADO475alloc_userptr: TIntegerField;
    ADO475alloc_datetime: TDateTimeField;
    ADO475empname: TStringField;
    ADO475_1alloc_userptr: TIntegerField;
    ADO475_1alloc_datetime: TDateTimeField;
    ADO475_1empname: TStringField;
    procedure ADO468AfterScroll(DataSet: TDataSet);
    procedure ADO22FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private

  public
    Fok:boolean;
    FCurrDate:TDatetime;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO468AfterScroll(DataSet: TDataSet);
begin
  ADO475.Close;
  ADO475.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO475.Open;
end;

procedure TDM.ADO22FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if Fok then exit;
  Accept:= not ADO475_1.Locate('rkey22',ADO22RKEY.Value,[]);
end;

end.
