unit DM_u;

interface           

uses
  SysUtils, Classes, DB, ADODB,PubFunc,Variants, Provider, DBClient,
  MConnect, SConnect, TConnect,Forms,controls,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    Tmp1: TADOQuery;
    ADOGLQry: TADOQuery;
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
    DS526orig_amountD: TBCDField;
    DS526orig_amountC: TBCDField;
    DS526orig_amountS: TBCDField;
    DS526DBCR: TStringField;
    DataSource2: TDataSource;
    Qry105_106: TADOQuery;
    Qry0103: TADOQuery;
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
    Qry0106: TADOQuery;
    Qry508: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public


  end;

var
  DM: TDM;

implementation

{$R *.dfm}


procedure TDM.DataModuleCreate(Sender: TObject);
begin
 // ADOCon.Open;
end;

end.
