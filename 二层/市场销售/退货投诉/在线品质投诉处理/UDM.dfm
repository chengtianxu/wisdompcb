object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 666
  Top = 315
  Height = 416
  Width = 419
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 248
    Top = 104
  end
  object ADO148: TADOQuery
    Connection = con1
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
    Connection = con1
    CursorType = ctStatic
    Filtered = True
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
      'SELECT *'
      'from data0101'
      'where rkey = :rkey0101')
    Left = 280
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
    object ADOQ0101if_send: TBooleanField
      FieldName = 'if_send'
    end
    object ADOQ0101CType: TIntegerField
      FieldName = 'CType'
    end
  end
  object TemADOQuery1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 48
    Top = 224
  end
  object TemADOQuery: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 48
    Top = 160
  end
  object ADOSSeepValueData0004: TADOStoredProc
    Connection = con1
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
  object ADOQ39: TADOQuery
    Connection = con1
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
  object ADOQ34: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,DEPT_CODE,DEPT_NAME'
      'from data0034')
    Left = 320
    Top = 176
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
    Connection = con1
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
end
