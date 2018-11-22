object dm: Tdm
  OldCreateOrder = False
  Left = 439
  Top = 214
  Height = 391
  Width = 457
  object ACt: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = AQ129
    Left = 40
    Top = 88
  end
  object ADOQuery1: TADOQuery
    Connection = ACt
    EnableBCD = False
    Parameters = <>
    Left = 104
    Top = 24
  end
  object ADO128: TADOQuery
    Connection = ACt
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select bank_current_check,bal_amount'
      'from data0128'
      'where rkey=:rkey')
    Left = 224
    Top = 88
    object ADO128bank_current_check: TStringField
      FieldName = 'bank_current_check'
      FixedChar = True
      Size = 10
    end
    object ADO128bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
  end
  object ADO129: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0129'
      'where rkey = :rkey')
    Left = 160
    Top = 88
    object ADO129RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO129CHECK_NUMBER: TStringField
      FieldName = 'CHECK_NUMBER'
      Size = 10
    end
    object ADO129BANK_PTR: TIntegerField
      FieldName = 'BANK_PTR'
    end
    object ADO129TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO129STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO129TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO129SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADO129EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO129AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ADO129PAY_TO: TStringField
      FieldName = 'PAY_TO'
      Size = 30
    end
    object ADO129CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADO129REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object ADO129warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO129trans_pl: TWordField
      FieldName = 'trans_pl'
    end
    object ADO129EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
  end
  object ADO130: TADOQuery
    Connection = ACt
    Parameters = <>
    SQL.Strings = (
      'select * from data0130'
      'where rkey is null')
    Left = 104
    Top = 153
    object ADO130RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO130CHECK_PTR: TIntegerField
      FieldName = 'CHECK_PTR'
    end
    object ADO130INVOICE_PTR: TIntegerField
      FieldName = 'INVOICE_PTR'
    end
    object ADO130DEBIT_AP_HEAD_PTR: TIntegerField
      FieldName = 'DEBIT_AP_HEAD_PTR'
    end
    object ADO130AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ADO130CASH_DISCOUNT: TBCDField
      FieldName = 'CASH_DISCOUNT'
      Precision = 19
    end
  end
  object AQ129: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ129AfterOpen
    CommandText = 
      'SELECT Data0005.EMPLOYEE_NAME, dbo.Data0128.BANK_NAME, '#13#10'      d' +
      'bo.Data0128.BAL_AMOUNT, dbo.Data0129.EX_RATE, dbo.Data0001.CURR_' +
      'NAME, '#13#10'      dbo.Data0001.CURR_CODE, dbo.Data0023.CODE, dbo.Dat' +
      'a0023.SUPPLIER_NAME, '#13#10'      dbo.Data0023.ABBR_NAME, dbo.Data012' +
      '9.TTYPE, dbo.Data0129.STATUS, '#13#10'      dbo.Data0129.TDATE, dbo.Da' +
      'ta0129.CHECK_NUMBER, dbo.Data0129.AMOUNT, '#13#10'      Data0129.RKEY,' +
      ' Data0015.WAREHOUSE_CODE, data0015.abbr_name as abbr15name,'#13#10'   ' +
      '   Data0015.WAREHOUSE_NAME, Data0129.REMARK, '#13#10'      Data0129.AM' +
      'OUNT * Data0129.EX_RATE AS amount_bamt, '#13#10'      Data0023.ACC_PAY' +
      'ABLE_PTR, dbo.Data0105.VOUCHER, '#13#10'      Data0105.RKEY AS rkey105' +
      ', data0128.GL_ACCT_PTR,'#13#10'case data0129.status when 1 then '#39#26410#28165#39' w' +
      'hen 2 then '#39#24050#28165#39#13#10'when 3 then '#39#34987#21462#28040#39' end as  '#29366#24577',Data0129.EMPL_PTR,' +
      #13#10'case data0129.ttype when 1 then '#39#29616#38134#20184#27454#39' when 2 then '#39#29616#38134#39044#20184#39' '#13#10'wh' +
      'en 3 then '#39#36153#29992#24320#25903#39' when 4 then '#39#38134#34892#36716#24080#39' '#13#10'when 5  then '#39#36716#24080#20184#27454#39' when 6' +
      '  then '#39#36716#24080#39044#20184#39' end as  '#31867#22411','#13#10'case data0105.STATUS when 0 then '#39#26410#23457#26680 +
      #39' when 1 then '#39#20250#35745#24050#23457#39#13#10'when 2 then '#39#20027#31649#24050#23457#39' when 3 then '#39#24050#30331#24080#39' when ' +
      '4 then '#39#20986#32435#24050#23457#39' '#13#10'when 5 then '#39#34987#20316#24223#39' end as '#20973#35777#29366#24577#13#10'FROM dbo.Data0129' +
      ' INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0129.EMPL_PTR = dbo.D' +
      'ata0005.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0129.CURR' +
      '_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'   ' +
      '   dbo.Data0129.SRCE_PTR = dbo.Data0023.RKEY LEFT OUTER JOIN'#13#10'  ' +
      '    dbo.Data0105 ON dbo.Data0129.RKEY = dbo.Data0105.SOURCE_PTR ' +
      'AND '#13#10'      dbo.Data0105.TRANS_TYPE = 3 LEFT OUTER JOIN'#13#10'      d' +
      'bo.Data0015 ON '#13#10'      dbo.Data0129.warehouse_ptr = dbo.Data0015' +
      '.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0128 ON dbo.Data0129.BANK_P' +
      'TR = dbo.Data0128.RKEY'#13#10'WHERE (dbo.Data0129.TTYPE <> 3) AND '#13#10'  ' +
      '   (dbo.Data0129.TTYPE <> 4) and'#13#10'      (Data0129.TDATE>=:dtpk1)' +
      ' and'#13#10'      (Data0129.TDATE<=:dtpk2) and'#13#10'      (Data0129.STATUS' +
      '<>:v1) and'#13#10'      (Data0129.STATUS<>:v2) and'#13#10'      (Data0129.ST' +
      'ATUS<>:v3)'#13#10
    IndexFieldNames = 'CHECK_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end
      item
        Name = 'v1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 2
      end
      item
        Name = 'v3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 3
      end>
    Left = 104
    Top = 88
    object AQ129EMPLOYEE_NAME: TStringField
      DisplayLabel = #25903#20184#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ129BANK_NAME: TStringField
      DisplayLabel = #29616#37329#38134#34892
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object AQ129BAL_AMOUNT: TFloatField
      FieldName = 'BAL_AMOUNT'
    end
    object AQ129EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EX_RATE'
    end
    object AQ129CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object AQ129CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ129CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object AQ129SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 30
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AQ129ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object AQ129TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object AQ129STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object AQ129TDATE: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'TDATE'
    end
    object AQ129CHECK_NUMBER: TStringField
      DisplayLabel = #25903#31080#32534#21495
      FieldName = 'CHECK_NUMBER'
      FixedChar = True
      Size = 10
    end
    object AQ129AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object AQ129RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ129WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ129WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object AQ129REMARK: TStringField
      FieldName = 'REMARK'
      FixedChar = True
      Size = 60
    end
    object AQ129amount_bamt: TFloatField
      FieldName = 'amount_bamt'
      ReadOnly = True
    end
    object AQ129ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object AQ129GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object AQ129VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object AQ129rkey105: TIntegerField
      FieldName = 'rkey105'
      ReadOnly = True
    end
    object AQ129DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object AQ129DSDesigner2: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object AQ129DSDesigner3: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
    object AQ129EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object AQ129abbr15name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr15name'
      Size = 10
    end
  end
  object ADO104: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 3
      end>
    SQL.Strings = (
      'select * from data0104'
      'where rkey =:rkey')
    Left = 38
    Top = 217
    object ADO104RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO104JOURNAL_TITLE: TStringField
      FieldName = 'JOURNAL_TITLE'
      FixedChar = True
      Size = 30
    end
    object ADO104DFLT_ACCT_01: TIntegerField
      FieldName = 'DFLT_ACCT_01'
    end
    object ADO104DFLT_ACCT_02: TIntegerField
      FieldName = 'DFLT_ACCT_02'
    end
    object ADO104DFLT_ACCT_03: TIntegerField
      FieldName = 'DFLT_ACCT_03'
    end
    object ADO104DFLT_ACCT_04: TIntegerField
      FieldName = 'DFLT_ACCT_04'
    end
    object ADO104DFLT_ACCT_05: TIntegerField
      FieldName = 'DFLT_ACCT_05'
    end
    object ADO104DFLT_ACCT_06: TIntegerField
      FieldName = 'DFLT_ACCT_06'
    end
    object ADO104DFLT_ACCT_07: TIntegerField
      FieldName = 'DFLT_ACCT_07'
    end
    object ADO104DFLT_ACCT_08: TIntegerField
      FieldName = 'DFLT_ACCT_08'
    end
    object ADO104DFLT_ACCT_09: TIntegerField
      FieldName = 'DFLT_ACCT_09'
    end
    object ADO104DFLT_ACCT_10: TIntegerField
      FieldName = 'DFLT_ACCT_10'
    end
  end
  object ADO105: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0105'
      'where'
      'Data0105.rkey=:rkey '
      '      ')
    Left = 152
    Top = 216
    object ADO105RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object ADO105BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      FixedChar = True
      Size = 16
    end
    object ADO105STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO105VOU_TYPE: TSmallintField
      FieldName = 'VOU_TYPE'
    end
    object ADO105TRANS_TYPE: TSmallintField
      FieldName = 'TRANS_TYPE'
    end
    object ADO105SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO105ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO105AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object ADO105POSTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'POSTED_BY_EMPL_PTR'
    end
    object ADO105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADO105POSTED_DT: TDateTimeField
      FieldName = 'POSTED_DT'
    end
    object ADO105REOCCURING_TRANS_FLG: TStringField
      FieldName = 'REOCCURING_TRANS_FLG'
      FixedChar = True
      Size = 1
    end
    object ADO105REVERSE_TRANS_FLAG: TStringField
      FieldName = 'REVERSE_TRANS_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO105DATA0105_PTR_REVERSE: TIntegerField
      FieldName = 'DATA0105_PTR_REVERSE'
    end
    object ADO105SPECIAL_POSTING: TStringField
      FieldName = 'SPECIAL_POSTING'
      FixedChar = True
      Size = 1
    end
    object ADO105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADO105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADO105SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO105CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO105casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADO105supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
    end
  end
  object ADO106: TADOQuery
    Connection = ACt
    CursorType = ctStatic
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
      'select * from data0106'
      'where GL_HEADER_PTR=:rkey')
    Left = 212
    Top = 216
    object ADO106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADO106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 10
    end
    object ADO106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADO106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADO106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADO106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADO106INV_PTR: TIntegerField
      FieldName = 'INV_PTR'
    end
    object ADO106UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 14
      Size = 2
    end
    object ADO106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
  object Aqd105: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0105.rkey,Data0105.VOUCHER, Data0105.BATCH_NUMBER,'#13#10' ' +
      'dbo.Data0005.EMPLOYEE_NAME, dbo.Data0105.FYEAR, '#13#10'      dbo.Data' +
      '0105.PERIOD, dbo.Data0105.ATTACHED, dbo.Data0105.ENTERED_DT '#13#10'FR' +
      'OM dbo.Data0105 INNER JOIN'#13#10'      dbo.Data0005 ON '#13#10'      dbo.Da' +
      'ta0105.ENTERED_BY_EMPL_PTR = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0' +
      '105.rkey = :rkey105) '
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 272
    Top = 216
    object Aqd105rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqd105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object Aqd105BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object Aqd105EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqd105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object Aqd105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object Aqd105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object Aqd105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
  end
  object Aqd508: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select CURR_FYEAR, CURR_PERIOD'#13#10'from data0508'
    Parameters = <>
    Left = 96
    Top = 216
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object ADOsp04: TADOStoredProc
    Connection = ACt
    CursorType = ctStatic
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
        Value = 28
      end>
    Left = 162
    Top = 153
    object ADOsp04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOsp04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOsp04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADO132: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0132'
      'where memo_tp=4 and SRCE_PTR=:rkey')
    Left = 226
    Top = 152
    object ADO132RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO132MEMO_NUMBER: TStringField
      FieldName = 'MEMO_NUMBER'
      Size = 10
    end
    object ADO132SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO132SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADO132MEMO_TP: TSmallintField
      FieldName = 'MEMO_TP'
    end
    object ADO132EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO132MEMO_DATE: TDateTimeField
      FieldName = 'MEMO_DATE'
    end
    object ADO132ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO132AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ADO132AVL_AMT: TBCDField
      FieldName = 'AVL_AMT'
      Precision = 19
    end
    object ADO132MATL_TOT: TBCDField
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object ADO132SHIPPING: TBCDField
      FieldName = 'SHIPPING'
      Precision = 19
    end
    object ADO132MISC_TOT: TBCDField
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object ADO132FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object ADO132CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO132EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object ADO132CASH_DISC: TBCDField
      FieldName = 'CASH_DISC'
      Precision = 19
    end
    object ADO132PURCH_DISC: TBCDField
      FieldName = 'PURCH_DISC'
      Precision = 19
    end
    object ADO132REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 50
    end
    object ADO132warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO132memo_status: TWordField
      FieldName = 'memo_status'
    end
  end
  object Aqd106: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = Aqd106CalcFields
    CommandText = 
      'SELECT dbo.Data0106.DESCRIPTION, dbo.Data0106.AMOUNT, dbo.Data01' +
      '06.D_C, '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR, dbo.Data0106.CURR_P' +
      'TR, '#13#10'      dbo.Data0106.EXCH_RATE, dbo.Data0001.CURR_CODE, dbo.' +
      'Data0001.CURR_NAME, '#13#10'      dbo.Data0103.GL_ACC_NUMBER, dbo.Data' +
      '0103.GL_DESCRIPTION, '#13#10'      Data0103_1.GL_DESCRIPTION AS father' +
      '_desc, data0106.PRICE,'#13#10'      Data0103_2.GL_DESCRIPTION AS grand' +
      'father_desc'#13#10'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'#13#10'    ' +
      '  dbo.Data0103 Data0103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_' +
      '1.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0106 INNER JOIN'#13#10'  ' +
      '    dbo.Data0103 ON '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Da' +
      'ta0103.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0106.CURR_' +
      'PTR = dbo.Data0001.RKEY ON '#13#10'      Data0103_1.RKEY = dbo.Data010' +
      '3.PARENT_PTR'#13#10'where data0106.GL_HEADER_PTR=:rkey105'
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 272
    Top = 264
    object Aqd106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object Aqd106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object Aqd106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object Aqd106gl_desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'gl_desc'
      ReadOnly = True
      Size = 200
      Calculated = True
    end
    object Aqd106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object Aqd106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object Aqd106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Aqd106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqd106CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqd106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Aqd106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object Aqd106father_desc: TStringField
      FieldName = 'father_desc'
      Size = 50
    end
    object Aqd106grandfather_desc: TStringField
      FieldName = 'grandfather_desc'
      Size = 50
    end
    object Aqd106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
end
