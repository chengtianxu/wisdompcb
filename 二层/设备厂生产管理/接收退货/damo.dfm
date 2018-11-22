object dm: Tdm
  OldCreateOrder = False
  Left = 541
  Top = 262
  Height = 269
  Width = 360
  object adsBrowse: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'Select t98.RKEY,t98.RMA_NUMBER,'#13#10'           t98.RMA_DATE,t98.Put' +
      'away_date,t98.sys_date,'#13#10'           IsNull(t10.CUST_CODE,'#39#39') AS ' +
      'CUST_CODE,'#13#10'           IsNull(t10.CUSTOMER_NAME,'#39#39') AS CUSTOMER_' +
      'NAME,'#13#10'           t98.RMA_STATUS,'#13#10'           Case t98.RMA_STATU' +
      'S When 1 Then '#39#26410#25552#20132#39#13#10'                                       When' +
      ' 2 Then '#39#24453#20837#20179#39#13#10'                                       When 3 The' +
      'n '#39#24050#20837#20179#39#13#10'                                       When 4 Then '#39#24050#20914#36134 +
      #39#13#10'           End AS TStatus,'#13#10'           Case t98.NOTE_PAD_PTR ' +
      'When 0 Then '#39#21542#39#13#10'                                       When 1 T' +
      'hen '#39#26159#39#13#10'           End AS TNOTE_PAD_PTR,'#13#10'           Case t98.G' +
      'LPTR_STATUS When 0 Then '#39#26410#24320#31080#39#13#10'                                 ' +
      '      else '#39#24050#24320#31080#39#13#10'           End AS TGLPTR_STATUS,'#13#10'           I' +
      'sNull(t70.sales_order,'#39#39') AS sales_order,'#13#10'           IsNull(t70' +
      '.rkey,'#39#39') AS rkey70,'#13#10'           --IsNull(t63.sales_order,'#39#39') AS' +
      ' '#39#20986#20179#21333#21495#39','#13#10'           IsNull(t5.EMPLOYEE_NAME,'#39#39') AS EMPLOYEE_NAM' +
      'E,'#13#10'           t98.ANALYSIS_CODE_1,'#13#10'           t98.QTY_AUTH,t98' +
      '.QTY_RECD,t98.QTY_CRED,'#13#10'           t98.srce_ptr,t98.SO_SHIP_PTR' +
      #13#10'From Data0098 t98'#13#10'LEFT JOIN Data0010 t10 ON t98.CUSTOMER_PTR ' +
      '= t10.RKEY'#13#10'LEFT JOIN WZCP0070 t70 ON t98.SO_PTR = t70.rkey'#13#10'LEF' +
      'T JOIN WZCP0063 t63 ON t98.SO_SHIP_PTR = t63.rkey'#13#10'LEFT JOIN Dat' +
      'a0005 t5  ON t98.AUTH_BY_EMPL_PTR = t5.RKEY'#13#10'Where t98.RMA_DATE ' +
      'Between :dtpk1 And :dtpk2'
    IndexFieldNames = 'RMA_NUMBER'
    Parameters = <
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
    Left = 15
    Top = 112
    object adsBrowseRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object adsBrowseRMA_NUMBER: TStringField
      DisplayLabel = #36864#36135#32534#21495
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object adsBrowseRMA_DATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object adsBrowsePutaway_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'Putaway_date'
    end
    object adsBrowsesys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object adsBrowseCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object adsBrowseCUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object adsBrowseRMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object adsBrowseTStatus: TStringField
      DisplayLabel = #36864#36135#29366#24577
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
    object adsBrowseTNOTE_PAD_PTR: TStringField
      DisplayLabel = #26159#21542#20877#20986#36135
      FieldName = 'TNOTE_PAD_PTR'
      ReadOnly = True
      Size = 2
    end
    object adsBrowseTGLPTR_STATUS: TStringField
      DisplayLabel = #24320#31080#29366#24577
      FieldName = 'TGLPTR_STATUS'
      ReadOnly = True
      Size = 6
    end
    object adsBrowsesales_order: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'sales_order'
      ReadOnly = True
      Size = 12
    end
    object adsBrowseEMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseANALYSIS_CODE_1: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'ANALYSIS_CODE_1'
      Size = 50
    end
    object adsBrowseQTY_AUTH: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_AUTH'
      Precision = 10
      Size = 2
    end
    object adsBrowseQTY_RECD: TBCDField
      DisplayLabel = #24050#25509#25910#25968
      FieldName = 'QTY_RECD'
      Precision = 10
      Size = 2
    end
    object adsBrowseQTY_CRED: TBCDField
      DisplayLabel = #24050#24320#31080#25968
      FieldName = 'QTY_CRED'
      Precision = 10
      Size = 2
    end
    object adsBrowsesrce_ptr: TIntegerField
      FieldName = 'srce_ptr'
    end
    object adsBrowseSO_SHIP_PTR: TIntegerField
      FieldName = 'SO_SHIP_PTR'
    end
    object adsBrowserkey70: TIntegerField
      FieldName = 'rkey70'
      ReadOnly = True
    end
  end
  object dsBrowse: TDataSource
    DataSet = adsBrowse
    Left = 15
    Top = 160
  end
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 16
  end
  object aqTmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 79
    Top = 16
  end
  object aq98: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0098'
      'Where RKEY = :RKEY')
    Left = 78
    Top = 112
    object aq98RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq98RMA_NUMBER: TStringField
      DisplayLabel = #36864#36135#32534#21495
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object aq98AUTH_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUTH_BY_EMPL_PTR'
    end
    object aq98EmpName: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldKind = fkLookup
      FieldName = 'EmpName'
      LookupDataSet = aq5
      LookupKeyFields = 'RKEY'
      LookupResultField = 'EMPLOYEE_NAME'
      KeyFields = 'AUTH_BY_EMPL_PTR'
      LookupCache = True
      Size = 16
      Lookup = True
    end
    object aq98CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
      OnChange = aq98CUSTOMER_PTRChange
    end
    object aq98SO_PTR: TIntegerField
      FieldName = 'SO_PTR'
      OnChange = aq98SO_PTRChange
    end
    object aq98SO_SHIP_PTR: TIntegerField
      FieldName = 'SO_SHIP_PTR'
      OnChange = aq98SO_SHIP_PTRChange
    end
    object aq98NOTE_PAD_PTR: TIntegerField
      FieldName = 'NOTE_PAD_PTR'
    end
    object aq98RMA_DATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object aq98Putaway_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'Putaway_date'
    end
    object aq98sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object aq98QTY_AUTH: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_AUTH'
      Precision = 10
      Size = 2
    end
    object aq98QTY_RECD: TBCDField
      DisplayLabel = #24050#25509#25910#25968
      FieldName = 'QTY_RECD'
      Precision = 10
      Size = 2
    end
    object aq98QTY_CRED: TBCDField
      DisplayLabel = #24050#24320#31080#25968
      FieldName = 'QTY_CRED'
      Precision = 10
      Size = 2
    end
    object aq98RMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object aq98ANALYSIS_CODE_1: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'ANALYSIS_CODE_1'
      Size = 50
    end
    object aq98srce_ptr: TIntegerField
      FieldName = 'srce_ptr'
    end
    object aq98GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
  end
  object ds98: TDataSource
    DataSet = aq98
    Left = 78
    Top = 160
  end
  object aqFindPO: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'BDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'EDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'status'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'status'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'Select t70.rkey,t70.sales_order,t10.RKEY as RKEY10,t10.CUST_CODE' +
        ',t10.ABBR_NAME,'
      't8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,'
      't71.quantity,--'#38144#21806#25968#37327
      't71.QTY_PLANED,--'#25237#20135#25968#37327
      't71.PARTS_SHIPPED,--'#36865#36135#25968#37327
      't71.returen_qty,--'#36864#36135#25968#37327
      't70.status,'
      'Case status when 1 then '#39#26410#25552#20132#39
      '            when 2 then '#39#24453#30830#35748#39
      '            when 3 then '#39#24050#30830#35748#39
      '            when 4 then '#39#24050#25237#20135#39
      '            when 5 then '#39#24050#23436#25104#39
      '            when 6 then '#39#34987#36864#22238#39
      'end As TStatus'
      
        'From WZCP0070 t70 INNER JOIN WZCP0071 t71 ON t70.rkey = t71.so_p' +
        'tr'
      'INNER JOIN Data0008 t8 ON t71.prod_ptr = t8.RKEY'
      'INNER JOIN Data0010 t10 ON t70.customer_ptr = t10.RKEY'
      'Where t70.sales_date Between :BDate and :EDate'
      'And ((:rkey10 = 0) or (t70.customer_ptr = :rkey10))'
      'And ((:status = 0) or (t70.status = :status))')
    Left = 144
    Top = 16
    object aqFindPOrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqFindPOsales_order: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object aqFindPORKEY10: TIntegerField
      FieldName = 'RKEY10'
      ReadOnly = True
    end
    object aqFindPOCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqFindPOABBR_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqFindPOPROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#21495
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aqFindPOPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aqFindPOPRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object aqFindPOquantity: TBCDField
      DisplayLabel = #38144#21806#25968#37327
      DisplayWidth = 10
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object aqFindPOQTY_PLANED: TBCDField
      DisplayLabel = #25237#20135#25968#37327
      DisplayWidth = 10
      FieldName = 'QTY_PLANED'
      Precision = 10
      Size = 2
    end
    object aqFindPOPARTS_SHIPPED: TBCDField
      DisplayLabel = #36865#36135#25968#37327
      DisplayWidth = 10
      FieldName = 'PARTS_SHIPPED'
      Precision = 10
      Size = 2
    end
    object aqFindPOreturen_qty: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      DisplayWidth = 10
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object aqFindPOstatus: TWordField
      FieldName = 'status'
    end
    object aqFindPOTStatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
  end
  object dsFindPO: TDataSource
    DataSet = aqFindPO
    Left = 144
    Top = 64
  end
  object dsFindShip: TDataSource
    DataSet = aqFindShip
    Left = 215
    Top = 65
  end
  object aqFindShip: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'BDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'EDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey70'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey70'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'status'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'status'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'Select t63.rkey,t70.rkey as rkey70,t70.sales_order,t60.sales_ord' +
        'er as OUTNUMBER,'
      't10.RKEY as RKEY10,t10.CUST_CODE,t10.ABBR_NAME,'
      't8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,t16.LOCATION,'
      't63.quantity,t63.returen_qty,t60.status,'
      'Case t60.status when 1 then '#39#26410#25552#20132#39
      '                when 2 then '#39#24453#23457#26680#39
      '                when 3 then '#39#24050#23457#26680#39
      '                when 4 then '#39#24050#20837#24080#39
      '                when 5 then '#39#34987#36864#22238#39
      'end As TStatus'
      'From WZCP0063 t63'
      'INNER JOIN WZCP0060 t60 ON t63.so_ptr = t60.rkey'
      'INNER JOIN Data0008 t8 ON t63.prod_ptr = t8.RKEY'
      'INNER JOIN Data0016 t16 ON t63.location_ptr = t16.RKEY'
      'INNER JOIN WZCP0071 t71 ON t63.cp71_ptr = t71.rkey'
      'INNER JOIN WZCP0070 t70 ON t71.so_ptr = t70.rkey'
      'INNER JOIN Data0010 t10 ON t60.customer_ptr = t10.RKEY'
      'Where t60.SALES_REP_PTR = t70.rkey'
      'AND t60.sales_date Between :BDate and :EDate'
      'And ((:rkey10 = 0) or (t60.customer_ptr = :rkey10))'
      'And ((:rkey70 = 0) or (t60.SALES_REP_PTR = :rkey70))'
      'And ((:status = 0) or (t60.status = :status))'
      'And t60.status in(3,4)'
      'And t63.quantity>t63.returen_qty')
    Left = 215
    Top = 16
    object aqFindShiprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqFindShiprkey70: TAutoIncField
      FieldName = 'rkey70'
      ReadOnly = True
    end
    object aqFindShipsales_order: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object aqFindShipOUTNUMBER: TStringField
      DisplayLabel = #20986#20179#21333
      FieldName = 'OUTNUMBER'
      Size = 12
    end
    object aqFindShipRKEY10: TAutoIncField
      FieldName = 'RKEY10'
      ReadOnly = True
    end
    object aqFindShipCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqFindShipABBR_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqFindShipPROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#21495
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aqFindShipPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aqFindShipPRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object aqFindShipLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object aqFindShipquantity: TBCDField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object aqFindShipreturen_qty: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object aqFindShipstatus: TWordField
      FieldName = 'status'
    end
    object aqFindShipTStatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
  end
  object aqInfo: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey63'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select t63.rkey,t60.sales_order,'
      't8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,'
      't63.quantity,t63.returen_qty'
      'From WZCP0063 t63 '
      'INNER JOIN WZCP0060 t60 ON t63.so_ptr = t60.rkey'
      'INNER JOIN Data0008 t8 ON t63.prod_ptr = t8.RKEY'
      'Where t63.rkey = :rkey63')
    Left = 144
    Top = 112
    object aqInforkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqInfosales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object aqInfoPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aqInfoPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aqInfoPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object aqInfoquantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object aqInforeturen_qty: TBCDField
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
  end
  object dsInfo: TDataSource
    DataSet = aqInfo
    Left = 144
    Top = 160
  end
  object aq70: TADOQuery
    Connection = ADOConn
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
      'select rkey,sales_order from WZCP0070'
      'Where rkey = :rkey')
    Left = 79
    Top = 64
    object aq70rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq70sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
  end
  object aq5: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,EMPLOYEE_NAME from Data0005')
    Left = 79
    Top = 64
    object aq5RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq5EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object aq10: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select RKEY,CUST_CODE,CUSTOMER_NAME,ABBR_NAME from Data0010'
      'where RKEY = :RKEY')
    Left = 79
    Top = 64
    object aq10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aq10ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ds70: TDataSource
    DataSet = aq70
    Left = 16
    Top = 64
  end
  object ds10: TDataSource
    DataSet = aq10
    Left = 16
    Top = 64
  end
end
