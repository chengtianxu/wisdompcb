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
  object DSProfit: TADODataSet
    Connection = ADOCnn
    LockType = ltReadOnly
    CommandText = 
      'select data0103.rkey'#13#10'from data0103,data0104'#13#10'where data0104.rke' +
      'y=15'#13#10'and data0103.rkey=data0104.dflt_acct_01'
    Parameters = <>
    Left = 158
    Top = 16
    object DSProfitrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 344
    Top = 80
  end
  object Qry508: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    SQL.Strings = (
      'select * from data0508')
    Left = 344
    Top = 16
  end
  object DS0106: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0106.d_c,data0106.amount,gl_acct_no_ptr'#13#10'from data010' +
      '6'#13#10'where data0106.gl_header_ptr=:rkey'#13#10
    FieldDefs = <
      item
        Name = 'd_c'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 1
      end
      item
        Name = 'amount'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'gl_acct_no_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end>
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 3377
      end>
    StoreDefs = True
    Left = 96
    Top = 16
    object DS0106d_c: TStringField
      FieldName = 'd_c'
      FixedChar = True
      Size = 1
    end
    object DS0106amount: TBCDField
      FieldName = 'amount'
      Precision = 18
      Size = 2
    end
    object DS0106gl_acct_no_ptr: TIntegerField
      FieldName = 'gl_acct_no_ptr'
    end
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
      'WHERE Data0103.rkey=:rkey')
    Left = 96
    Top = 72
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
    Left = 160
    Top = 72
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
      'SELECT '#13#10'TYR_PERIOD_1_PROFIT, TYR_PERIOD_2_PROFIT, TYR_PERIOD_3_' +
      'PROFIT, TYR_PERIOD_4_PROFIT, TYR_PERIOD_5_PROFIT, TYR_PERIOD_6_P' +
      'ROFIT, TYR_PERIOD_7_PROFIT, TYR_PERIOD_8_PROFIT, TYR_PERIOD_9_PR' +
      'OFIT, TYR_PERIOD_10_PROFIT, TYR_PERIOD_11_PROFIT, TYR_PERIOD_12_' +
      'PROFIT'#13#10'from data0110'#13#10'where FYEAR=:vY'#13#10'and GL_ACCT_PTR=:rkey103' +
      #13#10
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
    Left = 232
    Top = 76
  end
end
