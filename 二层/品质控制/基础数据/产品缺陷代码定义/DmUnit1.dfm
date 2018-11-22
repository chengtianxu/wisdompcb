object DM: TDM
  OldCreateOrder = False
  Left = 423
  Top = 178
  Height = 457
  Width = 503
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOQALL2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,dbo.QC_GroupNameOfBug.' +
        'FQCBugSName, '
      
        'case REJECT_DEFECT_FLAG when '#39'R'#39' then '#39#25253#24223#39' else '#39#19981#33391'/'#25237#35785#39' end  as ' +
        'REJECT_DEFECT_FLAG , '
      'case rej_type when 0 then '#39#24037#21378#25253#24223#39
      '              when 1 then '#39#20379#24212#21830#25253#24223#39
      '              when 2 then '#39#23458#25143#25253#24223#39
      '              when 3 then '#39#24066#22330#25253#24223#39
      '              when 4 then '#39#20854#23427#39
      'end as Myrej_type'
      'FROM Data0039 left join '
      
        'dbo.QC_GroupNameOfBug on data0039.FQCBugsCode= dbo.QC_GroupNameO' +
        'fBug.FQCBugsCode'
      'where (1=1)')
    Left = 40
    Top = 88
    object ADOQALL2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQALL2REJ_CODE: TStringField
      DisplayLabel = #32570#38519#20195#30721
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQALL2REJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQALL2REJECT_DEFECT_FLAG: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'REJECT_DEFECT_FLAG'
    end
    object ADOQALL2Myrej_type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'Myrej_type'
      ReadOnly = True
      Size = 10
    end
    object ADOQALL2FQCBugSName: TStringField
      FieldName = 'FQCBugSName'
      Size = 30
    end
  end
  object TemADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 184
  end
  object AD39: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY39'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM DATA0039 WHERE RKEY = :RKEY39')
    Left = 264
    Top = 56
    object AD39RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AD39REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object AD39REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object AD39REJECT_DEFECT_FLAG: TStringField
      FieldName = 'REJECT_DEFECT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AD39rej_type: TWordField
      FieldName = 'rej_type'
    end
    object AD39FQCBugsCode: TWordField
      FieldName = 'FQCBugsCode'
    end
  end
  object AD40: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY39'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM DATA0040 WHERE REJECT_CODE_PTR = :RKEY39')
    Left = 264
    Top = 120
    object AD40RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AD40REJECT_CODE_PTR: TIntegerField
      FieldName = 'REJECT_CODE_PTR'
    end
    object AD40DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object AD40MyDEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyDEPT_CODE'
      LookupDataSet = AD34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Size = 10
      Lookup = True
    end
    object AD40MyDEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyDEPT_NAME'
      LookupDataSet = AD34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'DEPT_PTR'
      Size = 30
      Lookup = True
    end
  end
  object AD34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM DATA0034')
    Left = 264
    Top = 200
    object AD34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AD34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AD34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
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
    Left = 256
    Top = 272
    object ADOSSeepValueData0004SeedValue: TStringField
      FieldName = 'SeedValue'
      ReadOnly = True
    end
  end
end
