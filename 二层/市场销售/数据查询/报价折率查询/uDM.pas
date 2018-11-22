unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    DS85: TADODataSet;
    DS85TNUMBER: TStringField;
    DS85PROD_CODE: TStringField;
    DS85cust_code: TStringField;
    DS85customer_name: TStringField;
    DS85REF_PART_NO: TStringField;
    DS85CUST_PART_NO: TStringField;
    DS85TUNITS: TIntegerField;
    DS85QTE_DATE: TDateTimeField;
    DS85UNIT_LEN: TFloatField;
    DS85UNIT_WTH: TFloatField;
    DS85CURR_CODE: TStringField;
    DS85EMPLOYEE_NAME: TStringField;
    DS85TTYPE: TSmallintField;
    DS85AUDITED_STATUS: TWordField;
    DS85type: TStringField;
    DS85status: TStringField;
    DS85MARKUP: TFloatField;
    DS85quote_taxprice: TBCDField;
    ADS85_17: TADODataSet;
    ADS85_17INV_PART_NUMBER: TStringField;
    ADS85_17INV_NAME: TStringField;
    ADS85_17INV_DESCRIPTION: TStringField;
    ADS85_17TNUMBER: TStringField;
    ADS85_17PROD_CODE: TStringField;
    ADS85_17cust_code: TStringField;
    ADS85_17REF_PART_NO: TStringField;
    ADS85_17CUST_PART_NO: TStringField;
    ADS85_17TUNITS: TIntegerField;
    ADS85_17QTE_DATE: TDateTimeField;
    ADS85_17UNIT_LEN: TFloatField;
    ADS85_17UNIT_WTH: TFloatField;
    ADS85_17quote_taxprice: TBCDField;
    ADS85_17CURR_CODE: TStringField;
    ADS85_17EMPLOYEE_NAME: TStringField;
    ADS85_17TTYPE: TSmallintField;
    ADS85_17AUDITED_STATUS: TWordField;
    ADS85_17type: TStringField;
    ADS85_17status: TStringField;
    ADS85_17MARKUP: TFloatField;
    ADS85_17customer_name: TStringField;
    DS85PRODUCT_NAME: TStringField;
    DS85vatax: TBCDField;
    DS85EXPIRATION_DATE: TDateTimeField;
    ADS85_17PRODUCT_NAME: TStringField;
    ADS85_17vatax: TBCDField;
    ADS85_17EXPIRATION_DATE: TDateTimeField;
    ADS85_17QTY_BOM: TWordField;
    DS85ENTER_DATE: TDateTimeField;
    ADS85_17ENTER_DATE: TDateTimeField;
    ADS85_17ABBR_NAME: TStringField;
    ADS85_17rate_margin: TBCDField;
    DS85rate_margin: TBCDField;
    ADS85_17TUSAGE: TBCDField;
    DS85TUSAGE: TBCDField;
    DS85EMPL_CODE: TStringField;
    ADS85_17EMPL_CODE: TStringField;
    DS85sales_name: TStringField;
    ADS85_17sales_name: TStringField;
    procedure DS85CalcFields(DataSet: TDataSet);
    procedure ADS85_17CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DS85CalcFields(DataSet: TDataSet);
begin
 //报价模式
 case dm.DS85.FieldByName('TTYPE').asinteger of
  0: dm.DS85.FieldValues['type']:='快速报价';
  1: dm.DS85.FieldValues['type']:='完全报价';
  2: dm.DS85.FieldValues['type']:='样板报价';
  3: dm.DS85.FieldValues['type']:='批量报价';
 end;
 //状态
 case dm.DS85.FieldByName('AUDITED_STATUS').Value  of
  0: dm.DS85.FieldValues['status']:='未提交';
  1: dm.DS85.FieldValues['status']:='待审批';
  2: dm.DS85.FieldValues['status']:='已过期';
  3: dm.DS85.FieldValues['status']:='已审批';
  4: dm.DS85.FieldValues['status']:='被退回';
 end;
end;

procedure TDM.ADS85_17CalcFields(DataSet: TDataSet);
begin
 //报价模式
 case dm.ADS85_17.FieldByName('TTYPE').asinteger of
  0: dm.ADS85_17.FieldValues['type']:='快速报价';
  1: dm.ADS85_17.FieldValues['type']:='完全报价';
  2: dm.ADS85_17.FieldValues['type']:='样板报价';
  3: dm.ADS85_17.FieldValues['type']:='批量报价';
 end;
 //状态
 case dm.ADS85_17.FieldByName('AUDITED_STATUS').Value  of
  0: dm.ADS85_17.FieldValues['status']:='未提交';
  1: dm.ADS85_17.FieldValues['status']:='待审批';
  2: dm.ADS85_17.FieldValues['status']:='已过期';
  3: dm.ADS85_17.FieldValues['status']:='已审批';
  4: dm.ADS85_17.FieldValues['status']:='被退回';
 end;
end;

end.
