object DM: TDM
  OldCreateOrder = False
  Left = 268
  Top = 192
  Height = 218
  Width = 231
  object conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 8
  end
  object Qry524: TADOQuery
    Connection = conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Data0524 ORDER BY REPORT_FILE ')
    Left = 64
    Top = 48
    object Qry524RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Qry524REPORT_FILE: TStringField
      FieldName = 'REPORT_FILE'
      FixedChar = True
      Size = 50
    end
    object Qry524fyear: TIntegerField
      FieldName = 'fyear'
    end
  end
  object Qry508: TADOQuery
    Connection = conn
    Parameters = <>
    SQL.Strings = (
      'SELECT  * from data0508')
    Left = 136
    Top = 48
  end
  object Qry110: TADOQuery
    Connection = conn
    Parameters = <
      item
        Name = 'vYear'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *, Data0103.GL_ACC_NUMBER'
      'FROM Data0110 INNER JOIN'
      '      Data0103 ON Data0110.GL_ACCT_PTR = Data0103.RKEY'
      'WHERE (Data0110.FYEAR =:vYear)'
      '')
    Left = 64
    Top = 104
  end
  object Qry: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 136
    Top = 104
  end
end
