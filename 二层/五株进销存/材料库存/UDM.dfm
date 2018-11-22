object DM: TDM
  OldCreateOrder = False
  Left = 561
  Top = 235
  Height = 226
  Width = 330
  object ADOConnection1: TADOConnection
    CommandTimeout = 2000
    ConnectionTimeout = 2000
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADOStock1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandTimeout = 2000
    Parameters = <>
    SQL.Strings = (
      'select * from #invt_stock_tmp')
    Left = 112
    Top = 16
    object ADOStock1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOStock1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOStock1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 100
    end
    object ADOStock1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 200
    end
    object ADOStock1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 70
    end
    object ADOStock1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOStock1quantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADOStock1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOStock1stock_area: TFloatField
      FieldName = 'stock_area'
    end
    object ADOStock1stock_weight: TWideStringField
      FieldName = 'stock_weight'
      FixedChar = True
      Size = 10
    end
    object ADOStock1stock_date: TDateTimeField
      FieldName = 'stock_date'
    end
    object ADOStock1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOInv_Stock
    Left = 32
    Top = 96
  end
  object ADOTmp1: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 2000
    Parameters = <>
    Left = 112
    Top = 96
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 2000
    Parameters = <>
    Left = 208
    Top = 24
  end
  object ADO05: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 2000
    Parameters = <
      item
        Name = 'user_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     RKEY, EMPLOYEE_NAME'
      'FROM         Data0005'
      'where  RKEY= :user_ptr')
    Left = 168
    Top = 96
  end
  object ADOInv_Stock: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandTimeout = 2000
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION, GRO' +
        'UP_DESC, UNIT_NAME, quantity, LOCATION, stock_area, stock_weight' +
        ', stock_date, '
      '                      employee_name'
      'FROM         invt_stock')
    Left = 240
    Top = 104
    object ADOInv_Stockrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOInv_StockINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOInv_StockINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOInv_StockINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOInv_StockGROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOInv_StockUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOInv_Stockquantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADOInv_StockLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOInv_Stockstock_area: TFloatField
      FieldName = 'stock_area'
    end
    object ADOInv_Stockstock_weight: TWideStringField
      FieldName = 'stock_weight'
      FixedChar = True
      Size = 10
    end
    object ADOInv_Stockstock_date: TDateTimeField
      FieldName = 'stock_date'
    end
    object ADOInv_Stockemployee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object ADOTmp2: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 2000
    Parameters = <>
    Left = 112
    Top = 144
  end
end
