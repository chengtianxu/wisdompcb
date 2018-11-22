object DM: TDM
  OldCreateOrder = False
  Left = 412
  Top = 279
  Height = 150
  Width = 215
  object con1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 168
    Top = 16
  end
end
