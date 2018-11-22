object DM: TDM
  OldCreateOrder = False
  Left = 340
  Top = 309
  Height = 410
  Width = 518
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 216
    Top = 64
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'code'
    TableName = 'Data0023'
    Left = 96
    Top = 64
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOTable1SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216':'
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOTable1ABBR_NAME: TStringField
      DisplayLabel = #32553#20889':'
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOTable1BILLING_ADDRESS_1: TStringField
      DisplayLabel = #22320#22336':'
      FieldName = 'BILLING_ADDRESS_1'
      FixedChar = True
      Size = 100
    end
    object ADOTable1BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      FixedChar = True
      Size = 30
    end
    object ADOTable1BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      FixedChar = True
      Size = 30
    end
    object ADOTable1STATE: TStringField
      DisplayLabel = #24030'/'#30465':'
      FieldName = 'STATE'
      Size = 10
    end
    object ADOTable1ZIP: TStringField
      DisplayLabel = #37038#32534':'
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object ADOTable1PHONE: TStringField
      DisplayLabel = #30005#35805#21495#30721':'
      FieldName = 'PHONE'
      FixedChar = True
    end
    object ADOTable1FAX: TStringField
      DisplayLabel = #20256#30495#21495#30721':'
      FieldName = 'FAX'
      FixedChar = True
    end
    object ADOTable1TELEX: TStringField
      DisplayLabel = #30005#20256#21495#30721':'
      FieldName = 'TELEX'
      FixedChar = True
      Size = 40
    end
    object ADOTable1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOTable1PO_NOTE_PAD_PTR: TIntegerField
      FieldName = 'PO_NOTE_PAD_PTR'
    end
    object ADOTable1DEBMEM_NOTE_PAD_PTR: TIntegerField
      FieldName = 'DEBMEM_NOTE_PAD_PTR'
    end
    object ADOTable1RFQ_NOTE_PAD_PTR: TIntegerField
      FieldName = 'RFQ_NOTE_PAD_PTR'
    end
    object ADOTable1common_pad_ptr: TIntegerField
      FieldName = 'common_pad_ptr'
    end
    object ADOTable1CONTACT_NAME_1: TStringField
      DisplayLabel = #36134#30446#32852#32476#20154':'
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object ADOTable1CONT_PHONE_1: TStringField
      DisplayLabel = #24080#30446#32852#32476#20154#30005#35805':'
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      FixedChar = True
      Size = 14
    end
    object ADOTable1TAX_1: TFloatField
      FieldName = 'TAX_1'
    end
    object ADOTable1TAX_2: TFloatField
      FieldName = 'TAX_2'
    end
    object ADOTable1CURRENT_BALANCE: TFloatField
      FieldName = 'CURRENT_BALANCE'
    end
    object ADOTable1OUTSTANDING_DEBITS: TFloatField
      FieldName = 'OUTSTANDING_DEBITS'
    end
    object ADOTable1PAYMENT_TERMS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PAYMENT_TERMS'
    end
    object ADOTable1DISCOUNT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADOTable1DISCOUNT_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADOTable1PRNT_ONE_INV_PER_CHK: TStringField
      FieldName = 'PRNT_ONE_INV_PER_CHK'
      FixedChar = True
      Size = 1
    end
    object ADOTable1PUT_ALL_INV_HOLD: TStringField
      FieldName = 'PUT_ALL_INV_HOLD'
      FixedChar = True
      Size = 1
    end
    object ADOTable1LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOTable1TAX_ID_NUMBER: TStringField
      FieldName = 'TAX_ID_NUMBER'
      FixedChar = True
    end
    object ADOTable1DISCOUNT2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADOTable1DISCOUNT2_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADOTable1COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object ADOTable1NAME_FOR_FORM: TStringField
      FieldName = 'NAME_FOR_FORM'
      FixedChar = True
      Size = 45
    end
    object ADOTable1ADDRESS1_FOR_FORM: TStringField
      FieldName = 'ADDRESS1_FOR_FORM'
      FixedChar = True
      Size = 45
    end
    object ADOTable1ADDRESS2_FOR_FORM: TStringField
      FieldName = 'ADDRESS2_FOR_FORM'
      FixedChar = True
      Size = 45
    end
    object ADOTable1ADDRESS3_FOR_FORM: TStringField
      FieldName = 'ADDRESS3_FOR_FORM'
      FixedChar = True
      Size = 45
    end
    object ADOTable1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object ADOTable1SUPPIER_ENT_DATE: TDateTimeField
      FieldName = 'SUPPIER_ENT_DATE'
    end
    object ADOTable1EDI_ID: TStringField
      FieldName = 'EDI_ID'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EDI_FLAG_FOR_PO: TSmallintField
      FieldName = 'EDI_FLAG_FOR_PO'
    end
    object ADOTable1EDI_FLAG_DEBIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_DEBIT_MEMO'
    end
    object ADOTable1GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 30
    end
    object ADOTable1EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object ADOTable1ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object ADOTable1EDI_OUT_NEW_PO: TIntegerField
      FieldName = 'EDI_OUT_NEW_PO'
    end
    object ADOTable1EDI_OUT_CHG_PO: TIntegerField
      FieldName = 'EDI_OUT_CHG_PO'
    end
    object ADOTable1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 32
    Top = 66
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 96
    Top = 111
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select *  from data0024')
    Left = 96
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 32
    Top = 161
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0024 where supplier_ptr=:rkey')
    Left = 164
    Top = 161
  end
  object AQ04: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep120;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 21
      end>
    Left = 104
    Top = 16
    object AQ04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object AQ04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object AQ04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
end
