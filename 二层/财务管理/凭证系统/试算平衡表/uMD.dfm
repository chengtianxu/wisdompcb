object DM: TDM
  OldCreateOrder = False
  Left = 490
  Top = 175
  Height = 520
  Width = 525
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 16
  end
  object Qry103: TADOQuery
    Connection = Conn
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vlen'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vyear'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vcode1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'vcode2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0103.RKEY, dbo.Data0103.GL_ACC_NUMBER,data0103.cu' +
        'rr_tp,'
      
        '      dbo.Data0103.GL_DESCRIPTION, dbo.Data0103.HAS_CHILD, dbo.D' +
        'ata0103.DB_CR,'
      '      dbo.Data0103.ACC_TP, data0103.TTYPE,Data0110.TYR_OPEN,'
      '      Data0110.TYR_PERIOD_1_CLOSE, Data0110.TYR_PERIOD_2_CLOSE,'
      '      Data0110.TYR_PERIOD_3_CLOSE, Data0110.TYR_PERIOD_4_CLOSE,'
      '      Data0110.TYR_PERIOD_5_CLOSE, Data0110.TYR_PERIOD_6_CLOSE,'
      '      Data0110.TYR_PERIOD_7_CLOSE, Data0110.TYR_PERIOD_8_CLOSE,'
      '      Data0110.TYR_PERIOD_9_CLOSE, Data0110.TYR_PERIOD_10_CLOSE,'
      '      Data0110.TYR_PERIOD_11_CLOSE,Data0110.TYR_PERIOD_12_CLOSE,'
      '      Data0110.TYR_OPEN_ORIG,'
      
        '      Data0110.TYR_PERIOD_1_CLOSE_ORIG,Data0110.TYR_PERIOD_2_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_3_CLOSE_ORIG,Data0110.TYR_PERIOD_4_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_5_CLOSE_ORIG,Data0110.TYR_PERIOD_6_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_7_CLOSE_ORIG,Data0110.TYR_PERIOD_8_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_9_CLOSE_ORIG,Data0110.TYR_PERIOD_10_CL' +
        'OSE_ORIG,'
      
        '      Data0110.TYR_PERIOD_11_CLOSE_ORIG,Data0110.TYR_PERIOD_12_C' +
        'LOSE_ORIG,'
      '      data0001.curr_code'
      'FROM dbo.Data0110 INNER JOIN'
      
        '      dbo.Data0103 ON dbo.Data0110.GL_ACCT_PTR = dbo.Data0103.RK' +
        'EY LEFT OUTER JOIN'
      '      dbo.Data0001 ON dbo.Data0103.CURR_PTR = dbo.Data0001.RKEY'
      'where len(data0103.gl_acc_number)<=:vlen'
      'and data0110.fyear=:vyear'
      'and data0103.gl_acc_number>=:vcode1'
      'and data0103.gl_acc_number<=:vcode2'
      'order by data0103.gl_acc_number')
    Left = 184
    Top = 88
  end
  object Qry508: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'select * from data0508')
    Left = 184
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = DS103
    Left = 72
    Top = 88
  end
  object ADOQ: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 128
    Top = 16
  end
  object DS103: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = DS103CalcFields
    CommandText = 
      'SELECT GL_ACC_NUMBER, GL_DESCRIPTION, DB_CR, HAS_CHILD, TYR_OPEN' +
      ', '#13#10'      TYR_DEBIT, TYR_CREDIT, TYR_CLOSE, CURRENT_PERIOD_DEBIT' +
      ', '#13#10'      CURRENT_PERIOD_CREDIT, ACC_TP,TTYPE, SPEC_RKEY,'#13#10'TYR_O' +
      'PEN_ORIG, TYR_CLOSE_ORIG,'#13#10'TYR_DEBIT_ORIG, TYR_CREDIT_ORIG, '#13#10'CU' +
      'RRENT_PERIOD_DEBIT_ORIG, CURRENT_PERIOD_CREDIT_ORIG'#13#10'FROM dbo.Da' +
      'ta0103'#13#10'where rkey is null'
    Parameters = <>
    Left = 131
    Top = 88
    object DS103GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object DS103GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object DS103DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object DS103HAS_CHILD: TSmallintField
      FieldName = 'HAS_CHILD'
    end
    object DS103TYR_OPEN: TBCDField
      DisplayLabel = #26399#21021#26412#24065'|'#20511#26041
      FieldName = 'TYR_OPEN'
      Precision = 19
    end
    object DS103TYR_DEBIT: TBCDField
      DisplayLabel = #26399#26411#26412#24065'|'#20511#26041
      FieldName = 'TYR_DEBIT'
      Precision = 19
    end
    object DS103TYR_CREDIT: TBCDField
      DisplayLabel = #26399#26410#26412#24065'|'#36151#26041
      FieldName = 'TYR_CREDIT'
      Precision = 19
    end
    object DS103TYR_CLOSE: TBCDField
      DisplayLabel = #26399#21021#26412#24065'|'#36151#26041
      FieldName = 'TYR_CLOSE'
      Precision = 19
    end
    object DS103CURRENT_PERIOD_DEBIT: TBCDField
      DisplayLabel = #26412#26399#26412#24065'|'#20511#26041
      FieldName = 'CURRENT_PERIOD_DEBIT'
      Precision = 19
    end
    object DS103CURRENT_PERIOD_CREDIT: TBCDField
      DisplayLabel = #26412#26399#26412#24065'|'#36151#26041
      FieldName = 'CURRENT_PERIOD_CREDIT'
      Precision = 19
    end
    object DS103ACC_TP: TIntegerField
      FieldName = 'ACC_TP'
    end
    object DS103DBCR: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldKind = fkCalculated
      FieldName = 'DBCR'
      Size = 2
      Calculated = True
    end
    object DS103TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object DS103TYR_OPEN_ORIG: TBCDField
      DisplayLabel = #26399#21021#21407#24065'|'#20511#26041
      FieldName = 'TYR_OPEN_ORIG'
      Precision = 19
    end
    object DS103TYR_CLOSE_ORIG: TBCDField
      DisplayLabel = #26399#21021#21407#24065'|'#36151#26041
      FieldName = 'TYR_CLOSE_ORIG'
      Precision = 19
    end
    object DS103TYR_DEBIT_ORIG: TBCDField
      DisplayLabel = #26399#26411#21407#24065'|'#20511#26041
      FieldName = 'TYR_DEBIT_ORIG'
      Precision = 19
    end
    object DS103TYR_CREDIT_ORIG: TBCDField
      DisplayLabel = #26399#26411#21407#24065'|'#36151#26041
      FieldName = 'TYR_CREDIT_ORIG'
      Precision = 19
    end
    object DS103CURRENT_PERIOD_DEBIT_ORIG: TBCDField
      DisplayLabel = #26412#26399#21407#24065'|'#20511#26041
      FieldName = 'CURRENT_PERIOD_DEBIT_ORIG'
      Precision = 19
    end
    object DS103CURRENT_PERIOD_CREDIT_ORIG: TBCDField
      DisplayLabel = #26412#26399#21407#24065'|'#36151#26041
      FieldName = 'CURRENT_PERIOD_CREDIT_ORIG'
      Precision = 19
    end
    object DS103SPEC_RKEY: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 10
    end
  end
  object DS526: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = DS526CalcFields
    CommandText = 'select * from data0526 where rkey is null'
    Parameters = <>
    Left = 131
    Top = 168
    object DS526RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS526VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object DS526TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object DS526DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object DS526DEBIT: TBCDField
      FieldName = 'DEBIT'
      DisplayFormat = #26412#24065'|'#20511#26041
      Precision = 19
    end
    object DS526CREDIT: TBCDField
      FieldName = 'CREDIT'
      DisplayFormat = #26412#24065'|'#36151#26041
      Precision = 19
    end
    object DS526DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object DS526BALANCE: TBCDField
      DisplayLabel = #26399#26411#20313#39069'|'#26412#24065
      FieldName = 'BALANCE'
      Precision = 19
    end
    object DS526CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 50
    end
    object DS526EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
    end
    object DS526D_QTY: TFloatField
      FieldName = 'D_QTY'
    end
    object DS526C_QTY: TFloatField
      FieldName = 'C_QTY'
    end
    object DS526PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object DS526AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object DS526CLOSE_QTY: TFloatField
      FieldName = 'CLOSE_QTY'
    end
    object DS526REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 10
    end
    object DS526gl_acct_ptr: TFloatField
      FieldName = 'gl_acct_ptr'
    end
    object DS526remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object DS526orig_amount: TBCDField
      DisplayLabel = #26399#26411#20313#39069'|'#21407#24065
      FieldName = 'orig_amount'
      Precision = 19
    end
    object DS526orig_amountD: TBCDField
      FieldName = 'orig_amountD'
      DisplayFormat = #21407#24065'|'#20511#26041
      Precision = 19
    end
    object DS526orig_amountC: TBCDField
      FieldName = 'orig_amountC'
      DisplayFormat = #21407#24065'|'#36151#26041
      Precision = 19
    end
    object DS526orig_amountS: TBCDField
      FieldName = 'orig_amountS'
      Precision = 19
    end
    object DS526DBCR: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldKind = fkCalculated
      FieldName = 'DBCR'
      Size = 2
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = DS526
    Left = 72
    Top = 168
  end
  object Qry105_106: TADOQuery
    Connection = Conn
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vVoucher'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0105.VOUCHER, dbo.Data0105.FYEAR, dbo.Data0105.PE' +
        'RIOD,'
      '      dbo.Data0105.ATTACHED, dbo.Data0105.ENTERED_DT, '
      '      dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTION, '
      '      dbo.Data0106.D_C,'
      '      case when Data0106.EXCH_RATE>0 then'
      
        '      ROUND(1 / dbo.Data0106.EXCH_RATE, 4) else 0 end AS exch_ra' +
        'te,'
      '      dbo.Data0001.CURR_CODE, dbo.Data0106.AMOUNT,'
      '      Isnull(dbo.Data0106.PRICE,0) AS orig_amount,'
      '      dbo.Data0005.EMPLOYEE_NAME,dbo.Data0106.DESCRIPTION'
      'FROM dbo.Data0105 INNER JOIN'
      '      dbo.Data0106 ON '
      '      dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'
      '      dbo.Data0103 ON '
      '      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'WHERE (Data0105.VOUCHER = :vVoucher)')
    Left = 344
    Top = 168
  end
  object Qry0103: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vyear'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'acc_number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0103.rkey,data0103.gl_acc_number,data0103.gl_descript' +
        'ion,'
      '      data0103.db_cr,Data0110.TYR_OPEN, '
      '      Data0110.TYR_PERIOD_1_CLOSE, Data0110.TYR_PERIOD_2_CLOSE, '
      '      Data0110.TYR_PERIOD_3_CLOSE, Data0110.TYR_PERIOD_4_CLOSE,'
      '      Data0110.TYR_PERIOD_5_CLOSE, Data0110.TYR_PERIOD_6_CLOSE,'
      '      Data0110.TYR_PERIOD_7_CLOSE, Data0110.TYR_PERIOD_8_CLOSE,'
      '      Data0110.TYR_PERIOD_9_CLOSE, Data0110.TYR_PERIOD_10_CLOSE,'
      '      Data0110.TYR_PERIOD_11_CLOSE,Data0110.TYR_PERIOD_12_CLOSE,'
      '      Data0110.TYR_OPEN_ORIG,'
      
        '      Data0110.TYR_PERIOD_1_CLOSE_ORIG,Data0110.TYR_PERIOD_2_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_3_CLOSE_ORIG,Data0110.TYR_PERIOD_4_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_5_CLOSE_ORIG,Data0110.TYR_PERIOD_6_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_7_CLOSE_ORIG,Data0110.TYR_PERIOD_8_CLO' +
        'SE_ORIG,'
      
        '      Data0110.TYR_PERIOD_9_CLOSE_ORIG,Data0110.TYR_PERIOD_10_CL' +
        'OSE_ORIG,'
      
        '      Data0110.TYR_PERIOD_11_CLOSE_ORIG,Data0110.TYR_PERIOD_12_C' +
        'LOSE_ORIG'
      'FROM dbo.Data0110 INNER JOIN'
      
        '      dbo.Data0103 ON dbo.Data0110.GL_ACCT_PTR = dbo.Data0103.RK' +
        'EY'
      'where data0110.fyear=:vyear'
      'and data0103.gl_acc_number=:acc_number'
      'order by data0103.gl_acc_number')
    Left = 188
    Top = 168
    object Qry0103rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Qry0103gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      Size = 18
    end
    object Qry0103gl_description: TStringField
      FieldName = 'gl_description'
      Size = 50
    end
    object Qry0103db_cr: TStringField
      FieldName = 'db_cr'
      FixedChar = True
      Size = 1
    end
    object Qry0103TYR_OPEN: TBCDField
      FieldName = 'TYR_OPEN'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_1_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_1_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_2_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_2_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_3_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_3_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_4_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_4_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_5_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_5_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_6_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_6_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_7_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_7_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_8_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_8_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_9_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_9_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_10_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_10_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_11_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_11_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_12_CLOSE: TBCDField
      FieldName = 'TYR_PERIOD_12_CLOSE'
      Precision = 19
    end
    object Qry0103TYR_OPEN_ORIG: TBCDField
      FieldName = 'TYR_OPEN_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_1_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_1_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_2_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_2_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_3_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_3_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_4_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_4_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_5_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_5_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_6_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_6_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_7_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_7_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_8_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_8_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_9_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_9_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_10_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_10_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_11_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_11_CLOSE_ORIG'
      Precision = 19
    end
    object Qry0103TYR_PERIOD_12_CLOSE_ORIG: TBCDField
      FieldName = 'TYR_PERIOD_12_CLOSE_ORIG'
      Precision = 19
    end
  end
  object Qry0106: TADOQuery
    Connection = Conn
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vyear'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vptr1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0106.GL_ACCT_NO_PTR,Data0105.VOUCHER, Data0105.ENTERE' +
        'D_DT AS tdate,'
      
        '      Data0106.DESCRIPTION,Data0106.D_C, Data0106.AMOUNT, Data01' +
        '05.PERIOD,'
      '      Data0105.STATUS,Data0001.CURR_CODE,'
      '      case when Data0106.EXCH_RATE>0 then'
      '     round(1 / Data0106.EXCH_RATE,4) else 0 end AS EXCH_RATE,'
      '     Isnull(Data0106.PRICE,0) as orig_amount,'
      'case when (data0010.cust_code is not null) then'
      '     '#39#23458#65306#39'+data0010.cust_code+data0010.abbr_name'
      '     when data0023.code is not null then'
      '     '#39#20379#65306#39'+data0023.code+data0023.abbr_name'
      '    else '#39#39'  end as remark'
      'FROM Data0001 INNER JOIN'
      '      Data0105 INNER JOIN'
      '      Data0106 ON Data0105.RKEY = Data0106.GL_HEADER_PTR ON'
      '      Data0001.RKEY = Data0106.CURR_PTR LEFT OUTER JOIN'
      
        '      Data0010 ON Data0105.CUSTOMER_PTR = Data0010.RKEY LEFT OUT' +
        'ER JOIN'
      '      Data0023 ON Data0105.SUPP_PTR = Data0023.RKEY'
      ' where  data0106.gl_acct_no_ptr=:rkey'
      '    and data0105.fyear=:vyear'
      '    and data0105.period=:vptr1'
      '    and Data0105.STATUS <> 5'
      ''
      
        'order by Data0105.ENTERED_DT, LEFT(Data0105.VOUCHER, 1) DESC,RIG' +
        'HT(Data0105.VOUCHER, 9)')
    Left = 256
    Top = 170
  end
end
