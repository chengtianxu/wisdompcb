object DM: TDM
  OldCreateOrder = False
  Left = 461
  Top = 254
  Height = 268
  Width = 203
  object Conn: TADOConnection
    ConnectionTimeout = 200
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object SP451: TADOStoredProc
    Connection = Conn
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Left = 88
    Top = 16
  end
  object Qery1: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      ' SELECT Data0496.ttype, Data0019.inv_group_desc'
      ' FROM Data0019 INNER JOIN'
      '      Data0496 ON Data0019.rkey = Data0496.group_ptr'
      ' GROUP BY Data0496.ttype, Data0019.inv_group_desc'
      ' ORDER BY Data0496.ttype')
    Left = 24
    Top = 72
  end
  object Query34: TADOQuery
    Connection = Conn
    Parameters = <
      item
        Name = 'vdn'
        DataType = ftString
        NumericScale = 20
        Precision = 20
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DEPT_CODE, DEPT_NAME, IS_COST_DEPT, COST_DEPT_PTR'
      'FROM Data0034'
      'WHERE (IS_COST_DEPT = 1)')
    Left = 88
    Top = 72
  end
  object tmp: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 24
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 88
    Top = 136
  end
end
