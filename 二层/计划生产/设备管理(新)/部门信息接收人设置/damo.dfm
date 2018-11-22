object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 160
  Height = 217
  Width = 215
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADS834: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS834AfterScroll
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,'#13#10'data00' +
      '34.DEPT_NAME,data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,'#13#10'data08' +
      '34.User_ptr, data0834.DeptCode, data0834.Phone, data0834.warehou' +
      'se_ptr'#13#10'from data0834'#13#10'join data0073 on data0834.User_ptr=data00' +
      '73.rkey'#13#10'join data0034 on data0834.DeptCode=data0034.Dept_Code'#13#10 +
      'join data0015 on data0834.warehouse_ptr=data0015.rkey'#13#10'where 1=1'
    IndexFieldNames = 'USER_LOGIN_NAME'
    Parameters = <>
    Left = 128
    Top = 64
    object ADS834USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADS834USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS834DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS834WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS834ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS834User_ptr: TIntegerField
      FieldName = 'User_ptr'
    end
    object ADS834DeptCode: TStringField
      FieldName = 'DeptCode'
      Size = 10
    end
    object ADS834Phone: TStringField
      FieldName = 'Phone'
      Size = 14
    end
    object ADS834warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS834
    Left = 40
    Top = 72
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 128
  end
end
