object DM: TDM
  OldCreateOrder = False
  Left = 300
  Top = 240
  Height = 333
  Width = 477
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'exec dbo.hrsp_emp_turn')
    Left = 136
    Top = 39
    object qry1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry1position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object qry1workyear: TWideStringField
      FieldName = 'workyear'
      ReadOnly = True
      Size = 48
    end
    object qry1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object qry1departmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object qry1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry1begindate: TDateTimeField
      FieldName = 'begindate'
    end
    object qry1workage: TIntegerField
      FieldName = 'workage'
    end
    object qry1position: TIntegerField
      FieldName = 'position'
    end
    object qry1circle: TIntegerField
      FieldName = 'circle'
    end
    object qry1position_keeptime: TIntegerField
      FieldName = 'position_keeptime'
    end
    object qry1position_keeptime_char: TWideStringField
      FieldName = 'position_keeptime_char'
      ReadOnly = True
      Size = 48
    end
    object qry1extra_month: TIntegerField
      FieldName = 'extra_month'
      ReadOnly = True
    end
    object qry1remain_month: TIntegerField
      FieldName = 'remain_month'
      ReadOnly = True
    end
    object qry1month_left: TIntegerField
      FieldName = 'month_left'
      ReadOnly = True
    end
    object qry1extra_remark: TWideStringField
      FieldName = 'extra_remark'
      Size = 50
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 192
    Top = 40
  end
  object ADOTEMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 134
    Top = 101
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select d.departmentname,b.employeecode,'
      'b.chinesename,c.item,e.employee_name,'
      'a.rkey,'
      'a.employeeid,'
      'a.departmentid,'
      'a.Positionid,'
      'a.startdate,'
      'r.circle,'
      'a.extra_month,'
      
        'dateadd(month,(isnull(r.circle,0)+isnull(a.extra_month,0)),start' +
        'date) as enddate,'
      'a.oper_0005,'
      'a.operate_date,'
      'a.extra_remark,'
      'a.visible'
      'from employee_station_turn_remark a'
      'join employeemsg b on a.employeeid=b.rkey'
      'join datadetail c on a.positionid=c.rkey'
      'join datadepartment d on a.departmentid=d.rkey'
      'join data0005 e on a.oper_0005=e.rkey'
      'join dbo.employee_station_turn_rule r'
      ' on a.departmentid=r.departmentid and a.positionid=r.positionid'
      'where a.visible=1')
    Left = 135
    Top = 170
    object qry2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry2item: TWideStringField
      FieldName = 'item'
    end
    object qry2employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object qry2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry2employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object qry2departmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object qry2Positionid: TIntegerField
      FieldName = 'Positionid'
    end
    object qry2startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object qry2circle: TIntegerField
      FieldName = 'circle'
    end
    object qry2extra_month: TIntegerField
      FieldName = 'extra_month'
    end
    object qry2enddate: TDateTimeField
      FieldName = 'enddate'
      ReadOnly = True
    end
    object qry2oper_0005: TIntegerField
      FieldName = 'oper_0005'
    end
    object qry2operate_date: TDateTimeField
      FieldName = 'operate_date'
    end
    object qry2extra_remark: TWideStringField
      FieldName = 'extra_remark'
      Size = 50
    end
    object qry2visible: TBooleanField
      FieldName = 'visible'
    end
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 184
    Top = 165
  end
end
