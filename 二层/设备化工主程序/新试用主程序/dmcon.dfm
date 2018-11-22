object dm: Tdm
  OldCreateOrder = False
  Left = 283
  Top = 243
  Height = 289
  Width = 399
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object adsMenuList: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 32
    Top = 64
  end
  object adsTmp: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 112
    Top = 64
  end
  object ADODate: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP000;9'
    Parameters = <>
    Left = 32
    Top = 130
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
    Left = 112
    Top = 16
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
    Left = 184
    Top = 16
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
    Left = 112
    Top = 130
  end
  object qry419: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select rKey,tType,Exe_Flag,Description,Programe,VerNo from data0' +
        '419 where TType>2')
    Left = 192
    Top = 128
  end
  object qryTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 256
    Top = 128
  end
end
