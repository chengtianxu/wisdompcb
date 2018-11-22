unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    aqd114: TADODataSet;
    aqd114REFERENCE_NO: TStringField;
    aqd114VOUCHER: TStringField;
    aqd114STATUS: TSmallintField;
    aqd114RKEY: TIntegerField;
    aqd114TDATE: TDateTimeField;
    aqd114status114: TWordField;
    aqd114EMPLOYEE_NAME: TStringField;
    aqd114CURR_CODE: TStringField;
    aqd114CURR_NAME: TStringField;
    aqd114EXCHANGE_RATE: TFloatField;
    aqd114BANK_NAME: TStringField;
    aqd114AMOUNT: TFloatField;
    DataSource1: TDataSource;
    aqd114v_status: TStringField;
    aqd114v_status114: TStringField;
    DataSource2: TDataSource;
    ado114: TADOQuery;
    ado114RKEY: TAutoIncField;
    ado114TTYPE: TWordField;
    ado114SRCE_PTR: TIntegerField;
    ado114REFERENCE_NO: TStringField;
    ado114TDATE: TDateTimeField;
    ado114EMPL_PTR: TIntegerField;
    ado114CSI_USER_PTR: TIntegerField;
    ado114AMOUNT: TFloatField;
    ado114EXCHANGE_RATE: TFloatField;
    ado114ENTER_DATE: TDateTimeField;
    ado114PERIOD_POSTED: TSmallintField;
    ado114POSTED_DATE: TDateTimeField;
    ado114DEBIT_AMOUNT: TFloatField;
    ado114CURRECY_PTR: TIntegerField;
    ado114BANK_PTR: TIntegerField;
    ado114STATUS: TSmallintField;
    ado114REMARK: TStringField;
    ado114pay_to: TStringField;
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
    ADO106AMOUNT: TBCDField;
    ADO106D_C: TStringField;
    ADO106INV_PTR: TIntegerField;
    ADO106UNIT_PTR: TIntegerField;
    ADO106CURR_PTR: TIntegerField;
    ADO106PRICE: TFloatField;
    ADO106EXCH_RATE: TFloatField;
    ADO106QUANTITY: TFloatField;
    ADO128: TADOQuery;
    ADO128bank_current_check: TStringField;
    ADO128bal_amount: TFloatField;
    aqd114bal_amount: TFloatField;
    Aqd105: TADODataSet;
    Aqd105rkey: TIntegerField;
    Aqd105VOUCHER: TStringField;
    Aqd105EMPLOYEE_NAME: TStringField;
    Aqd105FYEAR: TIntegerField;
    Aqd105PERIOD: TSmallintField;
    Aqd105ATTACHED: TSmallintField;
    Aqd105ENTERED_DT: TDateTimeField;
    aqd114EMPL_CODE: TStringField;
    aqd114employee_skname: TStringField;
    aqd114abbr_name: TStringField;
    Aqd508: TADODataSet;
    Aqd508CURR_FYEAR: TIntegerField;
    Aqd508CURR_PERIOD: TSmallintField;
    aqd114stand_amount: TFloatField;
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
    aqd114empl_ptr: TIntegerField;
    ado114warehouse_ptr: TIntegerField;
    aqd114warehouse_code: TStringField;
    aqd114abbrname15: TStringField;
    Aqd106PRICE: TBCDField;
    procedure aqd114AfterOpen(DataSet: TDataSet);
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.aqd114AfterOpen(DataSet: TDataSet);
var
 total_bamt,total_amount:currency;
begin
 total_bamt:=0;
 total_amount:=0;
 self.Aqd114.DisableControls;
 datasource1.DataSet:=nil;
 aqd114.First;
 while not aqd114.Eof do
  begin
   if dm.aqd114status114.Value<>3 then
   begin
   total_bamt:=total_bamt+self.aqd114AMOUNT.Value;
   total_amount:=total_amount+self.aqd114stand_amount.Value;
   end;
   aqd114.Next;
  end;
 aqd114.First;
 datasource1.DataSet:=self.Aqd114;
 self.Aqd114.EnableControls;
 form1.Label3.Caption:=Formatfloat('#,##0.00',total_bamt);
 form1.Label5.Caption:=Formatfloat('#,##0.00',total_amount);
end;


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
