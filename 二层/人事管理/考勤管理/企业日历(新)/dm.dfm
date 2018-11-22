object udm: Tudm
  OldCreateOrder = False
  Left = 541
  Top = 219
  Height = 269
  Width = 293
  object adocon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 67
    Top = 13
  end
  object adoqry: TADOQuery
    Connection = adocon
    Parameters = <>
    Left = 137
    Top = 13
  end
  object dsqry: TDataSource
    Left = 181
    Top = 16
  end
  object dstbl: TDataSource
    DataSet = adotbl
    Left = 182
    Top = 82
  end
  object adotbl: TADOTable
    Connection = adocon
    CursorType = ctStatic
    TableDirect = True
    TableName = 'dbo.Resttypemsg'
    Left = 136
    Top = 80
  end
end
