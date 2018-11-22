object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 240
  Height = 288
  Width = 450
  object ADOCnn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB_BAK;Data Source=172.16.1.' +
      '57'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 15
  end
  object DS0508: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 99
    Top = 136
  end
  object DS0106: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 
      'SELECT Data0105.RKEY, Data0106.GL_ACCT_NO_PTR, Data0106.D_C, '#13#10' ' +
      '     Data0106.AMOUNT'#13#10'FROM Data0105 INNER JOIN'#13#10'      Data0106 O' +
      'N Data0105.RKEY = Data0106.GL_HEADER_PTR'#13#10'where Data0105.RKEY=:v' +
      'rkey'
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 172
    Top = 72
    object DS0106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS0106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object DS0106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object DS0106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 96
    Top = 72
  end
  object ds0103: TADOQuery
    Connection = ADOCnn
    Parameters = <
      item
        Name = 'debit'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'credit'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'debit_orig'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'credit_orig'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Data0103'
      'SET current_period_debit = current_period_debit - :debit,'
      '    current_period_credit = current_period_credit - :credit,'
      
        '    current_period_debit_orig = current_period_debit_orig - :deb' +
        'it_orig,'
      
        '    current_period_credit_orig = current_period_credit_orig - :c' +
        'redit_orig'
      'WHERE Data0103.rkey=:rkey'
      ''
      ' ')
    Left = 184
    Top = 184
  end
  object ds103p: TADOQuery
    Connection = ADOCnn
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
      'select DB_CR, '
      'TYR_OPEN, '
      'CURRENT_PERIOD_DEBIT, '
      'CURRENT_PERIOD_CREDIT, '
      'TYR_CLOSE,'
      'TYR_OPEN_ORIG, '
      'CURRENT_PERIOD_DEBIT_ORIG, '
      'CURRENT_PERIOD_CREDIT_ORIG, '
      'TYR_CLOSE_ORIG'
      ' from Data0103'
      'where rkey=:rkey')
    Left = 256
    Top = 184
    object ds103pDB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object ds103pTYR_OPEN: TBCDField
      FieldName = 'TYR_OPEN'
      Precision = 19
    end
    object ds103pCURRENT_PERIOD_DEBIT: TBCDField
      FieldName = 'CURRENT_PERIOD_DEBIT'
      Precision = 19
    end
    object ds103pCURRENT_PERIOD_CREDIT: TBCDField
      FieldName = 'CURRENT_PERIOD_CREDIT'
      Precision = 19
    end
    object ds103pTYR_CLOSE: TBCDField
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
    object ds103pTYR_OPEN_ORIG: TBCDField
      FieldName = 'TYR_OPEN_ORIG'
      Precision = 19
    end
    object ds103pCURRENT_PERIOD_DEBIT_ORIG: TBCDField
      FieldName = 'CURRENT_PERIOD_DEBIT_ORIG'
      Precision = 19
    end
    object ds103pCURRENT_PERIOD_CREDIT_ORIG: TBCDField
      FieldName = 'CURRENT_PERIOD_CREDIT_ORIG'
      Precision = 19
    end
    object ds103pTYR_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_CLOSE_ORIG'
      Precision = 19
    end
  end
  object DS110: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 
      'SELECT * from data0110'#13#10'where FYEAR=:vY'#13#10'and GL_ACCT_PTR=:rkey10' +
      '3'#13#10
    Parameters = <
      item
        Name = 'vY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey103'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 312
    Top = 184
  end
end
