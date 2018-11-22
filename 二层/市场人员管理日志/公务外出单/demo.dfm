object dm: Tdm
  OldCreateOrder = False
  Left = 323
  Top = 89
  Height = 319
  Width = 474
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADO723: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT     dbo.data0723.*, '
      '             case when data0723.status=0 then '#39#26410#25552#20132#39
      '                      when data0723.status=1 then '#39#24453#23457#26680#39
      '                      when data0723.status=2 then '#39#24050#23457#26680#39
      
        '                      when data0723.status=3 then '#39#34987#36864#22238#39' end stat' +
        'us_c,'
      
        '             dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGI' +
        'N_NAME, '
      '              Data0073_1.USER_FULL_NAME  USER_FULL_NAME_A,'
      
        '              Data0073_1.USER_LOGIN_NAME USER_LOGIN_NAME_A      ' +
        '      '
      'FROM         dbo.data0723 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.data0723.salesID = dbo' +
        '.Data0073.RKEY left JOIN'
      
        '                      dbo.Data0073 AS Data0073_1 ON  dbo.data072' +
        '3.AuditID = Data0073_1.RKEY'
      'where   data0723.ent_date>=:dtpk1  '
      '    and   data0723.ent_date<=:dtpk2')
    Left = 136
    Top = 24
    object ADO723LogNo: TStringField
      FieldName = 'LogNo'
      Size = 50
    end
    object ADO723salesID: TIntegerField
      FieldName = 'salesID'
    end
    object ADO723CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO723BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADO723apply_date: TDateTimeField
      FieldName = 'apply_date'
    end
    object ADO723goout_date: TDateTimeField
      FieldName = 'goout_date'
    end
    object ADO723return_date: TDateTimeField
      FieldName = 'return_date'
    end
    object ADO723ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO723goout_reason: TStringField
      FieldName = 'goout_reason'
      Size = 500
    end
    object ADO723AuditID: TIntegerField
      FieldName = 'AuditID'
    end
    object ADO723Audit_Date: TDateTimeField
      FieldName = 'Audit_Date'
    end
    object ADO723AuditRemark: TStringField
      FieldName = 'AuditRemark'
      Size = 50
    end
    object ADO723status: TWordField
      FieldName = 'status'
    end
    object ADO723status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO723USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO723USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO723USER_FULL_NAME_A: TStringField
      FieldName = 'USER_FULL_NAME_A'
      Size = 30
    end
    object ADO723USER_LOGIN_NAME_A: TStringField
      FieldName = 'USER_LOGIN_NAME_A'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO723
    Left = 248
    Top = 24
  end
  object ADO723_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'LogNo'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0723 where LogNo=:LogNo'
      #9)
    Left = 136
    Top = 80
  end
  object ADOtemp: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 240
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = ADO723_1
    Left = 312
    Top = 88
  end
  object ADO73: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME, d' +
        'bo.Data0005.TPOSTION, dbo.Data0005.EMPL_CODE'
      'FROM         dbo.Data0073 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR ' +
        '= dbo.Data0005.RKEY AND dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005' +
        '.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID =' +
        ' dbo.Data0034.RKEY'
      'WHERE     dbo.Data0073.RKEY = :rkey')
    Left = 128
    Top = 160
    object ADO73EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO73DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO73TPOSTION: TStringField
      FieldName = 'TPOSTION'
      Size = 30
    end
    object ADO73EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
  end
end
