object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 684
  Top = 219
  Height = 472
  Width = 472
  object aconn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;Dat' +
      'a Source='
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 80
    Top = 8
  end
  object aqry: TADOQuery
    Connection = aconn
    Parameters = <>
    Left = 80
    Top = 64
  end
  object statqry: TADOQuery
    Connection = aconn
    LockType = ltUnspecified
    BeforeClose = statqryBeforeClose
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT Updated as optype, Count(data.hash) AS cnt'
      'FROM data'
      'GROUP BY Updated;')
    Left = 146
    Top = 7
  end
  object odataqry: TADOQuery
    Tag = 12
    Connection = aconn
    CursorType = ctStatic
    MaxRecords = 1
    BeforeClose = odataqryBeforeClose
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 1 updated, hash, actiondate, linestr'
      'FROM data'
      'WHERE updated=False')
    Left = 147
    Top = 65
  end
  object fstatqry: TADOQuery
    Connection = aconn
    MaxRecords = 1
    Parameters = <>
    Left = 213
    Top = 6
  end
end
