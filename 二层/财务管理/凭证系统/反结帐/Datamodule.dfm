object DM: TDM
  OldCreateOrder = False
  Left = 231
  Top = 244
  Height = 201
  Width = 253
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 7
  end
  object DS0508: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 171
    Top = 8
  end
  object ADOQ: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 176
    Top = 64
  end
  object DS0105: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,status,voucher,posted_dt from data0105'#13#10'where data01' +
      '05.fyear=:vfyear'#13#10'and data0105.period=:vperiod'#13#10'and data0105.sta' +
      'tus=3'#13#10
    FieldDefs = <
      item
        Name = 'rkey'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'status'
        Attributes = [faFixed]
        DataType = ftSmallint
      end>
    Parameters = <
      item
        Name = 'vfyear'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2002
      end
      item
        Name = 'vperiod'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 1
      end>
    StoreDefs = True
    Left = 104
    Top = 64
  end
  object ds0110: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 104
    Top = 16
  end
end
