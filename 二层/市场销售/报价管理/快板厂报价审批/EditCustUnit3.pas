unit EditCustUnit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, DB, ADODB, StdCtrls, Buttons,Grids, DBGridEh;

type
  TEditCustForm3 = class(TBaseForm1)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    rkey1: TLabel;
    rkey2: TLabel;
    rkey0: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    CheckBox1: TCheckBox;
    BitBtn10: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1BILLING_ADDRESS_1: TStringField;
    ADOQuery1BILLING_ADDRESS_2: TStringField;
    ADOQuery1BILLING_ADDRESS_3: TStringField;
    ADOQuery1STATE: TStringField;
    ADOQuery1ZIP: TStringField;
    ADOQuery1PHONE: TStringField;
    ADOQuery1FAX: TStringField;
    ADOQuery1TELEX: TStringField;
    ADOQuery1SALES_REP_PTR: TIntegerField;
    ADOQuery1CURRENCY_PTR: TIntegerField;
    ADOQuery1QUOTE_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1INVOICE_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1PACKSLP_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1ORDRACK_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1CRDTMEM_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1STATMNT_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1OPENORD_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1CONTACT_NAME_1: TStringField;
    ADOQuery1CONTACT_NAME_2: TStringField;
    ADOQuery1CONTACT_NAME_3: TStringField;
    ADOQuery1CONTACT_NAME_4: TStringField;
    ADOQuery1CONTACT_NAME_5: TStringField;
    ADOQuery1CONTACT_NAME_6: TStringField;
    ADOQuery1CONT_PHONE_1: TStringField;
    ADOQuery1CONT_PHONE_2: TStringField;
    ADOQuery1CONT_PHONE_3: TStringField;
    ADOQuery1CONT_PHONE_4: TStringField;
    ADOQuery1CONT_PHONE_5: TStringField;
    ADOQuery1CONT_PHONE_6: TStringField;
    ADOQuery1FED_TAX_ID_NO: TStringField;
    ADOQuery1COFC_FILENAME: TStringField;
    ADOQuery1COD_FLAG: TStringField;
    ADOQuery1REG_TAX_FIXED_UNUSED: TStringField;
    ADOQuery1DISCOUNT_PCT: TBCDField;
    ADOQuery1HIGH_BALANCE: TFloatField;
    ADOQuery1CREDIT_LIMIT: TFloatField;
    ADOQuery1CREDIT_RATING: TWordField;
    ADOQuery1BALANCE_DUE: TFloatField;
    ADOQuery1OUTSTANDING_CREDIT: TFloatField;
    ADOQuery1DISCOUNT_DAYS: TSmallintField;
    ADOQuery1CURRENT_BOOKINGS: TFloatField;
    ADOQuery1NET_PAY: TSmallintField;
    ADOQuery1LAST_ACTIVE_DATE: TDateTimeField;
    ADOQuery1LANGUAGE_FLAG: TStringField;
    ADOQuery1BILLING_ADDRESS_4: TStringField;
    ADOQuery1COUNTRY_PTR: TIntegerField;
    ADOQuery1INTERNAL_ECN_COUNT: TSmallintField;
    ADOQuery1EXTERNAL_ECN_COUNT: TSmallintField;
    ADOQuery1OUTGOING_FORM_NAME: TStringField;
    ADOQuery1OUTGOING_FORM_ADDR1: TStringField;
    ADOQuery1OUTGOING_FORM_ADDR2: TStringField;
    ADOQuery1OUTGOING_FORM_ADDR3: TStringField;
    ADOQuery1ANALYSIS_CODE1: TStringField;
    ADOQuery1ANALYSIS_CODE2: TStringField;
    ADOQuery1ANALYSIS_CODE3: TStringField;
    ADOQuery1CUST_ENT_DATE: TDateTimeField;
    ADOQuery1EDI_ID: TStringField;
    ADOQuery1EDI_FLAG_FOR_SOACK: TSmallintField;
    ADOQuery1EDI_FLAG_FOR_INVOICE: TSmallintField;
    ADOQuery1EDI_FLAG_CREDIT_MEMO: TSmallintField;
    ADOQuery1GEN_EMAIL_ADDRESS: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT1: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT2: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT3: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT4: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT5: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT6: TStringField;
    ADOQuery1ACC_REC_PTR: TIntegerField;
    ADOQuery1CONSUME_FORECASTS: TWordField;
    ADOQuery1BACKWARD_DAYS: TIntegerField;
    ADOQuery1FORWARD_DAYS: TIntegerField;
    ADOQuery1PLANNING_HORIZON: TIntegerField;
    ADOQuery1RAW_HORIZON: TIntegerField;
    ADOQuery1VISIBILITY_HORIZON: TIntegerField;
    ADOQuery1DAYS_EARLY_SCHEDULE: TIntegerField;
    ADOQuery1APPLY_IN_TRANSIT: TWordField;
    ADOQuery1CUSTOMER_TYPE: TIntegerField;
    ADOQuery1DO_SMOOTHING: TWordField;
    ADOQuery1SMOOTHING_THRESHOLD: TIntegerField;
    ADOQuery1ANALYSIS_CODE4: TStringField;
    ADOQuery1ANALYSIS_CODE5: TStringField;
    ADOQuery1EDI_OUT_FOR_SOACK: TWordField;
    ADOQuery1EDI_OUT_FOR_INVOICE: TWordField;
    ADOQuery1EDI_OUT_FOR_CRMEMO: TWordField;
    ADOQuery1EDI_OUT_FOR_PACKSL: TWordField;
    ADOQuery1EDI_IN_FORCST_MAN: TWordField;
    ADOQuery1EDI_IN_FORCST_AUT: TWordField;
    ADOQuery1EDI_IN_SONEW_MAN: TWordField;
    ADOQuery1EDI_IN_SONEW_AUT: TWordField;
    ADOQuery1EDI_IN_LOGGING: TWordField;
    ADOQuery1EDI_IN_ADD_CUSTPART: TWordField;
    ADOQuery1EDI_IN_PROD_CODE_PTR: TIntegerField;
    ADOQuery1quote_factor: TFloatField;
    ADOQuery1QUOTE_FACTOR1: TFloatField;
    ADOQuery1REP_EVAL: TStringField;
    ADOQuery1MAK_EVAL: TStringField;
    ADOQuery1FIN_EVAL: TStringField;
    ADOQuery1MARMANG_EVAL: TStringField;
    ADOQuery1REP_CREDIT: TFloatField;
    ADOQuery1MAK_CREDIT: TFloatField;
    ADOQuery1FIN_CREDIT: TFloatField;
    ADOQuery1MARMANG_CREDIT: TFloatField;
    ADOQuery1REP_HIGH: TFloatField;
    ADOQuery1MAK_HIGH: TFloatField;
    ADOQuery1FIN_HIGH: TFloatField;
    ADOQuery1MARMANG_HIGH: TFloatField;
    ADOQuery1REP_NAME: TStringField;
    ADOQuery1MAK_NAME: TStringField;
    ADOQuery1FIN_NAME: TStringField;
    ADOQuery1MARMANG_NAME: TStringField;
    ADOQuery1REP_DATE: TDateTimeField;
    ADOQuery1MAK_DATE: TDateTimeField;
    ADOQuery1FIN_DATE: TDateTimeField;
    ADOQuery1MARMANG_DATE: TDateTimeField;
    ADOQuery1HOUSE_FIXED: TStringField;
    ADOQuery1FIXED_SCOPE: TStringField;
    ADOQuery1SALES_DISCOUNT: TBCDField;
    ADOQuery1MONTH_AMOUNT: TFloatField;
    ADOQuery1MONTH_PCBAMOUNT: TFloatField;
    ADOQuery1CAPITAL: TFloatField;
    ADOQuery1d0001_rkey: TAutoIncField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1curr_name: TStringField;
    ADOQuery1exch_rate: TFloatField;
    ADOQuery1sales_rep_name: TStringField;
    ADOQuery1rep_code: TStringField;
    ADOQuery1d0009_rkey: TAutoIncField;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
    vRkeyData10,vRkeyData01,vRkeyData09,vRkeyData08 : integer ;
    function Get_RkeyData10: integer;
    procedure Set_RkeyData10(const Value: integer);

    function DisplayData():boolean;
    function Get_RkeyData01: integer;
    function Get_RkeyData09: integer;
    procedure Set_RkeyData01(const Value: integer);
    procedure Set_RkeyData09(const Value: integer);
    function Get_RkeyData08: integer;
    procedure Set_RkeyData08(const Value: integer);
  public
    { Public declarations }
    property RkeyData10:integer Read Get_RkeyData10 Write Set_RkeyData10;
    property RkeyData01:integer Read Get_RkeyData01 Write Set_RkeyData01;
    property RkeyData09:integer Read Get_RkeyData09 Write Set_RkeyData09;
    property RkeyData08:integer Read Get_RkeyData08 Write Set_RkeyData08;
  end;

