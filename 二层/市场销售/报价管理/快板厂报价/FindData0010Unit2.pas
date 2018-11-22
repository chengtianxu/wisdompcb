unit FindData0010Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFindUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFindData0010Form2 = class(TBaseFindForm1)
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1CUST_CODE: TStringField;
    ADOStoredProc1CUSTOMER_NAME: TStringField;
    ADOStoredProc1ABBR_NAME: TStringField;
    ADOStoredProc1BILLING_ADDRESS_1: TStringField;
    ADOStoredProc1BILLING_ADDRESS_2: TStringField;
    ADOStoredProc1BILLING_ADDRESS_3: TStringField;
    ADOStoredProc1STATE: TStringField;
    ADOStoredProc1ZIP: TStringField;
    ADOStoredProc1PHONE: TStringField;
    ADOStoredProc1FAX: TStringField;
    ADOStoredProc1TELEX: TStringField;
    ADOStoredProc1SALES_REP_PTR: TIntegerField;
    ADOStoredProc1CURRENCY_PTR: TIntegerField;
    ADOStoredProc1QUOTE_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1PACKSLP_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1ORDRACK_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1CRDTMEM_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1STATMNT_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1OPENORD_NOTE_PAD_PTR: TIntegerField;
    ADOStoredProc1CONTACT_NAME_1: TStringField;
    ADOStoredProc1CONTACT_NAME_2: TStringField;
    ADOStoredProc1CONTACT_NAME_3: TStringField;
    ADOStoredProc1CONTACT_NAME_4: TStringField;
    ADOStoredProc1CONTACT_NAME_5: TStringField;
    ADOStoredProc1CONTACT_NAME_6: TStringField;
    ADOStoredProc1CONT_PHONE_1: TStringField;
    ADOStoredProc1CONT_PHONE_2: TStringField;
    ADOStoredProc1CONT_PHONE_3: TStringField;
    ADOStoredProc1CONT_PHONE_4: TStringField;
    ADOStoredProc1CONT_PHONE_5: TStringField;
    ADOStoredProc1CONT_PHONE_6: TStringField;
    ADOStoredProc1FED_TAX_ID_NO: TStringField;
    ADOStoredProc1COFC_FILENAME: TStringField;
    ADOStoredProc1COD_FLAG: TStringField;
    ADOStoredProc1REG_TAX_FIXED_UNUSED: TStringField;
    ADOStoredProc1DISCOUNT_PCT: TBCDField;
    ADOStoredProc1HIGH_BALANCE: TFloatField;
    ADOStoredProc1CREDIT_LIMIT: TFloatField;
    ADOStoredProc1CREDIT_RATING: TWordField;
    ADOStoredProc1BALANCE_DUE: TFloatField;
    ADOStoredProc1OUTSTANDING_CREDIT: TFloatField;
    ADOStoredProc1DISCOUNT_DAYS: TSmallintField;
    ADOStoredProc1CURRENT_BOOKINGS: TFloatField;
    ADOStoredProc1NET_PAY: TSmallintField;
    ADOStoredProc1LAST_ACTIVE_DATE: TDateTimeField;
    ADOStoredProc1LANGUAGE_FLAG: TStringField;
    ADOStoredProc1BILLING_ADDRESS_4: TStringField;
    ADOStoredProc1COUNTRY_PTR: TIntegerField;
    ADOStoredProc1INTERNAL_ECN_COUNT: TSmallintField;
    ADOStoredProc1EXTERNAL_ECN_COUNT: TSmallintField;
    ADOStoredProc1OUTGOING_FORM_NAME: TStringField;
    ADOStoredProc1OUTGOING_FORM_ADDR1: TStringField;
    ADOStoredProc1OUTGOING_FORM_ADDR2: TStringField;
    ADOStoredProc1OUTGOING_FORM_ADDR3: TStringField;
    ADOStoredProc1ANALYSIS_CODE1: TStringField;
    ADOStoredProc1ANALYSIS_CODE2: TStringField;
    ADOStoredProc1ANALYSIS_CODE3: TStringField;
    ADOStoredProc1CUST_ENT_DATE: TDateTimeField;
    ADOStoredProc1EDI_ID: TStringField;
    ADOStoredProc1EDI_FLAG_FOR_SOACK: TSmallintField;
    ADOStoredProc1EDI_FLAG_FOR_INVOICE: TSmallintField;
    ADOStoredProc1EDI_FLAG_CREDIT_MEMO: TSmallintField;
    ADOStoredProc1GEN_EMAIL_ADDRESS: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT1: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT2: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT3: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT4: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT5: TStringField;
    ADOStoredProc1EMAIL_FOR_CONTACT6: TStringField;
    ADOStoredProc1ACC_REC_PTR: TIntegerField;
    ADOStoredProc1CONSUME_FORECASTS: TWordField;
    ADOStoredProc1BACKWARD_DAYS: TIntegerField;
    ADOStoredProc1FORWARD_DAYS: TIntegerField;
    ADOStoredProc1PLANNING_HORIZON: TIntegerField;
    ADOStoredProc1RAW_HORIZON: TIntegerField;
    ADOStoredProc1VISIBILITY_HORIZON: TIntegerField;
    ADOStoredProc1DAYS_EARLY_SCHEDULE: TIntegerField;
    ADOStoredProc1APPLY_IN_TRANSIT: TWordField;
    ADOStoredProc1CUSTOMER_TYPE: TIntegerField;
    ADOStoredProc1DO_SMOOTHING: TWordField;
    ADOStoredProc1SMOOTHING_THRESHOLD: TIntegerField;
    ADOStoredProc1ANALYSIS_CODE4: TStringField;
    ADOStoredProc1ANALYSIS_CODE5: TStringField;
    ADOStoredProc1EDI_OUT_FOR_SOACK: TWordField;
    ADOStoredProc1EDI_OUT_FOR_INVOICE: TWordField;
    ADOStoredProc1EDI_OUT_FOR_CRMEMO: TWordField;
    ADOStoredProc1EDI_OUT_FOR_PACKSL: TWordField;
    ADOStoredProc1EDI_IN_FORCST_MAN: TWordField;
    ADOStoredProc1EDI_IN_FORCST_AUT: TWordField;
    ADOStoredProc1EDI_IN_SONEW_MAN: TWordField;
    ADOStoredProc1EDI_IN_SONEW_AUT: TWordField;
    ADOStoredProc1EDI_IN_LOGGING: TWordField;
    ADOStoredProc1EDI_IN_ADD_CUSTPART: TWordField;
    ADOStoredProc1EDI_IN_PROD_CODE_PTR: TIntegerField;
    ADOStoredProc1quote_factor: TFloatField;
    ADOStoredProc1QUOTE_FACTOR1: TFloatField;
    ADOStoredProc1REP_EVAL: TStringField;
    ADOStoredProc1MAK_EVAL: TStringField;
    ADOStoredProc1FIN_EVAL: TStringField;
    ADOStoredProc1MARMANG_EVAL: TStringField;
    ADOStoredProc1REP_CREDIT: TFloatField;
    ADOStoredProc1MAK_CREDIT: TFloatField;
    ADOStoredProc1FIN_CREDIT: TFloatField;
    ADOStoredProc1MARMANG_CREDIT: TFloatField;
    ADOStoredProc1REP_HIGH: TFloatField;
    ADOStoredProc1MAK_HIGH: TFloatField;
    ADOStoredProc1FIN_HIGH: TFloatField;
    ADOStoredProc1MARMANG_HIGH: TFloatField;
    ADOStoredProc1REP_NAME: TStringField;
    ADOStoredProc1MAK_NAME: TStringField;
    ADOStoredProc1FIN_NAME: TStringField;
    ADOStoredProc1MARMANG_NAME: TStringField;
    ADOStoredProc1REP_DATE: TDateTimeField;
    ADOStoredProc1MAK_DATE: TDateTimeField;
    ADOStoredProc1FIN_DATE: TDateTimeField;
    ADOStoredProc1MARMANG_DATE: TDateTimeField;
    ADOStoredProc1HOUSE_FIXED: TStringField;
    ADOStoredProc1FIXED_SCOPE: TStringField;
    ADOStoredProc1SALES_DISCOUNT: TBCDField;
    ADOStoredProc1MONTH_AMOUNT: TFloatField;
    ADOStoredProc1MONTH_PCBAMOUNT: TFloatField;
    ADOStoredProc1CAPITAL: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                          Column: TColumnEh);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindData0010Form2: TFindData0010Form2;

implementation

{$R *.dfm}

procedure TFindData0010Form2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edit1.Text := '' ;
end;

procedure TFindData0010Form2.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'CUST_CODE');
end;

procedure TFindData0010Form2.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure TFindData0010Form2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;
  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,ADOStoredProc1);
  Label1.Caption :=self.vColumn1.Title.Caption;

end;

procedure TFindData0010Form2.Button1Click(Sender: TObject);
begin
  if  ADOStoredProc1.RecordCount > 0 then
       inherited;
end;

end.
