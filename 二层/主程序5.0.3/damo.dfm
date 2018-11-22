object DM: TDM
  OldCreateOrder = False
  Left = 305
  Top = 197
  Height = 354
  Width = 327
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object adsMenuList: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 115
    Top = 24
  end
  object AQ_EXEC: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <
      item
        Name = 'RKEY73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Data0419.DESCRIPTION, Data0419.PROGRAME,data0074.USER_RIG' +
        'HTS,'
      '          Data0419.VerNo, Data0419.manu_ptr, Data0419.RKEY'
      '    FROM Data0419 INNER JOIN'
      '          Data0074 ON Data0419.RKEY = Data0074.FUNCTION_ID'
      '    WHERE Data0074.USER_PTR = :RKEY73'
      '    ORDER BY Data0419.manu_ptr,Data0419.SEQ_NO')
    Left = 244
    Top = 25
    object AQ_EXECDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object AQ_EXECPROGRAME: TStringField
      FieldName = 'PROGRAME'
      Size = 50
    end
    object AQ_EXECUSER_RIGHTS: TSmallintField
      FieldName = 'USER_RIGHTS'
    end
    object AQ_EXECVerNo: TStringField
      FieldName = 'VerNo'
      Size = 12
    end
    object AQ_EXECmanu_ptr: TIntegerField
      FieldName = 'manu_ptr'
    end
    object AQ_EXECRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object adsTmp: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 175
    Top = 24
  end
  object ADOData0073: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT RKEY, USER_LOGIN_NAME, USER_FULL_NAME, PASSWORD, '
      
        '      EMPLOYEE_PTR, NETWORK_ID, COMPUTER, LOGIN_IN_TIME,message_' +
        'flag,'
      'NETWORK_IP'
      'FROM Data0073'
      'where user_login_name=:login_id'
      'and active_flag=0 '
      'and user_group_flag=1')
    Left = 244
    Top = 76
    object ADOData0073RKEY: TAutoIncField
      FieldName = 'RKEY'
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
    object ADOData0073PASSWORD: TStringField
      FieldName = 'PASSWORD'
      FixedChar = True
      Size = 32
    end
    object ADOData0073EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOData0073NETWORK_ID: TStringField
      FieldName = 'NETWORK_ID'
      Size = 15
    end
    object ADOData0073COMPUTER: TStringField
      FieldName = 'COMPUTER'
      Size = 30
    end
    object ADOData0073LOGIN_IN_TIME: TDateTimeField
      FieldName = 'LOGIN_IN_TIME'
    end
    object ADOData0073message_flag: TBooleanField
      FieldName = 'message_flag'
    end
    object ADOData0073NETWORK_IP: TStringField
      FieldName = 'NETWORK_IP'
      Size = 15
    end
  end
  object ADS314: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0073.USER_FULL_NAME, dbo.Data0014.senddate, '#13#10'   ' +
      '   dbo.Data0014.MESSAGE, dbo.data0314.rkey, dbo.data0314.hread'#13#10 +
      'FROM dbo.Data0014 INNER JOIN'#13#10'      dbo.data0314 ON dbo.Data0014' +
      '.rkey = dbo.data0314.d14_ptr INNER JOIN'#13#10'      dbo.Data0073 ON d' +
      'bo.Data0014.whosend = dbo.Data0073.RKEY'#13#10'WHERE (dbo.data0314.hre' +
      'ad = '#39'F'#39') AND'#13#10'               (DATA0314.EMP_PTR=:RKEY)'#13#10'order by' +
      ' Data0014.senddate desc'
    DataSource = DataSource1
    MasterFields = 'RKEY'
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 245
    Top = 131
    object ADS314USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS314senddate: TDateTimeField
      FieldName = 'senddate'
    end
    object ADS314MESSAGE: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object ADS314rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS314hread: TStringField
      FieldName = 'hread'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOData0073
    Left = 173
    Top = 75
  end
  object DataSource2: TDataSource
    DataSet = ADS314
    Left = 176
    Top = 128
  end
  object ASPSYSUSERLIFE: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'sysuselife;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@active'
        Attributes = [paNullable]
        DataType = ftBoolean
        Direction = pdInputOutput
        Value = Null
      end>
    Left = 40
    Top = 80
  end
end
