object DM: TDM
  OldCreateOrder = False
  Left = 736
  Top = 152
  Height = 590
  Width = 395
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADS105
    Left = 40
    Top = 96
  end
  object ADS105: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0105.RKEY, dbo.Data0105.VOUCHER, dbo.Data0105' +
      '.TRANS_TYPE,'#13#10' dbo.Data0105.ENTERED_DT, dbo.Data0105.STATUS, dbo' +
      '.Data0105.FYEAR, '#13#10'                      dbo.Data0105.PERIOD, db' +
      'o.Data0005.EMPLOYEE_NAME, dbo.Data0105.ATTACHED, '#13#10'dbo.Data0105.' +
      'ENTERED_BY_EMPL_PTR, dbo.Data0105.BATCH_NUMBER, '#13#10'              ' +
      '        dbo.Data0105.CUSTOMER_PTR, dbo.Data0105.CURRENCY_PTR, '#13#10 +
      'dbo.Data0105.EXCHANGE_RATE, dbo.Data0010.ABBR_NAME, dbo.Data0010' +
      '.CUST_CODE, '#13#10'                      dbo.Data0010.CUSTOMER_NAME, ' +
      #13#10'                      CASE data0105.STATUS WHEN 0 THEN '#39#26410#23457#26680#39' W' +
      'HEN 1 THEN '#39#20250#35745#24050#23457#39' '#13#10'WHEN 2 THEN '#39#20027#31649#24050#23457#39' WHEN 3 THEN '#39#24050#30331#24080#39' WHEN 4 ' +
      'THEN '#39#20986#32435#24050#23457#39' WHEN 5 THEN'#13#10'                       '#39#34987#20316#24223#39' END AS v_s' +
      'tatus, dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME'#13#10'FROM     ' +
      '    dbo.Data0105 INNER JOIN'#13#10'                      dbo.Data0005 ' +
      'ON dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Data0005.RKEY INNER JO' +
      'IN'#13#10'                      dbo.Data0010 ON dbo.Data0105.CUSTOMER_' +
      'PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'                      d' +
      'bo.Data0001 ON dbo.Data0105.CURRENCY_PTR = dbo.Data0001.RKEY'#13#10'WH' +
      'ERE     (dbo.Data0105.TRANS_TYPE = 8)'#13#10'and DATA0105.entered_dt>=' +
      ':vdate1'#13#10'and DATA0105.entered_dt<=:vdate2'#13#10'and data0105.STATUS<>' +
      ':vStaus0'#13#10'and data0105.STATUS<>:vStaus1'#13#10'and data0105.STATUS<>:v' +
      'Staus2'#13#10'and data0105.STATUS<>:vStaus3'#13#10'and  data0105.STATUS<>:vS' +
      'taus4'#13#10'and  data0105.STATUS<>:vStaus5'#13#10
    EnableBCD = False
    IndexFieldNames = 'VOUCHER'
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40544d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40848d
      end
      item
        Name = 'vStaus0'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vStaus5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end>
    Prepared = True
    Left = 104
    Top = 96
    object ADS105RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS105VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADS105TRANS_TYPE: TSmallintField
      FieldName = 'TRANS_TYPE'
    end
    object ADS105ENTERED_DT: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ENTERED_DT'
    end
    object ADS105STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADS105FYEAR: TIntegerField
      DisplayLabel = #24180#24230
      FieldName = 'FYEAR'
    end
    object ADS105PERIOD: TSmallintField
      DisplayLabel = #26399#38388
      FieldName = 'PERIOD'
    end
    object ADS105EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS105ATTACHED: TSmallintField
      DisplayLabel = #38468#20214#25968
      FieldName = 'ATTACHED'
    end
    object ADS105ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADS105BATCH_NUMBER: TStringField
      DisplayLabel = #21442#32771#21495
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object ADS105CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADS105CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADS105ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS105CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS105CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS105v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object ADS105CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS105CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS105EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
  end
  object ads106: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
      'ON, dbo.Data0001.CURR_NAME, dbo.Data0001.CURR_CODE, dbo.Data0106' +
      '.GL_HEADER_PTR, '#13#10'                      dbo.Data0106.RKEY, dbo.D' +
      'ata0106.GL_ACCT_NO_PTR, dbo.Data0106.REF_NUMBER, dbo.Data0106.DE' +
      'SCRIPTION, dbo.Data0106.AMOUNT, dbo.Data0106.D_C, '#13#10'            ' +
      '          dbo.Data0106.FYEAR, dbo.Data0106.PERIOD, dbo.Data0106.' +
      'CURR_PTR, '#13#10'round(1/dbo.Data0106.EXCH_RATE,8) as EXCH_RATE,data0' +
      '106.price,'#13#10'round(Data0106.EXCH_RATE*Data0106.AMOUNT,2) as yuan_' +
      'amount,'#13#10' (CASE WHEN data0103_4.GL_DESCRIPTION IS NOT NULL '#13#10'   ' +
      '                   THEN data0103_4.GL_DESCRIPTION + '#39'-'#39' + data01' +
      '03_3.GL_DESCRIPTION + '#39'-'#39' + data0103_2.GL_DESCRIPTION + '#39'-'#39' + da' +
      'ta0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESCRIPTION'#13#10'       ' +
      '                ELSE CASE WHEN data0103_3.GL_DESCRIPTION IS NOT ' +
      'NULL '#13#10'                      THEN data0103_3.GL_DESCRIPTION + '#39'-' +
      #39' + data0103_2.GL_DESCRIPTION + '#39'-'#39' + data0103_1.GL_DESCRIPTION ' +
      '+ '#39'-'#39' + data0103.GL_DESCRIPTION ELSE CASE WHEN data0103_2.GL_DES' +
      'CRIPTION'#13#10'                       IS NOT NULL '#13#10'                 ' +
      '     THEN data0103_2.GL_DESCRIPTION + '#39'-'#39' + data0103_1.GL_DESCRI' +
      'PTION + '#39'-'#39' + data0103.GL_DESCRIPTION ELSE CASE WHEN data0103_1.' +
      'GL_DESCRIPTION IS NOT'#13#10'                       NULL THEN data0103' +
      '_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESCRIPTION ELSE data0103.' +
      'GL_DESCRIPTION END END END END) AS description_2'#13#10'FROM         d' +
      'bo.Data0103 AS Data0103_4 RIGHT OUTER JOIN'#13#10'                    ' +
      '  dbo.Data0103 AS Data0103_3 ON Data0103_4.RKEY = Data0103_3.PAR' +
      'ENT_PTR RIGHT OUTER JOIN'#13#10'                      dbo.Data0103 AS ' +
      'Data0103_2 ON Data0103_3.RKEY = Data0103_2.PARENT_PTR RIGHT OUTE' +
      'R JOIN'#13#10'                      dbo.Data0103 AS Data0103_1 ON Data' +
      '0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'#13#10'          ' +
      '            dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PAREN' +
      'T_PTR INNER JOIN'#13#10'                      dbo.Data0106 ON dbo.Data' +
      '0103.RKEY = dbo.Data0106.GL_ACCT_NO_PTR INNER JOIN'#13#10'            ' +
      '          dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.R' +
      'KEY'#13#10'WHERE (dbo.Data0106.GL_HEADER_PTR =  :rkey)'#13#10
    DataSource = DataSource1
    EnableBCD = False
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 85670
      end>
    Prepared = True
    Left = 104
    Top = 160
    object ads106GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ads106GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ads106description_2: TStringField
      DisplayLabel = #31185#30446#20840#31216
      FieldName = 'description_2'
      ReadOnly = True
      Size = 254
    end
    object ads106CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ads106CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ads106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ads106RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ads106REF_NUMBER: TStringField
      DisplayLabel = #38468#21152#21442#32771
      FieldName = 'REF_NUMBER'
    end
    object ads106DESCRIPTION: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ads106AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads106D_C: TStringField
      DisplayLabel = #20511'/'#36151
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ads106FYEAR: TIntegerField
      DisplayLabel = #24180#24230
      FieldName = 'FYEAR'
    end
    object ads106PERIOD: TSmallintField
      DisplayLabel = #26376#20221
      FieldName = 'PERIOD'
    end
    object ads106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ads106EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
      ReadOnly = True
    end
    object ads106yuan_amount: TFloatField
      FieldName = 'yuan_amount'
      ReadOnly = True
    end
    object ads106price: TFloatField
      FieldName = 'price'
    end
  end
  object DataSource2: TDataSource
    DataSet = ads106
    Left = 40
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 192
    Top = 48
  end
  object ADO104: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0104'
      'where rkey=16')
    Left = 256
    Top = 48
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
  object Aqd508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select CURR_FYEAR, CURR_PERIOD'#13#10'from data0508'
    Parameters = <>
    Left = 256
    Top = 144
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object ADO105: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
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
      'where Data0105.rkey=:rkey ')
    Left = 104
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
    object ADO105CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO105casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADO105supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
    end
    object ADO105CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO105EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
  end
  object ADO106: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
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
      
        'select gl_header_ptr,gl_acct_no_ptr,ref_number,description,amoun' +
        't,d_c,curr_ptr,exch_rate,price'
      'from data0106'
      'where GL_HEADER_PTR=:rkey')
    Left = 104
    Top = 272
    object ADO106gl_header_ptr: TIntegerField
      FieldName = 'gl_header_ptr'
    end
    object ADO106gl_acct_no_ptr: TIntegerField
      FieldName = 'gl_acct_no_ptr'
    end
    object ADO106ref_number: TStringField
      FieldName = 'ref_number'
    end
    object ADO106description: TStringField
      FieldName = 'description'
      Size = 100
    end
    object ADO106amount: TFloatField
      FieldName = 'amount'
    end
    object ADO106d_c: TStringField
      FieldName = 'd_c'
      FixedChar = True
      Size = 1
    end
    object ADO106curr_ptr: TIntegerField
      FieldName = 'curr_ptr'
    end
    object ADO106exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object ADO106price: TFloatField
      FieldName = 'price'
    end
  end
end
