object dm1: Tdm1
  OldCreateOrder = False
  Left = 423
  Top = 278
  Height = 415
  Width = 533
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 112
    Top = 24
  end
end
