object dm1: Tdm1
  OldCreateOrder = False
  Left = 606
  Top = 347
  Height = 257
  Width = 322
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 72
    Top = 24
  end
end
