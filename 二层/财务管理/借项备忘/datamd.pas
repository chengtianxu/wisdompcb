unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
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
    aq132: TADODataSet;
    aq132RKEY: TIntegerField;
    aq132MEMO_NUMBER: TStringField;
    aq132CODE: TStringField;
    aq132ABBR_NAME: TStringField;
    aq132AMOUNT: TBCDField;
    aq132AVL_AMT: TBCDField;
    aq132MEMO_DATE: TDateTimeField;
    aq132MEMO_TP: TSmallintField;
    aq132REF_NUMBER: TStringField;
    aq132EX_RATE: TFloatField;
    aq132CURR_CODE: TStringField;
    aq132CURR_NAME: TStringField;
    aq132EMPLOYEE_NAME: TStringField;
    aq132MATL_TOT: TBCDField;
    aq132MISC_TOT: TBCDField;
    aq132FED_TAX: TBCDField;
    aq132SUPPLIER_NAME: TStringField;
    aq132SUPP_PTR: TIntegerField;
    aq132CURRENCY_PTR: TIntegerField;
    aq132ENT_DATE: TDateTimeField;
    aq132VOUCHER: TStringField;
    aq132rkey105: TIntegerField;
    aq132STATUS: TSmallintField;
    aq132DSDesigner: TStringField;
    aq132v_type: TStringField;
    aq132stand_amount: TFloatField;
    aq132stand_avlamount: TFloatField;
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
    aq210: TADODataSet;
    aq210GRN_NUMBER: TStringField;
    aq210DELIVER_NUMBER: TStringField;
    aq210INV_NAME: TStringField;
    aq210INV_DESCRIPTION: TStringField;
    aq210TDATE: TDateTimeField;
    aq210QUANTITY: TFloatField;
    aq210UNIT_NAME: TStringField;
    aq210PRICE: TBCDField;
    aq210TAX_2: TBCDField;
    aq210RKEY: TIntegerField;
    DataSource2: TDataSource;
    aq210employee_name: TStringField;
    aq132ACC_PAYABLE_PTR: TIntegerField;
    aq132empl_ptr: TIntegerField;
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
    ADO132memo_status: TWordField;
    aq132memo_status: TWordField;
    aq132DSDesigner2: TStringField;
    aq132abbr_name_1: TStringField;
    aq132warehouse_ptr: TIntegerField;
    ADO132warehouse_ptr: TIntegerField;
    aq132warehouse_code: TStringField;
    Aqd106price: TBCDField;
    aq132GLPTR_STATUS: TBooleanField;
    procedure aq132AfterOpen(DataSet: TDataSet);
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

procedure Tdm.aq132AfterOpen(DataSet: TDataSet);
var
 total_bamt,total_avlamt,total_stanavlamt,total_amount:currency;
begin
 total_bamt:=0;
 total_amount:=0;
 total_avlamt:=0;
 total_stanavlamt:=0;
 self.aq132.DisableControls;
 datasource1.DataSet:=nil;
 aq132.First;
 while not aq132.Eof do
  begin
   if self.aq132memo_status.Value<>3 then
   begin
    total_bamt:=total_bamt+self.aq132AMOUNT.Value;
    total_amount:=total_amount+self.aq132stand_amount.Value;
    total_avlamt:=total_avlamt+self.aq132AVL_AMT.Value;
    total_stanavlamt:=total_stanavlamt+self.aq132stand_avlamount.Value;
   end;
   aq132.Next;
  end;
 aq132.First;
 datasource1.DataSet:=self.aq132;
 self.aq132.EnableControls;
 form1.Label3.Caption:=Formatfloat('#,##0.00',total_bamt);
 form1.Label5.Caption:=Formatfloat('#,##0.00',total_amount);
 form1.Label7.Caption:=Formatfloat('#,##0.00',total_avlamt);
 form1.Label8.Caption:=Formatfloat('#,##0.00',total_stanavlamt);  
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