var
  EditCustForm3: TEditCustForm3;

implementation

uses
    FindData0010Unit2,FindData0009Unit3,FindData0001Unit2
    ,DMUnit1;
{$R *.dfm}

procedure TEditCustForm3.BitBtn3Click(Sender: TObject);
begin
  inherited;
  FindData0010Form2:= TFindData0010Form2.Create(application) ;
  try
      FindData0010Form2.Caption := '查找客户';
      FindData0010Form2.ADOStoredProc1.Prepared ;
      FindData0010Form2.ADOStoredProc1.Open ;
      if FindData0010Form2.ShowModal = mrok then
          begin
               vRkeyData10 := FindData0010Form2.ADOStoredProc1RKEY.Value ;
               if ADOQuery1.Active then ADOQuery1.Close ;
               ADOQuery1.Parameters.ParamValues['rkey'] := vRkeyData10 ;
               ADOQuery1.Prepared ;
               ADOQuery1.Open ;
               DisplayData ;
               //ADOQuery1.SQL.Add('select * from data0010')
          end ;
  finally
      if FindData0010Form2.ADOStoredProc1.Active then FindData0010Form2.ADOStoredProc1.Close ;
      FindData0010Form2.Free;
  end;
end;

procedure TEditCustForm3.BitBtn4Click(Sender: TObject);
begin
  inherited;
  FindData0009Form3:= TFindData0009Form3.Create(application) ;
  try
      FindData0009Form3.Caption := '查找销售代表';
      FindData0009Form3.ADOStoredProc1.Open ;

      if FindData0009Form3.ShowModal = mrok then
          begin
               vRkeyData09 := FindData0009Form3.ADOStoredProc1RKEY.Value ;
               edit7.Text := FindData0009Form3.ADOStoredProc1REP_CODE.Value ; 
               label15.Caption := FindData0009Form3.ADOStoredProc1SALES_REP_NAME.Value ; 
          end ;
  finally
      if FindData0009Form3.ADOStoredProc1.Active then FindData0009Form3.ADOStoredProc1.Close ;
      FindData0009Form3.Free;
  end;
