object DM: TDM
  OldCreateOrder = False
  Left = 354
  Top = 230
  Height = 309
  Width = 321
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 152
    Top = 8
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from data0516'
      'order by rkey')
    Left = 96
    Top = 8
    object ADOQuery1RKEY: TSmallintField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1FASSET_STATUS: TStringField
      DisplayLabel = #22266#23450#36164#20135#29366#24577
      FieldName = 'FASSET_STATUS'
    end
    object ADOQuery1IN_DEPRECIATION: TWordField
      FieldName = 'IN_DEPRECIATION'
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #35745#25552#25240#26087#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Calculated = True
    end
  end
end
