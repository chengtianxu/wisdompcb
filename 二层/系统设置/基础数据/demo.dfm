object DM: TDM
  OldCreateOrder = False
  Left = 694
  Top = 257
  Height = 235
  Width = 213
  object cn_adocon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 36
    Top = 23
  end
  object ds_source: TDataSource
    AutoEdit = False
    DataSet = dsADS02
    Left = 114
    Top = 24
  end
  object dsADS02: TADODataSet
    AutoCalcFields = False
    Connection = cn_adocon
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    AfterDelete = dsADS02AfterDelete
    OnDeleteError = dsADS02DeleteError
    OnPostError = dsADS02PostError
    CommandText = 
      'select unit_code,unit_name,prod,purch,stock,quote from data0002'#13 +
      #10
    IndexFieldNames = 'unit_code'
    Parameters = <>
    Left = 37
    Top = 88
    object strngfldADS02unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object strngfldADS02unit_name: TStringField
      FieldName = 'unit_name'
    end
    object strngfldADS02prod: TStringField
      FieldName = 'prod'
      FixedChar = True
      Size = 1
    end
    object strngfldADS02purch: TStringField
      FieldName = 'purch'
      FixedChar = True
      Size = 1
    end
    object strngfldADS02stock: TStringField
      FieldName = 'stock'
      FixedChar = True
      Size = 1
    end
    object strngfldADS02quote: TStringField
      FieldName = 'quote'
      FixedChar = True
      Size = 1
    end
  end
end
