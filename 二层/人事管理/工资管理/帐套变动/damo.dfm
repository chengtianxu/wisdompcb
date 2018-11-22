object DM: TDM
  OldCreateOrder = False
  Left = 415
  Top = 220
  Height = 281
  Width = 541
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 56
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      
        'select employeemsg.rkey EmpRkey, employeemsg.employeecode, emplo' +
        'yeemsg.chinesename,'
      
        'datadepartment.departmentname,  OldsalaryAccount.accountName as ' +
        'OldName, NewsalaryAccount.accountName NewName,'
      
        'employee_alteration.rkey AltRkey, employee_alteration.oper_date,' +
        ' '
      
        '(select employee_name from data0005 where rkey=employee_alterati' +
        'on.oper_person) as OperName,'
      
        'employee_alteration.alterdate,employee_alteration.active,  emplo' +
        'yee_alteration.orginal_accountid, employee_alteration.new_accoun' +
        'tid,'
      
        'case when employee_alteration.active = 0 then '#39#21542#39' else '#39#26159#39' end A' +
        'ctiveName,employee_alteration.remark'
      'from employee_alteration'
      'inner join employeemsg on employeeid = employeemsg.rkey'
      
        'inner join dbo.datadepartment on employeemsg.departmentid = data' +
        'department.rkey'
      
        'inner join salaryAccount OldsalaryAccount on employee_alteration' +
        '.orginal_accountid = OldsalaryAccount.rkey'
      
        'inner join salaryAccount NewsalaryAccount on employee_alteration' +
        '.new_accountid = NewsalaryAccount.rkey'
      'where (1=1)')
    Left = 120
    Top = 56
    object qry1EmpRkey: TAutoIncField
      FieldName = 'EmpRkey'
      ReadOnly = True
    end
    object qry1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry1OldName: TWideStringField
      FieldName = 'OldName'
      Size = 50
    end
    object qry1NewName: TWideStringField
      FieldName = 'NewName'
      Size = 50
    end
    object qry1AltRkey: TAutoIncField
      FieldName = 'AltRkey'
      ReadOnly = True
    end
    object qry1oper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object qry1OperName: TWideStringField
      FieldName = 'OperName'
      ReadOnly = True
    end
    object qry1alterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object qry1active: TIntegerField
      FieldName = 'active'
    end
    object qry1ActiveName: TStringField
      FieldName = 'ActiveName'
      ReadOnly = True
      Size = 2
    end
    object qry1orginal_accountid: TIntegerField
      FieldName = 'orginal_accountid'
    end
    object qry1new_accountid: TIntegerField
      FieldName = 'new_accountid'
    end
    object qry1remark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 168
    Top = 56
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 120
    Top = 128
  end
end
