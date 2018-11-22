unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOSP04: TADOStoredProc;
    ADOSP04CONTROL_NO_LENGTH: TSmallintField;
    ADOSP04SEED_VALUE: TStringField;
    ADOSP04SEED_FLAG: TWordField;
    aq22: TADOQuery;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22QUANTITY: TBCDField;
    aq22UNIT_NAME: TStringField;
    aq22TAX_2: TBCDField;
    aq22amount: TBCDField;
    aq22tax_amount: TBCDField;
    aq22GRN_PTR: TIntegerField;
    aq22RKEY: TIntegerField;
    aq22SOURCE_PTR: TIntegerField;
    ADO107: TADOQuery;
    ADO107INVOICE_NO: TStringField;
    ADO107SUPP_PTR: TIntegerField;
    ADO107CURRENCY_PTR: TIntegerField;
    ADO107EMPL_PTR: TIntegerField;
    ADO107STATUS: TWordField;
    ADO107INV_TOTAL: TBCDField;
    ADO107MATL_TOT: TBCDField;
    ADO107FED_TAX: TBCDField;
    ADO107MISC_TOT: TBCDField;
    ADO107INV_DATE: TDateTimeField;
    ADO107ENT_DATE: TDateTimeField;
    ADO107DUE_DATE: TDateTimeField;
    ADO107tax_invoice_amt: TBCDField;
    ADO107tax_invoice_date: TDateTimeField;
    ADO107tax_invoice_ref: TStringField;
    ADO107rkey: TAutoIncField;
    ADOQuery2: TADOQuery;
    ADOupdate70: TADOQuery;
    ADOupmc70: TADOQuery;
    ADOQuery3: TADOQuery;
    Aq107: TADODataSet;
    Aq107RKEY: TIntegerField;
    Aq107CODE: TStringField;
    Aq107ABBR_NAME: TStringField;
    Aq107INVOICE_NO: TStringField;
    Aq107CURR_NAME: TStringField;
    Aq107INV_DATE: TDateTimeField;
    Aq107EMPLOYEE_NAME: TStringField;
    Aq107EX_RATE: TFloatField;
    Aq107SUPPLIER_NAME: TStringField;
    Aq107INV_TOTAL: TBCDField;
    Aq107MATL_TOT: TBCDField;
    Aq107FED_TAX: TBCDField;
    Aq107MISC_TOT: TBCDField;
    Aq107DUE_DATE: TDateTimeField;
    Aq107SUPP_PTR: TIntegerField;
    Aq107CURRENCY_PTR: TIntegerField;
    Aq107total_bamt: TFloatField;
    Aq107AMT_PAID: TBCDField;
    Aq107VOUCHER: TStringField;
    Aq107rkey105: TIntegerField;
    Aq107DSDesigner: TStringField;
    Aq107DSDesigner2: TStringField;
    Aq107DSDesigner3: TStringField;
    Aq107warehouse_ptr: TIntegerField;
    ADO107warehouse_ptr: TIntegerField;
    ADO107INV_TP: TStringField;
    Aq107inv_tp: TStringField;
    Aq107WAREHOUSE_CODE: TStringField;
    Aq107WAREHOUSE_NAME: TStringField;
    Aq107status: TWordField;
    Aq107curr_code: TStringField;
    aq235: TADOQuery;
    aq235goods_name: TStringField;
    aq235goods_guige: TStringField;
    aq235QUAN_RECD: TBCDField;
    aq235UNIT_NAME: TStringField;
    aq235unit_price: TBCDField;
    aq235state_tax: TBCDField;
    aq235GRN_PTR: TIntegerField;
    aq235D0072_PTR: TIntegerField;
    aq235RKEY: TIntegerField;
    aq235amount: TBCDField;
    aq235tax_amount: TBCDField;
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
    Aq107EMPL_PTR: TIntegerField;
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
    ADO107AMT_PAID: TBCDField;
    ADO107CASH_DISC: TBCDField;
    Aq107name15: TStringField;
    ADO107EX_RATE: TFloatField;
    Aq107GLPTR_STATUS: TBooleanField;
    ADO106PRICE: TBCDField;
    Aqd106PRICE: TBCDField;
    aq22price: TBCDField;
    Aq107DSDesigner4: TBCDField;
    ADOQuery4: TADOQuery;
    procedure Aq107AfterOpen(DataSet: TDataSet);
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

procedure Tdm.Aq107AfterOpen(DataSet: TDataSet);
var
 total_bamt,total_amt,fed_tax:double;
begin
 total_bamt:=0;
 total_amt:=0;
 fed_tax:=0;
 self.Aq107.DisableControls;
 datasource1.DataSet:=nil;
 aq107.First;
 while not aq107.Eof do
  begin
   if dm.Aq107status.Value<>3 then
   begin
    total_bamt:=total_bamt+self.Aq107total_bamt.Value;
    total_amt:=total_amt+self.Aq107INV_TOTAL.Value;
    fed_tax:=fed_tax+self.Aq107FED_TAX.Value;
   end;
   aq107.Next;
  end;
 aq107.First;
 datasource1.DataSet:=self.Aq107;
 self.Aq107.EnableControls;
 form1.Edit2.Text:=Formatfloat('#,##0.00',total_amt);
 form1.Edit3.Text:=Formatfloat('#,##0.00',total_bamt);
 form1.Edit4.Text:=Formatfloat('#,##0.00',fed_tax);
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
