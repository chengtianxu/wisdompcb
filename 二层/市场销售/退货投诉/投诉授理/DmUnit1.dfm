object DM: TDM
  OldCreateOrder = False
  Left = 458
  Top = 132
  Height = 457
  Width = 503
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object TemADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 224
  end
  object ADOSSeepValueData0004: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SeepValueData0004'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@RKEY0004'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 55
      end
      item
        Name = '@ttype'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ttype2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@tablwname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 256
        Value = 'data0492'
      end
      item
        Name = '@FieldNamw'
        Attributes = [paNullable]
        DataType = ftString
        Size = 256
        Value = 'CUT_NO'
      end>
    Left = 280
    Top = 24
    object ADOSSeepValueData0004SeedValue: TStringField
      FieldName = 'SeedValue'
      ReadOnly = True
    end
  end
  object TemADOQuery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 160
  end
  object ADOQ34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,DEPT_CODE,DEPT_NAME'
      'from data0034')
    Left = 264
    Top = 112
    object ADOQ34RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQ34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object ADOQ0118: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey0101'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from data0118 '
      'where SOURCE_PTR = :rkey0101')
    Left = 280
    Top = 296
    object ADOQ0118RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0118SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADOQ0118defect_ptr: TIntegerField
      FieldName = 'defect_ptr'
    end
    object ADOQ0118RESP_DEPT_PTR: TIntegerField
      FieldName = 'RESP_DEPT_PTR'
    end
    object ADOQ0118MyREJ_CODE: TStringField
      DisplayLabel = #25237#35785#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyREJ_CODE'
      LookupDataSet = ADOQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJ_CODE'
      KeyFields = 'defect_ptr'
      Lookup = True
    end
    object ADOQ0118MyREJECT_DESCRIPTION: TStringField
      DisplayLabel = #25237#35785#25551#36848
      FieldKind = fkLookup
      FieldName = 'MyREJECT_DESCRIPTION'
      LookupDataSet = ADOQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJECT_DESCRIPTION'
      KeyFields = 'defect_ptr'
      Lookup = True
    end
    object ADOQ0118MyDEPT_CODE: TStringField
      DisplayLabel = #36131#20219#37096#38376#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyDEPT_CODE'
      LookupDataSet = ADOQ34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'RESP_DEPT_PTR'
      Lookup = True
    end
    object ADOQ0118MyDEPT_NAME: TStringField
      DisplayLabel = #36131#20219#37096#38376#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyDEPT_NAME'
      LookupDataSet = ADOQ34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'RESP_DEPT_PTR'
      Lookup = True
    end
    object ADOQ0118FLAG: TBooleanField
      DisplayLabel = #20998#26512
      FieldName = 'FLAG'
    end
    object ADOQ0118Qty: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'Qty'
    end
  end
  object ADOQ39: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,REJ_CODE,REJECT_DESCRIPTION'
      'from data0039')
    Left = 336
    Top = 112
    object ADOQ39RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ39REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object ADOQ39REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
  object ADO148: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey0101'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,rec_no, SOURCE_PTR, file_name, in_date, remark'
      ' from Data0148'
      'where SOURCE_PTR=:rkey0101'
      'order by rec_no')
    Left = 128
    Top = 304
    object ADO148rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADO148rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADO148SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO148file_name: TStringField
      FieldName = 'file_name'
      Size = 50
    end
    object ADO148in_date: TDateTimeField
      FieldName = 'in_date'
    end
    object ADO148remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADOQ0101: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'rkey0101'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'from data0101'
      'where rkey = :rkey0101')
    Left = 304
    Top = 216
    object ADOQ0101RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0101LOG_NUMBER: TStringField
      FieldName = 'LOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQ0101CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
    object ADOQ0101CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADOQ0101CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQ0101LOG_DATE: TDateTimeField
      FieldName = 'LOG_DATE'
    end
    object ADOQ0101SHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object ADOQ0101QTY: TFloatField
      FieldName = 'QTY'
    end
    object ADOQ0101EFFECT_TP: TStringField
      FieldName = 'EFFECT_TP'
      FixedChar = True
      Size = 4
    end
    object ADOQ0101ANALYSIS: TStringField
      FieldName = 'ANALYSIS'
      Size = 600
    end
    object ADOQ0101AFTER_ACTION: TStringField
      FieldName = 'AFTER_ACTION'
      Size = 600
    end
    object ADOQ0101STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADOQ0101CLOSED_BY_PTR: TIntegerField
      FieldName = 'CLOSED_BY_PTR'
    end
    object ADOQ0101CLOSED_DATE: TDateTimeField
      FieldName = 'CLOSED_DATE'
    end
    object ADOQ0101DEALT_BY_PTR: TIntegerField
      FieldName = 'DEALT_BY_PTR'
    end
    object ADOQ0101DEALT_DATE: TDateTimeField
      FieldName = 'DEALT_DATE'
    end
    object ADOQ0101LOSS_AMT: TIntegerField
      FieldName = 'LOSS_AMT'
    end
    object ADOQ0101RESULT: TStringField
      FieldName = 'RESULT'
      Size = 600
    end
    object ADOQ0101CONTENT: TStringField
      FieldName = 'CONTENT'
      Size = 600
    end
    object ADOQ0101DEFECT_MAIN: TWideStringField
      FieldName = 'DEFECT_MAIN'
      Size = 50
    end
    object ADOQ0101CYCLES: TWideStringField
      FieldName = 'CYCLES'
      Size = 50
    end
    object ADOQ0101UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
  end
  object ADOQALL2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end>
    SQL.Strings = (
      
        'SELECT Data0101.*, Data0010.CUST_CODE, Data0010.CUSTOMER_NAME, c' +
        'ase data0101.if_send when 0 then  '#39#26410#21457#36865#39'  when 1 then '#39#24050#21457#36865#39' end  ' +
        'as Ssend,'
      
        '      Data0005.EMPLOYEE_NAME AS Close_EMPLOYEE_NAME, Data0025.MA' +
        'NU_PART_NUMBER, '
      '      Data0025.MANU_PART_DESC, '
      '      Data0005_1.EMPLOYEE_NAME AS Dealt_EMPLOYEE_NAME, '
      '      Data0005_2.EMPLOYEE_NAME AS Ent_EMPLOYEE_NAME,'
      '      Data0002.Unit_Name,derivedtb.dept_names '
      'FROM Data0101 INNER JOIN'
      
        '      Data0010 ON Data0101.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      '      Data0025 ON '
      '      Data0101.CUSTOMER_PART_PTR = Data0025.RKEY LEFT OUTER JOIN'
      '      Data0002 ON'
      '      Data0101.unit_ptr=Data0002.rkey  LEFT OUTER JOIN'
      '      Data0005 Data0005_2 ON '
      '      Data0101.CSI_USER_PTR = Data0005_2.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON '
      '      Data0101.DEALT_BY_PTR = Data0005_1.RKEY LEFT OUTER JOIN'
      
        '      Data0005 ON Data0101.CLOSED_BY_PTR = Data0005.RKEY LEFT OU' +
        'TER JOIN'
      '      (select SOURCE_PTR,[dept_names]=STUFF'
      '                      ((SELECT '#39','#39' + convert(varchar,dept_name)'
      '                      FROM  dbo.Data0034  INNER JOIN'
      
        '                      Data0118 ON Data0118.resp_dept_ptr=Data003' +
        '4.rkey  '
      
        '                      where  SOURCE_PTR=tb.source_ptr FOR XML PA' +
        'TH('#39#39')), 1, 1, '#39#39')'
      'from data0118 as tb'
      
        'GROUP BY source_PTR) AS derivedtb on data0101.rkey=derivedtb.sou' +
        'rce_ptr   '
      'where (data0101.log_date >= :vdate1)'
      '      and (data0101.log_date <= :vdate2)'
      '     and (Ctype=0 or ctype is null)')
    Left = 48
    Top = 88
    object ADOQALL2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQALL2LOG_NUMBER: TStringField
      DisplayLabel = #25237#35785#32534#21495
      FieldName = 'LOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQALL2CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
    object ADOQALL2CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADOQALL2CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQALL2LOG_DATE: TDateTimeField
      DisplayLabel = #24314#26723#26085#26399
      FieldName = 'LOG_DATE'
    end
    object ADOQALL2SHIP_DATE: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'SHIP_DATE'
    end
    object ADOQALL2QTY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QTY'
    end
    object ADOQALL2EFFECT_TP: TStringField
      FieldName = 'EFFECT_TP'
      FixedChar = True
      Size = 4
    end
    object ADOQALL2ANALYSIS: TStringField
      DisplayLabel = #21407#22240#20998#26512
      FieldName = 'ANALYSIS'
      Size = 600
    end
    object ADOQALL2AFTER_ACTION: TStringField
      DisplayLabel = #25913#21892#34892#21160
      FieldName = 'AFTER_ACTION'
      Size = 600
    end
    object ADOQALL2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADOQALL2CLOSED_BY_PTR: TIntegerField
      FieldName = 'CLOSED_BY_PTR'
    end
    object ADOQALL2CLOSED_DATE: TDateTimeField
      DisplayLabel = #32467#26696#26085#26399
      FieldName = 'CLOSED_DATE'
    end
    object ADOQALL2DEALT_BY_PTR: TIntegerField
      FieldName = 'DEALT_BY_PTR'
    end
    object ADOQALL2DEALT_DATE: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399
      FieldName = 'DEALT_DATE'
    end
    object ADOQALL2LOSS_AMT: TIntegerField
      DisplayLabel = #32463#27982#25439#22833#20272#35745
      FieldName = 'LOSS_AMT'
    end
    object ADOQALL2RESULT: TStringField
      DisplayLabel = #25237#35785#32467#26696#20449#24687
      FieldName = 'RESULT'
      Size = 600
    end
    object ADOQALL2CONTENT: TStringField
      DisplayLabel = #25237#35785#20869#23481#25551#36848
      FieldName = 'CONTENT'
      Size = 600
    end
    object ADOQALL2CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQALL2CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQALL2MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQALL2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQALL2Mystatus: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'Mystatus'
      Size = 10
      Calculated = True
    end
    object ADOQALL2Close_EMPLOYEE_NAME: TStringField
      DisplayLabel = #32467#26696#20154
      FieldName = 'Close_EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2Dealt_EMPLOYEE_NAME: TStringField
      DisplayLabel = #21463#29702#20154
      FieldName = 'Dealt_EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2Ent_EMPLOYEE_NAME: TStringField
      DisplayLabel = #24314#26723#20154
      FieldName = 'Ent_EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2DEFECT_MAIN: TWideStringField
      FieldName = 'DEFECT_MAIN'
      Size = 50
    end
    object ADOQALL2CYCLES: TWideStringField
      FieldName = 'CYCLES'
      Size = 50
    end
    object ADOQALL2UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADOQALL2Unit_Name: TStringField
      FieldName = 'Unit_Name'
    end
    object ADOQALL2dept_names: TMemoField
      FieldName = 'dept_names'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ADOQALL2if_send: TBooleanField
      FieldName = 'if_send'
    end
    object ADOQALL2Ssend: TStringField
      FieldName = 'Ssend'
      ReadOnly = True
      Size = 6
    end
  end
end
