object DM: TDM
  OldCreateOrder = False
  Left = 675
  Top = 192
  Height = 452
  Width = 328
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 49
    Top = 7
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    Parameters = <>
    Left = 97
    Top = 133
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 182
    Top = 13
  end
  object AQ1060: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 190
    Top = 139
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery3
    Left = 28
    Top = 81
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 241
    Top = 13
  end
  object ADOQuery3: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep027;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 100
    Top = 80
    object ADOQuery3SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery3ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADOQuery3DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADOQuery3SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADOQuery3EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQuery3TO_BE_CONFIRMED: TIntegerField
      FieldName = 'TO_BE_CONFIRMED'
    end
    object ADOQuery3RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADOQuery3DISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Precision = 4
      Size = 2
    end
    object ADOQuery3TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADOQuery3RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery3PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADOQuery3PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery3PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery3PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOQuery3PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery3CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery3ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery3ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADOQuery3ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADOQuery3PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADOQuery3CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQuery3set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADOQuery3REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQuery3PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADOQuery3rush_charge_pct_used: TIntegerField
      FieldName = 'rush_charge_pct_used'
    end
    object ADOQuery3fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object ADOQuery3so_tp: TWordField
      FieldName = 'so_tp'
    end
    object ADOQuery3CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery3SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery3tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADOQuery3STATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery3orders_sqft: TFloatField
      Alignment = taLeftJustify
      FieldName = 'orders_sqft'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADOQuery3MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery3MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery3set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOQuery3ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery3ABBR_NAME15: TStringField
      FieldName = 'ABBR_NAME15'
      ReadOnly = True
      Size = 10
    end
  end
  object ado89: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'cust_part_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,'
      '       Data0002.UNIT_NAME, dbo.data0089.tvalue,'
      '       Data0277.CATEGORY_DESC'
      'FROM   data0089 INNER JOIN'
      '       Data0278 ON'
      '       data0089.parameter_ptr = dbo.Data0278.RKEY INNER JOIN'
      
        '       Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY INN' +
        'ER JOIN'
      '       Data0277 ON dbo.Data0278.CATEGORY_PTR = dbo.Data0277.RKEY'
      'where'
      '   data0089.cust_part_ptr=:cust_part_ptr'
      'order by data0089.rkey')
    Left = 240
    Top = 79
    object ado89parameter_name: TStringField
      DisplayLabel = #21442#25968#21517#31216
      DisplayWidth = 38
      FieldName = 'parameter_name'
      FixedChar = True
      Size = 10
    end
    object ado89parameter_desc: TStringField
      DisplayLabel = #29305#21035#35201#27714#39033#30446
      DisplayWidth = 40
      FieldName = 'parameter_desc'
    end
    object ado89unit_name: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 24
      FieldName = 'unit_name'
    end
    object ado89tvalue: TStringField
      DisplayLabel = #20869#23481
      DisplayWidth = 35
      FieldName = 'tvalue'
    end
    object ado89CATEGORY_DESC: TStringField
      DisplayLabel = #21442#25968#31867#21035
      FieldName = 'CATEGORY_DESC'
      Size = 25
    end
  end
  object DataSource2: TDataSource
    DataSet = ado89
    Left = 184
    Top = 80
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 133
  end
  object DataSource4: TDataSource
    DataSet = ADO360
    Left = 30
    Top = 196
  end
  object ADO360: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
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
      'select rkey,so_ptr,quantity,sch_date'
      'from data0360'
      'where so_ptr=:RKEY')
    Left = 100
    Top = 197
    object ADO360rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO360so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO360quantity: TIntegerField
      DisplayLabel = #23436#24037#25968#37327
      FieldName = 'quantity'
    end
    object ADO360sch_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'sch_date'
    end
  end
end
