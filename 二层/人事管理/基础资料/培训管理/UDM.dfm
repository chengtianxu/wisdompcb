object DM: TDM
  OldCreateOrder = False
  Left = 457
  Top = 266
  Height = 230
  Width = 234
  object con: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 40
  end
  object qry_temp: TADOQuery
    Connection = con
    Parameters = <>
    Left = 168
    Top = 104
  end
end
