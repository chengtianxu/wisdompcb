object dm: Tdm
  OldCreateOrder = False
  Left = 430
  Top = 230
  Height = 445
  Width = 645
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADS34
    Left = 80
    Top = 192
  end
  object ADS34: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0034.rkey,dbo.Data0034.DEPT_CODE, '#13#10'dbo.Data0034.DEPT' +
      '_NAME, dbo.Data0034.PRINTING_RESOURCE, '#13#10'dbo.Data0034.PR_ID, dbo' +
      '.Data0034.SEQ_NR, '#13#10'      dbo.Data0034.PCS_AS_UNIT, dbo.Data0034' +
      '.OUT_SOURCE, '#13#10'      Data0103_1.GL_ACC_NUMBER, dbo.Data0034.BIG_' +
      'DEPT_PTR, '#13#10'      dbo.Data0034.GL_ACCT_PTR,'#13#10'case when data0103_' +
      '3.GL_DESCRIPTION is not null then'#13#10'  data0103_3.GL_DESCRIPTION+'#39 +
      '-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+data0103_1.GL_DESCRIPTION'#13#10 +
      'else'#13#10' case when data0103_2.GL_DESCRIPTION is not null then'#13#10'   ' +
      'data0103_2.GL_DESCRIPTION+'#39'-'#39'+data0103_1.GL_DESCRIPTION'#13#10'  else ' +
      'data0103_1.GL_DESCRIPTION'#13#10'  end  '#13#10'end as gl_desc,'#13#10'case data00' +
      '34.ttype when '#39'4'#39' then '#39#37096#38376#39' when '#39'5'#39' then '#39#29677#32452#39#13#10'end as vttype,da' +
      'ta0034_1.dept_code as bumeicode'#13#10#13#10'FROM dbo.Data0034 Data0034_1 ' +
      'RIGHT OUTER JOIN'#13#10'      dbo.Data0034 ON '#13#10'      Data0034_1.RKEY ' +
      '= dbo.Data0034.BIG_DEPT_PTR LEFT OUTER JOIN'#13#10'      dbo.Data0103 ' +
      'Data0103_2 LEFT OUTER JOIN'#13#10'      dbo.Data0103 Data0103_3 ON '#13#10' ' +
      '     Data0103_2.PARENT_PTR = Data0103_3.RKEY RIGHT OUTER JOIN'#13#10' ' +
      '     dbo.Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PAR' +
      'ENT_PTR ON '#13#10'      dbo.Data0034.GL_ACCT_PTR = Data0103_1.RKEY'#13#10#13 +
      #10'WHERE (dbo.Data0034.TTYPE = 4) OR'#13#10'      (dbo.Data0034.TTYPE = ' +
      '5)'
    IndexFieldNames = 'dept_code'
    Parameters = <>
    Left = 141
    Top = 192
    object ADS34rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS34DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS34DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS34PRINTING_RESOURCE: TStringField
      DisplayLabel = #36127#36131#20154
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object ADS34PR_ID: TStringField
      DisplayLabel = #35831#36141#21069#32512
      FieldName = 'PR_ID'
      FixedChar = True
      Size = 2
    end
    object ADS34SEQ_NR: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'SEQ_NR'
    end
    object ADS34PCS_AS_UNIT: TWordField
      FieldName = 'PCS_AS_UNIT'
    end
    object ADS34OUT_SOURCE: TWordField
      FieldName = 'OUT_SOURCE'
    end
    object ADS34GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#32534#30721
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADS34BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object ADS34GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADS34gl_desc: TStringField
      DisplayLabel = #31185#30446#21517#31216
      DisplayWidth = 30
      FieldName = 'gl_desc'
      ReadOnly = True
      Size = 152
    end
    object ADS34vttype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'vttype'
      ReadOnly = True
      Size = 4
    end
    object ADS34bumeicode: TStringField
      FieldName = 'bumeicode'
      Size = 10
    end
  end
  object AQ34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0034.rkey,dbo.Data0034.DEPT_CODE, '
      'dbo.Data0034.DEPT_NAME, ttype,'
      'dbo.Data0034.PRINTING_RESOURCE, '
      '     dbo.Data0034.PR_ID, ACTIVE_FLAG,'
      '      dbo.Data0034.SEQ_NR, '
      '     dbo.Data0034.PCS_AS_UNIT,'
      '     dbo.Data0034.OUT_SOURCE, '
      '     dbo.Data0034.BIG_DEPT_PTR, '
      '     dbo.Data0034.GL_ACCT_PTR'
      'FROM data0034'
      'where rkey=:rkey')
    Left = 144
    Top = 256
    object AQ34rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AQ34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQ34ttype: TStringField
      FieldName = 'ttype'
      Size = 1
    end
    object AQ34PRINTING_RESOURCE: TStringField
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object AQ34PR_ID: TStringField
      FieldName = 'PR_ID'
      FixedChar = True
      Size = 2
    end
    object AQ34SEQ_NR: TIntegerField
      FieldName = 'SEQ_NR'
    end
    object AQ34PCS_AS_UNIT: TWordField
      FieldName = 'PCS_AS_UNIT'
    end
    object AQ34OUT_SOURCE: TWordField
      FieldName = 'OUT_SOURCE'
    end
    object AQ34BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object AQ34GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object AQ34ACTIVE_FLAG: TWordField
      FieldName = 'ACTIVE_FLAG'
    end
  end
  object DataSource2: TDataSource
    DataSet = AQ34
    Left = 80
    Top = 256
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 120
  end
end
