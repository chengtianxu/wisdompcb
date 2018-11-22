object DM: TDM
  OldCreateOrder = False
  Left = 443
  Top = 193
  Height = 239
  Width = 365
  object ADO722: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0722.rkey, dbo.data0722.LogNo, dbo.data0722.C' +
        'ustName, dbo.data0722.VistDate, dbo.data0722.visitors, dbo.data0' +
        '722.visitedMan, '
      
        '                      dbo.data0722.Comp_BckGrd, dbo.data0722.Pro' +
        'd_type, dbo.data0722.PCB_Req, dbo.data0722.Exp_quan, dbo.data072' +
        '2.Close_Acc, '
      
        '                      dbo.data0722.Quality_Req, dbo.data0722.Que' +
        's_Answ, dbo.data0722.Conclusion, dbo.data0722.others, dbo.data07' +
        '22.isUpdate, dbo.data0722.status, '
      
        '                      dbo.data0722.ReportID, dbo.data0722.Ent_Da' +
        'te, dbo.data0722.AuditID, dbo.data0722.AuditRemark, dbo.data0722' +
        '.AuditDate, '
      
        '                      CASE WHEN data0722.status = 0 THEN '#39#26410#25552#20132#39' W' +
        'HEN data0722.status = 1 THEN '#39#24453#23457#26680#39' WHEN data0722.status = 2 THEN' +
        ' '#39#24050#23457#26680#39' WHEN data0722.status'
      
        '                       = 3 THEN '#39#34987#36864#22238#39' END AS status_c, dbo.Data0' +
        '073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_NAME, '
      
        '                      Data0073_1.USER_FULL_NAME AS USER_FULL_NAM' +
        'E_A, Data0073_1.USER_LOGIN_NAME AS USER_LOGIN_NAME_A'
      'FROM         dbo.Data0073 INNER JOIN'
      
        '                      dbo.data0722 ON dbo.Data0073.RKEY = dbo.da' +
        'ta0722.ReportID LEFT OUTER JOIN'
      
        '                      dbo.Data0073 AS Data0073_1 ON dbo.data0722' +
        '.AuditID = Data0073_1.RKEY'
      'WHERE'
      'dbo.data0722.Ent_Date>=:dtpk1 and  dbo.data0722.Ent_Date<=:dtpk2'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 208
    Top = 16
    object ADO722rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO722LogNo: TStringField
      FieldName = 'LogNo'
      Size = 8
    end
    object ADO722CustName: TStringField
      FieldName = 'CustName'
      Size = 40
    end
    object ADO722VistDate: TDateTimeField
      FieldName = 'VistDate'
    end
    object ADO722visitors: TStringField
      FieldName = 'visitors'
      Size = 300
    end
    object ADO722visitedMan: TStringField
      FieldName = 'visitedMan'
      Size = 300
    end
    object ADO722Comp_BckGrd: TStringField
      FieldName = 'Comp_BckGrd'
      Size = 150
    end
    object ADO722Prod_type: TStringField
      FieldName = 'Prod_type'
      Size = 150
    end
    object ADO722PCB_Req: TStringField
      FieldName = 'PCB_Req'
      Size = 150
    end
    object ADO722Exp_quan: TStringField
      FieldName = 'Exp_quan'
      Size = 150
    end
    object ADO722Close_Acc: TStringField
      FieldName = 'Close_Acc'
      Size = 150
    end
    object ADO722Quality_Req: TStringField
      FieldName = 'Quality_Req'
      Size = 150
    end
    object ADO722Ques_Answ: TStringField
      FieldName = 'Ques_Answ'
      Size = 500
    end
    object ADO722Conclusion: TStringField
      FieldName = 'Conclusion'
      Size = 500
    end
    object ADO722others: TStringField
      FieldName = 'others'
      Size = 150
    end
    object ADO722isUpdate: TBooleanField
      FieldName = 'isUpdate'
    end
    object ADO722status: TIntegerField
      FieldName = 'status'
    end
    object ADO722ReportID: TIntegerField
      FieldName = 'ReportID'
    end
    object ADO722Ent_Date: TDateTimeField
      FieldName = 'Ent_Date'
    end
    object ADO722AuditID: TIntegerField
      FieldName = 'AuditID'
    end
    object ADO722AuditRemark: TStringField
      FieldName = 'AuditRemark'
      Size = 150
    end
    object ADO722AuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
    object ADO722status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO722USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO722USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO722USER_FULL_NAME_A: TStringField
      FieldName = 'USER_FULL_NAME_A'
      Size = 30
    end
    object ADO722USER_LOGIN_NAME_A: TStringField
      FieldName = 'USER_LOGIN_NAME_A'
      Size = 15
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADO722
    Left = 128
    Top = 16
  end
  object Tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 296
    Top = 56
  end
  object ADO722_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey722'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0722 where rkey= :rkey722')
    Left = 208
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ADO722_1
    Left = 128
    Top = 88
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 208
    Top = 144
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO493
    Left = 136
    Top = 144
  end
end
