object dm: Tdm
  OldCreateOrder = False
  Left = 470
  Top = 341
  Height = 262
  Width = 435
  object ACt: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 14
  end
  object Aq107: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = Aq107AfterOpen
    OnCalcFields = Aq107CalcFields
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
        Value = 38401d
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0023.CODE, dbo.Data0023.ABBR_NAME, dbo.Data0107.I' +
        'NVOICE_NO, '
      
        '      dbo.Data0001.CURR_NAME, dbo.Data0107.INV_TP, dbo.Data0107.' +
        'STATUS, '
      '      dbo.Data0107.INV_DATE, dbo.Data0005.EMPLOYEE_NAME,'
      '      Data0107.EX_RATE, Data0107.RKEY,Data0023.SUPPLIER_NAME,'
      '      dbo.Data0015.WAREHOUSE_CODE,dbo.Data0015.WAREHOUSE_NAME,'
      '      Data0107.INV_TOTAL,dbo.Data0107.MATL_TOT,'
      
        '      dbo.Data0107.FED_TAX, dbo.Data0107.MISC_TOT, dbo.Data0107.' +
        'DUE_DATE, '
      
        '      data0107.supp_ptr,data0107.warehouse_ptr,data0107.currency' +
        '_ptr,'
      '      Data0107.INV_TOTAL*Data0107.EX_RATE as total_bamt'
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.Data0107 ON dbo.Data0023.RKEY = dbo.Data0107.SUPP_PTR ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0107.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0107.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0107.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'where  Data0107.INV_DATE>=:dtpk1 and'
      '       Data0107.INV_DATE<=:dtpk2 and'
      '       data0107.status <> :v1 and'
      '       data0107.status <> :v2 and'
      '       data0107.status <> :v3')
    Left = 97
    Top = 80
    object Aq107INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      DisplayWidth = 19
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object Aq107CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 21
      FieldName = 'CURR_NAME'
    end
    object Aq107INV_TP: TWordField
      FieldName = 'INV_TP'
    end
    object Aq107STATUS: TWordField
      FieldName = 'STATUS'
    end
    object Aq107INV_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      DisplayWidth = 15
      FieldName = 'INV_DATE'
    end
    object Aq107EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aq107INV_TOTAL: TBCDField
      DisplayLabel = #24635#35745#37329#39069
      DisplayWidth = 17
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object Aq107EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 12
      FieldName = 'EX_RATE'
    end
    object Aq107v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aq107v_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 8
      Calculated = True
    end
    object Aq107rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aq107CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      DisplayWidth = 12
      FieldName = 'CODE'
      Size = 10
    end
    object Aq107SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aq107ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 13
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aq107WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aq107WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aq107MATL_TOT: TBCDField
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object Aq107FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object Aq107MISC_TOT: TBCDField
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object Aq107DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object Aq107supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object Aq107warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aq107currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object Aq107total_bamt: TBCDField
      DisplayLabel = #24635#35745#37329#39069#26412#24065
      FieldName = 'total_bamt'
      ReadOnly = True
      Precision = 32
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = Aq107
    OnDataChange = DataSource1DataChange
    Left = 32
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 96
    Top = 14
  end
  object ADOSP04: TADOStoredProc
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
        Value = 66
      end>
    Left = 152
    Top = 80
    object ADOSP04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOSP04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOSP04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object aq22: TADOQuery
    Connection = ACt
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey456'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
      '      Data0022.QUANTITY, Data0002.UNIT_NAME, Data0022.PRICE,'
      
        '      Data0022.TAX_2, ROUND(Data0022.QUANTITY * Data0022.PRICE, ' +
        '2)'
      '      AS amount,'
      
        '      ROUND((Data0022.QUANTITY * Data0022.PRICE * Data0022.TAX_2' +
        ' * 0.01)'
      
        '       / (1 + Data0022.TAX_2 * 0.01), 2) AS tax_amount, Data0022' +
        '.GRN_PTR,'
      '      Data0022.RKEY, Data0022.SOURCE_PTR'
      'FROM Data0022 INNER JOIN'
      
        '      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER J' +
        'OIN'
      '      Data0002 ON'
      '      Data0022.LOCATION_PTR_FROM = Data0002.RKEY'
      'WHERE (Data0022.GRN_PTR = :rkey456)')
    Left = 210
    Top = 80
    object aq22INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object aq22INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object aq22QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object aq22UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object aq22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object aq22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq22amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object aq22tax_amount: TBCDField
      FieldName = 'tax_amount'
      ReadOnly = True
      Precision = 32
      Size = 17
    end
    object aq22GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object aq22RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq22SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
  end
  object ADO107: TADOQuery
    Connection = ACt
    Parameters = <
      item
        Name = 'rkey107'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT rkey,INVOICE_NO, SUPP_PTR, CURRENCY_PTR, EX_RATE, warehou' +
        'se_ptr, '
      
        '      EMPL_PTR, INV_TP, STATUS, INV_TOTAL, MATL_TOT, FED_TAX, MI' +
        'SC_TOT, '
      
        '      INV_DATE, ENT_DATE, DUE_DATE, tax_invoice_amt, tax_invoice' +
        '_date, '
      '      tax_invoice_ref'
      'FROM dbo.Data0107'
      'where rkey=:rkey107')
    Left = 98
    Top = 136
    object ADO107rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO107INVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 15
    end
    object ADO107SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO107CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO107EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object ADO107warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO107EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO107INV_TP: TWordField
      FieldName = 'INV_TP'
    end
    object ADO107STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO107INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADO107MATL_TOT: TBCDField
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object ADO107FED_TAX: TBCDField
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object ADO107MISC_TOT: TBCDField
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object ADO107INV_DATE: TDateTimeField
      FieldName = 'INV_DATE'
    end
    object ADO107ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO107DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADO107tax_invoice_amt: TBCDField
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object ADO107tax_invoice_date: TDateTimeField
      FieldName = 'tax_invoice_date'
    end
    object ADO107tax_invoice_ref: TStringField
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 162
    Top = 13
  end
  object ADOupdate70: TADOQuery
    Connection = ACt
    Parameters = <
      item
        Name = 'rkey107'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update data0070'
      'set status=7'
      'where rkey in (select dbo.Data0456.PO_PTR'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY IN' +
        'NER JOIN'
      '      dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR'
      
        'WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STA' +
        'TUS = 6)'
      'GROUP BY dbo.Data0456.PO_PTR'
      
        'HAVING (SUM(dbo.Data0071.QUAN_INVD) >= SUM(dbo.Data0071.QUAN_REC' +
        'D)))')
    Left = 232
    Top = 16
  end
  object ADOupmc70: TADOQuery
    Connection = ACt
    Parameters = <
      item
        Name = 'rkey107'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update data0070'
      'set status=7'
      'where rkey in (select dbo.Data0456.PO_PTR'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY IN' +
        'NER JOIN'
      '      dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR'
      
        'WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STA' +
        'TUS = 6)'
      'GROUP BY dbo.Data0456.PO_PTR'
      
        'HAVING (SUM(dbo.Data0072.QUAN_INVD) >= SUM(dbo.Data0072.QUANTITY' +
        '_RECEIVED)))')
    Left = 304
    Top = 16
  end
  object ADOQuery3: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 272
    Top = 80
  end
end
