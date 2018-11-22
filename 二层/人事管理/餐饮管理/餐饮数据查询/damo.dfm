object DM: TDM
  OldCreateOrder = False
  Left = 225
  Top = 155
  Height = 470
  Width = 732
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object DataSource_cx: TDataSource
    DataSet = ADOTMP
    Left = 128
    Top = 8
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 128
    Top = 64
  end
  object ADOTMP_DEL: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 65
  end
end
