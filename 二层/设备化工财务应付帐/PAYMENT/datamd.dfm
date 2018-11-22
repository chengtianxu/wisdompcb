object dm: Tdm
  OldCreateOrder = False
  Left = 439
  Top = 214
  Height = 391
  Width = 457
  object ACt: TADOConnection
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
  object AQ129: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ129AfterOpen
    OnCalcFields = AQ129CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38768d
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
    SQL.Strings = (
      'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0128.BANK_NAME, '
      
        '      dbo.Data0128.BAL_AMOUNT, dbo.Data0129.EX_RATE, dbo.Data000' +
        '1.CURR_NAME,'
      
        '      dbo.Data0001.CURR_CODE, dbo.Data0023.CODE, dbo.Data0023.SU' +
        'PPLIER_NAME, '
      
        '      dbo.Data0023.ABBR_NAME, dbo.Data0129.TTYPE, dbo.Data0129.S' +
        'TATUS, '
      
        '      dbo.Data0129.TDATE, dbo.Data0129.CHECK_NUMBER, dbo.Data012' +
        '9.AMOUNT,'
      '      dbo.Data0129.RKEY, dbo.Data0015.WAREHOUSE_CODE,'
      '      dbo.Data0015.WAREHOUSE_NAME,data0129.REMARK,'
      '      Data0129.AMOUNT*Data0129.EX_RATE as amount_bamt'
      'FROM dbo.Data0129 INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0129.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0129.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0129.SRCE_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0015 ON '
      
        '      dbo.Data0129.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER ' +
        'JOIN'
      '      dbo.Data0128 ON dbo.Data0129.BANK_PTR = dbo.Data0128.RKEY'
      'WHERE (Data0129.TTYPE <> 3) and'
      '      (Data0129.TDATE>=:dtpk1) and'
      '      (Data0129.TDATE<=:dtpk2) and'
      '      (Data0129.STATUS<>:v1) and'
      '      (Data0129.STATUS<>:v2) and'
      '      (Data0129.STATUS<>:v3)'
      '      '
      'order by  Data0129.CHECK_NUMBER')
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
    object AQ129EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object AQ129CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object AQ129CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ129CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object AQ129SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AQ129ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
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
      Size = 10
    end
    object AQ129AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object AQ129v_type: TStringField
      DisplayLabel = #25903#31080#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 8
      Calculated = True
    end
    object AQ129v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object AQ129rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ129bal_amount: TFloatField
      FieldName = 'bal_amount'
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
    object AQ129amount_bamt: TBCDField
      FieldName = 'amount_bamt'
      ReadOnly = True
      Precision = 32
      Size = 12
    end
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
    Parameters = <>
    SQL.Strings = (
      'select * from data0129'
      'where rkey is null')
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
    object ADO129EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object ADO129REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object ADO129warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADO130: TADOQuery
    Connection = ACt
    Parameters = <>
    SQL.Strings = (
      'select * from data0130'
      'where rkey is null')
    Left = 104
    Top = 200
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
end
