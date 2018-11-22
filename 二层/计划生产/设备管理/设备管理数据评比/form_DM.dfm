object DM: TDM
  OldCreateOrder = False
  Left = 601
  Top = 229
  Height = 268
  Width = 334
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 48
  end
  object qry_temp: TADOQuery
    Parameters = <>
    Left = 168
    Top = 56
  end
  object dt_temp: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 136
  end
end
