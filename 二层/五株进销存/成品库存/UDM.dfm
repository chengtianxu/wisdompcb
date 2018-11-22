object DM: TDM
  OldCreateOrder = False
  Left = 561
  Top = 235
  Height = 226
  Width = 330
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADOStock1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from product_stock')
    Left = 112
    Top = 16
    object ADOStock1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOStock1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOStock1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOStock1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOStock1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 50
    end
    object ADOStock1LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOStock1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOStock1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 50
    end
    object ADOStock1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOStock1quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADOStock1unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOStock1stock_area: TBCDField
      FieldName = 'stock_area'
      Precision = 12
    end
    object ADOStock1pcs_weight: TFloatField
      FieldName = 'pcs_weight'
    end
    object ADOStock1stock_weight: TBCDField
      FieldName = 'stock_weight'
      Precision = 12
    end
    object ADOStock1LOCATION: TStringField
      FieldName = 'LOCATION'
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
    DataSet = ADOproduct_stock
    Left = 32
    Top = 96
  end
  object ADOTmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 96
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 24
  end
  object ADO05: TADOQuery
    Connection = ADOConnection1
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
  object ADOproduct_stock: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey,MANU_PART_NUMBER, MANU_PART_DESC, ANALYSIS_CODE_' +
        '2, PROD_CODE, LAYERS, PRODUCT_NAME, CUST_CODE, ABBR_NAME, quanti' +
        'ty, '
      
        '                      unit_sq, stock_area, pcs_weight, stock_wei' +
        'ght, LOCATION, stock_date, employee_name '
      'FROM         dbo.product_stock')
    Left = 240
    Top = 104
    object ADOproduct_stockrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOproduct_stockMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOproduct_stockMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOproduct_stockANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOproduct_stockPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 50
    end
    object ADOproduct_stockLAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOproduct_stockPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOproduct_stockCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 50
    end
    object ADOproduct_stockABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOproduct_stockquantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADOproduct_stockunit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOproduct_stockstock_area: TBCDField
      FieldName = 'stock_area'
      Precision = 12
    end
    object ADOproduct_stockpcs_weight: TFloatField
      FieldName = 'pcs_weight'
    end
    object ADOproduct_stockstock_weight: TBCDField
      FieldName = 'stock_weight'
      Precision = 12
    end
    object ADOproduct_stockLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOproduct_stockstock_date: TDateTimeField
      FieldName = 'stock_date'
    end
    object ADOproduct_stockemployee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object ADOTmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 152
  end
end
