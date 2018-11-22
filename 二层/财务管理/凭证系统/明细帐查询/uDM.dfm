object DM: TDM
  OldCreateOrder = False
  Left = 260
  Top = 261
  Height = 264
  Width = 361
  object Cnn: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 15
  end
  object DS0508: TADODataSet
    Connection = Cnn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0508'
    EnableBCD = False
    Parameters = <>
    Left = 251
    Top = 88
  end
  object Qry0103: TADOQuery
    Connection = Cnn
    CursorType = ctStatic
    LockType = ltReadOnly
    EnableBCD = False
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
        Name = 'acc_number1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'acc_number2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    Prepared = True
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
      'and data0103.gl_acc_number >= :acc_number1'
      'and data0103.gl_acc_number <= :acc_number2'
      'and Data0103.HAS_CHILD = 0'
      'order by data0103.gl_acc_number')
    Left = 109
    Top = 144
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
  object DS526: TADODataSet
    Connection = Cnn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = DS526CalcFields
    CommandText = 
      'select * , VOUCHER '#39#20973#35777#21495#39',TDATE '#39#26085#26399#39',DESCRIPTION '#39#25688#35201#39',DEBIT '#39#26412#24065'_'#20511 +
      #26041#39','#13#10'CREDIT '#39#26412#24065'_'#36151#26041#39', DB_CR '#39#20511#36151#39', BALANCE '#39#26399#26411#20313#39069'_'#26412#24065#39', CURR_CODE '#39#36135 +
      #24065#39', EXCH_RATE '#39#27719#29575#39',remark '#39#24448#26469#23545#26041#39','#13#10'orig_amount '#39#26399#26411#20313#39069'_'#21407#24065#39', orig_a' +
      'mountD '#39#21407#24065'_'#20511#26041#39', '#13#10'orig_amountC '#39#21407#24065'_'#36151#26041#39', GL_ACC_NUMBER '#39#31185#30446#20195#30721#39',GL_' +
      'DESCRIPTION '#39#31185#30446#21517#31216#39#13#10'from data0526 where rkey is null'
    EnableBCD = False
    Parameters = <>
    Left = 115
    Top = 88
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
      DisplayLabel = #26412#24065'|'#20511#26041
      FieldName = 'DEBIT'
      Precision = 19
    end
    object DS526CREDIT: TBCDField
      DisplayLabel = #26412#24065'|'#36151#26041
      FieldName = 'CREDIT'
      Precision = 19
    end
    object DS526DB_CR: TStringField
      FieldName = 'DB_CR'
      FixedChar = True
      Size = 1
    end
    object DS526BALANCE: TBCDField
      FieldName = 'BALANCE'
      DisplayFormat = #26399#26411#20313#39069'|'#26412#24065
      Precision = 19
    end
    object DS526CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 50
    end
    object DS526EXCH_RATE: TFloatField
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
      FieldName = 'orig_amount'
      DisplayFormat = #26399#26411#20313#39069'|'#21407#24065
      Precision = 19
    end
    object DS526orig_amountD: TBCDField
      DisplayLabel = #21407#24065'|'#20511#26041
      FieldName = 'orig_amountD'
      Precision = 19
    end
    object DS526orig_amountC: TBCDField
      DisplayLabel = #21407#24065'|'#36151#26041
      FieldName = 'orig_amountC'
      Precision = 19
    end
    object DS526orig_amountS: TBCDField
      FieldName = 'orig_amountS'
      Precision = 19
    end
    object DS526DBCR: TStringField
      FieldKind = fkCalculated
      FieldName = 'DBCR'
      Size = 2
      Calculated = True
    end
    object DS526DSDesigner: TStringField
      FieldName = #20973#35777#21495
      Size = 12
    end
    object DS526DSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object DS526DSDesigner3: TStringField
      FieldName = #25688#35201
      Size = 100
    end
    object DS526_: TBCDField
      FieldName = #26412#24065'_'#20511#26041
      Precision = 19
    end
    object DS526_2: TBCDField
      FieldName = #26412#24065'_'#36151#26041
      Precision = 19
    end
    object DS526DSDesigner4: TStringField
      FieldName = #20511#36151
      FixedChar = True
      Size = 1
    end
    object DS526_3: TBCDField
      FieldName = #26399#26411#20313#39069'_'#26412#24065
      Precision = 19
    end
    object DS526DSDesigner5: TStringField
      FieldName = #36135#24065
      Size = 50
    end
    object DS526DSDesigner6: TFloatField
      FieldName = #27719#29575
    end
    object DS526DSDesigner7: TStringField
      FieldName = #24448#26469#23545#26041
      Size = 500
    end
    object DS526_4: TBCDField
      FieldName = #26399#26411#20313#39069'_'#21407#24065
      Precision = 19
    end
    object DS526_5: TBCDField
      FieldName = #21407#24065'_'#20511#26041
      Precision = 19
    end
    object DS526_6: TBCDField
      FieldName = #21407#24065'_'#36151#26041
      Precision = 19
    end
    object DS526DSDesigner8: TStringField
      FieldName = #31185#30446#20195#30721
      Size = 18
    end
    object DS526DSDesigner9: TStringField
      FieldName = #31185#30446#21517#31216
      Size = 50
    end
  end
  object ADOQ: TADOQuery
    Connection = Cnn
    EnableBCD = False
    Parameters = <>
    Left = 296
    Top = 88
  end
  object Qry105_106: TADOQuery
    Connection = Cnn
    LockType = ltReadOnly
    EnableBCD = False
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
      
        '      dbo.Data0106.D_C,dbo.Data0001.CURR_CODE, dbo.Data0106.AMOU' +
        'NT,'
      '      case when Data0106.EXCH_RATE>0 then'
      '      ROUND(1 / dbo.Data0106.EXCH_RATE, 8)'
      '      else 0 end AS exch_rate,'
      '      Isnull(dbo.Data0106.PRICE,0) AS orig_amount,'
      '      dbo.Data0005.EMPLOYEE_NAME,dbo.Data0106.DESCRIPTION'
      'FROM dbo.Data0105 INNER JOIN'
      '      dbo.Data0106 ON'
      '      dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'
      '      dbo.Data0103 ON'
      '      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'WHERE (Data0105.VOUCHER = :vVoucher)')
    Left = 256
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = DS526
    Left = 48
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = Qry0103
    Left = 48
    Top = 147
  end
  object Qry0106: TADOQuery
    Connection = Cnn
    LockType = ltReadOnly
    EnableBCD = False
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT Data0106.GL_ACCT_NO_PTR,Data0105.VOUCHER, Data0105.ENTERE' +
        'D_DT AS tdate,'
      
        '      Data0106.DESCRIPTION,Data0106.D_C, Data0106.AMOUNT, Data01' +
        '05.PERIOD,'
      '      Data0105.STATUS,Data0001.CURR_CODE,'
      '     case when Data0106.EXCH_RATE > 0 then'
      '     round(1 / Data0106.EXCH_RATE,8) else 0 end  AS EXCH_RATE,'
      '     Isnull(Data0106.PRICE,0) as orig_amount,'
      'case when (data0010.cust_code is not null) then'
      '     '#39#23458#65306#39'+data0010.cust_code+data0010.abbr_name'
      '     when data0023.code is not null then'
      '     '#39#20379#65306#39'+data0023.code+data0023.abbr_name'
      
        '    else '#39#39'  end as remark,Data0103.GL_ACC_NUMBER,Data0103.GL_DE' +
        'SCRIPTION,[dbo].[GetAcctQryDesc](data0105.rkey ,data0106.rkey) a' +
        's AcctDesc '
      'FROM Data0001 INNER JOIN'
      '      Data0105 INNER JOIN'
      '      Data0106 ON Data0105.RKEY = Data0106.GL_HEADER_PTR ON'
      
        '      Data0001.RKEY = Data0106.CURR_PTR INNER JOIN Data0103 ON D' +
        'ata0106.GL_ACCT_NO_PTR=Data0103.RKEY LEFT OUTER JOIN'
      
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
    Left = 173
    Top = 144
  end
  object qrytemp: TADOQuery
    Connection = Cnn
    Parameters = <>
    Left = 56
    Top = 16
  end
end
