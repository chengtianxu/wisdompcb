object DM: TDM
  OldCreateOrder = False
  Left = 564
  Top = 331
  Height = 150
  Width = 215
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 40
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 128
    Top = 48
  end
end
