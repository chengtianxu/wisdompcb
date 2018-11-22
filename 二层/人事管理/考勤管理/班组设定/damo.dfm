object DM: TDM
  OldCreateOrder = False
  Left = 365
  Top = 165
  Height = 336
  Width = 486
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select *,dbo.get_classnamestring(classbunch) '
      'as classbunch_str,'
      
        '(select count(rkey)from employeemsg where classgroupid=classgrou' +
        'p.rkey and [status]=1 ) as peoplecount,'
      
        'case when calendarid=0 then '#39#26085#21382'1'#39'  when calendarid=1 then '#39#26085#21382'2'#39' ' +
        ' else '#39#26085#21382'3'#39'  end as calendarname,'
      'case when repeatcycle=0 then '#39#22825#39
      '     when repeatcycle=1 then '#39#21608#39
      '     when repeatcycle=2 then '#39#21322#26376'(15'#26085#36716')'#39
      '     when repeatcycle=3 then '#39#21322#26376'(16'#26085#36716')'#39
      '     when repeatcycle=4 then '#39#26376#39' '
      '     end as repeatcyclename  '
      'from classgroup')
    Left = 200
    Top = 8
    object ADOQuery1rkey: TAutoIncField
      DisplayWidth = 4
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1ClassgroupCode: TStringField
      DisplayWidth = 14
      FieldName = 'ClassgroupCode'
    end
    object ADOQuery1CalendarID: TIntegerField
      DisplayWidth = 8
      FieldName = 'CalendarID'
    end
    object ADOQuery1descript: TWideStringField
      DisplayWidth = 16
      FieldName = 'descript'
      Size = 50
    end
    object ADOQuery1StartDate: TDateTimeField
      DisplayWidth = 11
      FieldName = 'StartDate'
    end
    object ADOQuery1RepeatMode: TIntegerField
      DisplayWidth = 10
      FieldName = 'RepeatMode'
    end
    object ADOQuery1RepeatCycle: TIntegerField
      DisplayWidth = 11
      FieldName = 'RepeatCycle'
    end
    object ADOQuery1ClassBunch: TWideStringField
      DisplayWidth = 100
      FieldName = 'ClassBunch'
      Size = 100
    end
    object ADOQuery1Remark: TWideStringField
      DisplayWidth = 50
      FieldName = 'Remark'
      Size = 50
    end
    object ADOQuery1classbunch_str: TStringField
      FieldName = 'classbunch_str'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery1calendarname: TStringField
      FieldName = 'calendarname'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1repeatcyclename: TStringField
      FieldName = 'repeatcyclename'
      ReadOnly = True
      Size = 12
    end
    object ADOQuery1peoplecount: TIntegerField
      FieldName = 'peoplecount'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 8
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 400
    Top = 8
  end
  object ADODataSet_emplist: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,departmentname,employeecode,chinesename,position_ite' +
      'm,ondutytime,classgroupcode,accountname  from v_employeemsg wher' +
      'e  attendance=1'
    Parameters = <>
    Prepared = True
    Left = 400
    Top = 104
    object ADODataSet_emplistrkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADODataSet_emplistdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADODataSet_emplistemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADODataSet_emplistchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADODataSet_emplistposition_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object ADODataSet_emplistondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADODataSet_emplistclassgroupcode: TStringField
      FieldName = 'classgroupcode'
      ReadOnly = True
    end
    object ADODataSet_emplistaccountname: TWideStringField
      FieldName = 'accountname'
      ReadOnly = True
      Size = 50
    end
  end
  object DataSource4: TDataSource
    DataSet = ADODataSet_emplist
    Left = 328
    Top = 106
  end
end
