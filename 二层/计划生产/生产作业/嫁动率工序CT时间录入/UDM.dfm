object DM: TDM
  OldCreateOrder = False
  Left = 195
  Top = 130
  Height = 311
  Width = 296
  object con1: TADOConnection
    CommandTimeout = 900
    ConnectionTimeout = 300
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\'#19996#33694'_172.18' +
      '.0.8.udl'
    Left = 32
    Top = 32
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 120
    Top = 136
  end
end
