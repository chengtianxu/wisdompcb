object dm1: Tdm1
  OldCreateOrder = False
  Height = 440
  Width = 461
  object con1: TADOConnection
    CommandTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 112
    Top = 88
  end
  object cdsLookup278: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 72
    Top = 306
    object atncfldLookup278rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfldLookup278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
    end
    object strngfldLookup278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      Size = 40
    end
    object strngfldLookup278datatype: TStringField
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object strngfldLookup278CATEGORY: TStringField
      FieldName = 'CATEGORY'
      ReadOnly = True
      Size = 4
    end
    object strngfldLookup278UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
  end
  object cdslookup34: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 152
    Top = 306
    object atncfldcdslookup34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldcdslookup34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object strngfldcdslookup34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cdslookup496: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 224
    Top = 306
    object atncfldcdslookup496rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfldcdslookup496GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object strngfldcdslookup496GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object strngfldcdslookup496SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bomprice06')
    Left = 328
    Top = 104
  end
  object spAfterSave: TADOStoredProc
    Connection = con1
    ProcedureName = 'AfterBOMPrice06Save'
    Parameters = <
      item
        Name = '@BP06IDKey'
        Value = Null
      end
      item
        Name = '@SaveType'
        Value = Null
      end>
    Left = 232
    Top = 200
  end
end