end;

procedure TEditCustForm3.BitBtn5Click(Sender: TObject);
begin
  inherited;
  FindData0001Form2:= TFindData0001Form2.Create(application) ;
  try
      FindData0001Form2.Caption := '查找货币';
      FindData0001Form2.ADOStoredProc1.Open ;
      if FindData0001Form2.ShowModal = mrok then
          begin
               vRkeyData01 := FindData0001Form2.ADOStoredProc1RKEY.Value ;
               edit8.Text := FindData0001Form2.ADOStoredProc1CURR_CODE.Value ;
               label16.Caption := FindData0001Form2.ADOStoredProc1CURR_NAME.Value ;
               edit15.Text := FindData0001Form2.ADOStoredProc1EXCH_RATE.AsString ; 
          end ;
  finally
      if FindData0001Form2.ADOStoredProc1.Active then FindData0001Form2.ADOStoredProc1.Close ;
      FindData0001Form2.Free;
  end;
end;

function TEditCustForm3.Get_RkeyData10: integer;
begin
   result := vRkeyData10 ;
end;

procedure TEditCustForm3.Set_RkeyData10(const Value: integer);
begin
   vRkeyData10 := value ;
end;

procedure TEditCustForm3.FormShow(Sender: TObject);
begin
  inherited;
  self.KeyPreview := true ;
  Edit2.Color :=clScrollBar;
  Edit3.Color :=clScrollBar;
  Edit6.Color :=clScrollBar;
  Edit9.Color :=clScrollBar;
  Edit10.Color :=clScrollBar;
  Edit11.Color :=clScrollBar;
  Edit12.Color :=clScrollBar;
  Edit13.Color :=clScrollBar;
  Edit14.Color :=clScrollBar;

  if ADOQuery1.Active then ADOQuery1.Close ;
  ADOQuery1.Parameters.ParamValues['rkey'] := vRkeyData10 ;
  ADOQuery1.Prepared ;
  ADOQuery1.Open ;
  if not ADOQuery1.IsEmpty then
      begin
          //显示要显示的内容
          DisplayData ;
      end ;

end;

