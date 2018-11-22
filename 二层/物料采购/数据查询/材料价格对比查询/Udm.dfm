object dm: Tdm
  OldCreateOrder = False
  Left = 439
  Top = 143
  Height = 265
  Width = 373
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 56
  end
  object qry1: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    Left = 144
    Top = 56
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 88
    Top = 56
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 208
    Top = 56
  end
end
