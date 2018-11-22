object DM: TDM
  OldCreateOrder = False
  Left = 271
  Top = 187
  Height = 475
  Width = 593
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object employee_contract: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey731'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT         '
      'dbo.employee_contract.rkey, dbo.employee_contract.code, '
      'dbo.employee_contract.employeeid,remark,                   '
      
        'convert(char(10),dbo.employee_contract.startdate,20) as startdat' +
        'e ,'
      
        'convert(char(10),employee_contract.probationdate,20) as probatio' +
        'ndate, '
      
        'convert(char(10),dbo.employee_contract.enddate,20) as enddate , ' +
        ' '
      'dbo.employee_contract.type, dbo.employee_contract.inputdate, '
      
        'dbo.employee_contract.opration_person, dbo.employee_contract.sta' +
        'tus, '
      
        'case dbo.employee_contract.status when 1 then '#39#26377#25928#39' when 2 then '#39 +
        #26080#25928#39' END AS status1, '
      
        'dbo.Data0005.employee_NAME, v_employeemsg.employeecode,v_employe' +
        'emsg.ondutytime,'
      
        'dbo.datadetail.item,v_employeemsg.chinesename,v_employeemsg.depa' +
        'rtmentname,'
      'v_employeemsg.position_item'
      'FROM'#9'dbo.employee_contract '
      
        'INNER JOIN v_employeemsg ON dbo.employee_contract.employeeid = v' +
        '_employeemsg.rkey '
      
        'INNER JOIN dbo.datadetail ON dbo.employee_contract.type = dbo.da' +
        'tadetail.rkey '
      
        'INNER JOIN dbo.Data0005  ON dbo.employee_contract.opration_perso' +
        'n = dbo.Data0005.RKEY'
      'WHERE '
      
        '(1=1)  and (v_employeemsg.status=1 or v_employeemsg.outdutytime ' +
        '>= dateadd(year,-1,getdate()) )'
      'and employee_contract.enddate between  :dtpk1 and :dtpk2 '
      'and v_employeemsg.departmentid in'
      
        #9'(select departmentid from hr_permission where program_ptr=(sele' +
        'ct rkey from data0419 where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr= :rkey731'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )')
    Left = 112
    Top = 99
    object employee_contractrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object employee_contractcode: TWideStringField
      FieldName = 'code'
    end
    object employee_contractemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object employee_contractremark: TWideStringField
      FieldName = 'remark'
      Size = 300
    end
    object employee_contractstartdate: TStringField
      FieldName = 'startdate'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_contractprobationdate: TStringField
      FieldName = 'probationdate'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_contractenddate: TStringField
      FieldName = 'enddate'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_contracttype: TIntegerField
      FieldName = 'type'
    end
    object employee_contractinputdate: TDateTimeField
      FieldName = 'inputdate'
    end
    object employee_contractopration_person: TIntegerField
      FieldName = 'opration_person'
    end
    object employee_contractstatus: TIntegerField
      FieldName = 'status'
    end
    object employee_contractstatus1: TStringField
      FieldName = 'status1'
      ReadOnly = True
      Size = 4
    end
    object employee_contractemployee_NAME: TStringField
      FieldName = 'employee_NAME'
      Size = 16
    end
    object employee_contractemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object employee_contractondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object employee_contractitem: TWideStringField
      FieldName = 'item'
    end
    object employee_contractchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object employee_contractdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object employee_contractposition_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
  end
  object employee_contract_1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, code, employeeid, startdate, enddate, type, inp' +
        'utdate, opration_person, status,probationdate,remark'
      'FROM         dbo.employee_contract')
    Left = 336
    Top = 20
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 24
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = employee_contract
    Left = 32
    Top = 96
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 240
    Top = 24
  end
  object employee_contract_2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey732'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT    departmentname,employeecode,chinesename,ondutytime,pos' +
        'ition_item,isnull(datadetail.item,'#39#27491#24335#21512#21516#39') as employee_typeitem'
      
        'FROM         v_employeemsg left join datadetail on v_employeemsg' +
        '.employ_type=datadetail.rkey'
      'where status=1  and v_employeemsg.rkey not in '
      '(select employeeid from dbo.employee_contract where status=1'
      'and  getdate() between dateadd(day,-2,startdate) and enddate'
      ')'
      ' and departmentid in '
      
        #9'(select departmentid from hr_permission where program_ptr=(sele' +
        'ct rkey from data0419 where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey732'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )'
      'and v_employeemsg.employ_type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')'
      'order by ondutytime')
    Left = 120
    Top = 156
    object employee_contract_2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object employee_contract_2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object employee_contract_2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object employee_contract_2ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object employee_contract_2position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object employee_contract_2employee_typeitem: TWideStringField
      FieldName = 'employee_typeitem'
    end
  end
  object DataSource2: TDataSource
    DataSet = employee_contract_2
    Left = 32
    Top = 152
  end
  object DataSource3: TDataSource
    DataSet = employee_contract_3
    Left = 32
    Top = 208
  end
  object DataSource4: TDataSource
    DataSet = employee_contract_4
    Left = 40
    Top = 264
  end
  object employee_contract_3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey733'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
        DataType = ftString
        Size = 4
        Value = '2141'
      end
      item
        Name = 'rkey734'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
        DataType = ftString
        Size = 4
        Value = '2141'
      end>
    SQL.Strings = (
      'select'
      ' (select departmentname from datadepartment  '
      
        'where rkey= (select departmentid from employeemsg where rkey =em' +
        'ployee_contract.employeeid) )as departmentname,'
      '(select employeecode from employeemsg '
      'where rkey= employee_contract.employeeid) as employeecode,'
      '(select chinesename from employeemsg '
      'where rkey= employee_contract.employeeid)as chinesename,'
      '(select item from datadetail'
      'where rkey= employee_contract.type) as employee_typeitem,'
      'code,startdate,enddate from employee_contract '
      'where type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')'
      'and  employeeid in '
      '(select rkey from employeemsg where status=1'
      
        ' and [rank] not in (select rkey from datadetail where dictid=2 a' +
        'nd item='#39#31649#29702#39')'
      'and departmentid in '
      
        #9'(select departmentid from hr_permission where program_ptr=(sele' +
        'ct rkey from data0419 where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey733'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )'
      ')'
      'and enddate between '
      'getdate()'
      'and '
      'dateadd(month,1,getdate())'
      'and status=1'
      ''
      'union '
      'select '
      ' (select departmentname from datadepartment  '
      
        'where rkey= (select departmentid from employeemsg where rkey =em' +
        'ployee_contract.employeeid) )as departmentname,'
      '(select employeecode from employeemsg '
      'where rkey= employee_contract.employeeid) as employeecode,'
      '(select chinesename from employeemsg '
      'where rkey= employee_contract.employeeid)as chinesename,'
      '(select item from datadetail'
      'where rkey= employee_contract.type)as employee_typeitem,'
      'code,startdate,enddate from employee_contract '
      'where type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')'
      'and employeeid in '
      '(select rkey from employeemsg where status=1 '
      
        'and [rank]  in (select rkey from datadetail where dictid=2 and i' +
        'tem='#39#31649#29702#39')'
      'and departmentid in '
      
        #9'(select departmentid from hr_permission where program_ptr=(sele' +
        'ct rkey from data0419 where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey734'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )'
      ')'
      'and enddate between '
      'getdate()'
      'and '
      'dateadd(month,3,getdate())'
      'and status=1'
      '')
    Left = 122
    Top = 209
    object employee_contract_3employeecode: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object employee_contract_3chinesename: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object employee_contract_3code: TWideStringField
      FieldName = 'code'
    end
    object employee_contract_3startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object employee_contract_3enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object employee_contract_3employee_typeitem: TWideStringField
      FieldName = 'employee_typeitem'
      ReadOnly = True
    end
    object employee_contract_3departmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object employee_contract_4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey735'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
        DataType = ftString
        Size = 4
        Value = '2141'
      end>
    SQL.Strings = (
      'select '
      '(select departmentname from datadepartment  '
      
        'where rkey= (select departmentid from employeemsg where rkey =em' +
        'ployee_contract.employeeid) )as departmentname,'
      '(select employeecode from employeemsg '
      'where rkey= employee_contract.employeeid)as employeecode,'
      '(select chinesename from employeemsg '
      'where rkey= employee_contract.employeeid)as chinesename,'
      '(select item from datadetail'
      'where rkey= employee_contract.type)as employee_typeitem,'
      'code,startdate,enddate from employee_contract'
      'where employeeid in '
      '(select rkey from employeemsg where status=1 '
      'and departmentid in '
      
        #9'(select departmentid from hr_permission where program_ptr=(sele' +
        'ct rkey from data0419 where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey735'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )'
      ')'
      'and enddate < getdate()'
      'and status=1'
      'and  type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')')
    Left = 126
    Top = 264
    object employee_contract_4employeecode: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object employee_contract_4chinesename: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object employee_contract_4code: TWideStringField
      FieldName = 'code'
    end
    object employee_contract_4startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object employee_contract_4enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object employee_contract_4employee_typeitem: TWideStringField
      FieldName = 'employee_typeitem'
      ReadOnly = True
    end
    object employee_contract_4departmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey73'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update employee_contract'
      'set status=2 '
      'from  employee_contract'
      'where employeeid in '
      '(select rkey from employeemsg where status=1 '
      'and departmentid in '
      #9'(select departmentid from hr_permission '
      'where program_ptr=(select rkey from data0419 '
      
        'where programe='#39'ContractOfEmployee.exe'#39' )and operator_ptr=:rkey7' +
        '3 ))'
      'and enddate < getdate()'
      'and status=1')
    Left = 264
    Top = 296
  end
  object DataSource5: TDataSource
    DataSet = employee_contract_5
    Left = 40
    Top = 336
  end
  object employee_contract_5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey73'#9#9#9#9#9#9#9#9#9#9#9#9#9
        DataType = ftString
        Size = 4
        Value = '2141'
      end>
    SQL.Strings = (
      'select '
      '(select departmentname from datadepartment  '
      
        'where rkey= (select departmentid from employeemsg where rkey =em' +
        'ployee_contract.employeeid) )as departmentname,'
      '(select employeecode from employeemsg '
      'where rkey= employee_contract.employeeid) as employeecode,'
      '(select chinesename from employeemsg '
      'where rkey= employee_contract.employeeid)as chinesename,'
      '(select item from datadetail'
      'where rkey= employee_contract.type)as employee_typeitem,'
      
        '(select item from employeemsg join datadetail on employeemsg.pos' +
        'ition =datadetail.rkey '
      
        'where employeemsg.rkey= employee_contract.employeeid) as positio' +
        'n,'
      'code,startdate,enddate '
      'from employee_contract '
      'where employeeid in '
      '(select rkey from employeemsg where status=1'
      ' and position   in (select rkey from datadetail'
      'where dictid=1'
      'and item like '#39'%'#32463#29702'%'#39
      'and item not like '#39'%'#24635'%'#39')'
      'and departmentid in '
      #9'(select departmentid from hr_permission '
      'where program_ptr='
      '(select rkey from data0419 '
      'where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey73'#9#9#9#9#9#9#9#9#9#9#9#9#9
      #9' )'
      ')'
      'and enddate between '
      'getdate()'
      'and '
      'dateadd(month,6,getdate())'
      'and status=1'
      'and  type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')')
    Left = 130
    Top = 337
    object WideStringField1: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object WideStringField2: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object employee_contract_5position: TWideStringField
      FieldName = 'position'
      ReadOnly = True
    end
    object WideStringField3: TWideStringField
      FieldName = 'code'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'startdate'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'enddate'
    end
    object WideStringField4: TWideStringField
      FieldName = 'employee_typeitem'
      ReadOnly = True
    end
    object employee_contract_5departmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object DataSource6: TDataSource
    DataSet = employee_contract_6
    Left = 40
    Top = 384
  end
  object employee_contract_6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey73'#9#9#9#9#9#9#9#9#9#9
        DataType = ftString
        Size = 4
        Value = '2141'
      end>
    SQL.Strings = (
      'select'
      '(select departmentname from datadepartment  '
      
        'where rkey= (select departmentid from employeemsg where rkey =em' +
        'ployee_contract.employeeid) )as departmentname, '
      '(select employeecode from employeemsg '
      'where rkey= employee_contract.employeeid) as employeecode,'
      '(select chinesename from employeemsg '
      'where rkey= employee_contract.employeeid)as chinesename,'
      '(select item from datadetail'
      'where rkey= employee_contract.type)as employee_typeitem,'
      
        '(select item from employeemsg join datadetail on employeemsg.pos' +
        'ition =datadetail.rkey '
      
        'where employeemsg.rkey= employee_contract.employeeid) as positio' +
        'n,'
      'code,startdate,enddate '
      'from employee_contract '
      'where employeeid in '
      '(select rkey from employeemsg where status=1'
      ' and position   in (select rkey from datadetail'
      'where dictid=1'
      'and item   like '#39'%'#24635'%'#39')'
      'and departmentid in '
      #9'(select departmentid from hr_permission '
      'where program_ptr='
      '(select rkey from data0419 '
      'where programe='#39'ContractOfEmployee.exe'#39' ) '
      #9'and operator_ptr=:rkey73'#9#9#9#9#9#9#9#9#9#9
      #9' )'
      ')'
      'and enddate between '
      'getdate()'
      'and '
      'dateadd(year,1,getdate())'
      'and status=1'
      'and  type in (select rkey from datadetail'
      'where dictid=5 and isnull(memo,'#39#39') not like '#39'%'#19981#25552#31034'%'#39')')
    Left = 130
    Top = 385
    object WideStringField5: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object WideStringField6: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object WideStringField7: TWideStringField
      FieldName = 'code'
    end
    object employee_contract_6position: TWideStringField
      FieldName = 'position'
      ReadOnly = True
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'startdate'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'enddate'
    end
    object WideStringField8: TWideStringField
      FieldName = 'employee_typeitem'
      ReadOnly = True
    end
    object employee_contract_6departmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
end
