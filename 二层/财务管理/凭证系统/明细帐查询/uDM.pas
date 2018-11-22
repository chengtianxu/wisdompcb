unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Cnn: TADOConnection;
    DS0508: TADODataSet;
    Qry0103: TADOQuery;
    DS526: TADODataSet;
    ADOQ: TADOQuery;
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
    Qry105_106: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Qry0106: TADOQuery;
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
    qrytemp: TADOQuery;
    DS526DSDesigner: TStringField;
    DS526DSDesigner2: TDateTimeField;
    DS526DSDesigner3: TStringField;
    DS526_: TBCDField;
    DS526_2: TBCDField;
    DS526DSDesigner4: TStringField;
    DS526_3: TBCDField;
    DS526DSDesigner5: TStringField;
    DS526DSDesigner6: TFloatField;
    DS526DSDesigner7: TStringField;
    DS526_4: TBCDField;
    DS526_5: TBCDField;
    DS526_6: TBCDField;
    DS526DSDesigner8: TStringField;
    DS526DSDesigner9: TStringField;
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
