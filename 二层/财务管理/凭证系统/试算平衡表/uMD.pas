unit uMD;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    Qry103: TADOQuery;
    Qry508: TADOQuery;
    DataSource1: TDataSource;
    ADOQ: TADOQuery;
    DS103: TADODataSet;
    DS526: TADODataSet;
    DS526RKEY: TAutoIncField;
    DS526VOUCHER: TStringField;
    DS526TDATE: TDateTimeField;
    DS526DESCRIPTION: TStringField;
    DS526DEBIT: TBCDField;
    DS526CREDIT: TBCDField;
    DS526DB_CR: TStringField;
    DS526BALANCE: TBCDField;
    DS526CURR_CODE: TStringField;
    DS526EXCH_RATE: TFloatField;
    DS526D_QTY: TFloatField;
    DS526C_QTY: TFloatField;
    DS526PRICE: TFloatField;
    DS526AMOUNT: TBCDField;
    DS526CLOSE_QTY: TFloatField;
    DS526REF_NUMBER: TStringField;
    DS526gl_acct_ptr: TFloatField;
    DS526remark: TStringField;
    DS526orig_amount: TBCDField;
    DataSource2: TDataSource;
    Qry105_106: TADOQuery;
    Qry0103: TADOQuery;
    Qry0106: TADOQuery;
    DS103GL_ACC_NUMBER: TStringField;
    DS103GL_DESCRIPTION: TStringField;
    DS103DB_CR: TStringField;
    DS103HAS_CHILD: TSmallintField;
    DS103TYR_OPEN: TBCDField;
    DS103TYR_DEBIT: TBCDField;
    DS103TYR_CREDIT: TBCDField;
    DS103TYR_CLOSE: TBCDField;
    DS103CURRENT_PERIOD_DEBIT: TBCDField;
    DS103CURRENT_PERIOD_CREDIT: TBCDField;
    DS103ACC_TP: TIntegerField;
    DS103DBCR: TStringField;
    DS103TTYPE: TSmallintField;
    DS526orig_amountD: TBCDField;
    DS526orig_amountC: TBCDField;
    DS526orig_amountS: TBCDField;
    Qry0103rkey: TAutoIncField;
    Qry0103gl_acc_number: TStringField;
    Qry0103gl_description: TStringField;
    Qry0103db_cr: TStringField;
    Qry0103TYR_OPEN: TBCDField;
    Qry0103TYR_PERIOD_1_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_2_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_3_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_4_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_5_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_6_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_7_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_8_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_9_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_10_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_11_CLOSE: TBCDField;
    Qry0103TYR_PERIOD_12_CLOSE: TBCDField;
    DS526DBCR: TStringField;
    DS103TYR_OPEN_ORIG: TBCDField;
    DS103TYR_CLOSE_ORIG: TBCDField;
    DS103TYR_DEBIT_ORIG: TBCDField;
    DS103TYR_CREDIT_ORIG: TBCDField;
    DS103CURRENT_PERIOD_DEBIT_ORIG: TBCDField;
    DS103CURRENT_PERIOD_CREDIT_ORIG: TBCDField;
    DS103SPEC_RKEY: TStringField;
    Qry0103TYR_OPEN_ORIG: TBCDField;
    Qry0103TYR_PERIOD_1_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_2_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_3_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_4_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_5_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_6_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_7_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_8_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_9_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_10_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_11_CLOSE_ORIG: TBCDField;
    Qry0103TYR_PERIOD_12_CLOSE_ORIG: TBCDField;
    procedure DS103CalcFields(DataSet: TDataSet);
    procedure DS526CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DS103CalcFields(DataSet: TDataSet);
begin
if (UpperCase(DS103DB_CR.Value)='D') and (DS103TYR_DEBIT.Value<>0) then
  self.DS103DBCR.Value:='½è'
else
 if (UpperCase(DS103DB_CR.Value)='C') and (DS103TYR_CREDIT.Value<>0) then
  self.DS103DBCR.Value:='´û'
 else
  if DS103DB_CR.Value<>'' then
   self.DS103DBCR.Value:='Æ½'
  else
   self.DS103DBCR.Value:='';
end;

procedure TDM.DS526CalcFields(DataSet: TDataSet);
begin
if (self.DS526BALANCE.Value <> 0) then
 if UpperCase(trim(DS526DB_CR.Value)) = 'D' then
  DS526DBCR.Value := '½è'
 else
  DS526DBCR.Value := '´û'
else
  DS526DBCR.Value:='Æ½';
end;

end.
