object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 263
  Width = 274
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 104
    Top = 40
  end
  object DP: TDataSetProvider
    Left = 160
    Top = 40
  end
end
