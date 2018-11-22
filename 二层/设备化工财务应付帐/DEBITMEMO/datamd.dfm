object dm: Tdm
  OldCreateOrder = False
  Left = 440
  Top = 204
  Height = 361
  Width = 395
  object ACt: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=SJ_V20_SAMPLE;Data Source=W119'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 50
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 104
    Top = 34
  end
  object aq132: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aq132CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37257d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38776d
      end
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
      end>
    SQL.Strings = (
      
        'SELECT Data0132.rkey,Data0132.MEMO_NUMBER, dbo.Data0023.CODE, db' +
        'o.Data0023.ABBR_NAME,'
      
        '      dbo.Data0132.AMOUNT, dbo.Data0132.AVL_AMT, dbo.Data0132.ME' +
        'MO_DATE,'
      
        '      dbo.Data0132.MEMO_TP, dbo.Data0132.REF_NUMBER, Data0132.EX' +
        '_RATE,'
      
        '      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME,Data0132.ch' +
        'eck_ptr, '
      
        '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0132.MATL_TOT,data0132' +
        '.ent_date, '
      
        '      dbo.Data0132.MISC_TOT, dbo.Data0132.FED_TAX,data0023.suppl' +
        'ier_name,'
      '      Data0132.SUPP_PTR,Data0132.CURRENCY_PTR'
      'FROM dbo.Data0132 INNER JOIN'
      
        '      dbo.Data0023 ON Data0132.SUPP_PTR = dbo.Data0023.RKEY INNE' +
        'R JOIN'
      
        '      dbo.Data0001 ON Data0132.CURRENCY_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0005 ON dbo.Data0132.EMPL_PTR = dbo.Data0005.RKEY'
      'where Data0132.MEMO_DATE>=:dtpk1 and'
      '      Data0132.MEMO_DATE<=:dtpk2 and'
      '      Data0132.MEMO_TP <> :v2 and'
      '      Data0132.MEMO_TP <> :v3 and'
      '      Data0132.MEMO_TP <> :v4'
      'order by  Data0132.MEMO_NUMBER')
    Left = 104
    Top = 96
    object aq132rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq132MEMO_NUMBER: TStringField
      DisplayLabel = #22791#24536#32534#21495
      DisplayWidth = 11
      FieldName = 'MEMO_NUMBER'
      Size = 10
    end
    object aq132CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 10
    end
    object aq132ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq132AMOUNT: TBCDField
      DisplayLabel = #20511#39033#37329#39069
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object aq132AVL_AMT: TBCDField
      DisplayLabel = #21487#29992#37329#39069
      DisplayWidth = 8
      FieldName = 'AVL_AMT'
      Precision = 19
    end
    object aq132MEMO_DATE: TDateTimeField
      DisplayLabel = #26085#26399
      DisplayWidth = 13
      FieldName = 'MEMO_DATE'
    end
    object aq132MEMO_TP: TSmallintField
      DisplayWidth = 8
      FieldName = 'MEMO_TP'
    end
    object aq132REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 11
      FieldName = 'REF_NUMBER'
    end
    object aq132EX_RATE: TBCDField
      DisplayLabel = #27719#29575
      DisplayWidth = 9
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object aq132CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aq132CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 12
      FieldName = 'CURR_NAME'
    end
    object aq132EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#21592#24037
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq132MATL_TOT: TBCDField
      DisplayWidth = 12
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object aq132MISC_TOT: TBCDField
      DisplayWidth = 20
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object aq132FED_TAX: TBCDField
      DisplayWidth = 20
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object aq132v_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 8
      Calculated = True
    end
    object aq132supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object aq132check_ptr: TIntegerField
      FieldName = 'check_ptr'
    end
    object aq132SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object aq132CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aq132ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
  end
  object DataSource1: TDataSource
    DataSet = aq132
    Left = 48
    Top = 96
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
    Left = 49
    Top = 160
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
    Left = 160
    Top = 96
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
    object ADO132CHECK_PTR: TIntegerField
      FieldName = 'CHECK_PTR'
    end
  end
end
