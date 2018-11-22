object dm: Tdm
  OldCreateOrder = False
  Left = 253
  Top = 142
  Height = 333
  Width = 390
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOS1
    Left = 136
    Top = 104
  end
  object ADOS1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select * from product_incept'#13#10'where 1=1 and product_incept.MFG_D' +
      'ATE>=:dtpk1 and '#13#10'product_incept.MFG_DATE<=:dtpk2'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40603d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40622d
      end>
    Left = 56
    Top = 104
    object ADOS1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOS1number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADOS1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOS1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOS1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOS1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 50
    end
    object ADOS1LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOS1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOS1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 50
    end
    object ADOS1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOS1incept_qty: TIntegerField
      FieldName = 'incept_qty'
      OnChange = ADOS1incept_qtyChange
    end
    object ADOS1unit_sq: TFloatField
      FieldName = 'unit_sq'
      OnChange = ADOS1unit_sqChange
    end
    object ADOS1incept_area: TBCDField
      FieldName = 'incept_area'
      Precision = 12
    end
    object ADOS1pcs_weight: TFloatField
      FieldName = 'pcs_weight'
      OnChange = ADOS1pcs_weightChange
    end
    object ADOS1incept_weight: TBCDField
      FieldName = 'incept_weight'
      Precision = 12
    end
    object ADOS1MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object ADOS1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 50
    end
    object ADOS1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOS1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOS1incept_type: TStringField
      FieldName = 'incept_type'
    end
    object ADOS1sales_type: TStringField
      FieldName = 'sales_type'
      Size = 10
    end
    object ADOS1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 184
    Top = 40
  end
end
