object DM: TDM
  OldCreateOrder = False
  Left = 593
  Top = 261
  Height = 354
  Width = 301
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=KMERP_WZ'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 175
    Top = 25
  end
  object DataSource1: TDataSource
    DataSet = ADO235
    Left = 24
    Top = 63
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 241
    Top = 200
  end
  object ADO95: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0095'
      'where rkey is null')
    Left = 175
    Top = 143
  end
  object aq0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 237
    Top = 143
  end
  object ADO2211: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 235
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 176
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 24
    Top = 144
  end
  object ADO235: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, dbo.Data00' +
        '72.DEL_DATE, '
      
        '      dbo.Data0023.ABBR_NAME, dbo.Data0023.CODE, dbo.Data0023.SU' +
        'PPLIER_NAME, '
      
        '      dbo.Data0070.PO_NUMBER, dbo.Data0002.UNIT_NAME, dbo.Data02' +
        '35.unit_price, '
      '      dbo.Data0072.QUAN_ORD, dbo.Data0072.QUANTITY_RECEIVED, '
      
        '      dbo.Data0072.QUAN_RETN, dbo.Data0235.quan_to_ship, dbo.Dat' +
        'a0235.QUAN_RECD, '
      
        '      dbo.Data0235.QUAN_ON_HAND, dbo.Data0235.state_tax,Data0235' +
        '.D0072_PTR, '
      
        '      dbo.Data0235.quan_returned, dbo.Data0072.DESCRIPTION2, dbo' +
        '.Data0235.RKEY, '
      
        '      dbo.Data0023.BILLING_ADDRESS_1, dbo.Data0070.SUPPIER_CONTA' +
        'CT, '
      '      dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, '
      '      dbo.Data0456.CREATE_DATE'
      'FROM dbo.Data0070 INNER JOIN'
      '      dbo.Data0072 INNER JOIN'
      
        '      dbo.Data0235 ON dbo.Data0072.RKEY = dbo.Data0235.D0072_PTR' +
        ' ON '
      '      dbo.Data0070.RKEY = dbo.Data0072.POPTR INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'
      'WHERE (dbo.Data0235.quan_to_ship > 0)')
    Left = 80
    Top = 63
    object ADO235DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADO235GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 20
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO235quan_to_ship: TFloatField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'quan_to_ship'
    end
    object ADO235ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO235CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADO235SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO235PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADO235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO235UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADO235QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADO235QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADO235quan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object ADO235DEL_DATE: TDateTimeField
      FieldName = 'DEL_DATE'
    end
    object ADO235QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
    end
    object ADO235QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
    object ADO235DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object ADO235rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO235BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADO235SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
    end
    object ADO235QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADO235state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADO235GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO235DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADO235CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0095.TRAN_DATE, '
      
        '      dbo.Data0095.QUANTITY, dbo.Data0072.DESCRIPTION, dbo.Data0' +
        '072.GUI_GE, '
      
        '      dbo.Data0072.DESCRIPTION2, dbo.Data0235.QUAN_RECD, dbo.Dat' +
        'a0235.RKEY, '
      '      dbo.Data0235.QUAN_ON_HAND, dbo.Data0070.PO_NUMBER, '
      '      dbo.Data0072.DEL_DATE, dbo.Data0002.UNIT_NAME, '
      '      dbo.Data0070.SUPPIER_CONTACT, dbo.Data0023.CODE, '
      '      dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '
      
        '      dbo.Data0023.BILLING_ADDRESS_1, dbo.Data0023.CONTACT_NAME_' +
        '1, '
      
        '      dbo.Data0095.SHIPPING_METHOD, dbo.Data0095.REFERENCE_NUMBE' +
        'R, '
      '      dbo.Data0072.QUAN_ORD, dbo.Data0072.QUANTITY_RECEIVED, '
      
        '      dbo.Data0235.unit_price, dbo.Data0235.state_tax, dbo.Data0' +
        '456.CREATE_DATE, '
      '      dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, '
      '      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '
      '      dbo.Data0456.exch_rate'
      'FROM dbo.Data0095 INNER JOIN'
      
        '      dbo.Data0235 ON dbo.Data0095.SRCE_PTR = dbo.Data0235.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0095.TRAN_BY = dbo.Data0005.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0072 ON dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0072.POPTR = dbo.Data0070.RKEY INN' +
        'ER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.R' +
        'KEY'
      'WHERE (dbo.Data0095.TRAN_TP = 33)')
    Left = 86
    Top = 143
    object ADOQuery2EMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery2TRAN_DATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TRAN_DATE'
    end
    object ADOQuery2QUANTITY: TFloatField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQuery2DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADOQuery2GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 20
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADOQuery2DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object ADOQuery2UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADOQuery2QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery2QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADOQuery2PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery2DEL_DATE: TDateTimeField
      FieldName = 'DEL_DATE'
    end
    object ADOQuery2UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery2SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
    end
    object ADOQuery2CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery2SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery2ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery2BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADOQuery2CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOQuery2rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery2SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADOQuery2REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADOQuery2QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery2QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADOQuery2state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADOQuery2CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADOQuery2GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADOQuery2DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
  end
  object ADO210: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0210'
      'where rkey is null')
    Left = 88
    Top = 200
    object ADO210RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO210INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO210PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADO210D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ADO210D0235_PTR: TIntegerField
      FieldName = 'D0235_PTR'
    end
    object ADO210QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO210TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO210DEBIT_MEMO_PTR: TIntegerField
      FieldName = 'DEBIT_MEMO_PTR'
    end
    object ADO210empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO210type: TWordField
      FieldName = 'type'
    end
  end
end
