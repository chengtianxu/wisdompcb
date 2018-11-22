object DM: TDM
  OldCreateOrder = False
  Left = 545
  Top = 298
  Height = 385
  Width = 383
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ads73
    Left = 48
    Top = 96
  end
  object ads73: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_' +
      'NAME, dbo.Data0073.NETWORK_IP, dbo.Data0073.USER_GROUP_FLAG, '#13#10' ' +
      '                     dbo.Data0073.ACTIVE_FLAG, dbo.Data0073.mess' +
      'age_flag, dbo.Data0005.EMPL_CODE, dbo.Data0073.hrpopm, dbo.Data0' +
      '005.EMPLOYEE_NAME, '#13#10'                      dbo.Data0073.PASSWORD' +
      ', dbo.Data0034.DEPT_NAME, dbo.Data0073.RKEY, dbo.Data0073.EMPLOY' +
      'EE_PTR, dbo.Data0073.GROUP_PTR, '#13#10'                      Data0073' +
      '_1.USER_FULL_NAME AS group_name, dbo.Data0073.validity_date, '#13#10' ' +
      '                     CASE Data0073.USER_GROUP_FLAG WHEN 0 THEN '#39 +
      #35282#33394#39' WHEN 1 THEN '#39#29992#25143#39' END AS ttype, '#13#10'                      CASE ' +
      'Data0073.ACTIVE_FLAG WHEN 0 THEN '#39#26377#25928#39' WHEN 1 THEN '#39#26080#25928#39' END AS st' +
      'atus, '#13#10'                      CASE Data0073.message_flag WHEN 0 ' +
      'THEN '#39#26080#39' WHEN 1 THEN '#39#26377#39' END AS short_info, dbo.Data0015.ABBR_NA' +
      'ME'#13#10'FROM         dbo.Data0015 RIGHT OUTER JOIN'#13#10'                ' +
      '      dbo.Data0073 ON dbo.Data0015.RKEY = dbo.Data0073.warehouse' +
      '_ptr LEFT OUTER JOIN'#13#10'                      dbo.Data0005 LEFT OU' +
      'TER JOIN'#13#10'                      dbo.Data0034 ON dbo.Data0005.EMP' +
      'LOYEE_ID = dbo.Data0034.RKEY ON dbo.Data0073.EMPLOYEE_PTR = dbo.' +
      'Data0005.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data007' +
      '3 AS Data0073_1 ON dbo.Data0073.GROUP_PTR = Data0073_1.RKEY'#13#10
    IndexFieldNames = 'USER_LOGIN_NAME'
    Parameters = <>
    Left = 104
    Top = 96
    object ads73USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads73USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads73USER_GROUP_FLAG: TSmallintField
      FieldName = 'USER_GROUP_FLAG'
    end
    object ads73ACTIVE_FLAG: TSmallintField
      FieldName = 'ACTIVE_FLAG'
    end
    object ads73message_flag: TBooleanField
      FieldName = 'message_flag'
    end
    object ads73EMPL_CODE: TStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ads73EMPLOYEE_NAME: TStringField
      DisplayLabel = #21592#24037#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads73PASSWORD: TStringField
      FieldName = 'PASSWORD'
      FixedChar = True
      Size = 32
    end
    object ads73DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads73RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads73ttype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
    object ads73status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
    object ads73short_info: TStringField
      DisplayLabel = #30701#20449
      FieldName = 'short_info'
      ReadOnly = True
      Size = 2
    end
    object ads73EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ads73GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ads73group_name: TStringField
      FieldName = 'group_name'
      Size = 30
    end
    object ads73NETWORK_IP: TStringField
      FieldName = 'NETWORK_IP'
      Size = 15
    end
    object ads73hrpopm: TIntegerField
      FieldName = 'hrpopm'
    end
    object ads73validity_date: TDateTimeField
      DisplayLabel = #23494#30721#26377#25928#26399
      FieldName = 'validity_date'
    end
    object ads73ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 135
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 199
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 263
    Top = 25
  end
  object aq419: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT Data0419.DESCRIPTION, Data0419.manu_ptr, '
      '      SYSTEM_MENU.MAIN_PTR,data0419.rkey,'
      ''
      'case when len(CAST(dbo.SYSTEM_MAIN.seq_no AS varchar))=1 then'
      '            '#39'0'#39'+CAST(dbo.SYSTEM_MAIN.seq_no AS varchar)'
      '          else CAST(dbo.SYSTEM_MAIN.seq_no AS varchar) end  +'
      ''
      'case when len(CAST(dbo.SYSTEM_MENU.seq_no AS varchar))=1 then'
      '            '#39'0'#39'+CAST(dbo.SYSTEM_MENU.seq_no AS varchar)'
      '          else CAST(dbo.SYSTEM_MENU.seq_no AS varchar) end  +'
      ''
      'case when len(CAST(dbo.Data0419.seq_no AS varchar))=1 then'
      '            '#39'0'#39'+CAST(dbo.Data0419.seq_no AS varchar)'
      '          else CAST(dbo.Data0419.seq_no AS varchar) end as seqno'
      ''
      'FROM dbo.Data0419 INNER JOIN'
      '      dbo.SYSTEM_MENU ON '
      '      dbo.Data0419.manu_ptr = dbo.SYSTEM_MENU.RKEY INNER JOIN'
      '      dbo.SYSTEM_MAIN ON '
      '      dbo.SYSTEM_MENU.MAIN_PTR = dbo.SYSTEM_MAIN.RKEY'
      'ORDER BY dbo.SYSTEM_MAIN.seq_no, dbo.SYSTEM_MENU.seq_no, '
      '      dbo.Data0419.SEQ_NO')
    Left = 104
    Top = 168
    object aq419DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object aq419manu_ptr: TIntegerField
      FieldName = 'manu_ptr'
    end
    object aq419MAIN_PTR: TIntegerField
      FieldName = 'MAIN_PTR'
    end
    object aq419rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq419seqno: TStringField
      FieldName = 'seqno'
      ReadOnly = True
      Size = 90
    end
  end
  object ads74: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ads74CalcFields
    CommandText = 
      'SELECT FUNCTION_ID, USER_RIGHTS, USER_PTR,'#13#10'seqno'#13#10'FROM dbo.Data' +
      '0074'#13#10'where USER_PTR = :rkey'
    IndexFieldNames = 'seqno'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    Left = 48
    Top = 168
    object ads74FUNCTION_ID: TIntegerField
      FieldName = 'FUNCTION_ID'
    end
    object ads74USER_RIGHTS: TSmallintField
      FieldName = 'USER_RIGHTS'
    end
    object ads74USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ads74seqno: TStringField
      FieldName = 'seqno'
      Size = 10
    end
    object ads74DESCRIPTION: TStringField
      DisplayLabel = #31243#24207#21517#31216
      FieldKind = fkLookup
      FieldName = 'DESCRIPTION'
      LookupDataSet = aq419
      LookupKeyFields = 'rkey'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'FUNCTION_ID'
      Size = 50
      Lookup = True
    end
    object ads74manu_ptr: TIntegerField
      FieldKind = fkLookup
      FieldName = 'manu_ptr'
      LookupDataSet = aq419
      LookupKeyFields = 'rkey'
      LookupResultField = 'manu_ptr'
      KeyFields = 'FUNCTION_ID'
      Lookup = True
    end
    object ads74MAIN_PTR: TIntegerField
      FieldKind = fkLookup
      FieldName = 'MAIN_PTR'
      LookupDataSet = aq419
      LookupKeyFields = 'rkey'
      LookupResultField = 'MAIN_PTR'
      KeyFields = 'FUNCTION_ID'
      Lookup = True
    end
    object ads74seq_no: TStringField
      FieldKind = fkLookup
      FieldName = 'seq_no'
      LookupDataSet = aq419
      LookupKeyFields = 'rkey'
      LookupResultField = 'seqno'
      KeyFields = 'FUNCTION_ID'
      Size = 10
      Lookup = True
    end
    object ads74rights: TStringField
      FieldKind = fkCalculated
      FieldName = 'rights'
      Size = 4
      Calculated = True
    end
  end
end
