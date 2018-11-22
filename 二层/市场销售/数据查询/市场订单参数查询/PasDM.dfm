object DM: TDM
  OldCreateOrder = False
  Left = 442
  Top = 260
  Height = 287
  Width = 256
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 56
    Top = 96
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 96
  end
end
