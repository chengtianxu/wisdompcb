object DM: TDM
  OldCreateOrder = False
  Left = 209
  Top = 145
  Height = 336
  Width = 313
  object qryMain: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select'
      'isnull(departmentname,'#39#39') departmentname,'
      'isnull(employeecode,'#39#39') employeecode,'
      'isnull(chinesename,'#39#39') chinesename,'
      'isnull(idcard,'#39#39') idcard,'
      'case when sex=1 then '#39#30007#39'else '#39#22899#39' end as sex,'
      'isnull(regdate,'#39#39') regdate,'
      'isnull('
      '(select top 1 d_name+r_name from bedmsg  '
      'left join dbo.Bedroommsg on bedmsg.bedroomid=bedroommsg.rkey'
      
        'left join dbo.Dormitorymsg on bedroommsg.dormitoryid=Dormitoryms' +
        'g.rkey'
      
        'where  bedmsg.b_code=employeemsg_extra.roomcode),'#39#39') as roomcode' +
        ','
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
      'flag,'
      'data0005.employee_name oper_person'
      'from employeemsg_extra,data0005 '
      'where data0005.rkey=employeemsg_extra.operator '
      'and employeemsg_extra.flag <> 4')
    Left = 128
    Top = 56
    object qryMaindepartmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
    object qryMainemployeecode: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object qryMainchinesename: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object qryMainidcard: TWideStringField
      FieldName = 'idcard'
      ReadOnly = True
    end
    object qryMainsex: TStringField
      FieldName = 'sex'
      ReadOnly = True
      Size = 2
    end
    object qryMainregdate: TDateTimeField
      FieldName = 'regdate'
      ReadOnly = True
    end
    object qryMainroomcode: TWideStringField
      FieldName = 'roomcode'
      ReadOnly = True
      Size = 70
    end
    object qryMainprovince: TWideStringField
      FieldName = 'province'
      ReadOnly = True
    end
    object qryMainfactoryarea: TWideStringField
      FieldName = 'factoryarea'
      ReadOnly = True
    end
    object qryMaincardno: TWideStringField
      FieldName = 'cardno'
      ReadOnly = True
    end
    object qryMainondutytime: TWideStringField
      FieldName = 'ondutytime'
      ReadOnly = True
    end
    object qryMainoutdutytime: TWideStringField
      FieldName = 'outdutytime'
      ReadOnly = True
    end
    object qryMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryMainposition: TWideStringField
      FieldName = 'position'
      ReadOnly = True
    end
    object qryMainbirthday: TWideStringField
      FieldName = 'birthday'
      ReadOnly = True
    end
    object qryMainworkage: TBCDField
      FieldName = 'workage'
      ReadOnly = True
      Precision = 17
      Size = 6
    end
    object qryMainmarriage: TWideStringField
      FieldName = 'marriage'
      ReadOnly = True
    end
    object qryMainphone: TWideStringField
      FieldName = 'phone'
      ReadOnly = True
      Size = 50
    end
    object qryMainothers_contacts: TWideStringField
      FieldName = 'others_contacts'
      ReadOnly = True
      Size = 50
    end
    object qryMainnation: TWideStringField
      FieldName = 'nation'
      ReadOnly = True
      Size = 10
    end
    object qryMainoper_person: TStringField
      FieldName = 'oper_person'
      Size = 16
    end
    object qryMainflag: TIntegerField
      FieldName = 'flag'
    end
  end
  object dsMain: TDataSource
    DataSet = qryMain
    Left = 168
    Top = 56
  end
  object qryTemp: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      'select'
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
      'isnull(employeemsg_extra.photo,'#39#39') photo,'
      'data0005.employee_name oper_person'
      'from employeemsg_extra,data0005 '
      'where data0005.rkey=employeemsg_extra.operator '
      'and employeemsg_extra.flag <> 4')
    Left = 128
    Top = 104
  end
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 56
  end
  object qrytemp1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 128
    Top = 160
  end
  object qry_update: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      'update employeemsg_extra'
      
        'set ondutytime=substring(convert(nvarchar(20),b.ondutytime,120),' +
        '1,10)'
      'from employeemsg_extra a'
      'join employeemsg b'
      'on a.idcard=b.idcard and b.status=1'
      'where  a.ondutytime<>b.ondutytime and a.idcard<>'#39#39
      ''
      'update employeemsg_extra'
      'set employeecode=b.employeecode,'
      '    outdutytime='#39#39
      'from employeemsg_extra a '
      'join (select rkey,employeecode,idcard '
      
        'from employeemsg where status=1 and idcard<>'#39#39' and len(idcard)>1' +
        '0) '
      'as b '
      'on a.idcard=b.idcard and a.employeecode<>b.employeecode'
      'where flag=0'
      ''
      'update employeemsg_extra'
      
        'set outdutytime=substring(convert(nvarchar(20),b.outdutytime,120' +
        '),1,10),'
      'cardno=b.cardno'
      'from employeemsg_extra a join employeemsg b'
      'on a.employeecode=b.employeecode'
      'where b.outdutytime '
      'between dateadd(month,-1,getdate())'
      'and dateadd(month,1,getdate())'
      ''
      'update employeemsg_extra'
      'set departmentname=b.departmentname'
      'from employeemsg_extra a join v_employeemsg b'
      'on a.employeecode=b.employeecode'
      'where a.employeecode in '
      '(select employeecode from employeemsg where status=1)'
      'and b.status=1'
      'and a.departmentname<>b.departmentname'
      ''
      'update employeemsg_extra'
      'set position=b.position_item'
      'from employeemsg_extra a join v_employeemsg b'
      'on a.employeecode=b.employeecode'
      'where a.employeecode in '
      '(select employeecode from employeemsg where status=1)'
      'and b.status=1'
      'and a.position<>b.position_item'
      ''
      'update employeemsg_extra'
      'set flag=1 '
      'from employeemsg_extra'
      'where flag=0 and ('
      ' employeecode not in '
      '(select employeecode from employeemsg)'
      'and idcard not in '
      '(select idcard from employeemsg))')
    Left = 72
    Top = 232
  end
end
