object DM: TDM
  OldCreateOrder = False
  Left = 433
  Top = 254
  Height = 277
  Width = 404
  object con1: TADOConnection
    CommandTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 32
  end
  object qry_temp: TADOQuery
    Connection = con1
    CommandTimeout = 0
    Parameters = <>
    Left = 208
    Top = 96
  end
  object qry_Class: TADOQuery
    Connection = con1
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'update #onoffdutydata'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39')'
      'from #onoffdutydata'
      ''
      'update #onoffdutydata'
      'set employeeid=b.rkey '
      'from #onoffdutydata a'
      'join employeemsg b'
      
        'on a.employeecode=b.employeecode --and a.chinesename=b.chinesena' +
        'me'
      ''
      '--update #onoffdutydata'
      '--set rkey=b.rkey from #onoffdutydata a'
      '--join onoffdutydata b '
      '--on a.checkdate=b.checkdate '
      '--and a.employeeid=b.employeeid'
      ''
      'update #onoffdutydata'
      'set classid=isnull(b.rkey,0)'
      'from  #onoffdutydata a'
      'left join  class b on a.classname = b.classname'
      ''
      ''
      'delete from  #onoffdutydata'
      'where  employeeid=0 or classid=0'
      ''
      ''
      'update onoffdutydata'
      'set classid=b.classid'
      'from onoffdutydata a'
      'join #onoffdutydata b'
      'on a.checkdate=b.checkdate '
      'and a.employeeid=b.employeeid'
      '--where  '
      ' -- isnull(a.locked,0)<>1'
      '--and isnull(a.resttype,0)<>2')
    Left = 208
    Top = 24
  end
  object qry_LClass: TADOQuery
    Connection = con1
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'update #onoffdutydata'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39')'
      'from #onoffdutydata'
      ''
      'update #onoffdutydata'
      'set employeeid=b.rkey '
      'from #onoffdutydata a'
      'join employeemsg b'
      
        'on a.employeecode=b.employeecode --and a.chinesename=b.chinesena' +
        'me'
      ''
      '--update #onoffdutydata'
      '--set rkey=b.rkey from #onoffdutydata a'
      '--join onoffdutydata b '
      '--on a.checkdate=b.checkdate '
      '--and a.employeeid=b.employeeid'
      ''
      'delete from  #onoffdutydata'
      'where   employeeid=0 '
      ''
      ''
      'update onoffdutydata'
      'set resttype=b.resttype'
      'from onoffdutydata a'
      'join #onoffdutydata b'
      'on a.checkdate=b.checkdate '
      'and a.employeeid=b.employeeid')
    Left = 288
    Top = 56
  end
  object qry_holiday: TADOQuery
    Connection = con1
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'update #holiday'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39')'
      'from #holiday'
      ' '
      'update a set employeeid= b.rkey, a.RManID=d.rkey, a.LTID=c.rkey'
      'from #holiday a '
      
        'inner join employeemsg b on a.employeecode=b.employeecode and a.' +
        'chinesename=b.chinesename'
      'inner join AskForLeave c on  a.leavetype=c.leavetype '
      'inner join data0005 d on a.Rman=d.EMPLOYEE_NAME'
      ''
      ''
      ' update a  set  leavetype=b.LTID,leavereason=b.leavereason'
      ' from  #holiday  b '
      
        ' inner join  AskLeaveRegister a on  b.employeeid=a.employeeid an' +
        'd b.startdate=a.starttime and  b.enddate=a.endtime'
      ' '
      ''
      
        'insert into AskLeaveRegister(employeeid,leavetype,startdate,star' +
        'ttime,enddate,endtime,RegisterMan,leavereason,CurStatus,makedate' +
        ')'
      
        ' select employeeid,LTID, convert(varchar(10),startdate,120),conv' +
        'ert(varchar(10),startdate,120)+'#39' '#39'+convert(varchar(10),startdate' +
        ',108),'
      
        '  convert(varchar(10),enddate,120),convert(varchar(10),enddate,1' +
        '20)+'#39' '#39'+convert(varchar(10),enddate,108),'
      '  RManid,leavereason,1,getdate()'
      ' from #holiday  b '
      ' where not exists('
      
        ' select rkey from  AskLeaveRegister a  where b.employeeid=a.empl' +
        'oyeeid and b.startdate=a.starttime and  b.enddate=a.endtime)')
    Left = 312
    Top = 176
  end
end
