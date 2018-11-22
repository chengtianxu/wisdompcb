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
    ADO53: TADOQuery;
    ADO53_1: TADOQuery;
    DS3: TDataSource;
    DS4: TDataSource;
    ADO416: TADOQuery;
    ADO416_1: TADOQuery;
    ADO416rkey: TIntegerField;
    ADO416number: TStringField;
    ADO416type: TWordField;
    ADO416empl_ptr: TIntegerField;
    ADO416sys_date: TDateTimeField;
    ADO416quantity: TIntegerField;
    ADO416reference: TStringField;
    ADO416rma_ptr: TIntegerField;
    ADO416so_ptr: TIntegerField;
    ADO416status: TWordField;
    ADO416EMPLOYEE_NAME: TStringField;
    ADO53RKEY: TIntegerField;
    ADO53WHSE_PTR: TIntegerField;
    ADO53LOC_PTR: TIntegerField;
    ADO53CUST_PART_PTR: TIntegerField;
    ADO53QUANTITY: TFloatField;
    ADO53QTY_ALLOC: TFloatField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53RMA_PTR: TIntegerField;
    ADO53NPAD_PTR: TIntegerField;
    ADO53REFERENCE_NUMBER: TStringField;
    ADO53MANU_PART_NUMBER: TStringField;
    ADO53WAREHOUSE_CODE: TStringField;
    ADO53WAREHOUSE_NAME: TStringField;
    ADO53CODE: TStringField;
    ADO53LOCATION: TStringField;
    ADO416status_c: TStringField;
    ADO53_2: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    ADO53MANU_PART_DESC: TStringField;
    ADO53_2MANU_PART_DESC: TStringField;
    procedure ADO416AfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;
  Frkey416:integer;
implementation

{$R *.dfm}

procedure TDM.ADO416AfterScroll(DataSet: TDataSet);
begin
  ADO53.Close;
  ADO53.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO53.Open;
end;

end.
