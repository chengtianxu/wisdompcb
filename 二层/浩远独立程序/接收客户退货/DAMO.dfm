object dm: Tdm
  OldCreateOrder = False
  Left = 335
  Top = 274
  Height = 292
  Width = 319
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQuery1CalcFields
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
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0098.RMA_NUMBER, dbo.Data00' +
        '98.RMA_DATE, '
      
        'dbo.Data0098.QTY_AUTH, dbo.Data0098.SO_PTR, dbo.Data0098.RMA_STA' +
        'TUS, '
      
        '                      dbo.Data0098.RKEY, dbo.Data0098.CUSTOMER_P' +
        'TR,case dbo.Data0098.rma_type when 0 then '#39' '#23458#25143#36864#36135#39' when 1 then '#39#20027 +
        #21160#21484#22238#39' end as rmatype,'
      'dbo.Data0098.CUSTOMER_PART_PTR, dbo.Data0025.MANU_PART_NUMBER, '
      
        '                      dbo.Data0025.MANU_PART_DESC, dbo.Data0060.' +
        'SALES_ORDER,'
      
        ' dbo.Data0098.SHIPMENT_PTR, dbo.Data0098.QTY_RECD, dbo.Data0010.' +
        'CUST_CODE, '
      
        '                      dbo.Data0010.ABBR_NAME, dbo.Data0060.PART_' +
        'PRICE, CASE WHEN data0098.so_ptr IS NULL '
      
        '                      THEN data0015.abbr_name ELSE data0015_1.ab' +
        'br_name END AS warehouse_name'
      'FROM         dbo.Data0098 LEFT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.' +
        'Data0060.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART' +
        '_PTR = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0025.PROD_ROUTE_PT' +
        'R = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 AS Data0015_1 ON dbo.Data0060' +
        '.SHIP_REG_TAX_ID = Data0015_1.RKEY'
      
        'where (data0098.rma_date>=:dtpk1) and (data0098.rma_date<=:dtpk2' +
        ')'
      ''
      'order by rma_number')
    Left = 98
    Top = 119
    object ADOQuery1rma_number: TStringField
      FieldName = 'rma_number'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1rma_date: TDateTimeField
      FieldName = 'rma_date'
    end
    object ADOQuery1QTY_AUTH: TIntegerField
      FieldName = 'QTY_AUTH'
    end
    object ADOQuery1so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQuery1RMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADOQuery1customer_part_ptr: TIntegerField
      FieldName = 'customer_part_ptr'
    end
    object ADOQuery1sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1shipment_ptr: TIntegerField
      FieldName = 'shipment_ptr'
    end
    object ADOQuery1qty_recd: TIntegerField
      FieldName = 'qty_recd'
    end
    object ADOQuery1cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1rma_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'rma_type'
      Size = 6
      Calculated = True
    end
    object ADOQuery1status: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1PART_PRICE: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'PART_PRICE'
    end
    object ADOQuery1MANU_part_number: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_part_number'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1warehouse_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'warehouse_name'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1rmatype: TStringField
      FieldName = 'rmatype'
      ReadOnly = True
      Size = 9
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 98
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 120
  end
  object AQ9711: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 154
    Top = 64
  end
  object AQ04: TADOStoredProc
    Connection = ADOConnection1
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
        Value = 29
      end>
    Left = 30
    Top = 64
    object AQ04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object AQ04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object AQ04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADO64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0064.rkey,shipment_no,date_shipped,'
      '       quan_shipped,quan_credited,'
      '       quan_shipped-quan_credited as qty_aval,'
      '       data0005.employee_name'
      'from data0064 inner join data0005 on'
      '     data0064.ENT_EMPL_PTR=data0005.rkey'
      'where so_ptr=:rkey60 and'
      '      PACKING_SLIP_FLAG='#39'1'#39' and'
      '      quan_shipped-quan_credited>0'
      'order by shipment_no'
      '')
    Left = 97
    Top = 179
    object ADO64rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO64shipment_no: TSmallintField
      FieldName = 'shipment_no'
    end
    object ADO64date_shipped: TDateTimeField
      FieldName = 'date_shipped'
    end
    object ADO64quan_shipped: TIntegerField
      FieldName = 'quan_shipped'
    end
    object ADO64employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO64quan_credited: TIntegerField
      FieldName = 'quan_credited'
    end
    object ADO64qty_aval: TIntegerField
      FieldName = 'qty_aval'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO64
    Left = 33
    Top = 179
  end
end
