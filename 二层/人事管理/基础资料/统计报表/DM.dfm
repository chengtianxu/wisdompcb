object damo: Tdamo
  OldCreateOrder = False
  Left = 314
  Top = 106
  Height = 436
  Width = 370
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object qrydept: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT   rkey, departmentname, departmentcode, superior, chargen' +
        'ame, departmentration, departmentcount, scarcity'
      'FROM   dbo.datadepartment  order by departmentcode')
    Left = 104
    Top = 8
    object qrydeptrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qrydeptdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qrydeptdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object qrydeptsuperior: TIntegerField
      FieldName = 'superior'
    end
    object qrydeptchargename: TWideStringField
      FieldName = 'chargename'
    end
    object qrydeptdepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object qrydeptdepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object qrydeptscarcity: TIntegerField
      FieldName = 'scarcity'
    end
  end
  object qrysex: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select '
      'case when sex=0 then '#39#22899#39' '
      'when sex=1 then '#39#30007#39' '
      'end as '#39#24615#21035#39', '
      'count(*) '#39#20154#25968#39' '
      'from employeemsg ')
    Left = 32
    Top = 64
    object qrysexDSDesigner: TStringField
      FieldName = #24615#21035
      ReadOnly = True
      Size = 4
    end
    object qrysexDSDesigner2: TIntegerField
      FieldName = #20154#25968
      ReadOnly = True
    end
  end
  object dssex: TDataSource
    Left = 104
    Top = 64
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 296
    Top = 8
  end
  object qryempWhere: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      ''
      
        'select employeemsg.rkey, datadepartment.departmentname, employee' +
        'code, '
      'chinesename, case when sex= 0 then '#39#22899#39' else '#39#30007#39' end sex, '
      
        'ondutytime, outdutytime, convert(varchar(10), birthday, 23) as b' +
        'irthday, '
      
        'Employeebasicsalary.F2, case when dateadd(year,1,ondutytime)>get' +
        'date()  then 0 else  datediff(year,ondutytime,getdate()) end +ro' +
        'und((datediff(month,ondutytime,getdate()) % 12 )/12.0,2) as Work' +
        'Age,'
      'datadetail.item,province'
      'from employeemsg'
      
        'left join Employeebasicsalary on employeemsg.rkey=Employeebasics' +
        'alary.employeeid'
      
        'left join datadepartment on employeemsg.departmentid=datadepartm' +
        'ent.rkey'
      'left join datadetail on employeemsg.education = datadetail.rkey')
    Left = 224
    Top = 64
    object qryempWhererkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryempWhereemployeecode: TWideStringField
      DisplayWidth = 15
      FieldName = 'employeecode'
    end
    object qryempWherechinesename: TWideStringField
      DisplayWidth = 15
      FieldName = 'chinesename'
    end
    object qryempWhereondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qryempWhereoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object qryempWhereF2: TBCDField
      FieldName = 'F2'
      Precision = 19
    end
    object qryempWheredepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qryempWherebirthday: TStringField
      FieldName = 'birthday'
      ReadOnly = True
      Size = 10
    end
    object qryempWheresex: TStringField
      FieldName = 'sex'
      ReadOnly = True
      Size = 2
    end
    object qryempWhereWorkAge: TBCDField
      FieldName = 'WorkAge'
      ReadOnly = True
      Precision = 17
      Size = 6
    end
    object qryempWhereitem: TWideStringField
      FieldName = 'item'
    end
    object qryempWhereprovince: TWideStringField
      FieldName = 'province'
    end
  end
  object dsempWhere: TDataSource
    DataSet = qryempWhere
    Left = 296
    Top = 64
  end
  object dsBirthday: TDataSource
    DataSet = qryBirthday
    Left = 104
    Top = 112
  end
  object qryBirthday: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 112
    object qryBirthdayDSDesigner: TStringField
      FieldName = #24180#20221
      ReadOnly = True
      Size = 9
    end
    object qryBirthdayDSDesigner2: TIntegerField
      FieldName = #20154#25968
      ReadOnly = True
    end
  end
  object qryWorkAge: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 168
    object qryWorkAgeWorkAge: TIntegerField
      FieldName = 'WorkAge'
    end
    object qryWorkAgea: TWideStringField
      FieldName = 'a'
      Size = 0
    end
  end
  object dsWorkAge: TDataSource
    DataSet = qryWorkAge
    Left = 104
    Top = 168
  end
  object dsEducation: TDataSource
    DataSet = qryEducation
    Left = 104
    Top = 224
  end
  object qryEducation: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 224
    object qryEducationitem: TWideStringField
      FieldName = 'item'
      Size = 0
    end
    object qryEducationField: TIntegerField
      FieldName = #20154#25968
    end
  end
  object dsSalary: TDataSource
    DataSet = qrySalary
    Left = 104
    Top = 280
  end
  object qrySalary: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 280
    object IntegerField1: TIntegerField
      FieldName = #20154#25968
    end
    object qrySalaryField: TWideStringField
      FieldName = #34218#36164#33539#22260
      Size = 0
    end
  end
  object dsProvince: TDataSource
    DataSet = qryProvince
    Left = 104
    Top = 336
  end
  object qryProvince: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 336
    object WideStringField1: TWideStringField
      FieldName = 'area'
      Size = 0
    end
    object IntegerField2: TIntegerField
      FieldName = #20154#25968
    end
  end
end
