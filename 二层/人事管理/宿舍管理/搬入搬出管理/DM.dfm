object damo: Tdamo
  OldCreateOrder = False
  Left = 366
  Top = 327
  Height = 376
  Width = 517
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 104
    Top = 16
  end
  object qry2: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select Bedroommsg.[rkey] ,Dormitorymsg.rkey,employeemsg_extra.rk' +
        'ey,[dormitoryid],[R_code],[bedcount],[floor],Bedroommsg.R_name,'
      
        ' case when type=0 then '#39#22899#39' when type=1 then '#39#30007#39' when type=2 then' +
        ' '#39#23478#24237#39' end type, [grade],[monitor],'
      
        'employeemsg_extra.chinesename,[equipment_remark],Bedroommsg.[rem' +
        'ark],Dormitorymsg.D_code,'
      
        ' (select count(*) from bedmsg where employeeid in (select rkey f' +
        'rom employeemsg_extra) and bedroomid=Bedroommsg.[rkey]) FullBedC' +
        'ount,'
      
        '([bedcount]-(select count(*) from bedmsg where employeeid in (se' +
        'lect rkey from employeemsg_extra) and bedroomid=Bedroommsg.[rkey' +
        '])) NowBedCount '
      
        'FROM Bedroommsg inner join Dormitorymsg on Dormitorymsg.rkey=Bed' +
        'roommsg.dormitoryid '
      
        'left join employeemsg_extra on employeemsg_extra.rkey=Bedroommsg' +
        '.monitor where Bedroommsg.effective=1'
      'order by  R_Code')
    Left = 208
    Top = 16
  end
  object ds1: TDataSource
    DataSet = qry2
    Left = 240
    Top = 16
  end
  object qry3: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 144
    Top = 16
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 32
    Top = 88
  end
  object ds2: TDataSource
    DataSet = qry4
    Left = 144
    Top = 88
  end
  object qry4: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select employeemsg_extra.rkey,'
      'isnull(departmentname,'#39#39') departmentname,'
      'isnull(employeecode,'#39#39') employeecode,'
      'isnull(chinesename,'#39#39') chinesename,'
      'isnull(idcard,'#39#39') idcard,'
      'case when sex=1 then '#39#30007#39'else '#39#22899#39' end as sex,'
      'isnull(regdate,'#39#39') regdate,'
      'isnull(roomcode,'#39#39') roomcode,'
      'isnull(province,'#39#39') province,'
      'isnull(factoryarea,'#39#39') factoryarea,'
      'isnull(cardno,'#39#39') cardno,'
      'isnull(ondutytime,'#39#39') ondutytime,'
      'isnull(outdutytime,'#39#39') outdutytime,'
      'isnull(employeemsg_extra.rkey,'#39#39') rkey,'
      'isnull(position,'#39#39') position,'
      'isnull(birthday,'#39#39') birthday,'
      'datediff(day,ondutytime,getdate())/365.0  as workage,'
      'isnull(marriage,'#39#39') marriage,'
      'isnull(employeemsg_extra.phone,'#39#39') phone,'
      'isnull(others_contacts,'#39#39') others_contacts,'
      'isnull(employeemsg_extra.nation,'#39#39') nation,'
      ''
      'data0005.employee_name oper_person'
      'from employeemsg_extra,data0005 '
      'where data0005.rkey=employeemsg_extra.operator '
      'and employeemsg_extra.flag <> 4 and isnull(roomcode,'#39#39')='#39#39' ')
    Left = 104
    Top = 88
  end
  object qry5: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      'Bedroomusemsg.rkey as bedroomuserkey,'
      'Bedmsg.rkey as BedRkey,'
      'Bedroommsg.R_name,'
      'Dormitorymsg.D_name,'
      
        'Dormitorymsg.D_code,Bedroommsg.R_code,Bedmsg.B_code,employeemsg_' +
        'extra.idcard, '
      'case when employeemsg_extra.sex=0 then '#39#22899#39' else '#39#30007#39' end as sex,'
      
        'Bedroomusemsg.startdate,Bedroomusemsg.oper_time_in,Bedroomusemsg' +
        '.enddate,Bedroomusemsg.oper_time_out,Bedroomusemsg.remark, '
      'Bedroomusemsg.rkey as BedUseMsgrkey,'
      'employeemsg_extra.rkey as Emprkey,'
      'employeemsg_extra.position,'
      'employeemsg_extra.departmentname,'
      'employeemsg_extra.employeecode,'
      'employeemsg_extra.chinesename ,employeemsg.addr,'
      
        '(select data0005.employee_name from data0005 where data0005.rkey' +
        '=Bedroomusemsg.operator_out) out_name, '
      
        '(select data0005.employee_name from data0005 where data0005.rkey' +
        '=Bedroomusemsg.operator_in) in_name '
      
        'from Bedroomusemsg inner join employeemsg_extra on Bedroomusemsg' +
        '.employeeid=employeemsg_extra.rkey'
      'inner join Bedmsg on Bedroomusemsg.bedid=Bedmsg.rkey'
      'inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey'
      
        'inner join Dormitorymsg on Bedroommsg.Dormitoryid=Dormitorymsg.r' +
        'key'
      
        'left join employeemsg on employeemsg_extra.employeecode=employee' +
        'msg.employeecode'
      'where bedmsg.effective=1 and Bedroomusemsg.enddate is NULL'
      '')
    Left = 208
    Top = 88
    object qry5BedRkey: TAutoIncField
      FieldName = 'BedRkey'
      ReadOnly = True
    end
    object qry5R_name: TWideStringField
      FieldName = 'R_name'
    end
    object qry5D_name: TWideStringField
      FieldName = 'D_name'
      Size = 50
    end
    object qry5D_code: TStringField
      FieldName = 'D_code'
      Size = 50
    end
    object qry5R_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object qry5B_code: TStringField
      FieldName = 'B_code'
      Size = 50
    end
    object qry5idcard: TWideStringField
      FieldName = 'idcard'
    end
    object qry5sex: TStringField
      FieldName = 'sex'
      ReadOnly = True
      Size = 2
    end
    object qry5startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object qry5oper_time_in: TDateTimeField
      FieldName = 'oper_time_in'
    end
    object qry5enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object qry5oper_time_out: TDateTimeField
      FieldName = 'oper_time_out'
    end
    object qry5remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object qry5Emprkey: TAutoIncField
      FieldName = 'Emprkey'
      ReadOnly = True
    end
    object qry5position: TWideStringField
      FieldName = 'position'
    end
    object qry5departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry5employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry5chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry5out_name: TStringField
      FieldName = 'out_name'
      ReadOnly = True
      Size = 16
    end
    object qry5in_name: TStringField
      FieldName = 'in_name'
      ReadOnly = True
      Size = 16
    end
    object qry5bedroomuserkey: TAutoIncField
      FieldName = 'bedroomuserkey'
      ReadOnly = True
    end
    object qry5BedUseMsgrkey: TAutoIncField
      FieldName = 'BedUseMsgrkey'
      ReadOnly = True
    end
    object qry5addr: TWideStringField
      FieldName = 'addr'
      Size = 80
    end
  end
  object ds3: TDataSource
    DataSet = qry5
    Left = 240
    Top = 88
  end
  object qry6: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      'select'
      'Bedmsg.rkey as BedRkey,'
      'Bedroommsg.R_name,'
      'Dormitorymsg.D_name,'
      
        'Dormitorymsg.D_code,Bedroommsg.R_code,Bedmsg.B_code,employeemsg_' +
        'extra.idcard, '
      'case when employeemsg_extra.sex=0 then '#39#22899#39' else '#39#30007#39' end as sex,'
      'Bedroomusemsg.rkey as BedUseMsgrkey,'
      
        'Bedroomusemsg.startdate,Bedroomusemsg.oper_time_in,Bedroomusemsg' +
        '.enddate,Bedroomusemsg.oper_time_out,Bedroomusemsg.remark, '
      'employeemsg_extra.rkey as Emprkey,'
      'employeemsg_extra.position,'
      'employeemsg_extra.departmentname,'
      
        'employeemsg_extra.employeecode,employeemsg_extra.chinesename , e' +
        'mployeemsg.addr,'
      
        '(select data0005.employee_name from data0005 where data0005.rkey' +
        '=Bedroomusemsg.operator_out) out_name, '
      
        '(select data0005.employee_name from data0005 where data0005.rkey' +
        '=Bedroomusemsg.operator_in) in_name '
      
        'from Bedroomusemsg inner join employeemsg_extra on Bedroomusemsg' +
        '.employeeid=employeemsg_extra.rkey'
      'inner join Bedmsg on Bedroomusemsg.bedid=Bedmsg.rkey'
      'inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey'
      
        'inner join Dormitorymsg on Bedroommsg.Dormitoryid=Dormitorymsg.r' +
        'key'
      
        'left join employeemsg on employeemsg_extra.employeecode=employee' +
        'msg.employeecode'
      'where bedmsg.effective=1  and Bedroomusemsg.enddate is not NUll')
    Left = 208
    Top = 160
    object qry6BedRkey: TAutoIncField
      FieldName = 'BedRkey'
      ReadOnly = True
    end
    object qry6R_name: TWideStringField
      FieldName = 'R_name'
    end
    object qry6D_name: TWideStringField
      FieldName = 'D_name'
      Size = 50
    end
    object qry6D_code: TStringField
      FieldName = 'D_code'
      Size = 50
    end
    object qry6R_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object qry6B_code: TStringField
      FieldName = 'B_code'
      Size = 50
    end
    object qry6idcard: TWideStringField
      FieldName = 'idcard'
    end
    object qry6sex: TStringField
      FieldName = 'sex'
      ReadOnly = True
      Size = 2
    end
    object qry6BedUseMsgrkey: TAutoIncField
      FieldName = 'BedUseMsgrkey'
      ReadOnly = True
    end
    object qry6startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object qry6oper_time_in: TDateTimeField
      FieldName = 'oper_time_in'
    end
    object qry6enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object qry6oper_time_out: TDateTimeField
      FieldName = 'oper_time_out'
    end
    object qry6remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object qry6Emprkey: TAutoIncField
      FieldName = 'Emprkey'
      ReadOnly = True
    end
    object qry6position: TWideStringField
      FieldName = 'position'
    end
    object qry6departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry6employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry6chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry6out_name: TStringField
      FieldName = 'out_name'
      ReadOnly = True
      Size = 16
    end
    object qry6in_name: TStringField
      FieldName = 'in_name'
      ReadOnly = True
      Size = 16
    end
    object qry6addr: TWideStringField
      FieldName = 'addr'
      Size = 80
    end
  end
  object ds4: TDataSource
    DataSet = qry6
    Left = 240
    Top = 160
  end
  object ds7: TDataSource
    DataSet = qry7
    Left = 144
    Top = 160
  end
  object qry7: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'bedroomrkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select employeemsg_extra.employeecode,'
      'employeemsg_extra.chinesename,'
      'employeemsg_extra.Province,'
      'employeemsg_extra.departmentname,'
      'case when sex=0 then '#39#22899#39' else '#39#30007#39' end sex,'
      'employeemsg_extra.ondutytime,'
      'employeemsg_extra.birthday,'
      'employeemsg_extra.position,'
      'bedroomusemsg.startdate from employeemsg_extra'
      ''
      'inner join bedmsg on employeemsg_extra.rkey=bedmsg.employeeid'
      ''
      'inner join bedroommsg on bedmsg.bedroomid=bedroommsg.rkey '
      ''
      'inner join bedroomusemsg on bedroomusemsg.bedid=bedmsg.rkey'
      'where bedroomid=:bedroomrkey and bedroomusemsg.enddate is NULL  ')
    Left = 104
    Top = 160
  end
  object qryWCinfo: TADOQuery
    Connection = con1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select employeecode, chinesename,'
      'case when sex=1 then '#39#30007#39' else '#39#22899#39' end sexName,'
      'departmentname, factoryarea, regdate, roomcode, IDCard, '
      'province '
      
        'from employeemsg_extra where flag = 1 and isnull(roomcode, '#39#39') <' +
        '> '#39#39)
    Left = 104
    Top = 232
    object qryWCinfoemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qryWCinfochinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qryWCinfosexName: TStringField
      FieldName = 'sexName'
      ReadOnly = True
      Size = 2
    end
    object qryWCinfodepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qryWCinfofactoryarea: TWideStringField
      FieldName = 'factoryarea'
    end
    object qryWCinforegdate: TDateTimeField
      FieldName = 'regdate'
    end
    object qryWCinforoomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object qryWCinfoIDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object qryWCinfoprovince: TWideStringField
      FieldName = 'province'
    end
  end
  object dsWCinfo: TDataSource
    DataSet = qryWCinfo
    Left = 160
    Top = 232
  end
  object qry_changebed: TADOQuery
    Connection = con1
    Parameters = <
      item
        Name = 'operator'
        Size = -1
        Value = Null
      end
      item
        Name = 'cur_empid'
        Size = -1
        Value = Null
      end
      item
        Name = 'des_empid'
        Size = -1
        Value = Null
      end
      item
        Name = 'cur_bedid'
        Size = -1
        Value = Null
      end
      item
        Name = 'des_bedid'
        Size = -1
        Value = Null
      end
      item
        Name = 'cur_beduseid'
        Size = -1
        Value = Null
      end
      item
        Name = 'des_beduseid'
        Size = -1
        Value = Null
      end
      item
        Name = 'changdate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @operator int'
      'declare @cur_empid int'
      'declare @des_empid int'
      'declare @cur_bedid int'
      'declare @des_bedid int'
      'declare @cur_beduseid int'
      'declare @des_beduseid int'
      'declare @remark nvarchar(20)'
      'declare @chagedate datetime'
      ''
      'set @operator=:operator'
      'set @cur_empid=:cur_empid'
      'set @des_empid=:des_empid'
      'set @cur_bedid=:cur_bedid'
      'set @des_bedid=:des_bedid'
      'set @cur_beduseid=:cur_beduseid'
      'set @des_beduseid=:des_beduseid'
      'set @chagedate =:changdate'
      'set @remark='#39#25442#25151#39
      ''
      ''
      'update bedroomusemsg'
      'set operator_out=@operator,'
      
        'enddate=cast (substring(convert(nvarchar(20),@chagedate,120),1,1' +
        '0) as datetime),'
      'oper_time_out=getdate(),remark=@remark'
      'from bedroomusemsg'
      'where rkey in (@cur_beduseid,@des_beduseid)'
      ''
      
        'insert bedroomusemsg(bedid,employeeid,startdate,operator_in,oper' +
        '_time_in)'
      
        'select @des_bedid,@cur_empid,cast (substring(convert(nvarchar(20' +
        '),@chagedate,120),1,10) as datetime),@operator,getdate()'
      ''
      'update employeemsg_extra'
      'set roomcode=(select B_code from bedmsg where rkey=@des_bedid)'
      'from employeemsg_extra'
      'where rkey=@cur_empid'
      ''
      'update bedmsg'
      'set employeeid=null'
      'where rkey=@cur_bedid'
      ''
      'update bedmsg'
      'set employeeid=@cur_empid'
      'where rkey=@des_bedid'
      ''
      ''
      ''
      'if @des_empid<>0 '
      'begin'
      ''
      
        'insert bedroomusemsg(bedid,employeeid,startdate,operator_in,oper' +
        '_time_in)'
      
        'select @cur_bedid,@des_empid,cast (substring(convert(nvarchar(20' +
        '),@chagedate,120),1,10) as datetime),@operator,getdate()'
      ''
      'update employeemsg_extra'
      'set roomcode=(select B_code from bedmsg where rkey=@cur_bedid)'
      'from employeemsg_extra'
      'where rkey=@des_empid'
      ''
      'update bedmsg'
      'set employeeid=@des_empid'
      'where rkey=@cur_bedid'
      ''
      'end'
      ''
      ''
      'delete   from bedroomusemsg'
      'where startdate=enddate')
    Left = 344
    Top = 192
  end
end
