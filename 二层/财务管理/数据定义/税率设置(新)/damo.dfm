object DM: TDM
  OldCreateOrder = False
  Left = 696
  Top = 338
  Height = 245
  Width = 324
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
  end
  object DataSource1: TDataSource
    DataSet = ds189
    Left = 72
    Top = 64
  end
  object ds189: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'select rkey, STATE_ID,NAME,STATE_TAX from data0189 where 1=1'
    EnableBCD = False
    IndexFieldNames = 'STATE_ID'
    Parameters = <>
    Prepared = True
    Left = 136
    Top = 48
    object ds189RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ds189STATE_ID: TStringField
      FieldName = 'STATE_ID'
      Size = 10
    end
    object ds189STATE_TAX: TBCDField
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
    object ds189NAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 120
  end
end
