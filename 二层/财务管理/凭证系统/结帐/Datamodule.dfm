object DM: TDM
  OldCreateOrder = False
  Left = 491
  Top = 263
  Height = 233
  Width = 310
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 7
  end
  object DS0508: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 163
    Top = 8
  end
  object DS0105: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,status,voucher,posted_dt from data0105'#13#10'where data01' +
      '05.fyear=:vfyear'#13#10'and data0105.period=:vperiod'#13#10'and data0105.sta' +
      'tus<>3 and data0105.status<>5'#13#10
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
    Left = 160
    Top = 64
  end
  object ADOQ: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 256
    Top = 64
  end
  object ds0110: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 96
    Top = 64
  end
  object ds0103: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'update data0103'
      'set'
      '     TYR_DEBIT=TYR_DEBIT+CURRENT_PERIOD_DEBIT,'
      '     TYR_CREDIT=TYR_CREDIT+CURRENT_PERIOD_CREDIT,'
      '     TYR_DEBIT_ORIG=TYR_DEBIT_ORIG+CURRENT_PERIOD_DEBIT_ORIG,'
      '     TYR_CREDIT_ORIG=TYR_CREDIT_ORIG+CURRENT_PERIOD_CREDIT_ORIG,'
      '     Data0103.TYR_OPEN=Data0103.TYR_CLOSE,'
      '     Data0103.CURRENT_PERIOD_DEBIT=0,'
      '     Data0103.CURRENT_PERIOD_CREDIT=0,'
      '     Data0103.TYR_CLOSE=0,'
      '     Data0103.TYR_OPEN_ORIG=Data0103.TYR_CLOSE_ORIG,'
      '     Data0103.CURRENT_PERIOD_DEBIT_ORIG=0,'
      '     Data0103.CURRENT_PERIOD_CREDIT_ORIG=0,'
      '     Data0103.TYR_CLOSE_ORIG=0')
    Left = 96
    Top = 8
  end
end
