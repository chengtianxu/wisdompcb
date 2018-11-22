object DM: TDM
  OldCreateOrder = False
  Left = 405
  Top = 224
  Height = 386
  Width = 457
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 33
    Top = 24
  end
  object AQ416: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
        Value = 0
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.data0416.number, dbo.Data0098.RMA_NUMBER, dbo.Dat' +
        'a0416.SO_PTR, dbo.Data0060.SALES_ORDER,'
      
        ' dbo.data0025.MANU_PART_NUMBER, dbo.data0025.MANU_PART_DESC, dbo' +
        '.data0010. ABBR_NAME,dbo.Data0005.EMPLOYEE_NAME, '
      
        '                      dbo.data0416.sys_date, dbo.data0416.quanti' +
        'ty, dbo.data0416.type, dbo.Data0098.qty_ship, dbo.data0416.rkey,' +
        ' dbo.data0416.rma_ptr, '
      
        '                      dbo.Data0098.QTY_AUTH, dbo.Data0098.QTY_RE' +
        'CD, dbo.data0416.status,data0060.REPUT_APPR_BY,'
      'data0060.PARTS_ORDERED+data0060.PARTS_RETURNED as parts_order,'
      
        '                     CASE dbo.data0416.status WHEN 0 THEN '#39#26410#25552#20132#39' ' +
        'WHEN 1 THEN '#39#24453#23457#26680#39' WHEN 2 THEN '#39#24050#20837#24211#39' WHEN 3 THEN '#39#34987#36864#22238#39' END AS '#29366#24577','
      '           data0097.po_number'
      'FROM         dbo.data0416 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0416.empl_ptr = db' +
        'o.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.data0416.so_ptr = dbo.' +
        'Data0060.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0098 ON dbo.data0416.rma_ptr = dbo' +
        '.Data0098.RKEY left JOIN'
      
        '                      dbo.data0025 ON dbo.data0060.CUST_PART_PTR' +
        ' = dbo.data0025.RKEY LEFT JOIN'
      
        '                      dbo.data0010 ON dbo.data0060.CUSTOMER_PTR ' +
        '= dbo.data0010.RKEY LEFT JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY'
      
        'where  data0416.sys_date>=:dtpk1 and data0416.sys_date<=:dtpk2 a' +
        'nd'
      '      data0416.type<>:v1  and data0416.type<>:v2 and'
      '      data0416.type<>:v3  and data0416.type<>:v4 and'
      '      data0416.type<>:v5  and data0416.type<>:v6'
      'order by data0416.number')
    Left = 89
    Top = 75
    object AQ416number: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object AQ416RMA_NUMBER: TStringField
      DisplayLabel = #36864#36135#21333#21495
      FieldName = 'RMA_NUMBER'
      FixedChar = True
      Size = 10
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
    object AQ416MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ416MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object AQ416ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ416sys_date: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      FieldName = 'sys_date'
    end
    object AQ416quantity: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
    end
    object AQ416type: TWordField
      FieldName = 'type'
    end
    object AQ416rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ416rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
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
    object AQ416qty_auth: TIntegerField
      FieldName = 'qty_auth'
    end
    object AQ416qty_recd: TIntegerField
      FieldName = 'qty_recd'
    end
    object AQ416qty_ship: TIntegerField
      FieldName = 'qty_ship'
    end
    object AQ416status: TWordField
      FieldName = 'status'
    end
    object AQ416DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object AQ416po_number: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'po_number'
      Size = 25
    end
    object AQ416REPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object AQ416parts_order: TFloatField
      FieldName = 'parts_order'
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
    Left = 184
    Top = 21
  end
  object ADOT15: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0015'
    Left = 32
    Top = 128
  end
  object ADOT16: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0016'
    Left = 88
    Top = 128
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
      'select * from data0416'
      'where rkey=:rkey416')
    Left = 184
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
    object ADO416empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO416sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADO416quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADO416reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object ADO416rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object ADO416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
  end
  object aq50: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,MANU_PART_NUMBER,MANU_PART_DESC'
      'from data0025'
      'where data0025.PARENT_PTR is null')
    Left = 88
    Top = 184
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 80
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 152
  end
end
