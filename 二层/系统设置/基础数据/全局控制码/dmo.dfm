object DM: TDM
  OldCreateOrder = False
  Left = 458
  Top = 224
  Height = 150
  Width = 286
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
  end
  object ADO04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select RKEY, CONTROL_NO_LENGTH, SEED_MEAN, SEED_FLAG, case seed_' +
      'flag '#13#10'when 1 then '#39#25163#21160#39' when 2 then '#39#22266#23450#23383#27597#39' when 3 then '#39#21487#21464#23383#27597#39' wh' +
      'en 4 then '#39#22266#23450#39' end as seed_flag1,SEED_VALUE, table_name from Dat' +
      'a0004'
    Parameters = <>
    Left = 112
    Top = 40
    object ADO04RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADO04SEED_MEAN: TStringField
      FieldName = 'SEED_MEAN'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04table_name: TStringField
      FieldName = 'table_name'
      Size = 12
    end
    object ADO04seed_flag1: TStringField
      FieldName = 'seed_flag1'
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO04
    Left = 176
    Top = 40
  end
end