function TEditCustForm3.DisplayData: boolean;
begin
    result := false ;
    try                                                       edit2.Text := ADOQuery1.FieldValues['cust_code'];//客户代码:
        Label2.Caption := ADOQuery1CUSTOMER_NAME.AsString ; //名称:
        edit2.Text := ADOQuery1CUSTOMER_NAME.Asstring;//名称:
        edit3.Text := ADOQuery1BILLING_ADDRESS_1.Asstring;//地址:
        edit6.Text := ADOQuery1STATE.Asstring;//省/州:
        edit14.Text := ADOQuery1zip.Asstring; //区号:
        edit7.Text := ADOQuery1rep_code.Asstring;//销售代表:
        Label15.Caption := ADOQuery1sales_rep_name.Asstring; //
        vRkeyData09 :=  ADOQuery1d0009_rkey.Value ;

        edit8.Text := ADOQuery1curr_code.Asstring;  //币种:
        Label16.Caption := ADOQuery1curr_name.Asstring;
        vRkeyData01 :=ADOQuery1d0001_rkey.Value ;

        edit15.Text := ADOQuery1exch_rate.Asstring;//报价汇率:
        edit16.Text := ADOQuery1fed_tax_id_NO.Asstring;//结算方式:
        edit9.Text := ADOQuery1phone.Asstring;//电话号码:
        edit10.Text := ADOQuery1fax.Asstring; //传真:
        edit11.Text := ADOQuery1gen_email_address.Asstring; //E-mail:
        edit12.Text := ADOQuery1contact_name_1.Asstring;//联络人:
        edit13.Text := ADOQuery1cont_phone_1.Asstring;//联络电话:
        edit17.Text := ADOQuery1quote_factor.Asstring; //客户价格常规毛利率/折价率(%):
        edit18.Text := ADOQuery1sales_discount.Asstring; //销售佣金(%):
        result := true ;
        {}
    except

    end ;
end;

function TEditCustForm3.Get_RkeyData01: integer;
begin
    result := vRkeyData01 ;
end;

function TEditCustForm3.Get_RkeyData09: integer;
begin
   result := vRkeyData09 ;
end;

procedure TEditCustForm3.Set_RkeyData01(const Value: integer);
begin
   vRkeyData01 := value ;
end;

procedure TEditCustForm3.Set_RkeyData09(const Value: integer);
begin
   vRkeyData09 := value ;
end;

procedure TEditCustForm3.BitBtn2Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrCancel	;
end;

function TEditCustForm3.Get_RkeyData08: integer;
begin
   RESULT := vRkeyData08 ;
end;

procedure TEditCustForm3.Set_RkeyData08(const Value: integer);
begin
   vRkeyData08 := VALUE ;
end;

procedure TEditCustForm3.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Edit2.Enabled := Checkbox1.Checked;
  Edit3.Enabled := Checkbox1.Checked;
  Edit6.Enabled := Checkbox1.Checked;
  Edit9.Enabled := Checkbox1.Checked;
  Edit10.Enabled := Checkbox1.Checked;
  Edit11.Enabled := Checkbox1.Checked;
  Edit12.Enabled := Checkbox1.Checked;
  Edit13.Enabled := Checkbox1.Checked;
  Edit14.Enabled := Checkbox1.Checked;
  if not checkbox1.Checked then
      begin
          Edit2.Color :=clScrollBar;
          Edit3.Color :=clScrollBar;
          Edit6.Color :=clScrollBar;
          Edit9.Color :=clScrollBar;
          Edit10.Color :=clScrollBar;
          Edit11.Color :=clScrollBar;
          Edit12.Color :=clScrollBar;
          Edit13.Color :=clScrollBar;
          Edit14.Color :=clScrollBar;
      end
  else
      begin
          Edit2.Color :=clWindow;
          Edit3.Color :=clWindow;
          Edit6.Color :=clWindow;
          Edit9.Color :=clWindow;
          Edit10.Color :=clWindow;
          Edit11.Color :=clWindow;
          Edit12.Color :=clWindow;
          Edit13.Color :=clWindow;
          Edit14.Color :=clWindow;
      end;
  if checkbox1.Checked then
      begin
          edit1.Text :='';
          Label2.Caption :='';
      end;
end;

procedure TEditCustForm3.BitBtn1Click(Sender: TObject);
begin
  inherited;
  //新客户
  IF CheckBox1.Checked THEN vRkeyData10 := 0 ;
  //modalresult:=mrok;
  {}
end;

procedure TEditCustForm3.BitBtn10Click(Sender: TObject);
begin
  inherited;
  showmessage('2');
end;

end.
