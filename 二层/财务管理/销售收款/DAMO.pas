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
    aqd114CUST_CODE: TStringField;
    aqd114CUSTOMER_NAME: TStringField;
    aqd114ABBR_NAME: TStringField;
    aqd114TTYPE: TWordField;
    aqd114AMOUNT: TFloatField;
    DataSource1: TDataSource;
    aqd114v_ttype: TStringField;
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
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    ado116: TADOQuery;
    ado116RKEY: TAutoIncField;
    ado116MEMO_NUMBER: TStringField;
    ado116CUST_PTR: TIntegerField;
    ado116SRCE_PTR: TIntegerField;
    ado116MEMO_TP: TSmallintField;
    ado116EMPL_PTR: TIntegerField;
    ado116MEMO_DATE: TDateTimeField;
    ado116AMOUNT: TFloatField;
    ado116AVL_AMT: TFloatField;
    ado116EX_RATE: TFloatField;
    ado116REF_NUMBER: TStringField;
    ado116DESCRIPTION: TStringField;
    ado116CURRENCY_PTR: TIntegerField;
    ado116RMA_DATE: TDateTimeField;
    aqd114bal_amount: TFloatField;
    Aqd105: TADODataSet;
    Aqd105rkey: TIntegerField;
    Aqd105VOUCHER: TStringField;
    Aqd105EMPLOYEE_NAME: TStringField;
    Aqd105FYEAR: TIntegerField;
    Aqd105PERIOD: TSmallintField;
    Aqd105ATTACHED: TSmallintField;
    Aqd105ENTERED_DT: TDateTimeField;
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
    aqd115_112: TADODataSet;
    aqd115_112invoice_number: TStringField;
    aqd115_112INVOICE_TOTAL: TBCDField;
    aqd115_112RKEY: TIntegerField;
    aqd115_112EXCHANGE_RATE: TFloatField;
    aqd115_112yisou: TFloatField;
    aqd115_112yinsou: TFloatField;
    aqd115_112AMOUNT: TFloatField;
    aqd115_112APPL_CASH_DISC: TFloatField;
    aqd115_116: TADODataSet;
    aqd115_116MEMO_NUMBER: TStringField;
    aqd115_116REF_NUMBER: TStringField;
    aqd115_116RMA_DATE: TDateTimeField;
    aqd115_116AMOUNT: TBCDField;
    aqd115_116avl_amount: TFloatField;
    aqd115_116EX_RATE: TFloatField;
    aqd115_116amount_115: TFloatField;
    aqd115_116RKEY: TIntegerField;
    aqd115_116type: TStringField;
    Aqd508: TADODataSet;
    Aqd508CURR_FYEAR: TIntegerField;
    Aqd508CURR_PERIOD: TSmallintField;
    aqd115_112INVOICE_DATE: TDateTimeField;
    aqd114stand_amount: TFloatField;
    Aqd106GL_ACC_NUMBER: TStringField;
    Aqd106GL_DESCRIPTION: TStringField;
    Aqd106father_desc: TStringField;
    Aqd106grandfather_desc: TStringField;
    aqd114empl_ptr: TIntegerField;
    ado114trans_pl: TWordField;
    ado114PO_NUMBER: TStringField;
    ado114MANU_PART_NUMBER: TStringField;
    ado114all_shipqty: TIntegerField;
    aqd114PO_NUMBER: TStringField;
    aqd114MANU_PART_NUMBER: TStringField;
    aqd114all_shipqty: TIntegerField;
    aqd114remark: TStringField;
    ado116memo_status: TWordField;
    ado116GL_HEADER_PTR: TIntegerField;
    ado116GLPTR_STATUS: TBooleanField;
    aqd114DEBIT_AMOUNT: TFloatField;
    aqd114dz_amount: TFloatField;
    Aqd106price: TBCDField;
    ado114warehouse_ptr: TIntegerField;
    aqd114warehouse_code: TStringField;
    aqd114abbrname15: TStringField;
    ado116warehouse_ptr: TIntegerField;
    aqd114sales_rep_name: TStringField;
    ado116GOODS_AMT: TBCDField;
    ado116SHIPPING: TBCDField;
    ado116TOOLING_CHARGE: TBCDField;
    ado116RUSH_CHARGE: TBCDField;
    ado116FED_TAX: TBCDField;
    aqd114FED_TAX_ID_NO: TStringField;
    ado114IF_VOUCHER: TBooleanField;
    aqd114ANALYSIS_CODE4: TStringField;
    aqd114ANALYSIS_CODE5: TStringField;
    procedure aqd114AfterOpen(DataSet: TDataSet);
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetServerDate:String;
    function rkey105Exists(rkey114:Integer):boolean;
    function Get_Bank_gl_acct_ptr_by_rkey(rkey:String):integer;//获取银行的科目
    function Get_Cust_acc_gl_ptr_by_rkey(rkey:String):integer;//获取客户总账科目
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

function TDM.GetServerDate: String;
var
  Sql:string;
  aqTmp:TAdoQuery;
begin
  aqTmp:= TadoQuery.Create(self);
  try
    aqTmp.Connection:=ADOConnection1;
    aqTmp.Close;
    aqTmp.SQL.Add('select convert(datetime,convert(varchar,getdate(),101))');
    aqTmp.Open;
    result:=aqTmp.Fields[0].AsString;
  finally
    aqTmp.Free;
  end;
end;

function TDM.rkey105Exists(rkey114: Integer): boolean;
var
  AQTmp:TADOQuery;
begin
  if rkey114=0 then
    result:=false
  else
  begin
    AQTmp:=TADOQuery.Create(Self);
    try
      AQTmp.Connection:=DM.ADOConnection1;
      AQTmp.SQL.Text:='select 1 from data0105 where Data0105.TRANS_TYPE = 6 and Data0105.SOURCE_PTR='+IntToStr(rkey114);
      AQTmp.Open;
      Result:=AQTmp.IsEmpty=false;
    finally
      AQTmp.free;
    end;
  end;
end;

function TDM.Get_Bank_gl_acct_ptr_by_rkey(rkey: String): integer;
var
  AdoQuery:TAdoQuery;
begin
  if rkey='' then
    result:=0
  else
  begin
    AdoQuery:=TAdoQuery.create(self);
    try
      AdoQuery.Connection:=DM.ADOConnection1;
      AdoQuery.SQL.Text:=' select gl_acct_ptr from data0128 where rkey='+rkey;
      AdoQuery.open;
      Result:=AdoQuery.Fields[0].AsInteger;
    finally
      AdoQuery.Free;
    end;
  end;
end;

function TDM.Get_Cust_acc_gl_ptr_by_rkey(rkey: String): integer;
var
  AdoQuery:TAdoQuery;
begin
  if rkey='' then
    result:=0
  else
  begin
    AdoQuery:=TAdoQuery.create(self);
    try
      AdoQuery.Connection:=DM.ADOConnection1;
      AdoQuery.SQL.Text:=' select ACC_REC_PTR from data0010 where rkey='+rkey;
      AdoQuery.open;
      Result:=AdoQuery.Fields[0].AsInteger;
    finally
      AdoQuery.Free;
    end;
  end;
end;

end.
