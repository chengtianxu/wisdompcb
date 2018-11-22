object DM: TDM
  OldCreateOrder = False
  Left = 447
  Top = 283
  Height = 232
  Width = 215
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=W001057'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object DS264: TADODataSet
    Connection = Conn
    CommandText = 'select * from Data0264'
    Parameters = <>
    Left = 72
    Top = 56
  end
  object Query: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 72
    Top = 104
  end
  object DS265: TADODataSet
    Connection = Conn
    CommandText = 
      'select * from data0265 where AUTH_GROUP_PTR=:vrkey'#13#10'order by rke' +
      'y'
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 56
  end
end
