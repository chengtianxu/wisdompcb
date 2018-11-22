object DM: TDM
  OldCreateOrder = False
  Left = 457
  Top = 206
  Height = 150
  Width = 215
  object con1: TADOConnection
    CommandTimeout = 300
    ConnectionTimeout = 300
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\11DG_172.' +
      '18.0.8.udl'
    Left = 8
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 72
    Top = 48
  end
  object qry_temp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 128
    Top = 48
  end
end
