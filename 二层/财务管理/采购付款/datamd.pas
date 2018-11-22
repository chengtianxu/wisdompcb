unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO128: TADOQuery;
    ADO128bank_current_check: TStringField;
    ADO129: TADOQuery;
    ADO129RKEY: TAutoIncField;
    ADO129CHECK_NUMBER: TStringField;
    ADO129BANK_PTR: TIntegerField;
    ADO129TDATE: TDateTimeField;
    ADO129STATUS: TSmallintField;
    ADO129TTYPE: TSmallintField;
    ADO129SRCE_PTR: TIntegerField;
    ADO129EMPL_PTR: TIntegerField;
    ADO129AMOUNT: TBCDField;
    ADO129PAY_TO: TStringField;
    ADO129CURR_PTR: TIntegerField;
    ADO129REMARK: TStringField;
    ADO129warehouse_ptr: TIntegerField;
    ADO128bal_amount: TFloatField;
    ADO130: TADOQuery;
    ADO130RKEY: TAutoIncField;
    ADO130CHECK_PTR: TIntegerField;
    ADO130INVOICE_PTR: TIntegerField;
    ADO130DEBIT_AP_HEAD_PTR: TIntegerField;
    ADO130AMOUNT: TBCDField;
    ADO130CASH_DISCOUNT: TBCDField;
    AQ129: TADODataSet;
    AQ129EMPLOYEE_NAME: TStringField;
    AQ129BANK_NAME: TStringField;
    AQ129BAL_AMOUNT: TFloatField;
    AQ129EX_RATE: TFloatField;
    AQ129CURR_NAME: TStringField;
    AQ129CURR_CODE: TStringField;
    AQ129CODE: TStringField;
    AQ129SUPPLIER_NAME: TStringField;
    AQ129ABBR_NAME: TStringField;
    AQ129TTYPE: TSmallintField;
    AQ129STATUS: TSmallintField;
    AQ129TDATE: TDateTimeField;
    AQ129CHECK_NUMBER: TStringField;
    AQ129AMOUNT: TBCDField;
    AQ129RKEY: TIntegerField;
    AQ129WAREHOUSE_CODE: TStringField;
    AQ129WAREHOUSE_NAME: TStringField;
    AQ129REMARK: TStringField;
    AQ129amount_bamt: TFloatField;
    AQ129ACC_PAYABLE_PTR: TIntegerField;
    AQ129VOUCHER: TStringField;
    AQ129rkey105: TIntegerField;
    AQ129DSDesigner: TStringField;
    AQ129DSDesigner2: TStringField;
    AQ129DSDesigner3: TStringField;
    ADO104: TADOQuery;
    ADO104RKEY: TIntegerField;
    ADO104JOURNAL_TITLE: TStringField;
    ADO104DFLT_ACCT_01: TIntegerField;
    ADO104DFLT_ACCT_02: TIntegerField;
    ADO104DFLT_ACCT_03: TIntegerField;
    ADO104DFLT_ACCT_04: TIntegerField;
    ADO104DFLT_ACCT_05: TIntegerField;
    ADO104DFLT_ACCT_06: TIntegerField;
    ADO104DFLT_ACCT_07: TIntegerField;
    ADO104DFLT_ACCT_08: TIntegerField;
    ADO104DFLT_ACCT_09: TIntegerField;
    ADO104DFLT_ACCT_10: TIntegerField;
    ADO105: TADOQuery;
    ADO105RKEY: TAutoIncField;
    ADO105VOUCHER: TStringField;
    ADO105BATCH_NUMBER: TStringField;
    ADO105STATUS: TSmallintField;
    ADO105VOU_TYPE: TSmallintField;
    ADO105TRANS_TYPE: TSmallintField;
    ADO105SOURCE_PTR: TIntegerField;
    ADO105ENTERED_BY_EMPL_PTR: TIntegerField;
    ADO105AUDITED_BY_EMPL_PTR: TIntegerField;
    ADO105POSTED_BY_EMPL_PTR: TIntegerField;
    ADO105ENTERED_DT: TDateTimeField;
    ADO105POSTED_DT: TDateTimeField;
    ADO105REOCCURING_TRANS_FLG: TStringField;
    ADO105REVERSE_TRANS_FLAG: TStringField;
    ADO105DATA0105_PTR_REVERSE: TIntegerField;
    ADO105SPECIAL_POSTING: TStringField;
    ADO105ATTACHED: TSmallintField;
    ADO105FYEAR: TIntegerField;
    ADO105PERIOD: TSmallintField;
    ADO105SUPP_PTR: TIntegerField;
    ADO105CUSTOMER_PTR: TIntegerField;
    ADO105casher_ptr: TIntegerField;
    ADO105supervisor_ptr: TIntegerField;
    ADO106: TADOQuery;
    ADO106RKEY: TAutoIncField;
    ADO106GL_HEADER_PTR: TIntegerField;
    ADO106GL_ACCT_NO_PTR: TIntegerField;
    ADO106REF_NUMBER: TStringField;
    ADO106DESCRIPTION: TStringField;
    ADO106SRCE_PTR: TIntegerField;
    ADO106D_C: TStringField;
    ADO106FYEAR: TIntegerField;
    ADO106PERIOD: TSmallintField;
    ADO106INV_PTR: TIntegerField;
    ADO106UNIT_PTR: TIntegerField;
    ADO106CURR_PTR: TIntegerField;
    ADO106EXCH_RATE: TFloatField;
    ADO106QUANTITY: TFloatField;
    Aqd105: TADODataSet;
    Aqd105rkey: TIntegerField;
    Aqd105VOUCHER: TStringField;
    Aqd105EMPLOYEE_NAME: TStringField;
    Aqd105FYEAR: TIntegerField;
    Aqd105PERIOD: TSmallintField;
    Aqd105ATTACHED: TSmallintField;
    Aqd105ENTERED_DT: TDateTimeField;
    Aqd508: TADODataSet;
    Aqd508CURR_FYEAR: TIntegerField;
    Aqd508CURR_PERIOD: TSmallintField;
    ADOsp04: TADOStoredProc;
    ADOsp04CONTROL_NO_LENGTH: TSmallintField;
    ADOsp04SEED_VALUE: TStringField;
    ADOsp04SEED_FLAG: TWordField;
    ADO132: TADOQuery;
    ADO132RKEY: TAutoIncField;
    ADO132MEMO_NUMBER: TStringField;
    ADO132SUPP_PTR: TIntegerField;
    ADO132SRCE_PTR: TIntegerField;
    ADO132MEMO_TP: TSmallintField;
    ADO132EMPL_PTR: TIntegerField;
    ADO132MEMO_DATE: TDateTimeField;
    ADO132ENT_DATE: TDateTimeField;
    ADO132AMOUNT: TBCDField;
    ADO132AVL_AMT: TBCDField;
    ADO132MATL_TOT: TBCDField;
    ADO132SHIPPING: TBCDField;
    ADO132MISC_TOT: TBCDField;
    ADO132FED_TAX: TBCDField;
    ADO132CURRENCY_PTR: TIntegerField;
    ADO132EX_RATE: TBCDField;
    ADO132CASH_DISC: TBCDField;
    ADO132PURCH_DISC: TBCDField;
    ADO132REF_NUMBER: TStringField;
    AQ129GL_ACCT_PTR: TIntegerField;
    Aqd106: TADODataSet;
    Aqd106DESCRIPTION: TStringField;
    Aqd106AMOUNT: TBCDField;
    Aqd106D_C: TStringField;
    Aqd106gl_desc: TStringField;
    Aqd106GL_ACCT_NO_PTR: TIntegerField;
    Aqd106CURR_PTR: TIntegerField;
    Aqd106EXCH_RATE: TFloatField;
    Aqd106CURR_CODE: TStringField;
    Aqd106CURR_NAME: TStringField;
    Aqd106GL_ACC_NUMBER: TStringField;
    Aqd106GL_DESCRIPTION: TStringField;
    Aqd106father_desc: TStringField;
    Aqd106grandfather_desc: TStringField;
    AQ129EMPL_PTR: TIntegerField;
    ADO129trans_pl: TWordField;
    Aqd105BATCH_NUMBER: TStringField;
    AQ129abbr15name: TStringField;
    ADO132warehouse_ptr: TIntegerField;
    ADO132memo_status: TWordField;
    ADO106AMOUNT: TBCDField;
    ADO106PRICE: TBCDField;
    Aqd106PRICE: TBCDField;
    ADO129EX_RATE: TFloatField;
    procedure AQ129AfterOpen(DataSet: TDataSet);
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses main;

