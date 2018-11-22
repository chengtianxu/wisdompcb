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
    ADO521: TADOQuery;
    ADO521RKEY: TAutoIncField;
    ADO521TTYPE: TSmallintField;
    ADO521EXPENSE_TP: TStringField;
    ADO521SUMMARIZE: TStringField;
    ADO521SRCE_PTR: TIntegerField;
    ADO521AMOUNT: TBCDField;
    ADO521inex_ptr: TIntegerField;
    AQ129: TADODataSet;
    AQ129CHECK_NUMBER: TStringField;
    AQ129AMOUNT: TBCDField;
    AQ129EMPLOYEE_NAME: TStringField;
    AQ129BANK_NAME: TStringField;
    AQ129BAL_AMOUNT: TFloatField;
    AQ129EX_RATE: TFloatField;
    AQ129CURR_NAME: TStringField;
    AQ129CURR_CODE: TStringField;
    AQ129TDATE: TDateTimeField;
    AQ129RKEY: TIntegerField;
    AQ129WAREHOUSE_CODE: TStringField;
    AQ129WAREHOUSE_NAME: TStringField;
    AQ129REMARK: TStringField;
    AQ129EMPL_CODE: TStringField;
    AQ129amount_bamt: TFloatField;
    AQ129VOUCHER: TStringField;
    AQ129rkey105: TIntegerField;
    AQ129DSDesigner2: TStringField;
    AQ129status: TSmallintField;
    AQ129GL_ACCT_PTR: TIntegerField;
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
    ADO106AMOUNT: TBCDField;
    ADO106D_C: TStringField;
    ADO106FYEAR: TIntegerField;
    ADO106PERIOD: TSmallintField;
    ADO106INV_PTR: TIntegerField;
    ADO106UNIT_PTR: TIntegerField;
    ADO106CURR_PTR: TIntegerField;
    ADO106PRICE: TFloatField;
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
    AQ129DSDesigner: TStringField;
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
 amount_amt := 0;
 aq129.DisableControls;
 aq129.First;
 while not dm.aq129.Eof do
  begin
   if dm.AQ129status.Value<>3 then
   begin
   amount_bamt:=amount_bamt+aq129amount_bamt.Value;
   amount_amt:=amount_amt+aq129amount.Value;
   end;
   aq129.Next;
  end;
 aq129.First;
 aq129.EnableControls;
 form1.label3.caption:=floattostrf(amount_bamt,ffNumber,12,2);
 form1.label5.caption:=floattostrf(amount_amt,ffNumber,12,2);
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
