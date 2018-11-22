object DM: TDM
  OldCreateOrder = False
  Left = 444
  Top = 119
  Height = 405
  Width = 509
  object Conn: TADOConnection
    ConnectionString = 'FILE NAME=D:\vss_work\172.18.12.2.udl'
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
    Left = 168
    Top = 96
  end
  object SP22: TADOStoredProc
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzpr444;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 232
    Top = 144
    object SP22rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object SP22tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object SP22inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object SP22quantity: TBCDField
      FieldName = 'quantity'
      ReadOnly = True
      Precision = 22
      Size = 6
    end
    object SP22tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object SP22unit_price: TFloatField
      FieldName = 'unit_price'
      ReadOnly = True
    end
    object SP22EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
  end
  object SP56: TADOStoredProc
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzpr444;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 232
    Top = 96
    object SP56BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object SP56WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object SP56CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object SP56LATEST_PRICE: TFloatField
      FieldName = 'LATEST_PRICE'
    end
    object SP56FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object SP56DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object SP56STEP: TSmallintField
      FieldName = 'STEP'
    end
    object SP56QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object SP56INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object SP56CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object SP56SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object SP56WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object SP56to_be_stocked: TFloatField
      FieldName = 'to_be_stocked'
    end
    object SP56unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
  end
  object SP53: TADOStoredProc
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzpr444;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 232
    Top = 192
    object SP53rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object SP53WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object SP53WORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object SP53CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object SP53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object SP53QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object SP53LATEST_PRICE: TFloatField
      FieldName = 'LATEST_PRICE'
    end
    object SP53MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object SP53REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object SP53WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object SP53LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object SP53unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
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
      LookupCache = True
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
  object adoupdate: TADOStoredProc
    Connection = Conn
    ProcedureName = 'wzpr444;5'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey444'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 232
    Top = 240
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
      
        'SELECT ISNULL(SUM((D22.tax_price * D207.QUANTITY * D456.exch_rat' +
        'e) / (1 + D22.TAX_2 * 0.01)),0) AS amount, '
      '       ISNULL(SUM(D207.QUANTITY),0) AS QUANTITY into #temp'
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
      'insert into #temp'
      
        'SELECT ISNULL(SUM(STD_PRICE * QUAN),0) AS amount,ISNULL(SUM(QUAN' +
        '),0) AS QUANTITY'
      'FROM   DATA0462'
      
        'WHERE  (INVENT_PTR=:rkey17) AND (D0443_PTR=(SELECT EARLY_PTR FRO' +
        'M DATA0444 WHERE RKEY=:rkey444))'
      '       AND warehouse_ptr=:warehouse_ptr'
      ''
      'SELECT CASE WHEN SUM(amount)<>0 THEN SUM(amount)/SUM(QUANTITY) '
      
        '       ELSE (SELECT std_cost FROM DATA0017 WHERE RKEY=:rkey17) E' +
        'ND AS STD_PRICE'
      'FROM   #temp')
    Left = 168
    Top = 296
    object ADOtempSTD_PRICE: TFloatField
      FieldName = 'STD_PRICE'
      ReadOnly = True
    end
  end
  object aqTmp: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 216
    Top = 16
  end
end
