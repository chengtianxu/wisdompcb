object DM: TDM
  OldCreateOrder = False
  Left = 386
  Top = 241
  Height = 264
  Width = 333
  object ADOCnn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 15
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 144
    Top = 80
  end
  object Qry0517: TADOQuery
    Connection = ADOCnn
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vBdate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0517.DEPRE_ACCT_PTR, '
      '      dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.DB_CR, '
      '      SUM(dbo.Data0517.MONTH_DEPRE_AMT) AS sum_monthamt'
      'FROM dbo.Data0517 INNER JOIN'
      
        '      dbo.Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0103 ON dbo.Data0517.DEPRE_ACCT_PTR = dbo.Data0103' +
        '.RKEY'
      'WHERE (dbo.Data0517.BOOK_DATE < :vBdate)'
      '      AND (dbo.Data0517.active_flag = 1)  '
      '      AND  (Data0517.NET_VALUE >= Data0517.MONTH_DEPRE_AMT)'
      
        '      AND (dbo.Data0517.DEPRED_MONTHS < dbo.Data0517.EXPECTED_LI' +
        'FE_MONTHS) '
      '      AND (dbo.Data0516.IN_DEPRECIATION = 1)'
      
        'GROUP BY dbo.Data0517.DEPRE_ACCT_PTR, dbo.Data0103.GL_ACC_NUMBER' +
        ', '
      '      dbo.Data0103.DB_CR')
    Left = 96
    Top = 24
    object Qry0517DEPRE_ACCT_PTR: TIntegerField
      FieldName = 'DEPRE_ACCT_PTR'
    end
    object Qry0517GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Qry0517DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object Qry0517sum_monthamt: TBCDField
      FieldName = 'sum_monthamt'
      Precision = 32
      Size = 2
    end
  end
  object Qry326: TADOQuery
    Connection = ADOCnn
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vBdate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.data0326.FACCU_DEPT_GL_PTR, dbo.Data0103.GL_ACC_NUMBE' +
        'R, '
      '      dbo.Data0103.DB_CR, '
      
        '      SUM(dbo.Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS *' +
        ' 0.01) '
      '      AS sum_monthamt'
      'FROM dbo.Data0517 INNER JOIN'
      
        '      dbo.Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKE' +
        'Y INNER JOIN'
      '      dbo.Data0103 INNER JOIN'
      
        '      dbo.data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEP' +
        'T_GL_PTR ON '
      '      dbo.Data0517.RKEY = dbo.data0326.fasset_ptr'
      
        'WHERE (dbo.Data0517.DEPRED_MONTHS < dbo.Data0517.EXPECTED_LIFE_M' +
        'ONTHS)'
      '    AND (dbo.Data0516.IN_DEPRECIATION = 1)'
      '    AND (dbo.Data0517.active_flag = 1) '
      '    and (Data0517.NET_VALUE >= Data0517.MONTH_DEPRE_AMT)'
      '    AND (dbo.Data0517.BOOK_DATE < :vBdate)'
      'GROUP BY dbo.Data0103.DB_CR, dbo.data0326.FACCU_DEPT_GL_PTR, '
      '      dbo.Data0103.GL_ACC_NUMBER')
    Left = 96
    Top = 80
    object Qry326FACCU_DEPT_GL_PTR: TIntegerField
      FieldName = 'FACCU_DEPT_GL_PTR'
    end
    object Qry326GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Qry326DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object Qry326sum_monthamt: TFloatField
      FieldName = 'sum_monthamt'
    end
  end
  object DS0106: TADODataSet
    Connection = ADOCnn
    CursorType = ctDynamic
    LockType = ltBatchOptimistic
    CommandText = 'Select * from data0106 '#13#10'where rkey is null'
    Parameters = <>
    Left = 146
    Top = 128
  end
  object DS0105: TADODataSet
    Connection = ADOCnn
    CommandText = 'select * from data0105 where rkey is null'
    Parameters = <>
    Left = 96
    Top = 128
  end
  object DS0508: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 267
    Top = 80
  end
  object DS528: TADODataSet
    Connection = ADOCnn
    CommandText = 'select * from Data0528 where rkey is null'
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 141
    Top = 28
  end
end
