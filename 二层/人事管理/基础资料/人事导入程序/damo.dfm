object DM: TDM
  OldCreateOrder = False
  Left = 364
  Top = 153
  Height = 446
  Width = 509
  object ADOConnection1: TADOConnection
    CommandTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <>
    Left = 104
    Top = 16
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
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
      
        'join ( select rkey,employeecode,chinesename from employeemsg whe' +
        're [status]=1 '
      
        'or outdutytime  between dateadd(month,-2,getdate()) and getdate(' +
        ') ) as b'
      'on a.employeecode=b.employeecode and a.chinesename=b.chinesename'
      ''
      'update #onoffdutydata'
      'set rkey=b.rkey from #onoffdutydata a'
      'join onoffdutydata b '
      'on a.checkdate=b.checkdate '
      'and a.employeeid=b.employeeid'
      ''
      'update #onoffdutydata'
      'set classid=isnull(b.rkey,0)'
      'from  #onoffdutydata a'
      'join class b '
      'on a.classname = b.classname'
      ''
      ''
      'delete from  #onoffdutydata'
      'where rkey=0 or employeeid=0 or classid=0'
      ''
      ''
      'update onoffdutydata'
      'set classid=b.classid'
      'from onoffdutydata a'
      'join #onoffdutydata b'
      'on a.checkdate=b.checkdate '
      'and a.employeeid=b.employeeid'
      'where a.rkey in (select rkey from #onoffdutydata)'
      'and isnull(a.locked,0)<>1'
      'and isnull(a.resttype,0)<>2')
    Left = 168
    Top = 16
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      ''
      'update #onoffdutydata'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39')'
      'from #onoffdutydata'
      ''
      'update #onoffdutydata'
      'set employeeid=b.rkey '
      'from #onoffdutydata a'
      
        'join ( select rkey,employeecode,chinesename from employeemsg whe' +
        're [status]=1 '
      
        'or outdutytime  between dateadd(month,-2,getdate()) and getdate(' +
        ') ) as b'
      'on a.employeecode=b.employeecode and a.chinesename=b.chinesename'
      ''
      'update #onoffdutydata'
      'set rkey=b.rkey,locked=isnull(b.locked,0)'
      ' from #onoffdutydata a'
      'join onoffdutydata b '
      'on a.checkdate=b.checkdate '
      'and a.employeeid=b.employeeid')
    Left = 96
    Top = 96
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'tablea'
        Size = -1
        Value = Null
      end
      item
        Name = 'tableb'
        Size = -1
        Value = Null
      end
      item
        Name = 'emprkeyb'
        Size = -1
        Value = Null
      end
      item
        Name = 'tpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'tpk2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @str nvarchar(4000)'
      'declare @tablea nvarchar(50)'
      'declare @tableb nvarchar(50)'
      'declare @emp_rkey nvarchar(10)'
      'declare @tpk11 nvarchar(20)'
      'declare @tpk22 nvarchar(20)'
      'set @tablea=:tablea'
      'set @tableb=:tableb'
      'set @emp_rkey=:emprkeyb'
      'set @tpk11=:tpk1'
      'set @tpk22=:tpk2'
      
        'set @str='#39'select b.departmentname,b.employeecode,b.chinesename,a' +
        '.checkdate,resttype,'
      'a.ondutytime1,a.offdutytime1,'
      'a.ondutytime2,a.offdutytime2,'
      'a.ondutytime3,a.offdutytime3,'
      
        'ytnote,rwt,rot,sumct,sumzt,sumkt from '#39'+@tablea+'#39' a join '#39'+@tabl' +
        'eb+'#39' b'
      'on a.employeeid=b.rkey '
      'where employeeid='#39'+@emp_rkey+'#39' and checkdate '
      'between '#39'+'#39#39#39#39'+@tpk11+'#39#39#39#39'+'#39' and '#39'+'#39#39#39#39'+@tpk22+'#39#39#39#39
      'exec sp_executesql @str'
      ' ')
    Left = 104
    Top = 152
    object ADOQuery4employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery4chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery4checkdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object ADOQuery4resttype: TIntegerField
      FieldName = 'resttype'
    end
    object ADOQuery4ondutytime1: TDateTimeField
      FieldName = 'ondutytime1'
    end
    object ADOQuery4offdutytime1: TDateTimeField
      FieldName = 'offdutytime1'
    end
    object ADOQuery4ondutytime2: TDateTimeField
      FieldName = 'ondutytime2'
    end
    object ADOQuery4offdutytime2: TDateTimeField
      FieldName = 'offdutytime2'
    end
    object ADOQuery4ondutytime3: TDateTimeField
      FieldName = 'ondutytime3'
    end
    object ADOQuery4offdutytime3: TDateTimeField
      FieldName = 'offdutytime3'
    end
    object ADOQuery4ytnote: TWideStringField
      FieldName = 'ytnote'
      Size = 50
    end
    object ADOQuery4rwt: TFloatField
      FieldName = 'rwt'
    end
    object ADOQuery4rot: TFloatField
      FieldName = 'rot'
    end
    object ADOQuery4sumct: TFloatField
      FieldName = 'sumct'
    end
    object ADOQuery4sumzt: TFloatField
      FieldName = 'sumzt'
    end
    object ADOQuery4sumkt: TFloatField
      FieldName = 'sumkt'
    end
    object ADOQuery4departmentname: TStringField
      FieldName = 'departmentname'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 32
    Top = 160
  end
  object ADOQuery4_copy: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'tablea'
        Size = -1
        Value = Null
      end
      item
        Name = 'tableb'
        Size = -1
        Value = Null
      end
      item
        Name = 'emprkeya'
        Size = -1
        Value = Null
      end
      item
        Name = 'emprkeyb'
        Size = -1
        Value = Null
      end
      item
        Name = 'tpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'tpk2'
        Size = -1
        Value = Null
      end
      item
        Name = 'ytnote'
        DataType = ftString
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'declare @str nvarchar(4000)'
      'declare @tablea nvarchar(50)'
      'declare @tableb nvarchar(50)'
      'declare @emp_rkeya nvarchar(10)'
      'declare @emp_rkeyb nvarchar(10)'
      'declare @tpk11 nvarchar(20)'
      'declare @tpk22 nvarchar(20)'
      'declare @ytnote nvarchar(20)'
      'set @tablea=:tablea'
      'set @tableb=:tableb'
      'set @emp_rkeya=:emprkeya'
      'set @emp_rkeyb=:emprkeyb'
      'set @tpk11=:tpk1'
      'set @tpk22=:tpk2'
      'set @ytnote=:ytnote'
      'set @str='#39'update onoffdutydata'
      'set ondutytime1=bb.ondutytime1,'
      'offdutytime1=bb.offdutytime1,'
      'ondutytime2=bb.ondutytime2,'
      'offdutytime2=bb.offdutytime2,'
      'ondutytime3=bb.ondutytime3,'
      'offdutytime3=bb.offdutytime3,'
      'rwt=bb.rwt,rot=bb.rot,sumct=bb.sumct,'
      'sumzt=bb.sumzt,sumkt=bb.sumkt,'
      'RestType = bb.RestType,'
      'locked=1,'#9'ytnote=bb.ytnote+'#39'+'#39#39#39#39'+@ytnote+'#39#39#39#39
      '+'#39' from onoffdutydata aa join '
      
        '(select a.employeeid,b.departmentname,b.employeecode,b.chinesena' +
        'me,a.checkdate,'
      
        'a.ondutytime1,a.offdutytime1,a.ondutytime2,a.offdutytime2,RestTy' +
        'pe,'
      
        'a.ondutytime3,a.offdutytime3,ytnote,rwt,rot,sumct,sumzt,sumkt fr' +
        'om '#39
      '+@tablea+'#39' a join '#39'+@tableb+'#39' b'
      'on a.employeeid=b.rkey '
      'where employeeid='#39'+@emp_rkeyb+'#39' and checkdate '
      'between '#39'+'#39#39#39#39'+@tpk11+'#39#39#39#39'+'#39' and '#39'+'#39#39#39#39'+@tpk22+'#39#39#39#39'+'#39') '
      'as bb on aa.checkdate=bb.checkdate  '
      'where aa.employeeid='#39'+@emp_rkeya+'#39' and  aa.checkdate '
      'between '#39'+'#39#39#39#39'+@tpk11+'#39#39#39#39'+'#39' and '#39'+'#39#39#39#39'+@tpk22+'#39#39#39#39
      'exec sp_executesql @str'
      ' ')
    Left = 184
    Top = 160
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      ''
      'update #employee_station'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39'),'
      #9'str_province=replace(str_province,'#39' '#39','#39#39'),'
      '     str_station=replace(str_station,'#39' '#39','#39#39')'
      'from #employee_station'
      ''
      'update #employee_station'
      'set check_province=1 '
      'from #employee_station'
      'where str_province in '
      '(select distinct province from employeemsg where status=1)'
      'and str_province<>'#39#39
      ''
      ' '
      'update #employee_station'
      'set check_province=1 '
      'from #employee_station'
      'where str_province in '
      '(select distinct province from employeemsg where status=1)'
      'and str_province<>'#39#39
      ''
      ''
      'update #employee_station'
      'set employeeid=b.rkey'
      ' from #employee_station a'
      'join (select rkey,employeecode,chinesename '
      'from employeemsg where status=1) as b '
      'on   a.employeecode=b.employeecode'
      'and a.chinesename=b.chinesename'
      ''
      ''
      'if EXISTS (select * from datadetail where dictid=16 '
      'and item in (select str_station from #employee_station)'
      'and item <>'#39#39
      ')'
      'begin'
      'insert into datadetail(dictid,item)'
      'select  distinct 16,str_station from #employee_station'
      'where str_station not in '
      '(select item from datadetail where dictid=16)'
      'and str_station<>'#39#39
      ''
      'update #employee_station'
      'set ptr_station=b.rkey '
      'from #employee_station a'
      'join ( select rkey,dictid,item '
      'from datadetail where dictid=16 ) as b'
      'on a.str_station=b.item '
      ''
      'end'
      ''
      'update #employee_station'
      'set result_check= '
      '(case when ptr_station=0 and check_province=0 then 0'
      #9'when ptr_station<>0 and check_province=0 then 1'
      #9'when ptr_station=0 and check_province=1 then 2'
      #9'when ptr_station<>0 and check_province=1 then 3'
      #9' else 0 end)'
      'from #employee_station  where employeeid<>0')
    Left = 112
    Top = 216
  end
  object qry_checkperson: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <>
    Left = 192
    Top = 96
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'update #employee_account'
      'set employeecode=replace(employeecode,'#39' '#39','#39#39'),'
      #9'chinesename=replace(chinesename,'#39' '#39','#39#39'),'
      #9'str_sbaccount=replace(str_sbaccount,'#39' '#39','#39#39'),'
      '     str_gjjaccount=replace(str_gjjaccount,'#39' '#39','#39#39')'
      'from #employee_account'
      ''
      'update #employee_account'
      'set check_gjjaccount=1 '
      'from #employee_account'
      'where len(isnull(str_gjjaccount,'#39#39'))>0 '
      ''
      'update #employee_account'
      'set ptr_sbaccount=1 '
      'from #employee_account'
      'where len(isnull(str_sbaccount,'#39#39'))>0 '
      ''
      ''
      'update #employee_account'
      'set employeeid=b.rkey'
      ' from #employee_account a'
      'join (select rkey,employeecode,chinesename '
      'from employeemsg where status=1) as b '
      'on   a.employeecode=b.employeecode'
      'and a.chinesename=b.chinesename'
      ''
      'update #employee_account'
      'set result_check= '
      '(case when ptr_sbaccount=0 and check_gjjaccount=0 then 0'
      #9'when ptr_sbaccount<>0 and check_gjjaccount=0 then 1'
      #9'when ptr_sbaccount=0 and check_gjjaccount=1 then 2'
      #9'when ptr_sbaccount<>0 and check_gjjaccount=1 then 3'
      #9' else 0 end)'
      'from #employee_account'
      'where employeeid<>0')
    Left = 112
    Top = 280
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 288
  end
end
