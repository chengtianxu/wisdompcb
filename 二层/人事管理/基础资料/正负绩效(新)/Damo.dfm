object DM: TDM
  OldCreateOrder = False
  Left = 513
  Top = 214
  Height = 338
  Width = 461
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 24
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select employeecode, chinesename, departmentname, ondutytime, de' +
        'partmentcode, '
      
        'datadetail1.item, employee_rewards_punishment.*,datadetail2.item' +
        ' as item2, d73.user_full_name'
      'from employeemsg '
      
        'inner join datadepartment on employeemsg.departmentid=datadepart' +
        'ment.rkey'
      
        'inner join employee_rewards_punishment on employee_rewards_punis' +
        'hment.employeeid=employeemsg.rkey '
      
        'left   join datadetail datadetail1 on datadetail1.rkey=employee_' +
        'rewards_punishment.type'
      
        'left  join datadetail datadetail2 on datadetail2.rkey=employeems' +
        'g.position'
      
        'left join   data0073  d73 on d73.rkey= employee_rewards_punishme' +
        'nt.modiMan'
      'where (1=1) ')
    Left = 136
    Top = 32
    object qry1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry1departmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object qry1item: TWideStringField
      FieldName = 'item'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfldqry1employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object intgrfldqry1type: TIntegerField
      FieldName = 'type'
    end
    object data0362qry1money: TFloatField
      FieldName = 'money'
    end
    object intgrfldqry1flag: TIntegerField
      FieldName = 'flag'
    end
    object qry1effectdate: TDateTimeField
      FieldName = 'effectdate'
    end
    object qry1remark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object qry1item2: TWideStringField
      FieldName = 'item2'
    end
    object intgrfldqry1RType: TIntegerField
      FieldName = 'RType'
    end
    object dtmfldqry1ModiDate: TDateTimeField
      FieldName = 'ModiDate'
    end
    object intgrfldqry1ModiMan: TIntegerField
      FieldName = 'ModiMan'
    end
    object strngfldqry1user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object qry1PNo: TStringField
      FieldName = 'PNo'
      Size = 15
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 192
    Top = 32
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select employeemsg.rkey,employeemsg.employeecode,employeemsg.chi' +
        'nesename,'
      'datadepartment.departmentname'
      
        'from employeemsg inner join dbo.datadepartment on employeemsg.de' +
        'partmentid=datadepartment.rkey'
      'where status=1')
    Left = 136
    Top = 104
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 192
    Top = 104
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 224
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 192
    Top = 168
  end
  object qry3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select employeemsg.rkey,employeemsg.employeecode,employeemsg.chi' +
        'nesename,'
      
        'datadepartment.departmentname,datadetail.item,employeemsg.onduty' +
        'time'
      'from employeemsg '
      
        'inner join dbo.datadepartment on employeemsg.departmentid=datade' +
        'partment.rkey'
      'inner join datadetail on employeemsg.position=datadetail.rkey'
      'where employeemsg.rkey=-1')
    Left = 136
    Top = 168
  end
  object qry1s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select distinct employeemsg.rkey, employeecode, chinesename, de' +
        'partmentname , '
      ' '
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 and item<>'#39#21152#20854#23427#39' AND item <> '#39#38463#31859#24052#22870#39' '
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#27491#32489#25928#39', '
      
        '(select isnull(count(money),0) Smoney from employee_rewards_puni' +
        'shment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0  and item<>'#39#21152#20854#23427#39' AND item <> '#39#38463#31859#24052#22870#39' '
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#27491#32489#25928#27425#25968#39', '
      ''
      ''
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 and item='#39#21152#20854#23427#39
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#21152#20854#23427#39', '
      
        '(select isnull(count(money),0) Smoney from employee_rewards_puni' +
        'shment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 and item='#39#21152#20854#23427#39
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#21152#20854#23427#27425#25968#39','
      ''
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 and item='#39#38463#31859#24052#22870#39
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#38463#31859#24052#22870#39', '
      
        '(select isnull(count(money),0) Smoney from employee_rewards_puni' +
        'shment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 and item='#39#38463#31859#24052#22870#39
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#38463#31859#24052#22870#27425#25968#39','
      ''
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and item<>'#39#20943#20854#23427#39' and  year(effectdate)=year(getdate(' +
        ')) and month(effectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#36127#32489#25928#39','
      
        '(select isnull(count(money),0) Smoney from employee_rewards_puni' +
        'shment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and item<>'#39#20943#20854#23427#39' and  year(effectdate)=year(getdate(' +
        ')) and month(effectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#36127#32489#25928#27425#25968#39','
      ''
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and item='#39#20943#20854#23427#39' and  year(effectdate)=year(getdate()' +
        ') and month(effectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#20943#20854#23427#39','
      
        '(select isnull(count(money),0) Smoney from employee_rewards_puni' +
        'shment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and item='#39#20943#20854#23427#39' and  year(effectdate)=year(getdate()' +
        ') and month(effectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#20943#20854#23427#27425#25968#39','
      ''
      ''
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 '
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      'and employee_rewards_punishment.employeeid=employeemsg.rkey)'
      
        '-(select isnull(sum(money),0) Smoney from employee_rewards_punis' +
        'hment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and  year(effectdate)=year(getdate()) and month(eff' +
        'ectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#23454#24471#22870#24809#37329#39069#39','
      'datadetail.item'
      ''
      'from employee_rewards_punishment '
      
        'inner join employeemsg on employee_rewards_punishment.employeeid' +
        '=employeemsg.rkey '
      
        'left join dbo.datadepartment on employeemsg.departmentid=datadep' +
        'artment.rkey '
      'left join dbo.datadetail on employeemsg.position=datadetail.rkey'
      'where (1 = 1)'
      
        'and year(effectdate)=year(getdate()) and month(effectdate)=month' +
        '(getdate()) ')
    Left = 264
    Top = 32
    object qry1srkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry1semployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry1schinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry1sdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry1sDSDesigner: TFloatField
      FieldName = #27491#32489#25928
      ReadOnly = True
    end
    object qry1sDSDesigner2: TIntegerField
      FieldName = #27491#32489#25928#27425#25968
      ReadOnly = True
    end
    object qry1sDSDesigner3: TFloatField
      FieldName = #21152#20854#23427
      ReadOnly = True
    end
    object qry1sDSDesigner4: TIntegerField
      FieldName = #21152#20854#23427#27425#25968
      ReadOnly = True
    end
    object qry1sDSDesigner5: TFloatField
      FieldName = #36127#32489#25928
      ReadOnly = True
    end
    object qry1sDSDesigner6: TIntegerField
      FieldName = #36127#32489#25928#27425#25968
      ReadOnly = True
    end
    object qry1sDSDesigner7: TFloatField
      FieldName = #20943#20854#23427
      ReadOnly = True
    end
    object qry1sDSDesigner8: TIntegerField
      FieldName = #20943#20854#23427#27425#25968
      ReadOnly = True
    end
    object qry1sDSDesigner9: TFloatField
      FieldName = #23454#24471#22870#24809#37329#39069
      ReadOnly = True
    end
    object qry1sitem: TWideStringField
      FieldName = 'item'
      Size = 50
    end
    object qry1sDSDesigner10: TFloatField
      FieldName = #38463#31859#24052#22870
      ReadOnly = True
    end
    object qry1sDSDesigner11: TIntegerField
      FieldName = #38463#31859#24052#22870#27425#25968
      ReadOnly = True
    end
  end
  object ds1s: TDataSource
    DataSet = qry1s
    Left = 320
    Top = 32
  end
  object updatemistake: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'if exists ('
      'select * from datadetail'
      'where dictid=15'
      'and item ='#39#35760#22823#36807#39')'
      'begin'
      
        'update employeemsg set serious_mistake=0 where isnull(serious_mi' +
        'stake,0)>0'
      'update employeemsg'
      'set serious_mistake=mistakefrequnce.frequnce'
      'from employeemsg e inner join '
      '('
      
        'select employeeid,count(employeeid) as frequnce from dbo.employe' +
        'e_rewards_punishment'
      'where type in (select rkey from datadetail'
      'where dictid=15 and item ='#39#35760#22823#36807#39')'
      ' group by employeeid) as mistakefrequnce '
      'on e.rkey=mistakefrequnce.employeeid'
      'end')
    Left = 208
    Top = 232
  end
end
