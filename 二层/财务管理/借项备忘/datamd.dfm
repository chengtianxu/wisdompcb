object dm: Tdm
  OldCreateOrder = False
  Left = 440
  Top = 204
  Height = 361
  Width = 395
  object ACt: TADOConnection
    ConnectionString = 'FILE NAME=D:\vss_work\172.16.68.8.udl'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 38
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 94
    Top = 31
  end
  object DataSource1: TDataSource
    DataSet = aq132
    Left = 37
    Top = 92
  end
  object ADOsp04: TADOStoredProc
    Connection = ACt
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
    Left = 313
    Top = 151
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
      'where rkey=:rkey')
    Left = 151
    Top = 93
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
    object ADO132memo_status: TWordField
      FieldName = 'memo_status'
    end
    object ADO132warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object aq132: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = aq132AfterOpen
    CommandText = 
      'SELECT dbo.Data0132.RKEY, dbo.Data0132.MEMO_NUMBER, dbo.Data0023' +
      '.CODE, '#13#10'      dbo.Data0023.ABBR_NAME, dbo.Data0132.AMOUNT, dbo.' +
      'Data0132.AVL_AMT, '#13#10'      dbo.Data0132.MEMO_DATE, dbo.Data0132.M' +
      'EMO_TP, dbo.Data0132.REF_NUMBER, '#13#10'      dbo.Data0132.EX_RATE, d' +
      'bo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '#13#10'      dbo.Data0' +
      '005.EMPLOYEE_NAME, data0132.empl_ptr,data0132.memo_status,'#13#10'    ' +
      '  dbo.Data0132.MATL_TOT, dbo.Data0132.MISC_TOT, dbo.Data0132.FED' +
      '_TAX, data0132.warehouse_ptr,'#13#10'Data0023.SUPPLIER_NAME, Data0132.' +
      'SUPP_PTR, '#13#10'Data0132.CURRENCY_PTR, Data0132.ENT_DATE, Data0105.V' +
      'OUCHER, '#13#10'Data0105.RKEY AS rkey105,Data0105.STATUS,data0023.ACC_' +
      'PAYABLE_PTR,'#13#10'case data0105.STATUS when 0 then '#39#26410#23457#26680#39' when 1 then' +
      ' '#39#20250#35745#24050#23457#39#13#10'when 2 then '#39#20027#31649#24050#23457#39' when 3 then '#39#24050#30331#24080#39' when 4 then '#39#20986#32435#24050#23457#39 +
      ' '#13#10'when 5 then '#39#34987#20316#24223#39' end as '#20973#35777#29366#24577','#13#10'case data0132.memo_tp when 1 ' +
      'then '#39#20445#30041#22791#29992#39' when 2 then '#39#25187#27454#22791#24536#39#13#10'when 3 then '#39#36864#36135#22791#24536#39' when 4 then '#39 +
      #39044#20184#22791#24536#39' end as v_type,'#13#10'case data0132.memo_status when 1 then '#39#26377#25928#30340 +
      #39' when 2 then '#39#24050#20351#29992#39#13#10' when 3 then '#39#34987#21462#28040#39' end as '#22791#24536#29366#24577','#13#10'round(data' +
      '0132.amount*data0132.ex_rate,2) as stand_amount,'#13#10'round(data0132' +
      '.avl_amt*data0132.ex_rate,2) as stand_avlamount ,data0015.abbr_n' +
      'ame abbr_name_1,data0015.warehouse_code,dbo.Data0132.GLPTR_STATU' +
      'S'#13#10'FROM dbo.Data0132 INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0' +
      '132.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0001 ' +
      'ON dbo.Data0132.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'   ' +
      '   dbo.Data0005 ON '#13#10'      dbo.Data0132.EMPL_PTR = dbo.Data0005.' +
      'RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0105 ON dbo.Data0132.RKEY = ' +
      'dbo.Data0105.SOURCE_PTR AND '#13#10'      dbo.Data0105.TRANS_TYPE = 4 ' +
      'left join data0015 on data0132.warehouse_ptr=data0015.rkey'#13#10'wher' +
      'e   Data0132.MEMO_TP <> :v2 and'#13#10'      Data0132.MEMO_TP <> :v3 a' +
      'nd'#13#10'      Data0132.MEMO_TP <> :v4 '#13#10'    and Data0132.MEMO_DATE>=' +
      ':dtpk1'#13#10'    and Data0132.MEMO_DATE<=:dtpk2'
    Parameters = <
      item
        Name = 'v2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 96
    Top = 96
    object aq132RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq132MEMO_NUMBER: TStringField
      DisplayLabel = #22791#24536#32534#21495
      FieldName = 'MEMO_NUMBER'
      Size = 10
    end
    object aq132CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aq132ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq132SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 30
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aq132AMOUNT: TBCDField
      DisplayLabel = #20511#39033#37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object aq132AVL_AMT: TBCDField
      DisplayLabel = #21487#29992#37329#39069
      FieldName = 'AVL_AMT'
      Precision = 19
    end
    object aq132MEMO_DATE: TDateTimeField
      DisplayLabel = #22791#24536#26085#26399
      FieldName = 'MEMO_DATE'
    end
    object aq132ENT_DATE: TDateTimeField
      DisplayLabel = #25187#27454#26085#26399
      FieldName = 'ENT_DATE'
    end
    object aq132MEMO_TP: TSmallintField
      FieldName = 'MEMO_TP'
    end
    object aq132REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
    end
    object aq132EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EX_RATE'
    end
    object aq132CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aq132CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object aq132EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq132MATL_TOT: TBCDField
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object aq132MISC_TOT: TBCDField
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object aq132FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object aq132SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object aq132CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aq132VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object aq132rkey105: TIntegerField
      FieldName = 'rkey105'
      ReadOnly = True
    end
    object aq132STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object aq132DSDesigner: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
    object aq132v_type: TStringField
      DisplayLabel = #22791#24536#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object aq132stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object aq132stand_avlamount: TFloatField
      FieldName = 'stand_avlamount'
      ReadOnly = True
    end
    object aq132ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object aq132empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object aq132memo_status: TWordField
      FieldName = 'memo_status'
    end
    object aq132DSDesigner2: TStringField
      FieldName = #22791#24536#29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq132abbr_name_1: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name_1'
      Size = 10
    end
    object aq132warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aq132warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aq132GLPTR_STATUS: TBooleanField
      DisplayLabel = #31246#31080#26631#35782
      FieldName = 'GLPTR_STATUS'
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
        Value = 4
      end>
    SQL.Strings = (
      'select * from data0104'
      'where rkey =:rkey')
    Left = 38
    Top = 220
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
    Left = 161
    Top = 219
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
    Left = 212
    Top = 219
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
    Left = 272
    Top = 219
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
    Left = 100
    Top = 219
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object aq210: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzep132;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@SUPP_PTR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 168
      end
      item
        Name = '@currency_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@warehouse_ptr'
        Size = -1
        Value = Null
      end>
    Left = 97
    Top = 155
    object aq210GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aq210DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aq210INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 60
    end
    object aq210INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object aq210TDATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TDATE'
    end
    object aq210QUANTITY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUANTITY'
    end
    object aq210UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aq210PRICE: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object aq210TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq210RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq210employee_name: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object DataSource2: TDataSource
    DataSet = aq210
    Left = 37
    Top = 155
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
      '_desc, data0106.price,'#13#10'      Data0103_2.GL_DESCRIPTION AS grand' +
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
    Left = 320
    Top = 219
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
    object Aqd106price: TBCDField
      FieldName = 'price'
      Precision = 14
      Size = 2
    end
  end
end
