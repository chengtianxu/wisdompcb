object DM: TDM
  OldCreateOrder = False
  Left = 461
  Top = 232
  Height = 386
  Width = 457
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 34
    Top = 20
  end
  object AQ416: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ416CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38382d
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end>
    SQL.Strings = (
      'SELECT data0416.number,data0416.so_ptr,'
      
        '      wzcp0070.SALES_ORDER, Data0005.EMPLOYEE_NAME,wzcp0070.rkey' +
        ' rkey70,'
      '      data0416.sys_date, data0416.quantity, data0416.type,'
      '      data0416.rkey,data0015.WAREHOUSE_CODE,'
      
        '      data0015.WAREHOUSE_NAME,data0098.rma_number,data0098.rkey ' +
        'rkey98,data0098.SO_SHIP_PTR,'
      
        'data0034.dept_code,data0034.dept_name,data0010.customer_name,dat' +
        'a0010.cust_code'
      'FROM data0416 INNER JOIN'
      
        '      Data0005 ON data0416.empl_ptr = Data0005.RKEY  LEFT OUTER ' +
        'JOIN'
      '      data0098 on data0416.rma_ptr=data0098.rkey LEFT OUTER JOIN'
      
        '      wzcp0070 ON data0416.so_ptr = wzcp0070.RKEY LEFT OUTER JOI' +
        'N'
      
        '      data0010 on  wzcp0070.customer_ptr=data0010.rkey inner joi' +
        'n'
      
        '      data0015 on data0416.warehouse_ptr=data0015.rkey inner joi' +
        'n '
      'data0034 on data0416.dept_ptr=data0034.rkey'
      
        'where data0416.sys_date>=:dtpk1 and data0416.sys_date<=:dtpk2 an' +
        'd'
      '      data0416.type<>:v1 and data0416.type<>:v4 and'
      '      data0416.type<>:v5 '
      'order by data0416.number')
    Left = 97
    Top = 75
    object AQ416number: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object AQ416SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object AQ416EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#20179#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ416sys_date: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      FieldName = 'sys_date'
    end
    object AQ416type: TWordField
      FieldName = 'type'
    end
    object AQ416rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object AQ416C_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'C_type'
      Size = 10
      Calculated = True
    end
    object AQ416quantity: TBCDField
      DisplayLabel = #20837#20179#24635#25968
      FieldName = 'quantity'
      Precision = 11
      Size = 3
    end
    object AQ416WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ416WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object AQ416dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object AQ416dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object AQ416rma_number: TStringField
      FieldName = 'rma_number'
      Size = 10
    end
    object AQ416customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object AQ416cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object AQ416rkey98: TIntegerField
      FieldName = 'rkey98'
      ReadOnly = True
    end
    object AQ416SO_SHIP_PTR: TIntegerField
      FieldName = 'SO_SHIP_PTR'
    end
    object AQ416rkey70: TIntegerField
      FieldName = 'rkey70'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ416
    Left = 33
    Top = 75
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 21
  end
  object ADOT16: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0016'
    Left = 96
    Top = 136
  end
  object ADO416: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey416'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from  data0416'
      'where data0416.rkey=:rkey416')
    Left = 152
    Top = 76
    object ADO416rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO416number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADO416type: TWordField
      FieldName = 'type'
    end
    object ADO416warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO416empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO416sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADO416quantity: TBCDField
      FieldName = 'quantity'
      Precision = 11
      Size = 3
    end
    object ADO416reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object ADO416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO416dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO416rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
  end
  object aq50: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select data0008.rkey,PROD_CODE,PRODUCT_NAME,'
      '      data0002.unit_name,PRODUCT_DESC'
      'from data0008 inner join data0002'
      'on data0008.unit_ptr=data0002.rkey')
    Left = 152
    Top = 138
    object aq50rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq50PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aq50PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aq50unit_name: TStringField
      FieldName = 'unit_name'
    end
    object aq50PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
  object ADOSupdate: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WZCP416;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@PROC_PTR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@LOCATION_PTR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IN_QTY'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 3
        Precision = 10
        Value = Null
      end
      item
        Name = '@price'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end>
    Left = 32
    Top = 136
  end
  object qrywzcp0001: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 224
  end
  object qrydata0008: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 224
  end
  object qrydata0053: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 224
  end
  object qry98: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtp1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'dtp2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select t98.RKEY,t98.RMA_NUMBER,'
      '           t98.RMA_DATE,t98.Putaway_date,t98.sys_date,'
      '           IsNull(t10.CUST_CODE,'#39#39') AS CUST_CODE,'
      '           IsNull(t10.CUSTOMER_NAME,'#39#39') AS CUSTOMER_NAME,'
      '           t98.RMA_STATUS,'
      '           Case t98.RMA_STATUS When 1 Then '#39#26410#25552#20132#39
      '                                       When 2 Then '#39#24453#20837#20179#39
      '                                       When 3 Then '#39#24050#20837#20179#39
      '                                       When 4 Then '#39#24050#20914#36134#39
      '           End AS TStatus,'
      '           Case t98.NOTE_PAD_PTR When 0 Then '#39#21542#39
      '                                       When 1 Then '#39#26159#39
      '           End AS TNOTE_PAD_PTR,'
      '           Case t98.GLPTR_STATUS When 0 Then '#39#26410#24320#31080#39
      '                                       else '#39#24050#24320#31080#39
      '           End AS TGLPTR_STATUS,'
      '           IsNull(t70.sales_order,'#39#39') AS sales_order,'
      '           IsNull(t60.sales_order,'#39#39') AS '#39#20986#20179#21333#21495#39','
      '           IsNull(t5.EMPLOYEE_NAME,'#39#39') AS EMPLOYEE_NAME,'
      '           t98.ANALYSIS_CODE_1,'
      '           t98.QTY_AUTH,t98.QTY_RECD,t98.QTY_CRED,'
      '           t98.srce_ptr,t98.SO_SHIP_PTR,t34.dept_code,'
      #9#9'   t34.dept_name,t34.rkey rkey34,t60.sales_date '#39#20986#20179#26085#26399#39','
      
        't08.rkey rkey08, t08.prod_code, t08.product_name,t08.product_des' +
        'c,t02.unit_name,t63.price,t70.status status70, t70.rkey rkey70, ' +
        't70.sales_order sales_order70'
      'From Data0098 t98'
      'LEFT JOIN Data0010 t10 ON t98.CUSTOMER_PTR = t10.RKEY'
      'LEFT JOIN WZCP0070 t70 ON t98.SO_PTR = t70.rkey'
      'left join data0034 t34 on t70.produce_deptptr=t34.rkey'
      'LEFT JOIN WZCP0063 t63 ON t98.SO_SHIP_PTR = t63.rkey'
      'inner join wzcp0060 t60 on t63.so_ptr=t60.rkey'
      'left join data0008 t08 on t63.prod_ptr = t08.rkey'
      'LEFT JOIN Data0005 t5  ON t98.AUTH_BY_EMPL_PTR = t5.RKEY'
      'left join data0002 t02 on t08.unit_ptr = t02.rkey'
      'where rma_status=2 and RMA_DATE>=:dtp1 and RMA_DATE<=:dtp2')
    Left = 88
    Top = 296
    object qry98RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry98RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object qry98RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object qry98Putaway_date: TDateTimeField
      FieldName = 'Putaway_date'
    end
    object qry98sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object qry98CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object qry98CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object qry98RMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object qry98TStatus: TStringField
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
    object qry98TNOTE_PAD_PTR: TStringField
      FieldName = 'TNOTE_PAD_PTR'
      ReadOnly = True
      Size = 2
    end
    object qry98TGLPTR_STATUS: TStringField
      FieldName = 'TGLPTR_STATUS'
      ReadOnly = True
      Size = 6
    end
    object qry98sales_order: TStringField
      FieldName = 'sales_order'
      ReadOnly = True
      Size = 12
    end
    object qry98DSDesigner: TStringField
      FieldName = #20986#20179#21333#21495
      ReadOnly = True
      Size = 12
    end
    object qry98EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object qry98ANALYSIS_CODE_1: TWideStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 50
    end
    object qry98QTY_AUTH: TBCDField
      FieldName = 'QTY_AUTH'
      Precision = 10
      Size = 2
    end
    object qry98QTY_RECD: TBCDField
      FieldName = 'QTY_RECD'
      Precision = 10
      Size = 2
    end
    object qry98QTY_CRED: TBCDField
      FieldName = 'QTY_CRED'
      Precision = 10
      Size = 2
    end
    object qry98srce_ptr: TIntegerField
      FieldName = 'srce_ptr'
    end
    object qry98SO_SHIP_PTR: TIntegerField
      FieldName = 'SO_SHIP_PTR'
    end
    object qry98dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object qry98dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object qry98rkey34: TAutoIncField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object qry98DSDesigner2: TDateTimeField
      FieldName = #20986#20179#26085#26399
    end
    object qry98rkey08: TAutoIncField
      FieldName = 'rkey08'
      ReadOnly = True
    end
    object qry98prod_code: TStringField
      FieldName = 'prod_code'
      Size = 15
    end
    object qry98product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object qry98product_desc: TStringField
      FieldName = 'product_desc'
      Size = 200
    end
    object qry98unit_name: TStringField
      FieldName = 'unit_name'
    end
    object qry98price: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object qry98status70: TWordField
      FieldName = 'status70'
    end
    object qry98rkey70: TAutoIncField
      FieldName = 'rkey70'
      ReadOnly = True
    end
    object qry98sales_order70: TStringField
      FieldName = 'sales_order70'
      Size = 12
    end
  end
  object ds98: TDataSource
    DataSet = qry98
    Left = 24
    Top = 296
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 296
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 296
  end
  object qry98_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RMA_NUMBER'
        DataType = ftString
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'Select t98.RKEY,t98.RMA_NUMBER,'
      '           t98.RMA_DATE,t98.Putaway_date,t98.sys_date,'
      '           IsNull(t10.CUST_CODE,'#39#39') AS CUST_CODE,'
      '           IsNull(t10.CUSTOMER_NAME,'#39#39') AS CUSTOMER_NAME,'
      '           t98.RMA_STATUS,'
      '           Case t98.RMA_STATUS When 1 Then '#39#26410#25552#20132#39
      '                                       When 2 Then '#39#24453#20837#20179#39
      '                                       When 3 Then '#39#24050#20837#20179#39
      '                                       When 4 Then '#39#24050#20914#36134#39
      '           End AS TStatus,'
      '           Case t98.NOTE_PAD_PTR When 0 Then '#39#21542#39
      '                                       When 1 Then '#39#26159#39
      '           End AS TNOTE_PAD_PTR,'
      '           Case t98.GLPTR_STATUS When 0 Then '#39#26410#24320#31080#39
      '                                       else '#39#24050#24320#31080#39
      '           End AS TGLPTR_STATUS,'
      '           IsNull(t70.sales_order,'#39#39') AS sales_order,'
      '           IsNull(t60.sales_order,'#39#39') AS '#39#20986#20179#21333#21495#39','
      '           IsNull(t5.EMPLOYEE_NAME,'#39#39') AS EMPLOYEE_NAME,'
      '           t98.ANALYSIS_CODE_1,'
      '           t98.QTY_AUTH,t98.QTY_RECD,t98.QTY_CRED,'
      '           t98.srce_ptr,t98.SO_SHIP_PTR,t34.dept_code,'
      #9#9'   t34.dept_name,t34.rkey rkey34,t60.sales_date '#39#20986#20179#26085#26399#39','
      
        't08.rkey rkey08, t08.prod_code, t08.product_name,t08.product_des' +
        'c,t02.unit_name,t63.price,t70.status status70, t70.rkey rkey70, ' +
        't70.sales_order sales_order70'
      'From Data0098 t98'
      'LEFT JOIN Data0010 t10 ON t98.CUSTOMER_PTR = t10.RKEY'
      'LEFT JOIN WZCP0070 t70 ON t98.SO_PTR = t70.rkey'
      'left join data0034 t34 on t70.produce_deptptr=t34.rkey'
      'LEFT JOIN WZCP0063 t63 ON t98.SO_SHIP_PTR = t63.rkey'
      'inner join wzcp0060 t60 on t63.so_ptr=t60.rkey'
      'left join data0008 t08 on t63.prod_ptr = t08.rkey'
      'LEFT JOIN Data0005 t5  ON t98.AUTH_BY_EMPL_PTR = t5.RKEY'
      'left join data0002 t02 on t08.unit_ptr = t02.rkey'
      'where rma_status=2 and t98.RMA_NUMBER= :RMA_NUMBER')
    Left = 232
    Top = 216
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Putaway_date'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'sys_date'
    end
    object StringField2: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object SmallintField1: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object StringField4: TStringField
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
    object StringField5: TStringField
      FieldName = 'TNOTE_PAD_PTR'
      ReadOnly = True
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'TGLPTR_STATUS'
      ReadOnly = True
      Size = 6
    end
    object StringField7: TStringField
      FieldName = 'sales_order'
      ReadOnly = True
      Size = 12
    end
    object StringField8: TStringField
      FieldName = #20986#20179#21333#21495
      ReadOnly = True
      Size = 12
    end
    object StringField9: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object WideStringField1: TWideStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 50
    end
    object BCDField1: TBCDField
      FieldName = 'QTY_AUTH'
      Precision = 10
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'QTY_RECD'
      Precision = 10
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'QTY_CRED'
      Precision = 10
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'srce_ptr'
    end
    object IntegerField2: TIntegerField
      FieldName = 'SO_SHIP_PTR'
    end
    object StringField10: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object StringField11: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object DateTimeField4: TDateTimeField
      FieldName = #20986#20179#26085#26399
    end
    object AutoIncField3: TAutoIncField
      FieldName = 'rkey08'
      ReadOnly = True
    end
    object StringField12: TStringField
      FieldName = 'prod_code'
      Size = 15
    end
    object StringField13: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object StringField14: TStringField
      FieldName = 'product_desc'
      Size = 200
    end
    object StringField15: TStringField
      FieldName = 'unit_name'
    end
    object BCDField4: TBCDField
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object WordField1: TWordField
      FieldName = 'status70'
    end
    object AutoIncField4: TAutoIncField
      FieldName = 'rkey70'
      ReadOnly = True
    end
    object StringField16: TStringField
      FieldName = 'sales_order70'
      Size = 12
    end
  end
end
