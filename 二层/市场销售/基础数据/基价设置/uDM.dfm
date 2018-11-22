object DM: TDM
  OldCreateOrder = False
  Left = 432
  Top = 248
  Height = 296
  Width = 283
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object Qery346: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT (SELECT COUNT(*)'
      '          FROM data0346 a'
      
        '          WHERE a.rkey <= data0346.rkey) AS no, ROW_NAME, ROW_VA' +
        'LUE'
      
        '          ,rkey,isnull(prod_route_ptr,0) as prod_route_ptr,KLAmo' +
        'unt,sampleAmount'
      'FROM dbo.Data0346'
      'ORDER BY no')
    Left = 97
    Top = 72
    object Qery346no: TIntegerField
      FieldName = 'no'
      ReadOnly = True
    end
    object Qery346ROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object Qery346ROW_VALUE: TFloatField
      FieldName = 'ROW_VALUE'
    end
    object Qery346rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Qery346prod_route_ptr: TIntegerField
      FieldName = 'prod_route_ptr'
    end
    object Qery346KLAmount: TBCDField
      FieldName = 'KLAmount'
      Precision = 18
      Size = 2
    end
    object Qery346sampleAmount: TBCDField
      FieldName = 'sampleAmount'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = Qery346
    Left = 32
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = Qery348
    Left = 32
    Top = 136
  end
  object Qery348: TADODataSet
    Connection = Conn
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0351.seq_no, dbo.Data0348.ADDER_NAME, '#13#10'      dbo' +
      '.Data0351.DEFT_SELECTED, dbo.Data0348.RKEY, '#13#10'      dbo.Data0351' +
      '.D0346_PTR'#13#10'FROM dbo.Data0348 INNER JOIN'#13#10'      dbo.Data0351 ON ' +
      'dbo.Data0348.RKEY = dbo.Data0351.D0348_PTR'#13#10'WHERE (dbo.Data0351.' +
      'D0346_PTR =  :rkey) ORDER BY dbo.Data0351.seq_no'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'D0346_PTR'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 96
    Top = 136
    object Qery348no: TIntegerField
      FieldName = 'seq_no'
      ReadOnly = True
    end
    object Qery348ADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
    end
    object Qery348DEFT_SELECTED: TBooleanField
      FieldName = 'DEFT_SELECTED'
    end
    object Qery348RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Qery348D0346_PTR: TIntegerField
      FieldName = 'D0346_PTR'
    end
  end
  object Qery351: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0351.seq_no AS no, dbo.Data0348.ADDER_NAME, '
      '      dbo.Data0351.DEFT_SELECTED, dbo.Data0351.seq_no, '
      '      dbo.Data0351.D0346_PTR,Data0351.D0348_PTR'
      'FROM dbo.Data0348 INNER JOIN'
      '      dbo.Data0351 ON dbo.Data0348.RKEY = dbo.Data0351.D0348_PTR'
      
        'WHERE (dbo.Data0351.D0346_PTR =:vrkey) AND (dbo.Data0351.DEFT_SE' +
        'LECTED > 0)'
      'ORDER BY no'
      '')
    Left = 96
    Top = 192
    object Qery351no: TIntegerField
      FieldName = 'no'
      ReadOnly = True
    end
    object Qery351ADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
    end
    object Qery351DEFT_SELECTED: TBooleanField
      FieldName = 'DEFT_SELECTED'
    end
    object Qery351D0346_PTR: TIntegerField
      FieldName = 'D0346_PTR'
    end
    object Qery351seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object Qery351D0348_PTR: TIntegerField
      FieldName = 'D0348_PTR'
    end
  end
  object Qery: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT (SELECT COUNT(*)'
      '          FROM data0348 a'
      
        '          WHERE a.rkey <= data0348.rkey) AS no, dbo.Data0348.ADD' +
        'ER_NAME, '
      '      dbo.Data0351.DEFT_SELECTED,DISTINCT dbo.Data0348.RKEY, '
      '      dbo.Data0351.D0346_PTR'
      'FROM dbo.Data0348 INNER JOIN'
      '      dbo.Data0351 ON dbo.Data0348.RKEY = dbo.Data0351.D0348_PTR'
      ' ORDER BY no')
    Left = 208
    Top = 96
  end
  object DataSource3: TDataSource
    DataSet = Qery351
    Left = 32
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 176
    Top = 152
  end
end