{$R *.dfm}

procedure Tdm.AQ129AfterOpen(DataSet: TDataSet);
var
 amount_bamt,amount_amt:currency;
begin
 amount_bamt:=0;
 amount_amt:=0;
 aq129.DisableControls;
 datasource1.DataSet:=nil;
 aq129.First;
 while not aq129.Eof do
  begin
   if dm.AQ129STATUS.Value<>3 then
   begin
   amount_bamt:=amount_bamt+aq129amount_bamt.Value;
   amount_amt:=amount_amt+aq129amount.Value;
   end;
   aq129.Next;
  end;
 AQ129.First;
 datasource1.DataSet:=dm.aq129;
 aq129.EnableControls;
 form1.Edit2.Text:=floattostrf(amount_bamt,ffNumber,12,2);
 form1.Edit3.Text:=floattostrf(amount_amt,ffNumber,12,2);
end;

procedure Tdm.Aqd106CalcFields(DataSet: TDataSet);
begin
self.Aqd106gl_desc.Value:=self.AQD106GL_DESCRIPTION.Value;
if self.Aqd106father_desc.Value<>'' then
begin
 self.Aqd106gl_desc.Value:=self.Aqd106father_desc.Value+'-'+
                           self.Aqd106gl_desc.Value;
 if self.Aqd106grandfather_desc.Value<>'' then
  self.Aqd106gl_desc.Value:=self.Aqd106grandfather_desc.Value+'-'+
                            self.Aqd106gl_desc.Value;
end;
self.Aqd106gl_desc.Value:=trim(self.Aqd106GL_ACC_NUMBER.Value)+'-'+
                          self.Aqd106gl_desc.Value;
end;

end.
