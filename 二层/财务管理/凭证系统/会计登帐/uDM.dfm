object DM: TDM
  OldCreateOrder = False
  Left = 398
  Top = 221
  Height = 301
  Width = 362
  object ADOCnn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 7
  end
  object tmp: TADOQuery
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
      ' SET current_period_debit = current_period_debit + :debit,'
      '     current_period_credit = current_period_credit + :credit,'
      
        '     CURRENT_PERIOD_DEBIT_ORIG = CURRENT_PERIOD_DEBIT_ORIG + :de' +
        'bit_orig,'
      
        '     CURRENT_PERIOD_CREDIT_ORIG=CURRENT_PERIOD_CREDIT_ORIG + :cr' +
        'edit_orig'
      'WHERE Data0103.rkey=:rkey')
    Left = 40
    Top = 72
  end
end
