object dm1: Tdm1
  OldCreateOrder = False
  Left = 633
  Top = 327
  Height = 441
  Width = 588
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 48
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 408
    Top = 48
  end
end
