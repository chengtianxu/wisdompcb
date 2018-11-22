object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 240
  Height = 182
  Width = 238
  object ADOCnn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 15
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 96
    Top = 88
  end
  object DS0508: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 147
    Top = 88
  end
end
