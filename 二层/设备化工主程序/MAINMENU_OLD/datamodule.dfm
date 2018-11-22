object DM: TDM
  OldCreateOrder = False
  Left = 231
  Top = 212
  Height = 479
  Width = 696
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 7
  end
  object Database1: TDatabase
    AliasName = 'KMERP_KEY'
    DatabaseName = 'KMERPKEY'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME='
      'ODBC DSN=KMERP_KEY'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=')
    ReadOnly = True
    SessionName = 'Default'
    Left = 56
    Top = 82
  end
  object ADOData0073: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'EP000;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 2
        Value = 'aa'
      end>
    Left = 136
    Top = 8
    object ADOData0073rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOData0073USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADOData0073USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOData0073USER_ID: TStringField
      FieldName = 'USER_ID'
      Size = 10
    end
    object ADOData0073USER_PASSWORD: TStringField
      FieldName = 'USER_PASSWORD'
      FixedChar = True
      Size = 32
    end
    object ADOData0073EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOData0073NETWORK_ID: TStringField
      FieldName = 'NETWORK_ID'
      Size = 50
    end
    object ADOData0073COMPUTER: TStringField
      FieldName = 'COMPUTER'
      FixedChar = True
      Size = 30
    end
    object ADOData0073LOGIN_IN_TIME: TDateTimeField
      FieldName = 'LOGIN_IN_TIME'
    end
  end
  object ADO0419a: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 288
    Top = 8
  end
  object ADO0419b: TADOStoredProc
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'EP000;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 352
    Top = 8
  end
  object ADO0419c: TADOStoredProc
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'EP000;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 416
    Top = 8
  end
  object ADO0508: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;6'
    Parameters = <>
    Left = 216
    Top = 74
  end
  object ADO0419e: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 296
    Top = 74
  end
  object ADO0014: TADOStoredProc
    Connection = ADOConnection1
    Filtered = True
    ProcedureName = 'EP000;8'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 368
    Top = 74
  end
  object ADODate: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;9'
    Parameters = <>
    Left = 56
    Top = 130
  end
  object ADOUsers: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;10'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 136
    Top = 130
  end
  object ADO0073: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'EP000;11'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 216
    Top = 8
  end
  object ADOUserList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'EP000;12'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 296
    Top = 130
  end
  object ADOUser: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 130
  end
  object ADO0014A: TADOStoredProc
    Connection = ADOConnection1
    Filtered = True
    ProcedureName = 'EP000;13'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 440
    Top = 74
  end
  object ADO0074: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vptr1'
        Size = -1
        Value = Null
      end
      item
        Name = 'vptr2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0074'
      'where user_ptr=:vptr1'
      'and function_id=:vptr2')
    Left = 136
    Top = 82
  end
  object ADOData0074: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vptr1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0074'
      'where user_ptr=:vptr1'
      'and favoriate>0')
    Left = 440
    Top = 130
  end
end
