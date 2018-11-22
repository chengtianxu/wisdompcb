object DM: TDM
  OldCreateOrder = False
  Left = 509
  Top = 282
  Height = 284
  Width = 330
  object DataSource1: TDataSource
    DataSet = ads0552
    Left = 240
    Top = 48
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 48
  end
  object ads0552: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_' +
      'NAME, dbo.Data0005.PHONE, dbo.Data0496.GROUP_DESC, dbo.Data0496.' +
      'GROUP_NAME, '#13#10'                      dbo.DATA0552.CSI_PTR, dbo.DA' +
      'TA0552.GROUP_PTR, dbo.Data0034.DEPT_NAME,case  dbo.Data0073.ACTI' +
      'VE_FLAG when 0 then '#39#26159#39' else '#39#21542#39' end as FLAG '#13#10'FROM         dbo.' +
      'Data0034 INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.D' +
      'ata0034.RKEY = dbo.Data0005.EMPLOYEE_ID RIGHT OUTER JOIN'#13#10'      ' +
      '                dbo.DATA0552 INNER JOIN'#13#10'                      d' +
      'bo.Data0073 ON dbo.DATA0552.CSI_PTR = dbo.Data0073.RKEY INNER JO' +
      'IN'#13#10'                      dbo.Data0496 ON dbo.DATA0552.GROUP_PTR' +
      ' = dbo.Data0496.RKEY ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYE' +
      'E_PTR'
    Parameters = <>
    Left = 144
    Top = 48
    object ads0552USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads0552USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads0552GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ads0552GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ads0552csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object ads0552GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ads0552PHONE: TStringField
      FieldName = 'PHONE'
      Size = 14
    end
    object ads0552DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads0552FLAG: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'FLAG'
      ReadOnly = True
      Size = 2
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 128
  end
end
