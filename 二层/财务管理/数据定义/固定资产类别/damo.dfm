object DM: TDM
  OldCreateOrder = False
  Left = 259
  Top = 174
  Height = 185
  Width = 210
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 72
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    OnCalcFields = ADOQuery1CalcFields
    OnEditError = ADOQuery1EditError
    OnPostError = ADOQuery1PostError
    Parameters = <>
    SQL.Strings = (
      'select * from data0514'
      'order by rkey')
    Left = 72
    Top = 72
    object ADOQuery1RKEY: TSmallintField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1FASSET_TYPE: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'FASSET_TYPE'
      FixedChar = True
    end
    object ADOQuery1type: TStringField
      DisplayLabel = #25240#26087#26041#27861
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
    object ADOQuery1depr_mthd_ptr: TIntegerField
      FieldName = 'depr_mthd_ptr'
    end
    object ADOQuery1expected_life: TFloatField
      DisplayLabel = #39044#26399#23551#21629
      FieldName = 'expected_life'
    end
    object ADOQuery1expected_surplus_rate: TFloatField
      DisplayLabel = #27531#20540#29575'%'
      FieldName = 'expected_surplus_rate'
    end
    object ADOQuery1prechar1: TStringField
      FieldName = 'prechar1'
      FixedChar = True
      Size = 15
    end
  end
end
