object DM: TDM
  OldCreateOrder = False
  Left = 354
  Top = 148
  Height = 541
  Width = 439
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 20
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 228
    Top = 16
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select  a.employeecode,d.departmentname,a.chinesename,'#13#10'a.onduty' +
      'time,a.outdutytime,salaryaccount.accountname as accountname,'#13#10'e.' +
      'item as position_item from employeemsg a join '#13#10'(select employee' +
      'id,accountid from employeesalary where yearmonth= substring(conv' +
      'ert( nvarchar(20),:startDate,120),1,7))as b'#13#10'on  a.rkey=b.employ' +
      'eeid '#13#10'join salaryaccount on b.accountid=salaryaccount.rkey'#13#10'joi' +
      'n datadepartment d on a.departmentid=d.rkey'#13#10'join datadetail e o' +
      'n a.position=e.rkey'#13#10'where a.attendance=1 and  '#13#10'(a.outdutytime ' +
      'is null or a.outdutytime>=:startDate )'#13#10'     and  a.ondutytime<=' +
      ':endDate'#13#10'and a.departmentid in '#13#10'  (  select departmentid from ' +
      'hr_permission '#13#10' where operator_ptr=:rkey73 and '#13#10'  program_ptr=' +
      '(select rkey from data0419 where programe='#39'WorktimeReport.exe'#39'))' +
      #13#10'order by d.departmentname,a.employeecode'
    Parameters = <
      item
        Name = 'startDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'startDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'endDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey73'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 144
    Top = 16
    object ADODataSet1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADODataSet1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADODataSet1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADODataSet1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADODataSet1outdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object ADODataSet1accountname: TWideStringField
      FieldName = 'accountname'
      ReadOnly = True
      Size = 50
    end
    object ADODataSet1position_item: TStringField
      FieldName = 'position_item'
    end
  end
  object DataSource2: TDataSource
    DataSet = onoffdutydata_T
    Left = 224
    Top = 80
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 144
    Top = 80
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'select '#13#10' '#37096#38376','#24037#21495', '#22995#21517','#32844#21153', ['#24080#22871'],'#13#10'"1'#26085'" , "2'#26085'", "3'#26085'", "4'#26085'","5'#26085'", "6'#26085 +
      '","7'#26085'", "8'#26085'", "9'#26085'","10'#26085'",'#13#10'"11'#26085'", "12'#26085'", "13'#26085'","14'#26085'", "15'#26085'","16'#26085 +
      '","17'#26085'", "18'#26085'", "19'#26085'", "20'#26085'",'#13#10' "21'#26085'", "22'#26085'","23'#26085'","24'#26085'", "25'#26085'",' +
      ' "26'#26085'", "27'#26085'", "28'#26085'", "29'#26085'", "30'#26085'", "31'#26085'",'#13#10#21407#27491#29677#22825' as  '#21407#27491#29677#20986#21220#22825' ,'#26376#35745#21010 +
      #20986#21220#22825', '#27861#23450#20551#22825','#13#10' case when ['#24080#22871'] ='#39#26085#34218#24080#39'  then ( case when (['#27491#29677#20986#21220#22825']-['#26376 +
      #35745#21010#20986#21220#22825']) >=0  then ['#26376#35745#21010#20986#21220#22825']  else  ['#27491#29677#20986#21220#22825']  end )'#13#10' else (case wh' +
      'en (['#27491#29677#20986#21220#22825']-['#26376#35745#21010#20986#21220#22825']) >=0  then ['#26376#35745#21010#20986#21220#22825']  else  ['#27491#29677#20986#21220#22825']  end ) e' +
      'nd + ['#27861#23450#20551#22825']  as  '#20998#26512#35745#31639#21518#27491#29677#22825','#13#10'[ '#26631#35782#21608#26411#22825#25968'] as  ['#20998#26512#21518#21608#26411#22825'],'#30333', '#22812','#20241#24687#22825','#24179#26102#21152#29677 +
      #23567#26102', '#13#10'case when (['#24080#22871'] ='#39#26085#34218#24080#39' and isnull(position,0) not in (231,' +
      '528))'#13#10'then '#13#10'('#13#10'['#26376#35745#21010#20986#21220#22825'] * '#13#10'( case when isnull(position,0) '#13#10#9 +
      'in (36,37,38,39,40,115,117) '#13#10#9'then 4.0 else 3.0 end) '#9'+  '#13#10'(cas' +
      'e when ['#22812']>['#26376#35745#21010#20986#21220#22825'] '#9'then ['#26376#35745#21010#20986#21220#22825'] else ['#22812'] end) *'#13#10#9'(case when ' +
      'isnull(position,0) '#13#10#9'in (36,37,38,39,40,115,117) '#13#10#9'then 0 else' +
      ' 0.5 end)'#13#10' )'#13#10'else 0 end'#13#10'as ['#26376#24179#26102#21152#29677#23567#26102#21442#32771#20540'],'#13#10'case when ['#24080#22871'] ='#39#26085#34218 +
      #24080#39' then '#13#10' ['#24179#26102#21152#29677#23567#26102'] else 0  end  as  ['#20998#26512#35745#31639#24179#26102#21152#29677#23567#26102'],'#13#10#21608#26411#21152#29677#23567#26102','#13#10'cas' +
      'e when ['#24080#22871'] ='#39#26085#34218#24080#39' then '#13#10'['#21608#26411#21152#29677#23567#26102'] else 0 end  as ['#20998#26512#35745#31639#21608#26411#21152#29677#23567#26102'] ,' +
      #13#10' '#33410#20551#21152#29677#23567#26102','#24180#20551#23567#26102', '#36831#21040',  '#26089#36864',  '#26103#24037#13#10'from '#13#10'( select '#13#10'departmentname a' +
      's '#37096#38376',employeecode as '#24037#21495',chinesename as '#22995#21517',position,position_item' +
      ' as '#32844#21153','#13#10'accountname as '#24080#22871',sum(isnull([1],0))as "1'#26085'" ,sum(isnull' +
      '([2],0)) as "2'#26085'",'#13#10'sum(isnull([3],0))as "3'#26085'",sum(isnull([4],0))a' +
      's "4'#26085'",sum(isnull([5],0))as "5'#26085'",'#13#10'sum(isnull([6],0))as "6'#26085'",sum' +
      '(isnull([7],0))as "7'#26085'",sum(isnull([8],0))as "8'#26085'",'#13#10'sum(isnull([9' +
      '],0))as "9'#26085'",sum(isnull([10],0))as "10'#26085'",sum(isnull([11],0))as "' +
      '11'#26085'",'#13#10'sum(isnull([12],0))as "12'#26085'",sum(isnull([13],0))as "13'#26085'",s' +
      'um(isnull([14],0))as "14'#26085'",'#13#10'sum(isnull([15],0))as "15'#26085'",sum(isn' +
      'ull([16],0))as "16'#26085'",sum(isnull([17],0))as "17'#26085'",'#13#10'sum(isnull([1' +
      '8],0))as "18'#26085'",sum(isnull([19],0))as "19'#26085'",sum(isnull([20],0))as' +
      ' "20'#26085'",'#13#10'sum(isnull([21],0))as "21'#26085'",sum(isnull([22],0))as "22'#26085'"' +
      ',sum(isnull([23],0))as "23'#26085'",'#13#10'sum(isnull([24],0))as "24'#26085'",sum(i' +
      'snull([25],0))as "25'#26085'",sum(isnull([26],0))as "26'#26085'",'#13#10'sum(isnull(' +
      '[27],0))as "27'#26085'",sum(isnull([28],0))as "28'#26085'",sum(isnull([29],0))' +
      'as "29'#26085'",'#13#10'sum(isnull([30],0))as "30'#26085'",sum(isnull([31],0))as "31' +
      #26085'",sum(workday) as '#27491#29677#20986#21220#22825','#13#10'sum(festival) as '#27861#23450#20551#22825',sum(orginal_wor' +
      'kday) as '#21407#27491#29677#22825',sum(week_workday) as [ '#26631#35782#21608#26411#22825#25968'],'#13#10'dbo.Get_workdays(' +
      'employeecode, :tstartDate, :tendDate ) as ['#26376#35745#21010#20986#21220#22825'],'#13#10'sum(work1_d' +
      'ay) as ['#30333'],sum(work1_night) as ['#22812'],sum(restday) as '#20241#24687#22825',sum(work2' +
      ') as '#21152#29677#23567#26102','#13#10'sum(work3) as '#24179#26102#21152#29677#23567#26102',sum(work4) as '#21608#26411#21152#29677#23567#26102',sum(work10' +
      ') as '#33410#20551#21152#29677#23567#26102','#13#10'sum(yearj) as '#24180#20551#23567#26102',sum(SumCT) as '#36831#21040',sum(SumZT)  as' +
      '  '#26089#36864',sum(SumKT) as  '#26103#24037#13#10'from'#13#10'(select departmentname,employeecod' +
      'e,chinesename,position,position_item,outduty_flag,accountname,wo' +
      'rkday,festival,'#13#10'restday,work1,work2,work3,work4,work10,yearj,Su' +
      'mCT,SumZT,SumkT,work1_day,work1_night,orginal_workday,week_workd' +
      'ay,'#13#10'[1] as "1",[2] as "2",[3] as "3",[4] as "4",[5] as "5",'#13#10'[6' +
      '] as "6",[7] as "7",[8] as "8",[9] as "9",[10] as "10",'#13#10'[11] as' +
      ' "11",[12] as "12",[13] as "13",[14] as "14",[15] as "15",'#13#10'[16]' +
      ' as "16",[17] as "17",[18] as "18",[19] as "19",[20] as "20",'#13#10'[' +
      '21] as "21",[22] as "22",[23] as "23",[24] as "24",[25] as "25",' +
      #13#10'[26] as "26",[27] as "27",[28] as "28",[29] as "29",[30] as "3' +
      '0",'#13#10'[31] as "31"'#13#10' from'#13#10'(select  *  from v_onoffduty_report '#13#10 +
      'where checkdate  between :startDate and :endDate  and 1=1  ) as ' +
      't'#13#10'pivot'#13#10'( sum(RWTROT) for ['#26085'] '#13#10'   in ( [1],[2],[3],[4],[5],[6' +
      '],[7],[8],[9],[10],[11],[12],[13],[14],[15],'#13#10'        [16],[17],' +
      '[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30]' +
      ',[31] )'#13#10') as ttt'#13#10') as tttt '
    Parameters = <
      item
        Name = 'tstartDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'tendDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'startDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'endDate'
        Size = -1
        Value = Null
      end>
    Left = 144
    Top = 144
  end
  object ADOTMP: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 144
    Top = 216
  end
  object ADOTIME: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select cast('
      'cast (datepart(year,getdate()) as nvarchar(20))+'#39'-'#39
      '+cast (datepart(month,getdate()) as nvarchar(20))+'#39'-01'#39
      'as datetime) as time1,'
      
        'cast(substring(convert(nvarchar(20),getdate(),120),1,10) as date' +
        'time)'
      '    as time2')
    Left = 144
    Top = 272
  end
  object onoffduty_create: TADOQuery
    Connection = ADOConn
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'if exists (select * from tempdb.dbo.sysobjects '
      'where id = object_id(N'#39'tempdb..#onoffdutydata_total'#39') '
      'and type='#39'U'#39')'
      'drop table #onoffdutydata_total'
      'CREATE TABLE  #onoffdutydata_total('
      #9'['#37096#38376'] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,'
      #9'['#24037#21495'] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,'
      #9'['#22995#21517'] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,'
      #9'['#32844#21153'] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,'
      #9'['#24080#22871'] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,'
      #9'[1'#26085'] [float] NULL,'#9'[2'#26085'] [float] NULL,'
      #9'[3'#26085'] [float] NULL,'#9'[4'#26085'] [float] NULL,'
      #9'[5'#26085'] [float] NULL,'#9'[6'#26085'] [float] NULL,'
      #9'[7'#26085'] [float] NULL,'#9'[8'#26085'] [float] NULL,'
      #9'[9'#26085'] [float] NULL,'#9'[10'#26085'] [float] NULL,'
      #9'[11'#26085'] [float] NULL,'#9'[12'#26085'] [float] NULL,'
      #9'[13'#26085'] [float] NULL,'#9'[14'#26085'] [float] NULL,'
      #9'[15'#26085'] [float] NULL,'#9'[16'#26085'] [float] NULL,'
      #9'[17'#26085'] [float] NULL,'#9'[18'#26085'] [float] NULL,'
      #9'[19'#26085'] [float] NULL,'#9'[20'#26085'] [float] NULL,'
      #9'[21'#26085'] [float] NULL,'#9'[22'#26085'] [float] NULL,'#9
      #9'[23'#26085'] [float] NULL,'#9'[24'#26085'] [float] NULL,'
      #9'[25'#26085'] [float] NULL,'#9'[26'#26085'] [float] NULL,'
      #9'[27'#26085'] [float] NULL,'#9'[28'#26085'] [float] NULL,'
      #9'[29'#26085'] [float] NULL,'#9'[30'#26085'] [float] NULL,'
      #9'[31'#26085'] [float] NULL,'#9'['#21407#27491#29677#20986#21220#22825'] [numeric](38, 1) NULL,'
      '        ['#27491#29677#20986#21220#22825'][numeric](38, 1) NULL,'
      #9'['#26376#35745#21010#20986#21220#22825'] [float] NULL,'#9'['#27861#23450#20551#22825'] [numeric](38, 1) NULL,'
      #9'['#20998#26512#35745#31639#21518#27491#29677#22825'] [float] NULL,'#9'['#20998#26512#21518#21608#26411#22825'] [numeric](38, 1) NULL,'
      #9'['#30333'] [float] NULL,'#9'['#22812'] [float] NULL,'
      #9'['#20241#24687#22825'] [float] NULL,'#9'['#24179#26102#21152#29677#23567#26102'] [float] NULL,'
      #9'['#26376#24179#26102#21152#29677#23567#26102#21442#32771#20540'] [float] NULL,'#9'['#20998#26512#35745#31639#24179#26102#21152#29677#23567#26102'] [float] NULL,'
      #9'['#21608#26411#21152#29677#23567#26102'] [float] NULL,'#9'['#20998#26512#35745#31639#21608#26411#21152#29677#23567#26102'] [float] NULL,'
      #9'['#33410#20551#21152#29677#23567#26102'] [float] NULL,'#9'['#24180#20551#23567#26102'] [int] NULL,'
      #9'['#36831#21040'] [float] NULL,'#9'['#26089#36864'] [float] NULL,'
      #9'['#26103#24037'] [float] NULL,'
      '        [outduty_flag] [int] NULL )  ')
    Left = 32
    Top = 336
  end
  object employee_list_create: TADOQuery
    Connection = ADOConn
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'if exists (select * from tempdb.dbo.sysobjects '
      'where id = object_id(N'#39'tempdb..#temp_employeecode'#39') '
      'and type='#39'U'#39')'
      'drop table #temp_employeecode'
      'create table #temp_employeecode(employeecode nvarchar(20))')
    Left = 144
    Top = 336
  end
  object onoffduty_show: TADOQuery
    Connection = ADOConn
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'dpkt1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dpkt2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      'declare @employeecode nvarchar(20)'
      'declare @begindate datetime'
      'declare @enddate datetime'
      'set @begindate=:dpkt1'
      'set @enddate=:dpkt2'
      ''
      'declare cur_onoffduty cursor'
      'for select employeecode from #temp_employeecode'
      'open cur_onoffduty'
      'fetch next from cur_onoffduty into @employeecode'
      'while @@fetch_status=0'
      'begin'
      ''
      
        'insert into  #onoffdutydata_total('#37096#38376','#24037#21495','#22995#21517','#32844#21153','#24080#22871',[1'#26085'],[2'#26085'],[3'#26085'],' +
        '[4'#26085'],'
      '[5'#26085'],[6'#26085'],[7'#26085'],[8'#26085'],[9'#26085'],[10'#26085'],[11'#26085'],[12'#26085'],[13'#26085'],[14'#26085'],[15'#26085'],'
      '[16'#26085'],[17'#26085'],[18'#26085'],[19'#26085'],[20'#26085'],[21'#26085'],[22'#26085'],[23'#26085'],[24'#26085'],'
      '[25'#26085'],[26'#26085'],[27'#26085'],[28'#26085'],[29'#26085'],[30'#26085'],[31'#26085'])'
      ' select * from '
      ' ( select '
      
        ' distinct top 1 departmentname,employeecode,chinesename,position' +
        '_item,accountname'
      ' from v_onoffduty_report '
      'where checkdate  between  @begindate and @enddate'
      'and employeecode = @employeecode) as a ,'
      '('
      'select * from '
      ' ( select   '#26085',rwtrot from v_onoffduty_report '
      'where checkdate  between  @begindate and @enddate'
      'and employeecode = @employeecode ) as tt'
      'pivot'
      '( sum(RWTROT) for ['#26085'] '
      
        '   in ( [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],' +
        '[14],[15],'
      
        '        [16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[' +
        '27],[28],[29],[30],[31] )'
      ')as  ttt'
      ' ) as b'
      ''
      ''
      ''
      'update #onoffdutydata_total'
      'set ['#21407#27491#29677#20986#21220#22825']=orginal_workday,'#9
      #9'['#27861#23450#20551#22825']=festival,'
      '    ['#27491#29677#20986#21220#22825']=workday,'
      '    ['#20998#26512#21518#21608#26411#22825']=week_workday,'
      #9'['#30333']=work1_day,'#9
      '    ['#22812']=work1_night,'
      #9'['#20241#24687#22825']=restday,'
      '    ['#24179#26102#21152#29677#23567#26102']=work3,'
      #9'['#26376#24179#26102#21152#29677#23567#26102#21442#32771#20540']=0,'#9
      '    ['#20998#26512#35745#31639#24179#26102#21152#29677#23567#26102']=work3,'
      #9'['#21608#26411#21152#29677#23567#26102']=work4,'
      '    ['#20998#26512#35745#31639#21608#26411#21152#29677#23567#26102']=work4,'
      #9'['#33410#20551#21152#29677#23567#26102']=work10,'#9
      '    ['#24180#20551#23567#26102']=yearj,'
      #9'['#36831#21040']=SumCT,'
      '    ['#26089#36864']=SumzT,'
      #9'['#26103#24037']=SumkT'
      '  from #onoffdutydata_total a '
      '    join '
      '( select  employeecode,'
      'sum(isnull(orginal_workday,0)) as orginal_workday,'
      'sum(isnull(festival,0)) as festival,'
      'sum(isnull(workday,0)) as workday,'
      'sum(isnull(week_workday,0))as week_workday,'
      'sum(isnull(work1_day,0))as work1_day,'
      'sum(isnull(work1_night,0))as work1_night,'
      'sum(isnull(restday,0))as restday,'
      'sum(isnull(work3,0))as work3,'
      'sum(isnull(work4,0))as work4,'
      'sum(isnull(work10,0))as work10,'
      'sum(isnull(yearj,0))as yearj,'
      'sum(isnull(SumCT,0))as SumCT,'
      'sum(isnull(SumzT,0))as SumzT,'
      'sum(isnull(SumkT,0))as SumkT'
      
        'from v_onoffduty_report  where checkdate  between  @begindate an' +
        'd @enddate '
      'and employeecode=@employeecode'
      'group by employeecode  ) b '
      '  on a.'#24037#21495'=b.employeecode'
      ''
      'update #onoffdutydata_total'
      'set ['#26376#35745#21010#20986#21220#22825']=dbo.Get_workdays(['#24037#21495'],@begindate,@enddate)'
      'from #onoffdutydata_total '
      'where ['#24037#21495']=@employeecode'
      '  '
      'fetch next from cur_onoffduty'
      'into  @employeecode'
      ''
      'end'
      ''
      'CLOSE cur_onoffduty'
      'DEALLOCATE cur_onoffduty'
      ''
      'update #onoffdutydata_total'
      'set ['#20998#26512#35745#31639#21518#27491#29677#22825']='
      
        'case when ['#24080#22871'] in('#39#26085#34218#24080#39','#39#26376#34218#21152#29677#39')  then ( case when (['#21407#27491#29677#20986#21220#22825']-['#26376#35745#21010 +
        #20986#21220#22825']) >=0 '
      ' then ['#26376#35745#21010#20986#21220#22825']  else  ['#27491#29677#20986#21220#22825'] end )'
      ' else (case when (['#27491#29677#20986#21220#22825']-['#26376#35745#21010#20986#21220#22825']) >=0  then ['#26376#35745#21010#20986#21220#22825'] '
      ' else  ['#27491#29677#20986#21220#22825']  end ) end + ['#27861#23450#20551#22825']'
      'from #onoffdutydata_total'
      ''
      'update #onoffdutydata_total'
      'set ['#20998#26512#21518#21608#26411#22825']=0,'
      '    ['#24179#26102#21152#29677#23567#26102']=0,'
      '    ['#26376#24179#26102#21152#29677#23567#26102#21442#32771#20540']=0,'
      '    ['#20998#26512#35745#31639#24179#26102#21152#29677#23567#26102']=0,'
      '    ['#21608#26411#21152#29677#23567#26102']=0,'
      '    ['#20998#26512#35745#31639#21608#26411#21152#29677#23567#26102']=0'
      'from #onoffdutydata_total'
      'where  ['#24080#22871'] not  in('#39#26085#34218#24080#39','#39#26376#34218#21152#29677#39')'
      ''
      ''
      'update #onoffdutydata_total'
      'set [outduty_flag]= 0'
      'from #onoffdutydata_total'
      ''
      ''
      'update #onoffdutydata_total'
      'set [outduty_flag]= 1'
      'from #onoffdutydata_total'
      'where ['#24037#21495'] in ('
      'select ['#24037#21495'] from #onoffdutydata_total a join employeemsg b'
      'on ['#24037#21495']=b.employeecode and b.status=2)'
      '')
    Left = 256
    Top = 336
  end
  object onoffdutydata_T: TADOQuery
    Connection = ADOConn
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'select '#37096#38376','#24037#21495','#22995#21517','#32844#21153','#24080#22871',[1'#26085'],'
      '[2'#26085'],[3'#26085'],[4'#26085'],[5'#26085'],[6'#26085'],[7'#26085'],[8'#26085'],[9'#26085'],[10'#26085'],'
      '[11'#26085'],[12'#26085'],[13'#26085'],[14'#26085'],[15'#26085'],[16'#26085'],[17'#26085'],[18'#26085'],'
      '[19'#26085'],[20'#26085'],[21'#26085'],[22'#26085'],[23'#26085'],[24'#26085'],[25'#26085'],[26'#26085'],'
      '[27'#26085'],[28'#26085'],[29'#26085'],[30'#26085'],[31'#26085'],'#21407#27491#29677#20986#21220#22825','
      #26376#35745#21010#20986#21220#22825','#27861#23450#20551#22825','#20998#26512#35745#31639#21518#27491#29677#22825','
      #20998#26512#21518#21608#26411#22825','#30333','#22812','#20241#24687#22825','#24179#26102#21152#29677#23567#26102','
      #26376#24179#26102#21152#29677#23567#26102#21442#32771#20540','#20998#26512#35745#31639#24179#26102#21152#29677#23567#26102','
      #21608#26411#21152#29677#23567#26102','#20998#26512#35745#31639#21608#26411#21152#29677#23567#26102','
      #33410#20551#21152#29677#23567#26102','#24180#20551#23567#26102','#36831#21040','#26089#36864','#26103#24037' from #onoffdutydata_total where 1=1')
    Left = 256
    Top = 408
  end
end
