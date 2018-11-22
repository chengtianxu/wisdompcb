object FDM: TFDM
  OldCreateOrder = False
  Left = 608
  Top = 213
  Height = 421
  Width = 551
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 88
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 160
    Top = 128
  end
end
