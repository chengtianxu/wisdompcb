object DM: TDM
  OldCreateOrder = False
  Left = 254
  Top = 244
  Height = 313
  Width = 297
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 104
  end
  object ds370: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0370.CUSTOMER_PTR,dbo.Data0370.SHIPPERS_LEAD_TIME' +
      ', dbo.Data0370.VEHICLE,dbo.Data0370.SCAC_CODE, '#13#10'dbo.Data0370.DE' +
      'SCRIPTION,dbo.Data0370.CODE'#13#10'FROM   dbo.Data0370 '#13#10
    Parameters = <>
    Prepared = True
    Left = 112
    Top = 64
    object ds370CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 15
    end
    object ds370DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ds370CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ds370SCAC_CODE: TStringField
      FieldName = 'SCAC_CODE'
      Size = 40
    end
    object ds370VEHICLE: TStringField
      FieldName = 'VEHICLE'
      Size = 40
    end
    object ds370SHIPPERS_LEAD_TIME: TIntegerField
      FieldName = 'SHIPPERS_LEAD_TIME'
    end
  end
  object ds250: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select COUNTRY_CODE, COUNTRY_NAME from Data0250'
    Parameters = <>
    Prepared = True
    Left = 112
    Top = 112
    object ds250COUNTRY_CODE: TStringField
      FieldName = 'COUNTRY_CODE'
      Size = 5
    end
    object ds250COUNTRY_NAME: TStringField
      FieldName = 'COUNTRY_NAME'
      Size = 30
    end
  end
  object DataSource370: TDataSource
    DataSet = ds370
    Left = 184
    Top = 64
  end
  object DataSource250: TDataSource
    DataSet = ds250
    Left = 184
    Top = 112
  end
  object ds04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select SEED_VALUE, SEED_FLAG from Data0004 '#13#10'where  rkey=48'
    Parameters = <>
    Left = 112
    Top = 160
    object ds04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ds04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
end
