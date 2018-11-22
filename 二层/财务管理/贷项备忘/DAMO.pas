unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    aqd116: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ado116: TADOQuery;
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
    ado116RKEY: TAutoIncField;
    ado116MEMO_NUMBER: TStringField;
    ado116CUST_PTR: TIntegerField;
    ado116SRCE_PTR: TIntegerField;
    ado116MEMO_TP: TSmallintField;
    ado116EMPL_PTR: TIntegerField;
    ado116MEMO_DATE: TDateTimeField;
    ado116AMOUNT: TBCDField;
    ado116AVL_AMT: TBCDField;
    ado116GOODS_AMT: TBCDField;
    ado116SHIPPING: TBCDField;
    ado116TOOLING_CHARGE: TBCDField;
    ado116RUSH_CHARGE: TBCDField;
    ado116FED_TAX: TBCDField;
    ado116EX_RATE: TFloatField;
    ado116REF_NUMBER: TStringField;
    ado116DESCRIPTION: TStringField;
    ado116CURRENCY_PTR: TIntegerField;
    ado116RMA_DATE: TDateTimeField;
    aqd116MEMO_NUMBER: TStringField;
    aqd116VOUCHER: TStringField;
    aqd116CURR_CODE: TStringField;
    aqd116CURR_NAME: TStringField;
    aqd116EX_RATE: TFloatField;
    aqd116AMOUNT: TBCDField;
    aqd116AVL_AMT: TBCDField;
    aqd116MEMO_DATE: TDateTimeField;
    aqd116RMA_DATE: TDateTimeField;
    aqd116CUST_CODE: TStringField;
    aqd116CUSTOMER_NAME: TStringField;
    aqd116ABBR_NAME: TStringField;
    aqd116EMPL_CODE: TStringField;
    aqd116EMPLOYEE_NAME: TStringField;
    aqd116REF_NUMBER: TStringField;
    aqd116STATUS: TSmallintField;
    aqd116v_status: TStringField;
    aqd116ttype_116: TStringField;
    aqd116rkey: TIntegerField;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    aqd116GOODS_AMT: TBCDField;
    aqd116TOOLING_CHARGE: TBCDField;
    aqd116SHIPPING: TBCDField;
    aqd116FED_TAX: TBCDField;
    aqd116memo_tp: TSmallintField;
    aqd116stand_amount: TFloatField;
    aqd116stand_avlamount: TFloatField;
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
    aqd116EMPL_PTR: TIntegerField;
    ado116memo_status: TWordField;
    aqd116DSDesigner: TStringField;
    aqd116memo_status: TWordField;
    tmp: TADOQuery;
    aqd116DESCRIPTION: TStringField;
    aqd116GL_HEADER_PTR: TIntegerField;
    aqd116GLPTR_STATUS: TBooleanField;
    ado116GL_HEADER_PTR: TIntegerField;
    ado116GLPTR_STATUS: TBooleanField;
    Aqd106PRICE: TBCDField;
    ado116warehouse_ptr: TIntegerField;
    aqd116warehouse_code: TStringField;
    aqd116abbrname15: TStringField;
    procedure aqd116AfterOpen(DataSet: TDataSet);
    procedure Aqd106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   fincontrol1:string;
   function return_VOUCHER(rkey116: integer): string;
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}
function TDM.return_VOUCHER(rkey116: integer): string;
begin
result:='';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='SELECT  top 1 Data0105.VOUCHER'+#13+
   'FROM  Data0131 INNER JOIN'+#13+
   ' data0116 ON Data0131.DEBIT_PTR = data0116.rkey INNER JOIN'+#13+
   ' Data0105 ON Data0131.GL_HEADER_PTR = Data0105.RKEY'+#13+
   ' where Data0131.DEBIT_PTR=' +inttostr(rkey116);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('VOUCHER').AsString;
     exit;
    end;
  end;        //销售开票(无退货)

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='SELECT  top 1 Data0162.cut_date'+#13+
   'FROM  Data0163 INNER JOIN'+#13+
   ' Data0162 ON Data0163.HEADER_PTR = Data0162.RKEY'+#13+
   ' where Data0163.DEBIT_PTR=' +inttostr(rkey116);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('cut_date').AsString;
     exit;
    end;
  end;      //发出商品截数无退货

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:= 'SELECT  top 1 dbo.Data0105.VOUCHER'+#13+
    'FROM dbo.DATA0131 INNER JOIN'+#13+
    'dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+#13+
    'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY '+#13+
   ' where Data0098.srce_ptr=' +inttostr(rkey116);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('VOUCHER').AsString;
     exit;
    end;
  end;           //销售开票(退货)

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:= 'SELECT  top 1 Data0162.cut_date'+#13+
    'FROM dbo.DATA0163 INNER JOIN'+#13+
    'dbo.Data0162 ON dbo.DATA0163.HEADER_PTR = dbo.Data0162.RKEY INNER JOIN'+#13+
    'dbo.Data0098 ON dbo.DATA0163.RMA_PTR = dbo.Data0098.RKEY '+#13+
    'where Data0098.srce_ptr='+inttostr(rkey116);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('cut_date').AsString;
     exit;
    end;
  end;           //发出商品(退货)

end;

procedure TDM.aqd116AfterOpen(DataSet: TDataSet);
var
 total_bamt,total_avlamt,total_stanavlamt,total_amount:currency;
begin
 total_bamt:=0;
 total_amount:=0;
 total_avlamt:=0;
 total_stanavlamt:=0;
 self.Aqd116.DisableControls;
 datasource1.DataSet:=nil;
 aqd116.First;
 while not aqd116.Eof do
  begin
   if dm.aqd116memo_status.Value<>3 then
   begin
   total_bamt:=total_bamt+self.aqd116AMOUNT.Value;
   total_amount:=total_amount+self.aqd116stand_amount.Value;
   total_avlamt:=total_avlamt+self.aqd116AVL_AMT.Value;
   total_stanavlamt:=total_stanavlamt+self.aqd116stand_avlamount.Value;
   end;
   aqd116.Next;
  end;
 aqd116.First;
 datasource1.DataSet:=self.Aqd116;
 self.Aqd116.EnableControls;
 form1.Label3.Caption:=Formatfloat('#,##0.00',total_bamt);
 form1.Label5.Caption:=Formatfloat('#,##0.00',total_amount);
 form1.Label7.Caption:=Formatfloat('#,##0.00',total_avlamt);
 form1.Label8.Caption:=Formatfloat('#,##0.00',total_stanavlamt);
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
