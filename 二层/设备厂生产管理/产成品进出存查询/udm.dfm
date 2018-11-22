object DM: TDM
  OldCreateOrder = False
  Left = 674
  Top = 358
  Height = 221
  Width = 267
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Left = 120
    Top = 16
  end
end
