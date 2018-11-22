inherited FindData0010Form2: TFindData0010Form2
  Left = 237
  Top = 119
  Width = 434
  Height = 508
  BorderIcons = []
  Caption = #26597#25214#23458#25143
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 426
    Height = 399
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'CUSTOMER_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 253
      end>
  end
  inherited Panel1: TPanel
    Width = 426
    inherited Label1: TLabel
      Left = 3
      Width = 106
      Caption = #23458#25143#20195#30721#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 440
    Width = 426
    inherited Button2: TButton
      Left = 248
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;17'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStoredProc1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOStoredProc1CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOStoredProc1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOStoredProc1BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADOStoredProc1BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      Size = 50
    end
    object ADOStoredProc1BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      Size = 30
    end
    object ADOStoredProc1STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADOStoredProc1ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object ADOStoredProc1PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
    end
    object ADOStoredProc1FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
    end
    object ADOStoredProc1TELEX: TStringField
      FieldName = 'TELEX'
      Size = 50
    end
    object ADOStoredProc1SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADOStoredProc1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOStoredProc1QUOTE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'QUOTE_NOTE_PAD_PTR'
    end
    object ADOStoredProc1INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ADOStoredProc1PACKSLP_NOTE_PAD_PTR: TIntegerField
      FieldName = 'PACKSLP_NOTE_PAD_PTR'
    end
    object ADOStoredProc1ORDRACK_NOTE_PAD_PTR: TIntegerField
      FieldName = 'ORDRACK_NOTE_PAD_PTR'
    end
    object ADOStoredProc1CRDTMEM_NOTE_PAD_PTR: TIntegerField
      FieldName = 'CRDTMEM_NOTE_PAD_PTR'
    end
    object ADOStoredProc1STATMNT_NOTE_PAD_PTR: TIntegerField
      FieldName = 'STATMNT_NOTE_PAD_PTR'
    end
    object ADOStoredProc1OPENORD_NOTE_PAD_PTR: TIntegerField
      FieldName = 'OPENORD_NOTE_PAD_PTR'
    end
    object ADOStoredProc1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOStoredProc1CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object ADOStoredProc1CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object ADOStoredProc1CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object ADOStoredProc1CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object ADOStoredProc1CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object ADOStoredProc1CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      FixedChar = True
      Size = 14
    end
    object ADOStoredProc1FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
    end
    object ADOStoredProc1COFC_FILENAME: TStringField
      FieldName = 'COFC_FILENAME'
      FixedChar = True
      Size = 15
    end
    object ADOStoredProc1COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOStoredProc1REG_TAX_FIXED_UNUSED: TStringField
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object ADOStoredProc1DISCOUNT_PCT: TBCDField
      FieldName = 'DISCOUNT_PCT'
      Precision = 4
      Size = 2
    end
    object ADOStoredProc1HIGH_BALANCE: TFloatField
      FieldName = 'HIGH_BALANCE'
    end
    object ADOStoredProc1CREDIT_LIMIT: TFloatField
      FieldName = 'CREDIT_LIMIT'
    end
    object ADOStoredProc1CREDIT_RATING: TWordField
      FieldName = 'CREDIT_RATING'
    end
    object ADOStoredProc1BALANCE_DUE: TFloatField
      FieldName = 'BALANCE_DUE'
    end
    object ADOStoredProc1OUTSTANDING_CREDIT: TFloatField
      FieldName = 'OUTSTANDING_CREDIT'
    end
    object ADOStoredProc1DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADOStoredProc1CURRENT_BOOKINGS: TFloatField
      FieldName = 'CURRENT_BOOKINGS'
    end
    object ADOStoredProc1NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object ADOStoredProc1LAST_ACTIVE_DATE: TDateTimeField
      FieldName = 'LAST_ACTIVE_DATE'
    end
    object ADOStoredProc1LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOStoredProc1BILLING_ADDRESS_4: TStringField
      FieldName = 'BILLING_ADDRESS_4'
      Size = 100
    end
    object ADOStoredProc1COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object ADOStoredProc1INTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'INTERNAL_ECN_COUNT'
    end
    object ADOStoredProc1EXTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'EXTERNAL_ECN_COUNT'
    end
    object ADOStoredProc1OUTGOING_FORM_NAME: TStringField
      FieldName = 'OUTGOING_FORM_NAME'
      Size = 50
    end
    object ADOStoredProc1OUTGOING_FORM_ADDR1: TStringField
      FieldName = 'OUTGOING_FORM_ADDR1'
      Size = 70
    end
    object ADOStoredProc1OUTGOING_FORM_ADDR2: TStringField
      FieldName = 'OUTGOING_FORM_ADDR2'
      Size = 45
    end
    object ADOStoredProc1OUTGOING_FORM_ADDR3: TStringField
      FieldName = 'OUTGOING_FORM_ADDR3'
      Size = 45
    end
    object ADOStoredProc1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object ADOStoredProc1ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
    end
    object ADOStoredProc1ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
    end
    object ADOStoredProc1CUST_ENT_DATE: TDateTimeField
      FieldName = 'CUST_ENT_DATE'
    end
    object ADOStoredProc1EDI_ID: TStringField
      FieldName = 'EDI_ID'
      Size = 50
    end
    object ADOStoredProc1EDI_FLAG_FOR_SOACK: TSmallintField
      FieldName = 'EDI_FLAG_FOR_SOACK'
    end
    object ADOStoredProc1EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object ADOStoredProc1EDI_FLAG_CREDIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object ADOStoredProc1GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object ADOStoredProc1ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object ADOStoredProc1CONSUME_FORECASTS: TWordField
      FieldName = 'CONSUME_FORECASTS'
    end
    object ADOStoredProc1BACKWARD_DAYS: TIntegerField
      FieldName = 'BACKWARD_DAYS'
    end
    object ADOStoredProc1FORWARD_DAYS: TIntegerField
      FieldName = 'FORWARD_DAYS'
    end
    object ADOStoredProc1PLANNING_HORIZON: TIntegerField
      FieldName = 'PLANNING_HORIZON'
    end
    object ADOStoredProc1RAW_HORIZON: TIntegerField
      FieldName = 'RAW_HORIZON'
    end
    object ADOStoredProc1VISIBILITY_HORIZON: TIntegerField
      FieldName = 'VISIBILITY_HORIZON'
    end
    object ADOStoredProc1DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object ADOStoredProc1APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object ADOStoredProc1CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ADOStoredProc1DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADOStoredProc1SMOOTHING_THRESHOLD: TIntegerField
      FieldName = 'SMOOTHING_THRESHOLD'
    end
    object ADOStoredProc1ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object ADOStoredProc1ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object ADOStoredProc1EDI_OUT_FOR_SOACK: TWordField
      FieldName = 'EDI_OUT_FOR_SOACK'
    end
    object ADOStoredProc1EDI_OUT_FOR_INVOICE: TWordField
      FieldName = 'EDI_OUT_FOR_INVOICE'
    end
    object ADOStoredProc1EDI_OUT_FOR_CRMEMO: TWordField
      FieldName = 'EDI_OUT_FOR_CRMEMO'
    end
    object ADOStoredProc1EDI_OUT_FOR_PACKSL: TWordField
      FieldName = 'EDI_OUT_FOR_PACKSL'
    end
    object ADOStoredProc1EDI_IN_FORCST_MAN: TWordField
      FieldName = 'EDI_IN_FORCST_MAN'
    end
    object ADOStoredProc1EDI_IN_FORCST_AUT: TWordField
      FieldName = 'EDI_IN_FORCST_AUT'
    end
    object ADOStoredProc1EDI_IN_SONEW_MAN: TWordField
      FieldName = 'EDI_IN_SONEW_MAN'
    end
    object ADOStoredProc1EDI_IN_SONEW_AUT: TWordField
      FieldName = 'EDI_IN_SONEW_AUT'
    end
    object ADOStoredProc1EDI_IN_LOGGING: TWordField
      FieldName = 'EDI_IN_LOGGING'
    end
    object ADOStoredProc1EDI_IN_ADD_CUSTPART: TWordField
      FieldName = 'EDI_IN_ADD_CUSTPART'
    end
    object ADOStoredProc1EDI_IN_PROD_CODE_PTR: TIntegerField
      FieldName = 'EDI_IN_PROD_CODE_PTR'
    end
    object ADOStoredProc1quote_factor: TFloatField
      FieldName = 'quote_factor'
    end
    object ADOStoredProc1QUOTE_FACTOR1: TFloatField
      FieldName = 'QUOTE_FACTOR1'
    end
    object ADOStoredProc1REP_EVAL: TStringField
      FieldName = 'REP_EVAL'
      Size = 70
    end
    object ADOStoredProc1MAK_EVAL: TStringField
      FieldName = 'MAK_EVAL'
      Size = 70
    end
    object ADOStoredProc1FIN_EVAL: TStringField
      FieldName = 'FIN_EVAL'
      Size = 70
    end
    object ADOStoredProc1MARMANG_EVAL: TStringField
      FieldName = 'MARMANG_EVAL'
      Size = 70
    end
    object ADOStoredProc1REP_CREDIT: TFloatField
      FieldName = 'REP_CREDIT'
    end
    object ADOStoredProc1MAK_CREDIT: TFloatField
      FieldName = 'MAK_CREDIT'
    end
    object ADOStoredProc1FIN_CREDIT: TFloatField
      FieldName = 'FIN_CREDIT'
    end
    object ADOStoredProc1MARMANG_CREDIT: TFloatField
      FieldName = 'MARMANG_CREDIT'
    end
    object ADOStoredProc1REP_HIGH: TFloatField
      FieldName = 'REP_HIGH'
    end
    object ADOStoredProc1MAK_HIGH: TFloatField
      FieldName = 'MAK_HIGH'
    end
    object ADOStoredProc1FIN_HIGH: TFloatField
      FieldName = 'FIN_HIGH'
    end
    object ADOStoredProc1MARMANG_HIGH: TFloatField
      FieldName = 'MARMANG_HIGH'
    end
    object ADOStoredProc1REP_NAME: TStringField
      FieldName = 'REP_NAME'
      Size = 16
    end
    object ADOStoredProc1MAK_NAME: TStringField
      FieldName = 'MAK_NAME'
      Size = 16
    end
    object ADOStoredProc1FIN_NAME: TStringField
      FieldName = 'FIN_NAME'
      Size = 16
    end
    object ADOStoredProc1MARMANG_NAME: TStringField
      FieldName = 'MARMANG_NAME'
      Size = 16
    end
    object ADOStoredProc1REP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object ADOStoredProc1MAK_DATE: TDateTimeField
      FieldName = 'MAK_DATE'
    end
    object ADOStoredProc1FIN_DATE: TDateTimeField
      FieldName = 'FIN_DATE'
    end
    object ADOStoredProc1MARMANG_DATE: TDateTimeField
      FieldName = 'MARMANG_DATE'
    end
    object ADOStoredProc1HOUSE_FIXED: TStringField
      FieldName = 'HOUSE_FIXED'
      Size = 4
    end
    object ADOStoredProc1FIXED_SCOPE: TStringField
      FieldName = 'FIXED_SCOPE'
      Size = 30
    end
    object ADOStoredProc1SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object ADOStoredProc1MONTH_AMOUNT: TFloatField
      FieldName = 'MONTH_AMOUNT'
    end
    object ADOStoredProc1MONTH_PCBAMOUNT: TFloatField
      FieldName = 'MONTH_PCBAMOUNT'
    end
    object ADOStoredProc1CAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
  end
end
