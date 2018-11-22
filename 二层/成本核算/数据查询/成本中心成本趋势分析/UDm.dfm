object DM: TDM
  OldCreateOrder = False
  Left = 377
  Top = 236
  Height = 252
  Width = 286
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 56
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 160
    Top = 80
  end
end
