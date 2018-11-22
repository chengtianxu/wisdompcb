object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 240
  Height = 288
  Width = 450
  object ADOCnn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 15
  end
  object ADODS0508: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 275
    Top = 40
  end
  object DS0103: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT Data0103.RKEY,Data0103.auto_trans_ptr,'#13#10'    Data0103.GL_D' +
      'ESCRIPTION, Data0103.GL_ACC_NUMBER, '#13#10'     Data0103.multi_column' +
      '_flag, '#13#10'      Data0103.DB_CR, Data0103.PARENT_PTR, Data0103.TYR' +
      '_OPEN, '#13#10'      Data0103.TYR_DEBIT, Data0103.TYR_CREDIT, Data0103' +
      '.TYR_CLOSE, '#13#10'      Data0103.TYR_PROFIT, Data0103.CURRENT_PERIOD' +
      '_DEBIT, '#13#10'      Data0103.CURRENT_PERIOD_CREDIT, Data0103.CURRENT' +
      '_PERIOD_PROFIT, '#13#10'      Data0103.ACC_TP, Data0103.TYR_CLOSE_ORIG' +
      ','#13#10'      Data0103_1.GL_DESCRIPTION AS autoDES, '#13#10'      Data0103_' +
      '1.GL_ACC_NUMBER AS autoAcc, '#13#10'      Data0103_1.PARENT_PTR AS aut' +
      'oPar'#13#10'FROM Data0103 INNER JOIN'#13#10'      Data0103 Data0103_1 ON Dat' +
      'a0103.auto_trans_ptr = Data0103_1.RKEY'#13#10'WHERE (Data0103.TYR_CLOS' +
      'E<>0)'#13#10'      AND (Data0103.HAS_CHILD = 0)'#13#10'      AND (Data0103.A' +
      'CC_TP=4)'
    Parameters = <>
    Left = 96
    Top = 16
    object DS0103auto_trans_ptr: TIntegerField
      FieldName = 'auto_trans_ptr'
    end
    object DS0103GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object DS0103GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object DS0103RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS0103multi_column_flag: TBooleanField
      FieldName = 'multi_column_flag'
    end
    object DS0103DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object DS0103PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object DS0103TYR_OPEN: TBCDField
      FieldName = 'TYR_OPEN'
      Precision = 19
    end
    object DS0103TYR_DEBIT: TBCDField
      FieldName = 'TYR_DEBIT'
      Precision = 19
    end
    object DS0103TYR_CREDIT: TBCDField
      FieldName = 'TYR_CREDIT'
      Precision = 19
    end
    object DS0103TYR_CLOSE: TBCDField
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
    object DS0103TYR_PROFIT: TBCDField
      FieldName = 'TYR_PROFIT'
      Precision = 19
    end
    object DS0103CURRENT_PERIOD_DEBIT: TBCDField
      FieldName = 'CURRENT_PERIOD_DEBIT'
      Precision = 19
    end
    object DS0103CURRENT_PERIOD_CREDIT: TBCDField
      FieldName = 'CURRENT_PERIOD_CREDIT'
      Precision = 19
    end
    object DS0103CURRENT_PERIOD_PROFIT: TBCDField
      FieldName = 'CURRENT_PERIOD_PROFIT'
      Precision = 19
    end
    object DS0103ACC_TP: TIntegerField
      FieldName = 'ACC_TP'
    end
    object DS0103autoDES: TStringField
      FieldName = 'autoDES'
      Size = 50
    end
    object DS0103autoAcc: TStringField
      FieldName = 'autoAcc'
      Size = 18
    end
    object DS0103autoPar: TIntegerField
      FieldName = 'autoPar'
    end
    object DS0103TYR_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_CLOSE_ORIG'
      Precision = 19
    end
  end
  object DS0106: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'Select * from data0106'#13#10'where rkey is null'
    Parameters = <>
    Left = 168
    Top = 72
    object DS0106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS0106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object DS0106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object DS0106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 10
    end
    object DS0106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object DS0106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object DS0106AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object DS0106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object DS0106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object DS0106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object DS0106gl_acc_number: TStringField
      FieldKind = fkLookup
      FieldName = 'gl_acc_number'
      LookupDataSet = DS0103
      LookupKeyFields = 'rkey'
      LookupResultField = 'gl_acc_number'
      KeyFields = 'GL_ACCT_NO_PTR'
      Lookup = True
    end
    object DS0106gl_description: TStringField
      FieldKind = fkLookup
      FieldName = 'gl_description'
      LookupDataSet = DS0103
      LookupKeyFields = 'rkey'
      LookupResultField = 'gl_description'
      KeyFields = 'GL_ACCT_NO_PTR'
      Lookup = True
    end
    object DS0106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object DS0106EXCH_RATE: TBCDField
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object DS0106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
  object DS0105: TADODataSet
    Connection = ADOCnn
    CommandText = 'select * from data0105 where rkey is null'
    Parameters = <>
    Left = 96
    Top = 72
  end
  object ADOQ: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 280
    Top = 96
  end
  object DS103ZR: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 
      'select DB_CR, '#13#10'TYR_OPEN, '#13#10'CURRENT_PERIOD_DEBIT, '#13#10'CURRENT_PERI' +
      'OD_CREDIT, '#13#10'TYR_CLOSE,'#13#10' TYR_OPEN_ORIG, '#13#10'CURRENT_PERIOD_DEBIT_' +
      'ORIG,'#13#10' CURRENT_PERIOD_CREDIT_ORIG,'#13#10'TYR_CLOSE_ORIG'#13#10' from Data0' +
      '103'#13#10'where rkey=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 170
    Top = 134
    object DS103ZRDB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object DS103ZRTYR_OPEN: TBCDField
      FieldName = 'TYR_OPEN'
      Precision = 19
    end
    object DS103ZRCURRENT_PERIOD_DEBIT: TBCDField
      FieldName = 'CURRENT_PERIOD_DEBIT'
      Precision = 19
    end
    object DS103ZRCURRENT_PERIOD_CREDIT: TBCDField
      FieldName = 'CURRENT_PERIOD_CREDIT'
      Precision = 19
    end
    object DS103ZRTYR_CLOSE: TBCDField
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
    object DS103ZRTYR_OPEN_ORIG: TBCDField
      FieldName = 'TYR_OPEN_ORIG'
      Precision = 19
    end
    object DS103ZRCURRENT_PERIOD_DEBIT_ORIG: TBCDField
      FieldName = 'CURRENT_PERIOD_DEBIT_ORIG'
      Precision = 19
    end
    object DS103ZRCURRENT_PERIOD_CREDIT_ORIG: TBCDField
      FieldName = 'CURRENT_PERIOD_CREDIT_ORIG'
      Precision = 19
    end
    object DS103ZRTYR_CLOSE_ORIG: TBCDField
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
    Left = 280
    Top = 144
  end
  object DS103P: TADOCommand
    CommandText = 
      'UPDATE Data0103'#13#10'   SET Data0103.current_period_debit = current_' +
      'period_debit + :debit,'#13#10'           Data0103.current_period_credi' +
      't = current_period_credit + :credit,'#13#10'           Data0103.curren' +
      't_period_debit_orig = current_period_debit_orig + :debit_orig,'#13#10 +
      '           Data0103.current_period_credit_orig = current_period_' +
      'credit_orig + :credit_orig'#13#10'      WHERE Data0103.rkey=:rkey'
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
    Left = 98
    Top = 136
  end
end
