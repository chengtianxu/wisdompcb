object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 240
  Height = 318
  Width = 355
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
    Left = 283
    Top = 16
  end
  object ADODT0103: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 
      'select rkey, DB_CR, TYR_CLOSE, GL_ACC_NUMBER'#13#10'from data0103 '#13#10'wh' +
      'ere ACC_TP=5 and '#13#10'          HAS_CHILD=0 and'#13#10'          TYR_CLOS' +
      'E<>0'#13#10'order by DB_CR'
    Parameters = <>
    Left = 96
    Top = 24
    object ADODT0103rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODT0103DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object ADODT0103TYR_CLOSE: TBCDField
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
    object ADODT0103GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
  end
  object ADODS0106: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 'Select * from data0106'#13#10'where rkey is null'
    Parameters = <>
    Left = 172
    Top = 72
    object ADODS0106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODS0106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADODS0106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADODS0106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
    end
    object ADODS0106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADODS0106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 14
      Size = 2
    end
    object ADODS0106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADODS0106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADODS0106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADODS0106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADODS0106EXCH_RATE: TBCDField
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object ADODS0106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
  object ADODSProfit: TADODataSet
    Connection = ADOCnn
    CommandText = 
      'select '#13#10'data0103.rkey, GL_ACC_NUMBER,'#13#10' GL_DESCRIPTION, TYR_CLO' +
      'SE'#13#10'from data0103,data0104'#13#10'where data0104.rkey=15'#13#10'and data0103' +
      '.rkey=data0104.dflt_acct_01'
    Parameters = <>
    Left = 176
    Top = 24
    object ADODSProfitrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODSProfitGL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADODSProfitGL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADODSProfitTYR_CLOSE: TBCDField
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
  end
  object ADODS0105: TADODataSet
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
    Top = 72
  end
  object DS110: TADODataSet
    Connection = ADOCnn
    CursorType = ctStatic
    CommandText = 
      'SELECT *'#13#10'FROM Data0110'#13#10'WHERE (FYEAR = :vYear)'#13#10'and (GL_ACCT_PT' +
      'R = :rkey103)'
    Parameters = <
      item
        Name = 'vYear'
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
    Top = 128
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
    Left = 96
    Top = 136
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
    Left = 171
    Top = 136
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
end
