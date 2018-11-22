object DM: TDM
  OldCreateOrder = False
  Left = 833
  Top = 304
  Height = 172
  Width = 226
  object con1: TADOConnection
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
    Left = 144
    Top = 40
  end
end
