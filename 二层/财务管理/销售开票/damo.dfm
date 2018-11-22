object DM: TDM
  OldCreateOrder = False
  Left = 472
  Top = 251
  Height = 387
  Width = 393
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
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
      'data0105.REVERSE_TRANS_FLAG,'#13#10'                      CASE data010' +
      '5.STATUS WHEN 0 THEN '#39#26410#23457#26680#39' WHEN 1 THEN '#39#20250#35745#24050#23457#39' '#13#10'WHEN 2 THEN '#39#20027#31649#24050 +
      #23457#39' WHEN 3 THEN '#39#24050#30331#24080#39' WHEN 4 THEN '#39#20986#32435#24050#23457#39' WHEN 5 THEN'#13#10'           ' +
      '            '#39#34987#20316#24223#39' END AS v_status, dbo.Data0001.CURR_CODE, dbo.D' +
      'ata0001.CURR_NAME'#13#10'FROM         dbo.Data0105 INNER JOIN'#13#10'       ' +
      '               dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EMPL_PTR ' +
      '= dbo.Data0005.RKEY INNER JOIN'#13#10'                      dbo.Data00' +
      '10 ON dbo.Data0105.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER J' +
      'OIN'#13#10'                      dbo.Data0001 ON dbo.Data0105.CURRENCY' +
      '_PTR = dbo.Data0001.RKEY'#13#10'WHERE     (dbo.Data0105.TRANS_TYPE = 5' +
      ')'#13#10'and DATA0105.entered_dt>=:vdate1'#13#10'and DATA0105.entered_dt<=:v' +
      'date2'#13#10'and data0105.STATUS<>:vStaus0'#13#10'and data0105.STATUS<>:vSta' +
      'us1'#13#10'and data0105.STATUS<>:vStaus2'#13#10'and data0105.STATUS<>:vStaus' +
      '3'#13#10'and  data0105.STATUS<>:vStaus4'#13#10'and  data0105.STATUS<>:vStaus' +
      '5'#13#10
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
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADS105EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object ADS105REVERSE_TRANS_FLAG: TStringField
      DisplayLabel = #35299#38145
      FieldName = 'REVERSE_TRANS_FLAG'
      FixedChar = True
      Size = 1
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
      'CURR_PTR, '#13#10'round(1/dbo.Data0106.EXCH_RATE,8) as EXCH_RATE,'#13#10' da' +
      'ta0106.price as yuan_amount,'#13#10' (CASE WHEN data0103_4.GL_DESCRIPT' +
      'ION IS NOT NULL '#13#10'                      THEN data0103_4.GL_DESCR' +
      'IPTION + '#39'-'#39' + data0103_3.GL_DESCRIPTION + '#39'-'#39' + data0103_2.GL_D' +
      'ESCRIPTION + '#39'-'#39' + data0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL' +
      '_DESCRIPTION'#13#10'                       ELSE CASE WHEN data0103_3.G' +
      'L_DESCRIPTION IS NOT NULL '#13#10'                      THEN data0103_' +
      '3.GL_DESCRIPTION + '#39'-'#39' + data0103_2.GL_DESCRIPTION + '#39'-'#39' + data0' +
      '103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESCRIPTION ELSE CASE W' +
      'HEN data0103_2.GL_DESCRIPTION'#13#10'                       IS NOT NUL' +
      'L '#13#10'                      THEN data0103_2.GL_DESCRIPTION + '#39'-'#39' +' +
      ' data0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESCRIPTION ELSE ' +
      'CASE WHEN data0103_1.GL_DESCRIPTION IS NOT'#13#10'                    ' +
      '   NULL THEN data0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESCR' +
      'IPTION ELSE data0103.GL_DESCRIPTION END END END END) AS descript' +
      'ion_2'#13#10'FROM         dbo.Data0103 AS Data0103_4 RIGHT OUTER JOIN'#13 +
      #10'                      dbo.Data0103 AS Data0103_3 ON Data0103_4.' +
      'RKEY = Data0103_3.PARENT_PTR RIGHT OUTER JOIN'#13#10'                 ' +
      '     dbo.Data0103 AS Data0103_2 ON Data0103_3.RKEY = Data0103_2.' +
      'PARENT_PTR RIGHT OUTER JOIN'#13#10'                      dbo.Data0103 ' +
      'AS Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT O' +
      'UTER JOIN'#13#10'                      dbo.Data0103 ON Data0103_1.RKEY' +
      ' = dbo.Data0103.PARENT_PTR INNER JOIN'#13#10'                      dbo' +
      '.Data0106 ON dbo.Data0103.RKEY = dbo.Data0106.GL_ACCT_NO_PTR INN' +
      'ER JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0106.CURR' +
      '_PTR = dbo.Data0001.RKEY'#13#10'WHERE (dbo.Data0106.GL_HEADER_PTR =  :' +
      'rkey)'#13#10
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
      'where rkey=5')
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
        't,d_c,curr_ptr,exch_rate,price from data0106'
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
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT Data0064.GLPTR_STATUS,dbo.Data0064.' +
        'RKEY, dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER, d' +
        'bo.Data0025.MANU_PART_DESC, '
      
        '                      dbo.Data0097.PO_NUMBER, dbo.data0439.deliv' +
        'ery_no, dbo.data0439.date_sailing, dbo.Data0064.QUAN_SHIPPED, db' +
        'o.Data0060.PARTS_ALLOC, '
      
        '                      dbo.Data0064.cust_decl, dbo.Data0064.TAX_2' +
        ', dbo.Data0112.invoice_number, dbo.Data0064.SHIPMENT_NO, dbo.Dat' +
        'a0064.ovsh_qty, '
      
        '                      dbo.Data0064.QUAN_SHIPPED - dbo.Data0064.o' +
        'vsh_qty AS alloc_qty, dbo.Data0015.ABBR_NAME, dbo.Data0010.CUST_' +
        'CODE, dbo.Data0010.ABBR_NAME AS Expr1, '
      '                      dbo.Data0001.CURR_CODE'
      'FROM         dbo.Data0064 INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.' +
        'Data0060.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.data0439 ON dbo.Data0064.packing_list_' +
        'ptr = dbo.data0439.rkey INNER JOIN'
      
        '                      dbo.Data0112 ON dbo.data0439.invoice_ptr =' +
        ' dbo.Data0112.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0112.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0112.warehouse_ptr' +
        ' = dbo.Data0015.RKEY'
      
        'WHERE     (dbo.Data0064.GLPTR_STATUS = 0) AND (dbo.Data0064.ovsh' +
        '_qty = 0) AND (dbo.Data0060.PARTS_ALLOC = 0)')
    Left = 272
    Top = 224
    object ADOQuery3GLPTR_STATUS: TBooleanField
      DisplayLabel = #36873#39033
      DisplayWidth = 5
      FieldName = 'GLPTR_STATUS'
      OnChange = ADOQuery3GLPTR_STATUSChange
    end
    object ADOQuery3SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery3MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 12
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery3MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 17
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery3PO_NUMBER: TStringField
      DisplayLabel = #21512#21516#21495
      DisplayWidth = 23
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery3delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      DisplayWidth = 10
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADOQuery3date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      DisplayWidth = 10
      FieldName = 'date_sailing'
    end
    object ADOQuery3QUAN_SHIPPED: TIntegerField
      DisplayLabel = #24050#35013#36816#25968#37327
      DisplayWidth = 10
      FieldName = 'QUAN_SHIPPED'
    end
    object ADOQuery3PARTS_ALLOC: TFloatField
      DisplayLabel = #19981#21547#31246#20215#26684'PCS'
      DisplayWidth = 10
      FieldName = 'PARTS_ALLOC'
    end
    object ADOQuery3cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      DisplayWidth = 8
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADOQuery3TAX_2: TBCDField
      DisplayLabel = #22686#20540#31246#29575'%'
      DisplayWidth = 5
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOQuery3invoice_number: TStringField
      DisplayLabel = #21457#31080#21495#30721
      DisplayWidth = 12
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ADOQuery3SHIPMENT_NO: TSmallintField
      DisplayLabel = #35013#36816#21495#30721
      DisplayWidth = 10
      FieldName = 'SHIPMENT_NO'
    end
    object ADOQuery3ovsh_qty: TIntegerField
      DisplayLabel = #24050#24320#31080#25968#37327
      DisplayWidth = 10
      FieldName = 'ovsh_qty'
    end
    object ADOQuery3alloc_qty: TIntegerField
      DisplayLabel = #24453#24320#31080#25968#37327
      DisplayWidth = 10
      FieldName = 'alloc_qty'
      ReadOnly = True
    end
    object ADOQuery3ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery3CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery3Expr1: TStringField
      DisplayLabel = #23458#25143#31616#31216
      DisplayWidth = 10
      FieldName = 'Expr1'
      Size = 10
    end
    object ADOQuery3CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery3RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 208
    Top = 224
  end
end
