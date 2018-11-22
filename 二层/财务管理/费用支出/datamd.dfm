object dm: Tdm
  OldCreateOrder = False
  Left = 583
  Top = 225
  Height = 391
  Width = 457
  object ACt: TADOConnection
    KeepConnection = False
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
    Left = 40
    Top = 144
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
      'where rkey=:rkey')
    Left = 104
    Top = 144
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
    object ADO129EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
  end
  object ADO521: TADOQuery
    Connection = ACt
    Parameters = <
      item
        Name = 'rkey129'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0521'
      'where ttype=0 and SRCE_PTR=:rkey129')
    Left = 104
    Top = 200
    object ADO521RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO521TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO521EXPENSE_TP: TStringField
      FieldName = 'EXPENSE_TP'
    end
    object ADO521SUMMARIZE: TStringField
      FieldName = 'SUMMARIZE'
      Size = 50
    end
    object ADO521SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADO521AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ADO521inex_ptr: TIntegerField
      FieldName = 'inex_ptr'
    end
  end
  object AQ129: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ129AfterOpen
    CommandText = 
      'SELECT dbo.Data0129.CHECK_NUMBER, dbo.Data0129.AMOUNT, '#13#10'      d' +
      'bo.Data0005.EMPLOYEE_NAME, dbo.Data0128.BANK_NAME, '#13#10'      dbo.D' +
      'ata0128.BAL_AMOUNT, dbo.Data0129.EX_RATE, dbo.Data0001.CURR_NAME' +
      ', '#13#10'      dbo.Data0001.CURR_CODE, dbo.Data0129.TDATE, dbo.Data01' +
      '29.RKEY, '#13#10'      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREH' +
      'OUSE_NAME, '#13#10'      dbo.Data0129.REMARK, Data0005_1.EMPL_CODE, Da' +
      'ta0129.EMPL_PTR,'#13#10'      Data0005_1.EMPLOYEE_NAME AS '#32463#21150#20154#21592', '#13#10'    ' +
      '  dbo.Data0129.AMOUNT * dbo.Data0129.EX_RATE AS amount_bamt, '#13#10' ' +
      '     dbo.Data0105.VOUCHER, dbo.Data0105.RKEY AS rkey105,'#13#10'case d' +
      'ata0105.STATUS when 0 then '#39#26410#23457#26680#39' when 1 then '#39#20250#35745#24050#23457#39#13#10'when 2 then' +
      ' '#39#20027#31649#24050#23457#39' when 3 then '#39#24050#30331#24080#39' when 4 then '#39#20986#32435#24050#23457#39' '#13#10'when 5 then '#39#34987#20316#24223#39 +
      ' end as '#20973#35777#29366#24577','#13#10'data0129.status, data0128.GL_ACCT_PTR'#13#10'FROM dbo.D' +
      'ata0129 INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0129.EMPL_PTR ' +
      '= dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data01' +
      '29.CURR_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0015 O' +
      'N dbo.Data0129.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'   ' +
      '   dbo.Data0128 ON dbo.Data0129.BANK_PTR = dbo.Data0128.RKEY INN' +
      'ER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON '#13#10'      dbo.Data0129.S' +
      'RCE_PTR = Data0005_1.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0105 ON' +
      ' dbo.Data0129.RKEY = dbo.Data0105.SOURCE_PTR AND '#13#10'      dbo.Dat' +
      'a0105.TRANS_TYPE = 3'#13#10'WHERE (dbo.Data0129.TTYPE = 3) and'#13#10'      ' +
      '(Data0129.TDATE>=:dtpk1) and'#13#10'      (Data0129.TDATE<=:dtpk2) '#13#10
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
      end>
    Prepared = True
    Left = 102
    Top = 88
    object AQ129CHECK_NUMBER: TStringField
      DisplayLabel = #25903#31080#32534#21495
      FieldName = 'CHECK_NUMBER'
      Size = 10
    end
    object AQ129AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object AQ129EMPLOYEE_NAME: TStringField
      DisplayLabel = #25903#20184#21592#24037
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
      FieldName = 'CURR_NAME'
    end
    object AQ129CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ129TDATE: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'TDATE'
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
      Size = 60
    end
    object AQ129EMPL_CODE: TStringField
      DisplayLabel = #25910#27454#20154#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQ129amount_bamt: TFloatField
      FieldName = 'amount_bamt'
      ReadOnly = True
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
    object AQ129DSDesigner2: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
    object AQ129status: TSmallintField
      FieldName = 'status'
    end
    object AQ129GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object AQ129DSDesigner: TStringField
      FieldName = #32463#21150#20154#21592
      Size = 16
    end
    object AQ129EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
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
    Left = 54
    Top = 257
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
    Left = 168
    Top = 256
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
      Size = 10
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
    Left = 228
    Top = 256
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
    object ADO106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
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
    object ADO106PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object Aqd105: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0105.rkey,Data0105.VOUCHER, dbo.Data0005.EMPLOYEE_NAM' +
      'E, dbo.Data0105.FYEAR, '#13#10'      dbo.Data0105.PERIOD, dbo.Data0105' +
      '.ATTACHED, dbo.Data0105.ENTERED_DT '#13#10'FROM dbo.Data0105 INNER JOI' +
      'N'#13#10'      dbo.Data0005 ON '#13#10'      dbo.Data0105.ENTERED_BY_EMPL_PT' +
      'R = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0105.rkey = :rkey105) '
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 288
    Top = 256
    object Aqd105rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqd105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
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
    Left = 112
    Top = 256
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
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
    Left = 344
    Top = 256
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
