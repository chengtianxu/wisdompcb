object DM: TDM
  OldCreateOrder = False
  Left = 455
  Top = 283
  Height = 338
  Width = 461
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select employeecode, chinesename, departmentname, ondutytime, de' +
        'partmentcode, '
      'datadetail1.item, employee_rewards_punishment.*,datadetail2.item'
      'from employeemsg '
      
        'inner join datadepartment on employeemsg.departmentid=datadepart' +
        'ment.rkey'
      
        'inner join employee_rewards_punishment on employee_rewards_punis' +
        'hment.employeeid=employeemsg.rkey '
      
        'inner join datadetail datadetail1 on datadetail1.rkey=employee_r' +
        'ewards_punishment.type'
      
        'inner join datadetail datadetail2 on datadetail2.rkey=employeems' +
        'g.position'
      'where (1=1) ')
    Left = 136
    Top = 32
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
      
        'select distinct employeemsg.rkey, employeecode, chinesename, dep' +
        'artmentname , '
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      
        'where employee_rewards_punishment.type=datadetail.rkey and flag=' +
        ' 0 '
      
        'and  year(effectdate)=year(getdate()) and month(effectdate)=mont' +
        'h(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#24635#22870#21169#39', '
      
        '(select isnull(sum(money),0) Smoney from employee_rewards_punish' +
        'ment, datadetail '
      'where employee_rewards_punishment.type=datadetail.rkey  '
      
        'and flag = 1 and  year(effectdate)=year(getdate()) and month(eff' +
        'ectdate)=month(getdate()) '
      
        'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ' +
        #39#24635#24809#32602#39','
      
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
      'from employee_rewards_punishment '
      
        'inner join employeemsg on employee_rewards_punishment.employeeid' +
        '=employeemsg.rkey '
      
        'inner join dbo.datadepartment on employeemsg.departmentid=datade' +
        'partment.rkey '
      
        'inner join dbo.datadetail on employeemsg.position=datadetail.rke' +
        'y'
      'where (1 = 1)'
      
        'and year(effectdate)=year(getdate()) and month(effectdate)=month' +
        '(getdate()) ')
    Left = 264
    Top = 32
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
