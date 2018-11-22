object DM: TDM
  OldCreateOrder = False
  Left = 647
  Top = 297
  Height = 389
  Width = 330
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 80
  end
end
