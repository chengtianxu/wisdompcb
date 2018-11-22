object DM: TDM
  OldCreateOrder = False
  Left = 444
  Top = 119
  Height = 405
  Width = 509
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object Qery192: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT CLOSE_DAYTH,CLOSE_HOURTH FROM DATA0192')
    Left = 344
    Top = 72
  end
  object Qery5: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select rkey,employee_name from data0005')
    Left = 400
    Top = 72
  end
  object QeryDate: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CURRENT_TIMESTAMP AS vdt,'
      ' CONVERT(datetime, CONVERT(varchar, '
      '      CURRENT_TIMESTAMP, 101), 101) AS vd')
    Left = 448
    Top = 72
    object QeryDatevdt: TDateTimeField
      FieldName = 'vdt'
      ReadOnly = True
    end
    object QeryDatevd: TDateTimeField
      FieldName = 'vd'
      ReadOnly = True
    end
  end
  object Qery445: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    Left = 168
    Top = 144
  end
  object Qery449: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    Left = 168
    Top = 192
  end
  object Qery448: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        '   SELECT TOP 100 PERCENT dbo.Data0448.RKEY,dbo.Data0025.MANU_PA' +
        'RT_NUMBER,'
      'dbo.Data0025.MANU_PART_DESC,Data0034.DEPT_NAME,'
      
        'dbo.Data0448.WORK_ORDER_NUMBER, dbo.Data0010.CUST_CODE, Data0034' +
        '.DEPT_CODE,'
      
        'dbo.Data0448.STEP,dbo.Data0448.SO_NO, dbo.Data0448.CUT_NO, dbo.D' +
        'ata0448.QUANTITY,'
      'dbo.Data0448.INDATE'
      'FROM dbo.Data0448 INNER JOIN'
      'dbo.Data0025 ON'
      'dbo.Data0448.MANU_PART_PTR = dbo.Data0025.RKEY INNER JOIN'
      
        'dbo.Data0010 ON dbo.Data0448.CUSTOMER_PTR = dbo.Data0010.RKEY IN' +
        'NER JOIN'
      'dbo.Data0034 ON dbo.Data0448.DEPT_PTR = dbo.Data0034.RKEY'
      'where data0448.d0444_ptr=0'
      
        'ORDER BY Data0034.DEPT_CODE, dbo.Data0025.manu_PART_NUMBER, dbo.' +
        'Data0448.WORK_ORDER_NUMBER')
    Left = 168
    Top = 96
  end
  object DS444: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'Select * from data0444'#13#10'where YEAR(cut_date)=:vy'#13#10'order by cut_d' +
      'ate '#13#10
    Parameters = <
      item
        Name = 'vy'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 24
    object DS444RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS444CUT_DATE: TDateTimeField
      FieldName = 'CUT_DATE'
    end
    object DS444MATL_DATE: TDateTimeField
      FieldName = 'MATL_DATE'
    end
    object DS444WIP_DATE: TDateTimeField
      FieldName = 'WIP_DATE'
    end
    object DS444SFG_DATE: TDateTimeField
      FieldName = 'SFG_DATE'
    end
    object DS444FG_DATE: TDateTimeField
      FieldName = 'FG_DATE'
    end
    object DS444TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object DS444CUT_BY: TIntegerField
      FieldName = 'CUT_BY'
    end
    object DS444MATL_CST_IN_STOCK_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_STOCK_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444MATL_CST_IN_DEPT_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_DEPT_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444MATL_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444MATL_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444MATL_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'MATL_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444OVHD_CST_IN_WIP_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_WIP_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444OVHD_CST_IN_SFG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_SFG_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444OVHD_CST_IN_FG_CLOSED: TBCDField
      FieldName = 'OVHD_CST_IN_FG_CLOSED'
      Precision = 18
      Size = 2
    end
    object DS444CLOSED: TStringField
      FieldName = 'CLOSED'
      FixedChar = True
      Size = 1
    end
    object DS444early_ptr: TIntegerField
      FieldName = 'early_ptr'
    end
    object DS444employee_name: TStringField
      DisplayLabel = #25130#25968#20154#21592
      FieldKind = fkLookup
      FieldName = 'employee_name'
      LookupDataSet = Qery5
      LookupKeyFields = 'rkey'
      LookupResultField = 'employee_name'
      KeyFields = 'CUT_BY'
      Size = 16
      Lookup = True
    end
  end
  object Qery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 344
    Top = 128
  end
  object AD462: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0015.warehouse_code,Data0015.abbr_name,Data0034.DEPT_' +
      'CODE, Data0034.DEPT_NAME, '#13#10'      Data0017.INV_PART_NUMBER, dbo.' +
      'Data0017.INV_NAME, '#13#10'      Data0017.INV_DESCRIPTION, dbo.Data046' +
      '2.QUAN, dbo.Data0462.STD_PRICE, '#13#10'      Data0002.UNIT_NAME, '#13#10'  ' +
      '    Data0462.QUAN * Data0462.STD_PRICE AS amount, '#13#10'      Data04' +
      '62.RKEY,data0462.D0443_PTR, data0462.DEPT_PTR,data0462.INVENT_PT' +
      'R,data0462.warehouse_ptr '#13#10'FROM Data0017 INNER JOIN Data0462 ON ' +
      'Data0017.RKEY = Data0462.INVENT_PTR '#13#10'      INNER JOIN Data0034 ' +
      'ON Data0462.DEPT_PTR = Data0034.RKEY '#13#10'      INNER JOIN Data0015' +
      ' ON Data0462.warehouse_ptr=data0015.rkey'#13#10'      INNER JOIN Data0' +
      '002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY'#13#10'where data0462.d' +
      '0443_ptr=:rkey'
    IndexFieldNames = 'warehouse_code'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 408
    Top = 192
    object AD462DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AD462DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AD462INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object AD462INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object AD462INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object AD462QUAN: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN'
    end
    object AD462STD_PRICE: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'STD_PRICE'
    end
    object AD462UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object AD462amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object AD462RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AD462D0443_PTR: TIntegerField
      FieldName = 'D0443_PTR'
    end
    object AD462DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object AD462INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object AD462warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object AD462warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object AD462abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = AD462
    Left = 344
    Top = 192
  end
  object wzpr444_7: TADOStoredProc
    Connection = Conn
    CursorType = ctStatic
    ProcedureName = 'wzpr444;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 48
    Top = 96
    object wzpr444_7rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wzpr444_7cut_date: TDateTimeField
      FieldName = 'cut_date'
    end
  end
  object ADOtemp: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey17'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey444'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey444'
        Size = -1
        Value = Null
      end
      item
        Name = 'warehouse_ptr'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey17'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey444'
        Size = -1
        Value = Null
      end
      item
        Name = 'warehouse_ptr'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey17'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'if object_ID('#39'tempdb..#temp'#39') is not null  drop table #temp '
      'Create Table #temp'
      '(id int identity(1,1) not null,'
      'amount float not null,'
      'QUANTITY float not null)'
      ''
      'insert #temp(amount,QUANTITY)'
      
        'SELECT ISNULL(SUM((D22.tax_price * D207.QUANTITY * D456.exch_rat' +
        'e) / (1 + D22.TAX_2 * 0.01)),0) AS amount, '
      '       ISNULL(SUM(D207.QUANTITY),0) AS QUANTITY'
      'FROM   DATA0456 D456 INNER JOIN'
      '       DATA0022 D22  ON D456.RKEY=D22.GRN_PTR INNER JOIN'
      '       DATA0207 D207 ON D22.RKEY=D207.D0022_PTR INNER JOIN'
      '       DATA0457 D457 ON D457.RKEY=D207.GON_PTR'
      'WHERE (D207.INVENTORY_PTR=:rkey17) AND'
      
        '      (D207.TDATE>(SELECT MATL_DATE FROM DATA0444 WHERE RKEY=(SE' +
        'LECT EARLY_PTR FROM DATA0444 WHERE RKEY=:rkey444)) AND '
      
        '       D207.TDATE<(SELECT MATL_DATE FROM DATA0444 WHERE RKEY=:rk' +
        'ey444)) AND D457.warehouse_ptr=:warehouse_ptr'
      ''
      'insert into #temp(amount,QUANTITY)'
      
        'SELECT ISNULL(SUM(STD_PRICE * QUAN),0) AS amount,ISNULL(SUM(QUAN' +
        '),0) AS QUANTITY'
      'FROM   DATA0462'
      
        'WHERE  (INVENT_PTR=:rkey17) AND (D0443_PTR=(SELECT EARLY_PTR FRO' +
        'M DATA0444 WHERE RKEY=:rkey444))'
      '       AND warehouse_ptr=:warehouse_ptr'
      ''
      
        'SELECT CASE WHEN SUM(QUANTITY)<>0 THEN SUM(amount)/SUM(QUANTITY)' +
        ' '
      
        '       ELSE (SELECT Isnull(std_cost,0) FROM DATA0017 WHERE RKEY=' +
        ':rkey17) END AS STD_PRICE'
      'FROM   #temp')
    Left = 168
    Top = 296
    object ADOtempSTD_PRICE: TFloatField
      FieldName = 'STD_PRICE'
      ReadOnly = True
    end
  end
end
