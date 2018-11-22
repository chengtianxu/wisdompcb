object dm: Tdm
  OldCreateOrder = False
  Left = 659
  Top = 258
  Height = 401
  Width = 517
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 48
  end
  object ADOqry: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 10  cast ( 0 as bit) as selected,'
      'cast (b.departmentname as varchar(40)) as departmentname ,'
      'cast (b.employeecode as varchar(40)) as employeecode,'
      'cast (b.chinesename as varchar(40)) as chinesename,'
      'reqtime,cast (reqperson as varchar(40)) as reqperson ,'
      'cast (reqinfo as varchar(40)) as reqinfo,'
      'case  reqtype when 0 then cast ('#39#34917#21345#39' as varchar(40))'
      ' when 1 then  cast ('#39#35831#20551#39' as varchar(40)) '
      ' when 2 then  cast ('#39#20462#25913#24037#26102#39'as  varchar(40)) end  as  ['#20107#21153#31867#22411'],'
      'case  reqstate when 0 then cast('#39#26410#25552#20132#39'as varchar(40))'
      'when 1 then cast('#39#25552#20132#39' as varchar(40)) when 2 '
      'then cast ('#39#24050#32463#23457#26680#39' as varchar(40)) when 3 then '
      'cast ('#39#36864#22238#39' as varchar(40)) end as  ['#22788#29702#29366#24577'],'
      'dealperson,dealtime,req_starttime,req_endtime,'
      'req_cardtime,zbhour,jbhour,askforleaverk,'
      'a.rkey,employeeid,reqstate,reqtype'
      ' from req a  join v_employeemsg b on a.employeeid=b.rkey')
    Left = 120
    Top = 48
    object ADOqryselected: TBooleanField
      FieldName = 'selected'
    end
    object ADOqrydepartmentname: TStringField
      FieldName = 'departmentname'
      ReadOnly = True
      Size = 40
    end
    object ADOqryemployeecode: TStringField
      FieldName = 'employeecode'
      ReadOnly = True
      Size = 40
    end
    object ADOqrychinesename: TStringField
      FieldName = 'chinesename'
      ReadOnly = True
      Size = 40
    end
    object ADOqryreqtime: TDateTimeField
      FieldName = 'reqtime'
    end
    object ADOqryreqperson: TStringField
      FieldName = 'reqperson'
      ReadOnly = True
      Size = 40
    end
    object ADOqryreqinfo: TStringField
      FieldName = 'reqinfo'
      ReadOnly = True
      Size = 40
    end
    object ADOqryDSDesigner: TStringField
      FieldName = #20107#21153#31867#22411
      ReadOnly = True
      Size = 40
    end
    object ADOqryDSDesigner2: TStringField
      FieldName = #22788#29702#29366#24577
      ReadOnly = True
      Size = 40
    end
    object ADOqrydealperson: TWideStringField
      FieldName = 'dealperson'
    end
    object ADOqrydealtime: TDateTimeField
      FieldName = 'dealtime'
    end
    object ADOqryreq_starttime: TDateTimeField
      FieldName = 'req_starttime'
    end
    object ADOqryreq_endtime: TDateTimeField
      FieldName = 'req_endtime'
    end
    object ADOqryreq_cardtime: TDateTimeField
      FieldName = 'req_cardtime'
    end
    object ADOqryzbhour: TBCDField
      FieldName = 'zbhour'
      Precision = 8
      Size = 2
    end
    object ADOqryjbhour: TBCDField
      FieldName = 'jbhour'
      Precision = 8
      Size = 2
    end
    object ADOqryaskforleaverk: TIntegerField
      FieldName = 'askforleaverk'
    end
    object ADOqryrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOqryemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOqryreqstate: TIntegerField
      FieldName = 'reqstate'
    end
    object ADOqryreqtype: TIntegerField
      FieldName = 'reqtype'
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 432
    Top = 40
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOqry
    Options = [poAllowCommandText]
    Left = 184
    Top = 48
  end
  object cds1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select   cast ( 0 as bit) as selected,'#13#10'cast (b.departmentname a' +
      's varchar(20)) as departmentname ,'#13#10'cast (b.employeecode as varc' +
      'har(20)) as employeecode,'#13#10'cast (b.chinesename as varchar(20)) a' +
      's chinesename,'#13#10'reqtime,cast (reqperson as varchar(20)) as reqpe' +
      'rson ,'#13#10'cast (reqinfo as varchar(20)) as reqinfo,'#13#10'case  reqtype' +
      ' when 0 then cast ('#39#34917#21345#39' as varchar(20))'#13#10' when 1 then  cast ('#39#35831#20551 +
      #39' as varchar(20)) '#13#10' when 2 then  cast ('#39#20462#25913#24037#26102#39'as  varchar(20)) e' +
      'nd  as  ['#20107#21153#31867#22411'],'#13#10'case  reqstate when 0 then cast('#39#26410#25552#20132#39'as varchar' +
      '(20))'#13#10'when 1 then cast('#39#25552#20132#39' as varchar(20)) when 2 '#13#10'then cast ' +
      '('#39#24050#32463#23457#26680#39' as varchar(20)) when 3 then '#13#10'cast ('#39#36864#22238#39' as varchar(20))' +
      ' end as  ['#22788#29702#29366#24577'],'#13#10'dealperson,dealtime,req_starttime,req_endtime,' +
      #13#10'req_cardtime,zbhour,jbhour,askforleaverk,'#13#10'a.rkey,employeeid,r' +
      'eqstate,reqtype'#13#10' from req a  join v_employeemsg b on a.employee' +
      'id=b.rkey'#13#10'where 1=1'#13#10
    Filtered = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 248
    Top = 48
    object cds1selected: TBooleanField
      FieldName = 'selected'
    end
    object cds1departmentname: TStringField
      FieldName = 'departmentname'
      ReadOnly = True
      Size = 40
    end
    object cds1employeecode: TStringField
      FieldName = 'employeecode'
      ReadOnly = True
      Size = 40
    end
    object cds1chinesename: TStringField
      FieldName = 'chinesename'
      ReadOnly = True
      Size = 40
    end
    object cds1reqtime: TDateTimeField
      FieldName = 'reqtime'
      ReadOnly = True
    end
    object cds1reqperson: TStringField
      FieldName = 'reqperson'
      ReadOnly = True
      Size = 40
    end
    object cds1reqinfo: TStringField
      FieldName = 'reqinfo'
      ReadOnly = True
      Size = 40
    end
    object cds1CDSDesigner: TStringField
      FieldName = #20107#21153#31867#22411
      ReadOnly = True
      Size = 40
    end
    object cds1CDSDesigner2: TStringField
      FieldName = #22788#29702#29366#24577
      ReadOnly = True
      Size = 40
    end
    object cds1dealperson: TWideStringField
      FieldName = 'dealperson'
      ReadOnly = True
    end
    object cds1dealtime: TDateTimeField
      FieldName = 'dealtime'
      ReadOnly = True
    end
    object cds1req_starttime: TDateTimeField
      FieldName = 'req_starttime'
      ReadOnly = True
    end
    object cds1req_endtime: TDateTimeField
      FieldName = 'req_endtime'
      ReadOnly = True
    end
    object cds1req_cardtime: TDateTimeField
      FieldName = 'req_cardtime'
      ReadOnly = True
    end
    object cds1zbhour: TBCDField
      FieldName = 'zbhour'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object cds1reqtype: TIntegerField
      FieldName = 'reqtype'
      ReadOnly = True
    end
    object cds1jbhour: TBCDField
      FieldName = 'jbhour'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object cds1askforleaverk: TIntegerField
      FieldName = 'askforleaverk'
      ReadOnly = True
    end
    object cds1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds1employeeid: TIntegerField
      FieldName = 'employeeid'
      ReadOnly = True
    end
    object cds1reqstate: TIntegerField
      FieldName = 'reqstate'
      ReadOnly = True
    end
  end
  object qry_adupro: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'req_rkey'
        Size = -1
        Value = Null
      end
      item
        Name = 'req_type'
        Size = -1
        Value = Null
      end
      item
        Name = 'oper_rkey'
        Size = -1
        Value = Null
      end
      item
        Name = 'oper_name'
        DataType = ftString
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      'declare @req_rkey int'
      'declare @reqtype int'
      'declare @oper_rkey  int'
      'declare @oper_name nvarchar(20)'
      ''
      'set @req_rkey =:req_rkey'
      'set  @reqtype=:req_type'
      'set @oper_rkey=:oper_rkey'
      'set @oper_name=:oper_name'
      ''
      ''
      'if @reqtype=0'
      'begin'
      ''
      ' insert into OriginalCheckData'
      
        #9'(employeecard,card_time,date_e,time_e,dev_id,employeeid,classid' +
        ','
      #9'signdesc,querysign,remark)'
      #9'select b.employeecode,a.req_cardtime,'
      #9'substring(convert (nvarchar(20),req_cardtime,120),1,10),'
      #9'substring(convert (nvarchar(20),req_cardtime,120),12,8),'
      #9'0,a.employeeid,0,0,0,'#39#25163#24037#34917#21345#39
      #9'from '
      
        #9'(select * from req where rkey=@req_rkey  and reqtype=@reqtype) ' +
        ' as  a join employeemsg b  '
      #9'on a.employeeid=b.rkey'
      'end'
      ''
      'if @reqtype=1'
      'begin'
      ' insert into AskLeaveRegister'
      
        #9'(employeeid,leavetype,startdate,starttime,enddate,endtime,regis' +
        'terman,'
      #9'leavereason,remark,makedate,curstatus)'
      #9'select a.employeeid,a.askforleaverk,'
      
        '    convert(datetime,convert (nvarchar(20),a.req_starttime,23),1' +
        '20),'
      '     a.req_starttime,'
      'convert (datetime,convert(nvarchar(20),a.req_endtime,23),120),'
      '    a.req_endtime,@oper_rkey,reqinfo,reqinfo,getdate(),1'
      #9'from '
      
        #9'(select  * from req where  rkey=@req_rkey and reqtype=@reqtype ' +
        ')  as  a join employeemsg b  '
      #9'on a.employeeid=b.rkey'
      'end'
      ''
      'if @reqtype=2 '
      'begin'
      ''
      'update onoffdutydata'
      
        'set rwt=isnull((select zbhour from req where rkey=@req_rkey and ' +
        'reqtype=@reqtype ),0),'
      
        'rot=isnull((select jbhour from req where rkey=@req_rkey and reqt' +
        'ype=@reqtype),0),'
      'yt=1,ytnote='#39#20462#25913#24037#26102#39','
      'locked=1,ct1=0,ct2=0,ct3=0,kt1=0,'
      'kt2=0,kt3=0,zt1=0,zt2=0,zt3=0,sumct=0, sumzt=0, sumkt=0'
      'from onoffdutydata '
      
        'where checkdate=(select  convert(datetime,convert (nvarchar(20),' +
        ' req_cardtime,23),120) from req where reqtype=2 and rkey=@req_rk' +
        'ey )'
      
        'and employeeid= (select employeeid from req where rkey=@req_rkey' +
        ' and reqtype=@reqtype ) '
      ''
      'end'
      ''
      
        'update req set reqstate=2,dealperson=@oper_name ,dealtime=getdat' +
        'e()'
      'from req where rkey=@req_rkey')
    Left = 208
    Top = 216
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 256
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'd1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        ' select empmsg.employeecode,empmsg.chinesename,empmsg.department' +
        'name'
      #9',count(req.rkey) as total'
      
        #9',case when count(req.rkey)-3 >0 then count(req.rkey)-3 else 0 e' +
        'nd as ChaoCount'
      
        #9',(case when count(req.rkey)-3 >0 then count(req.rkey)-3 else 0 ' +
        'end) * 10 as Pays  '
      
        ' from req  join v_employeemsg empmsg  on req.employeeid=empmsg.r' +
        'key'
      
        ' where ReqType = 0 and reqstate = 2 and req_cardtime between :d1' +
        '  and :d2'
      
        ' group by empmsg.employeecode,empmsg.chinesename,empmsg.departme' +
        'ntname'
      
        ' having  (case when count(req.rkey)-3 >0 then count(req.rkey)-3 ' +
        'else 0 end) > 0')
    Left = 48
    Top = 152
    object qry1employeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object qry1chinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object qry1departmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
      ReadOnly = True
    end
    object qry1total: TIntegerField
      DisplayLabel = #26376#34917#21345#24635#27425#25968
      FieldName = 'total'
      ReadOnly = True
    end
    object qry1ChaoCount: TIntegerField
      DisplayLabel = #36229#34917#21345#27425#25968
      FieldName = 'ChaoCount'
      ReadOnly = True
    end
    object qry1Pays: TIntegerField
      DisplayLabel = #24212#25187#65288#20803#65289
      FieldName = 'Pays'
      ReadOnly = True
    end
  end
  object ds2: TDataSource
    DataSet = qry1
    Left = 120
    Top = 152
  end
end
