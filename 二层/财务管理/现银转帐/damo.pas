unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    aqd522: TADODataSet;
    DataSource1: TDataSource;
    aqd522DSDesigner: TStringField;
    aqd522DSDesigner2: TStringField;
    aqd522DSDesigner3: TBCDField;
    aqd522DSDesigner4: TStringField;
    aqd522DSDesigner5: TStringField;
    aqd522DSDesigner6: TStringField;
    aqd522DSDesigner7: TStringField;
    aqd522TDATE: TDateTimeField;
    aqd522REMARK: TStringField;
    aqd522STATUS: TSmallintField;
    aqd522DSDesigner10: TStringField;
    aqd522RKEY: TIntegerField;
    aqd522DSDesigner11: TStringField;
    ado522: TADOQuery;
    ado522RKEY: TAutoIncField;
    ado522REF_NUMBER: TStringField;
    ado522TDATE: TDateTimeField;
    ado522EMPL_PTR: TIntegerField;
    ado522REMARK: TStringField;
    ado522STATUS: TSmallintField;
    ado522sys_ptr: TIntegerField;
    ado522check_129ptr: TIntegerField;
    ado522check_114ptr: TIntegerField;
    ado522amount: TBCDField;
    ado129: TADOQuery;
    ado114: TADOQuery;
    ado129RKEY: TAutoIncField;
    ado129CHECK_NUMBER: TStringField;
    ado129BANK_PTR: TIntegerField;
    ado129TDATE: TDateTimeField;
    ado129STATUS: TSmallintField;
    ado129TTYPE: TSmallintField;
    ado129SRCE_PTR: TIntegerField;
    ado129EMPL_PTR: TIntegerField;
    ado129AMOUNT: TBCDField;
    ado129PAY_TO: TStringField;
    ado129CURR_PTR: TIntegerField;
    ado129EX_RATE: TFloatField;
    ado129REMARK: TStringField;
    ado129warehouse_ptr: TIntegerField;
    ado114RKEY: TAutoIncField;
    ado114TTYPE: TWordField;
    ado114SRCE_PTR: TIntegerField;
    ado114REFERENCE_NO: TStringField;
    ado114TDATE: TDateTimeField;
    ado114STATUS: TWordField;
    ado114EMPL_PTR: TIntegerField;
    ado114CSI_USER_PTR: TIntegerField;
    ado114AMOUNT: TFloatField;
    ado114EXCHANGE_RATE: TFloatField;
    ado114ENTER_DATE: TDateTimeField;
    ado114DEBIT_AMOUNT: TFloatField;
    ado114CURRECY_PTR: TIntegerField;
    ado114BANK_PTR: TIntegerField;
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
    aqd522rkey105: TIntegerField;
    ADOQuery1: TADOQuery;
    aqd522REF_NUMBER: TStringField;
    aqd522DSDesigner8: TStringField;
    aqd522curr_code: TStringField;
    ado522currency_ptr: TIntegerField;
    ADOsp04: TADOStoredProc;
    ADOsp04CONTROL_NO_LENGTH: TSmallintField;
    ADOsp04SEED_VALUE: TStringField;
    ADOsp04SEED_FLAG: TWordField;
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
    ADO128: TADOQuery;
    ADO128bank_current_check: TStringField;
    ADO128bal_amount: TFloatField;
    aqd522empl_code: TStringField;
    aqd522bal_amount: TFloatField;
    aqd522putout_bal_amount: TFloatField;
    aqd522empl_ptr: TIntegerField;
    aqd522sys_ptr: TIntegerField;
    aqd522amount: TFloatField;
    ado104: TADODataSet;
    ado104RKEY: TAutoIncField;
    ado104JOURNAL_TITLE: TStringField;
    ado104DFLT_ACCT_01: TIntegerField;
    ado104DFLT_ACCT_02: TIntegerField;
    ado104DFLT_ACCT_03: TIntegerField;
    ado104DFLT_ACCT_04: TIntegerField;
    ado104DFLT_ACCT_05: TIntegerField;
    ado104DFLT_ACCT_06: TIntegerField;
    ado104DFLT_ACCT_07: TIntegerField;
    ado104DFLT_ACCT_08: TIntegerField;
    ado104DFLT_ACCT_09: TIntegerField;
    ado104DFLT_ACCT_10: TIntegerField;
    ado114warehouse_ptr: TIntegerField;
    Aqd106price: TBCDField;
    ado522warehouse_ptr: TIntegerField;
    aqd522WAREHOUSE_CODE: TStringField;
    aqd522abbrname15: TStringField;
    aqd522warehouse_ptr: TIntegerField;
    aqd522check_114ptr: TIntegerField;
    ado522exch_rate: TFloatField;
    ADO106EXCH_RATE: TFloatField;
    aqd522exch_rate: TFloatField;
    aqd522gl_banktobe_ptr: TIntegerField;
    aqd522gl_bankfrom_ptr: TIntegerField;
    aqd522currency_ptr: TIntegerField;
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.Aqd106CalcFields(DataSet: TDataSet);
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
