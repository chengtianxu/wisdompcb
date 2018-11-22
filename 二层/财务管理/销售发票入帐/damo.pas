unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AqD112: TADODataSet;
    DataSource1: TDataSource;
    AqD112RKEY: TIntegerField;
    AqD112invoice_number: TStringField;
    AqD112INVOICE_DATE: TDateTimeField;
    AqD112INVOICE_STATUS: TWordField;
    AqD112sales_order_ptr: TIntegerField;
    AqD112CUST_CODE: TStringField;
    AqD112CUSTOMER_NAME: TStringField;
    AqD112CUSTOMER_PTR: TIntegerField;
    AqD112SALES_ORDER: TStringField;
    AqD112INVOICE_TOTAL: TBCDField;
    AqD112CURR_CODE: TStringField;
    AqD112STATUS: TSmallintField;
    AqD112ABBR_NAME: TStringField;
    AqD112CURR_NAME: TStringField;
    AqD112EXCHANGE_RATE: TFloatField;
    AqD112VOUCHER: TStringField;
    AqD112EMPLOYEE_NAME: TStringField;
    AqD112TYPE: TStringField;
    AqD112v_status: TStringField;
    AqD112DSDesigner: TBCDField;
    ADOQuery1: TADOQuery;
    AqD112DSDesigner2: TStringField;
    ADO112: TADOQuery;
    ADO112RKEY: TAutoIncField;
    ADO112invoice_number: TStringField;
    ADO112sales_order_ptr: TIntegerField;
    ADO112EMPL_PTR: TIntegerField;
    ADO112CSI_USER_PTR: TIntegerField;
    ADO112CUSTOMER_PTR: TIntegerField;
    ADO112INVOICE_DATE: TDateTimeField;
    ADO112INVOICE_STATUS: TWordField;
    ADO112SHIPPING_CHARGES: TBCDField;
    ADO112FED_TAX_AMOUNT: TBCDField;
    ADO112TOOLING_CHARGES: TBCDField;
    ADO112DISCOUNT_AMOUNT: TBCDField;
    ADO112INVOICE_TOTAL: TBCDField;
    ADO112amount_paid: TBCDField;
    ADO112CASH_DISC: TBCDField;
    ADO112amount_credited: TBCDField;
    ADO112EXCHANGE_RATE: TFloatField;
    ADO112MISC_INV_DESCRIPTION: TStringField;
    ADO112COMMISION_PROCESSED: TStringField;
    ADO112STATE_SHIP_TAX_FLAG: TStringField;
    ADO112ship_tax: TBCDField;
    ADO112ship_tax_amount: TBCDField;
    ADO112PERIOD_POSTED: TSmallintField;
    ADO112POSTED_DATE: TDateTimeField;
    ADO112RUSH_CHARGE_AMOUNT: TBCDField;
    ADO112OVERSHIP_AMOUNT: TBCDField;
    ADO112ship_amount: TBCDField;
    ADO112CURRENCY_PTR: TIntegerField;
    ADO112ANALYSIS_CODE_1: TStringField;
    ADO112ANALYSIS_CODE_2: TStringField;
    ADO112ANALYSIS_CODE_3: TStringField;
    ADO112ANALYSIS_CODE_4: TStringField;
    ADO112ANALYSIS_CODE_5: TStringField;
    ADO112discount_pct: TBCDField;
    ADO112discount_days: TSmallintField;
    ADO112net_pay: TSmallintField;
    DataSource2: TDataSource;
    ADO112DUE_DATE: TDateTimeField;
    ADOD04: TADODataSet;
    ADOD04CONTROL_NO_LENGTH: TSmallintField;
    ADOD04SEED_VALUE: TStringField;
    ADOD04SEED_FLAG: TWordField;
    ADOD64: TADODataSet;
    ADOD64SALES_ORDER: TStringField;
    ADOD64part_price: TFloatField;
    ADOD64TAX_2: TBCDField;
    ADOD64PO_NUMBER: TStringField;
    ADOD64PO_DATE: TDateTimeField;
    ADOD64SCH_DATE: TDateTimeField;
    ADOD64QUAN_SHIPPED: TIntegerField;
    ADOD64ovsh_qty: TIntegerField;
    ADOD64ovsh_discount: TBCDField;
    ADOD64discount: TBCDField;
    ADOD64tax_in_price: TStringField;
    ADOD64ENT_DATE: TDateTimeField;
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
    ADO106QUANTITY: TFloatField;
    ADO106EXCH_RATE: TFloatField;
    Aqd105: TADODataSet;
    Aqd105rkey: TIntegerField;
    Aqd105VOUCHER: TStringField;
    Aqd105EMPLOYEE_NAME: TStringField;
    Aqd105FYEAR: TIntegerField;
    Aqd105PERIOD: TSmallintField;
    Aqd105ATTACHED: TSmallintField;
    Aqd105ENTERED_DT: TDateTimeField;
    ADOD64SO_PTR: TIntegerField;
    ADOD64rkey: TAutoIncField;
    ADO65: TADOQuery;
    ADO65RKEY: TAutoIncField;
    ADO65INVOICE_PTR: TIntegerField;
    ADO65ADDL_CATEGORY_PTR: TIntegerField;
    ADO65AMOUNT: TFloatField;
    ADO65TAXABLE_FLAG: TStringField;
    ADO65COMMISSION_FLAG: TStringField;
    ADO65FREE_AMOUNT: TBCDField;
    AqD112ACC_REC_PTR: TIntegerField;
    ADO112INVOICE_TYPE: TWordField;
    AqD112invoice_type: TWordField;
    AqD112total_amount: TFloatField;
    Aqd508: TADODataSet;
    Aqd508CURR_FYEAR: TIntegerField;
    Aqd508CURR_PERIOD: TSmallintField;
    AqD112rkey105: TIntegerField;
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
    ADOD64packing_list_ptr: TIntegerField;
    AqD112empl_ptr: TIntegerField;
    ADOD64MANU_PART_NUMBER: TStringField;
    ADOD64MANU_PART_DESC: TStringField;
    AqD112POSTED_DATE: TDateTimeField;
    ADO112GLPTR_STATUS: TBooleanField;
    AqD112GLPTR_STATUS: TBooleanField;
    Aqd106PRICE: TBCDField;
    ADO112warehouse_ptr: TIntegerField;
    AqD112abbrname15: TStringField;
    AqD112WAREHOUSE_CODE: TStringField;
    AqD112REG_TAX_FIXED_UNUSED: TStringField;
    AqD112FED_TAX_ID_NO: TStringField;
    procedure AqD112CalcFields(DataSet: TDataSet);
    procedure AqD112AfterOpen(DataSet: TDataSet);
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   fincontrol1:string; 
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.AqD112CalcFields(DataSet: TDataSet);
begin
if (AqD112invoice_type.Value=1)then
 aqd112type.Value:='标准发票'
else
 if (AqD112invoice_type.Value=2) then
  aqd112type.Value:='工具发票'
 else
  aqd112type.Value:='杂项发票';

case self.AqD112STATUS.Value of
 0:self.AqD112v_status.Value:='未审核';
 1:self.AqD112v_status.Value:='会计已审';
 2:self.AqD112v_status.Value:='主管已审';
 3:self.AqD112v_status.Value:='已登帐';
 4:self.AqD112v_status.Value:='出纳已审';
 5:self.AqD112v_status.Value:='被作废';
end;

end;

procedure TDM.AqD112AfterOpen(DataSet: TDataSet);
var
 total_bamt,total_amount:currency;
begin
 total_bamt:=0;
 total_amount:=0;
 self.Aqd112.DisableControls;
 datasource1.DataSet:=nil;
 aqd112.First;
 while not aqd112.Eof do
  begin
   if dm.AqD112INVOICE_STATUS.Value<>3 then
   begin
   total_bamt:=total_bamt+self.Aqd112invoice_total.Value;
   total_amount:=total_amount+self.AqD112total_amount.Value;
   end;
   aqd112.Next;
  end;
 aqd112.First;
 datasource1.DataSet:=self.Aqd112;
 self.Aqd112.EnableControls;
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
