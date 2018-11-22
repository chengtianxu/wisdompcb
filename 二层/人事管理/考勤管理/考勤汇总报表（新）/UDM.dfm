object DM: TDM
  OldCreateOrder = False
  Left = 648
  Top = 312
  Height = 248
  Width = 264
  object con1: TADOConnection
    CommandTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object qrytemp: TADOQuery
    Connection = con1
    CommandTimeout = 300
    Parameters = <>
    Left = 104
    Top = 40
  end
  object qrytemp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 144
    Top = 88
  end
end
