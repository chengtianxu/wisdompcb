object Form1: TForm1
  Left = 259
  Top = 172
  Width = 766
  Height = 522
  Caption = #23458#25143#29305#21035#35201#27714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 273
    Width = 750
    Height = 211
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 41
      Top = 13
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721':'
    end
    object Button3: TButton
      Left = 471
      Top = 6
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 366
      Top = 6
      Width = 75
      Height = 25
      Caption = #21462#28040
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 262
      Top = 6
      Width = 75
      Height = 25
      Caption = #20445#23384
      Enabled = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 100
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 750
    Height = 232
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 188
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 363
      end>
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 400
    Top = 408
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 408
  end
  object Ads10: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = Ads10AfterScroll
    CommandText = 'select * from Data0010 order by CUST_CODE'
    Parameters = <>
    Left = 232
    Top = 144
    object Ads10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Ads10CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 50
    end
    object Ads10CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Ads10ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
    end
    object Ads10BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 300
    end
    object Ads10BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      Size = 300
    end
    object Ads10BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      Size = 300
    end
    object Ads10STATE: TStringField
      FieldName = 'STATE'
    end
    object Ads10ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object Ads10PHONE: TStringField
      FieldName = 'PHONE'
      Size = 40
    end
    object Ads10FAX: TStringField
      FieldName = 'FAX'
      Size = 40
    end
    object Ads10TELEX: TStringField
      FieldName = 'TELEX'
      Size = 50
    end
    object Ads10SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object Ads10CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Ads10INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object Ads10CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object Ads10CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object Ads10CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object Ads10CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object Ads10CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object Ads10CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object Ads10CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      Size = 40
    end
    object Ads10CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      Size = 40
    end
    object Ads10CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      Size = 40
    end
    object Ads10CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      Size = 40
    end
    object Ads10CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      Size = 40
    end
    object Ads10CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      Size = 40
    end
    object Ads10FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object Ads10COFC_FILENAME: TStringField
      FieldName = 'COFC_FILENAME'
      FixedChar = True
      Size = 15
    end
    object Ads10COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object Ads10REG_TAX_FIXED_UNUSED: TStringField
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object Ads10DISCOUNT_PCT: TBCDField
      FieldName = 'DISCOUNT_PCT'
      Precision = 4
      Size = 2
    end
    object Ads10HIGH_BALANCE: TFloatField
      FieldName = 'HIGH_BALANCE'
    end
    object Ads10CREDIT_LIMIT: TFloatField
      FieldName = 'CREDIT_LIMIT'
    end
    object Ads10CREDIT_RATING: TWordField
      FieldName = 'CREDIT_RATING'
    end
    object Ads10BALANCE_DUE: TFloatField
      FieldName = 'BALANCE_DUE'
    end
    object Ads10OUTSTANDING_CREDIT: TFloatField
      FieldName = 'OUTSTANDING_CREDIT'
    end
    object Ads10DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object Ads10CURRENT_BOOKINGS: TFloatField
      FieldName = 'CURRENT_BOOKINGS'
    end
    object Ads10NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object Ads10LAST_ACTIVE_DATE: TDateTimeField
      FieldName = 'LAST_ACTIVE_DATE'
    end
    object Ads10LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object Ads10BILLING_ADDRESS_4: TStringField
      FieldName = 'BILLING_ADDRESS_4'
      Size = 300
    end
    object Ads10COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object Ads10INTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'INTERNAL_ECN_COUNT'
    end
    object Ads10EXTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'EXTERNAL_ECN_COUNT'
    end
    object Ads10OUTGOING_FORM_NAME: TStringField
      FieldName = 'OUTGOING_FORM_NAME'
      Size = 50
    end
    object Ads10OUTGOING_FORM_ADDR1: TStringField
      FieldName = 'OUTGOING_FORM_ADDR1'
      Size = 70
    end
    object Ads10OUTGOING_FORM_ADDR2: TStringField
      FieldName = 'OUTGOING_FORM_ADDR2'
      Size = 45
    end
    object Ads10OUTGOING_FORM_ADDR3: TStringField
      FieldName = 'OUTGOING_FORM_ADDR3'
      Size = 45
    end
    object Ads10ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object Ads10ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
    end
    object Ads10ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
    end
    object Ads10CUST_ENT_DATE: TDateTimeField
      FieldName = 'CUST_ENT_DATE'
    end
    object Ads10EDI_ID: TStringField
      FieldName = 'EDI_ID'
      Size = 50
    end
    object Ads10EDI_FLAG_FOR_SOACK: TSmallintField
      FieldName = 'EDI_FLAG_FOR_SOACK'
    end
    object Ads10EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object Ads10EDI_FLAG_CREDIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object Ads10GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object Ads10EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object Ads10ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object Ads10CONSUME_FORECASTS: TWordField
      FieldName = 'CONSUME_FORECASTS'
    end
    object Ads10BACKWARD_DAYS: TIntegerField
      FieldName = 'BACKWARD_DAYS'
    end
    object Ads10FORWARD_DAYS: TIntegerField
      FieldName = 'FORWARD_DAYS'
    end
    object Ads10PLANNING_HORIZON: TIntegerField
      FieldName = 'PLANNING_HORIZON'
    end
    object Ads10RAW_HORIZON: TIntegerField
      FieldName = 'RAW_HORIZON'
    end
    object Ads10VISIBILITY_HORIZON: TIntegerField
      FieldName = 'VISIBILITY_HORIZON'
    end
    object Ads10DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object Ads10APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object Ads10CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object Ads10DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object Ads10SMOOTHING_THRESHOLD: TIntegerField
      FieldName = 'SMOOTHING_THRESHOLD'
    end
    object Ads10ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object Ads10ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object Ads10EDI_IN_LOGGING: TWordField
      FieldName = 'EDI_IN_LOGGING'
    end
    object Ads10quote_factor: TFloatField
      FieldName = 'quote_factor'
    end
    object Ads10QUOTE_FACTOR1: TFloatField
      FieldName = 'QUOTE_FACTOR1'
    end
    object Ads10REP_EVAL: TStringField
      FieldName = 'REP_EVAL'
      Size = 70
    end
    object Ads10MAK_EVAL: TStringField
      FieldName = 'MAK_EVAL'
      Size = 70
    end
    object Ads10FIN_EVAL: TStringField
      FieldName = 'FIN_EVAL'
      Size = 70
    end
    object Ads10MARMANG_EVAL: TStringField
      FieldName = 'MARMANG_EVAL'
      Size = 70
    end
    object Ads10REP_CREDIT: TFloatField
      FieldName = 'REP_CREDIT'
    end
    object Ads10MAK_CREDIT: TFloatField
      FieldName = 'MAK_CREDIT'
    end
    object Ads10FIN_CREDIT: TFloatField
      FieldName = 'FIN_CREDIT'
    end
    object Ads10MARMANG_CREDIT: TFloatField
      FieldName = 'MARMANG_CREDIT'
    end
    object Ads10REP_HIGH: TFloatField
      FieldName = 'REP_HIGH'
    end
    object Ads10MAK_HIGH: TFloatField
      FieldName = 'MAK_HIGH'
    end
    object Ads10FIN_HIGH: TFloatField
      FieldName = 'FIN_HIGH'
    end
    object Ads10MARMANG_HIGH: TFloatField
      FieldName = 'MARMANG_HIGH'
    end
    object Ads10REP_NAME: TStringField
      FieldName = 'REP_NAME'
      Size = 16
    end
    object Ads10MAK_NAME: TStringField
      FieldName = 'MAK_NAME'
      Size = 16
    end
    object Ads10FIN_NAME: TStringField
      FieldName = 'FIN_NAME'
      Size = 16
    end
    object Ads10MARMANG_NAME: TStringField
      FieldName = 'MARMANG_NAME'
      Size = 16
    end
    object Ads10REP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object Ads10MAK_DATE: TDateTimeField
      FieldName = 'MAK_DATE'
    end
    object Ads10FIN_DATE: TDateTimeField
      FieldName = 'FIN_DATE'
    end
    object Ads10MARMANG_DATE: TDateTimeField
      FieldName = 'MARMANG_DATE'
    end
    object Ads10HOUSE_FIXED: TStringField
      FieldName = 'HOUSE_FIXED'
      Size = 4
    end
    object Ads10FIXED_SCOPE: TStringField
      FieldName = 'FIXED_SCOPE'
      Size = 30
    end
    object Ads10SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object Ads10MONTH_AMOUNT: TFloatField
      FieldName = 'MONTH_AMOUNT'
    end
    object Ads10MONTH_PCBAMOUNT: TFloatField
      FieldName = 'MONTH_PCBAMOUNT'
    end
    object Ads10CAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
    object Ads10INVOICE_TYPE: TStringField
      FieldName = 'INVOICE_TYPE'
    end
    object Ads10quote_flag: TBooleanField
      FieldName = 'quote_flag'
    end
  end
  object DataSource1: TDataSource
    DataSet = Ads10
    Left = 208
    Top = 208
  end
end
