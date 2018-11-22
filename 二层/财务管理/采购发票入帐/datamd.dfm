object dm: Tdm
  OldCreateOrder = False
  Left = 466
  Top = 217
  Height = 423
  Width = 412
  object ACt: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 14
  end
  object DataSource1: TDataSource
    DataSet = Aq107
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
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey456'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_NAME,Data0017.INV_DESCRIPTION,'
      
        'Data0022.QUANTITY, Data0002.UNIT_NAME, Data0022.tax_PRICE as pri' +
        'ce,'
      
        'Data0022.TAX_2, ROUND(Data0022.QUANTITY * Data0022.tax_PRICE, 2)' +
        ' AS amount,'
      
        'ROUND((Data0022.QUANTITY * Data0022.tax_PRICE * Data0022.TAX_2 *' +
        ' 0.01)'
      
        '/(1 + Data0022.TAX_2 * 0.01), 2) AS tax_amount, Data0022.GRN_PTR' +
        ','
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
    object aq22price: TBCDField
      FieldName = 'price'
      Precision = 13
    end
  end
  object ADO107: TADOQuery
    Connection = ACt
    CursorType = ctStatic
    EnableBCD = False
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
      
        'SELECT rkey,INVOICE_NO, SUPP_PTR, CURRENCY_PTR, EX_RATE,warehous' +
        'e_ptr,  '
      
        '      EMPL_PTR, INV_TP, STATUS, INV_TOTAL, MATL_TOT, FED_TAX, MI' +
        'SC_TOT, '
      
        '      INV_DATE, ENT_DATE, DUE_DATE, tax_invoice_amt, tax_invoice' +
        '_date, '
      '      tax_invoice_ref,AMT_PAID,CASH_DISC'
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
      Size = 16
    end
    object ADO107SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO107CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO107EX_RATE: TFloatField
      FieldName = 'EX_RATE'
    end
    object ADO107EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
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
    object ADO107warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO107INV_TP: TStringField
      FieldName = 'INV_TP'
      FixedChar = True
      Size = 1
    end
    object ADO107AMT_PAID: TBCDField
      FieldName = 'AMT_PAID'
      Precision = 19
    end
    object ADO107CASH_DISC: TBCDField
      FieldName = 'CASH_DISC'
      Precision = 19
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
      
        'HAVING SUM(dbo.Data0071.QUAN_INVD) >= SUM(dbo.Data0071.QUAN_RECD' +
        '))')
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
      
        'HAVING SUM(dbo.Data0072.QUAN_INVD) >= SUM(dbo.Data0072.QUANTITY_' +
        'RECEIVED))')
    Left = 304
    Top = 16
  end
  object ADOQuery3: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 272
    Top = 80
  end
  object Aq107: TADODataSet
    Connection = ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = Aq107AfterOpen
    CommandText = 
      'SELECT Data0107.RKEY, Data0023.CODE, Data0023.ABBR_NAME, '#13#10'     ' +
      ' Data0107.INVOICE_NO, Data0001.CURR_NAME, Data0107.INV_TP, '#13#10'   ' +
      '   dbo.Data0107.INV_DATE, dbo.Data0005.EMPLOYEE_NAME, Data0107.E' +
      'X_RATE, '#13#10'      dbo.Data0023.SUPPLIER_NAME, dbo.Data0107.INV_TOT' +
      'AL, data0107.status,'#13#10'      dbo.Data0107.MATL_TOT, dbo.Data0107.' +
      'FED_TAX, dbo.Data0107.MISC_TOT, '#13#10'      dbo.Data0107.DUE_DATE, d' +
      'bo.Data0107.SUPP_PTR, dbo.Data0107.CURRENCY_PTR, '#13#10'      dbo.Dat' +
      'a0107.INV_TOTAL * dbo.Data0107.EX_RATE AS total_bamt, '#13#10'      Da' +
      'ta0107.AMT_PAID, Data0105.VOUCHER, Data0105.RKEY AS rkey105, '#13#10' ' +
      '     Data0107.warehouse_ptr, dbo.Data0015.WAREHOUSE_CODE, '#13#10'    ' +
      '  Data0015.WAREHOUSE_NAME,data0001.curr_code,data0015.abbr_name ' +
      'as name15,'#13#10'case data0107.status when 1 then '#39#26377#25928#30340#39' when 2 then '#39 +
      #24050#20184#27454#39#13#10'when 3 then '#39#34987#21462#28040#39' end as  '#29366#24577',Data0107.EMPL_PTR,'#13#10'case data' +
      '0107.inv_tp when '#39'0'#39' then '#39#26631#20934'PO'#39' when '#39'1'#39' then '#39#26434#39033'PO'#39' '#13#10'when '#39'2'#39 +
      ' then '#39#30452#25509#20837#20179#39' when '#39'3'#39' then '#39#22996#22806#21152#24037#39' '#13#10'when '#39'4'#39'  then '#39#20854#23427#36153#29992#39' end as' +
      '  '#31867#22411','#13#10'case data0105.STATUS when 0 then '#39#26410#23457#26680#39' when 1 then '#39#20250#35745#24050#23457#39 +
      #13#10'when 2 then '#39#20027#31649#24050#23457#39' when 3 then '#39#24050#30331#24080#39' when 4 then '#39#20986#32435#24050#23457#39' '#13#10'when' +
      ' 5 then '#39#34987#20316#24223#39' end as '#20973#35777#29366#24577',data0107.GLPTR_STATUS,(Data0107.INV_TO' +
      'TAL-Data0107.AMT_PAID) as '#26410#20184#37329#39069#13#10'FROM dbo.Data0023 INNER JOIN'#13#10'  ' +
      '    dbo.Data0107 ON dbo.Data0023.RKEY = dbo.Data0107.SUPP_PTR IN' +
      'NER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0107.EMPL_PTR = dbo.Data' +
      '0005.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0107' +
      '.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Dat' +
      'a0015 ON '#13#10'      dbo.Data0107.warehouse_ptr = dbo.Data0015.RKEY ' +
      'LEFT OUTER JOIN'#13#10'      dbo.Data0105 ON dbo.Data0107.RKEY = dbo.D' +
      'ata0105.SOURCE_PTR AND '#13#10'      (dbo.Data0105.TRANS_TYPE = 1 OR'#13#10 +
      '      dbo.Data0105.TRANS_TYPE = 2 OR'#13#10'      dbo.Data0105.TRANS_T' +
      'YPE = 12)'#13#10'where  Data0107.INV_DATE>=:dtpk1 and'#13#10'       Data0107' +
      '.INV_DATE<=:dtpk2 and'#13#10'       data0107.status <> :v1 and'#13#10'      ' +
      ' data0107.status <> :v2 and'#13#10'       data0107.status <> :v3'#13#10
    IndexFieldNames = 'INVOICE_NO'
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
        Value = 38930d
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
        Value = 0
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end>
    Prepared = True
    Left = 96
    Top = 79
    object Aq107RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aq107CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aq107ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aq107SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 30
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aq107INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object Aq107INV_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'INV_DATE'
    end
    object Aq107EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aq107curr_code: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'curr_code'
      Size = 5
    end
    object Aq107CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object Aq107EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EX_RATE'
    end
    object Aq107INV_TOTAL: TBCDField
      DisplayLabel = #24635#35745#37329#39069
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object Aq107MATL_TOT: TBCDField
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object Aq107FED_TAX: TBCDField
      DisplayLabel = #31246#37329
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
    object Aq107SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object Aq107CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Aq107total_bamt: TFloatField
      DisplayLabel = #24635#35745#26412#24065
      FieldName = 'total_bamt'
      ReadOnly = True
    end
    object Aq107AMT_PAID: TBCDField
      DisplayLabel = #24050#20184#37329#39069
      FieldName = 'AMT_PAID'
      Precision = 19
    end
    object Aq107VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object Aq107rkey105: TIntegerField
      FieldName = 'rkey105'
      ReadOnly = True
    end
    object Aq107DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object Aq107DSDesigner2: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object Aq107DSDesigner3: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
    object Aq107warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aq107inv_tp: TStringField
      FieldName = 'inv_tp'
      FixedChar = True
      Size = 1
    end
    object Aq107WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aq107WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aq107status: TWordField
      FieldName = 'status'
    end
    object Aq107EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object Aq107name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'name15'
      Size = 10
    end
    object Aq107GLPTR_STATUS: TBooleanField
      DisplayLabel = #31246#31080#26631#35782
      FieldName = 'GLPTR_STATUS'
    end
    object Aq107DSDesigner4: TBCDField
      DisplayWidth = 20
      FieldName = #26410#20184#37329#39069
      ReadOnly = True
      Precision = 19
    end
  end
  object aq235: TADOQuery
    Connection = ACt
    CursorType = ctStatic
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
      'SELECT dbo.Data0235.goods_name, dbo.Data0235.goods_guige,'
      
        '      dbo.Data0235.QUAN_RECD, dbo.Data0002.UNIT_NAME, dbo.Data02' +
        '35.unit_price,'
      
        '      dbo.Data0235.state_tax, dbo.Data0235.GRN_PTR, dbo.Data0235' +
        '.D0072_PTR,'
      '      dbo.Data0235.RKEY,'
      'ROUND(Data0235.QUAN_RECD * Data0235.unit_price, 2) AS amount,'
      
        'ROUND((Data0235.QUAN_RECD * Data0235.unit_price * Data0235.state' +
        '_tax * 0.01)'
      '/(1 + Data0235.state_tax * 0.01), 2) AS tax_amount'
      'FROM dbo.Data0235 INNER JOIN'
      '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'
      'WHERE (Data0235.GRN_PTR = :rkey456)')
    Left = 212
    Top = 136
    object aq235goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object aq235goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object aq235QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object aq235UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object aq235unit_price: TBCDField
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object aq235state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object aq235GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object aq235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object aq235RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq235amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object aq235tax_amount: TBCDField
      FieldName = 'tax_amount'
      ReadOnly = True
      Precision = 32
      Size = 15
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
        Value = 1
      end>
    SQL.Strings = (
      'select * from data0104'
      'where rkey =:rkey')
    Left = 41
    Top = 209
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
    Left = 155
    Top = 208
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
    Left = 210
    Top = 208
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
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
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
    Left = 275
    Top = 208
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
    Left = 99
    Top = 208
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
    Left = 275
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
  object ADOQuery4: TADOQuery
    Connection = ACt
    Parameters = <>
    Left = 296
    Top = 152
  end
end
