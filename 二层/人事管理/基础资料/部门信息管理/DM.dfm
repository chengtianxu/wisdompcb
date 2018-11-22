object DM_dept: TDM_dept
  OldCreateOrder = False
  Left = 310
  Top = 293
  Height = 150
  Width = 215
  object con_dept: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Topcb_0.188;Persist Security Info=T' +
      'rue;User ID=sa;Initial Catalog=wisdompcb_bakhr;Data Source=172.1' +
      '8.2.38;Use Procedure for Prepare=1;Auto Translate=True;Packet Si' +
      'ze=4096;Workstation ID=W002213;Use Encryption for Data=False;Tag' +
      ' with column collation when possible=False'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object qry_dept: TADOQuery
    Connection = con_dept
    CursorType = ctStatic
    OnEditError = qry_deptEditError
    OnPostError = qry_deptPostError
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, departmentname, departmentcode, superior, charg' +
        'ename, departmentration, departmentcount, scarcity'
      'FROM         dbo.datadepartment')
    Left = 88
    Top = 24
    object qry_deptrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_deptdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry_deptdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object qry_deptsuperior: TIntegerField
      FieldName = 'superior'
    end
    object qry_deptchargename: TWideStringField
      FieldName = 'chargename'
    end
    object qry_deptdepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object qry_deptdepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object qry_deptscarcity: TIntegerField
      FieldName = 'scarcity'
    end
  end
  object ds_dept: TDataSource
    DataSet = qry_dept
    Left = 152
    Top = 24
  end
end
