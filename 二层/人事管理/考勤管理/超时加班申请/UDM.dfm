object DM: TDM
  OldCreateOrder = False
  Left = 527
  Top = 354
  Height = 194
  Width = 348
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 112
    Top = 72
  end
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\demo 172.' +
      '18.0.8_'#19996#33694#27979#35797'.udl'
    Left = 24
    Top = 24
  end
  object qry_temp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 216
    Top = 72
  end
end
