object DM: TDM
  OldCreateOrder = False
  Left = 391
  Top = 210
  Height = 373
  Width = 517
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\'#28145#22323'_172.16' +
      '.0.8.udl'
    Left = 32
    Top = 8
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 128
    Top = 24
  end
  object qry_temp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 208
    Top = 24
  end
  object qry_Main: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    AfterScroll = qry_MainAfterScroll
    Parameters = <>
    Left = 80
    Top = 112
  end
  object ds: TDataSource
    DataSet = qry_Main
    Left = 144
    Top = 112
  end
end
