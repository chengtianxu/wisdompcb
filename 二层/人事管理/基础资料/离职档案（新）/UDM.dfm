object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 672
  Top = 290
  Height = 319
  Width = 450
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 136
    Top = 40
  end
  object qry_updateDep: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      'exec dbo.hrsp_update_datadepartment_empcount')
    Left = 232
    Top = 104
  end
  object qry_tmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 112
    Top = 144
  end
  object qry_tmp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 208
    Top = 184
  end
  object qry_tmp1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 160
    Top = 152
  end
  object qry_altSave: TADOQuery
    CacheSize = 500
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'alterrkey'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'select  * from employee_alteration'
      'where rkey=:alterrkey')
    Left = 317
    Top = 25
  end
  object qry_Empmsg: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select msg.rkey,employeecode,chinesename,departmentname,status,d' +
        'atadetail.item rankname,[rank],'
      
        '(case sex when 0 then '#39#22899#39' when 1 then '#39#30007#39' else '#39#20854#23427#39'  end) as sex' +
        'y ,isnull(msg.wagetype,9) as wagetype,'
      
        'cast (substring(convert(nvarchar(20),ondutytime,120),1,10) as da' +
        'tetime) as ondutytime,'
      
        'cast (substring(convert(nvarchar(20),outdutytime,120),1,10) as d' +
        'atetime) as outdutytime,'
      
        'province,IDCard,departmentid,pdet.item as pposition,mdet.item as' +
        ' employ_type,'
      'dept.departmentname,position,employ_type as employ_type_rkey,'
      '(select top 1 bb.rkey from '
      
        'dbo.employee_alteration  aa join datadetail bb on aa.reason=bb.r' +
        'key '
      'where employeeid=msg.rkey '
      'and type in (select rkey from datadetail where dictid=9) '
      'order by alterdate desc )  as old_reason, '
      '(select top 1 bb.item from '
      
        'dbo.employee_alteration  aa join datadetail bb on aa.reason=bb.r' +
        'key '
      'where employeeid=msg.rkey and type in '
      '(select rkey from datadetail where dictid=9) '
      'order by alterdate desc ) as oold_reason'
      ' from employeemsg msg'
      ' left join datadetail pdet on pdet.rkey=msg.position'
      ' left join datadetail mdet on mdet.rkey=msg.employ_type'
      ' left join datadetail on datadetail.rkey=msg.Rank'
      ' left join datadepartment dept on dept.rkey=msg.departmentid'
      'where 1=1')
    Left = 307
    Top = 88
    object qry_Empmsgrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_Empmsgemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_Empmsgchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_Empmsgdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry_Empmsgstatus: TWordField
      FieldName = 'status'
    end
    object qry_Empmsgrankname: TWideStringField
      FieldName = 'rankname'
    end
    object qry_Empmsgrank: TIntegerField
      FieldName = 'rank'
    end
    object qry_Empmsgsexy: TStringField
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object qry_Empmsgwagetype: TIntegerField
      FieldName = 'wagetype'
      ReadOnly = True
    end
    object qry_Empmsgondutytime: TDateTimeField
      FieldName = 'ondutytime'
      ReadOnly = True
    end
    object qry_Empmsgoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
      ReadOnly = True
    end
    object qry_Empmsgprovince: TWideStringField
      FieldName = 'province'
    end
    object qry_EmpmsgIDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object qry_Empmsgdepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object qry_Empmsgpposition: TWideStringField
      FieldName = 'pposition'
    end
    object qry_Empmsgemploy_type: TWideStringField
      FieldName = 'employ_type'
    end
    object qry_Empmsgdepartmentname_1: TWideStringField
      FieldName = 'departmentname_1'
    end
    object qry_Empmsgposition: TIntegerField
      FieldName = 'position'
    end
    object qry_Empmsgemploy_type_rkey: TIntegerField
      FieldName = 'employ_type_rkey'
    end
    object qry_Empmsgold_reason: TIntegerField
      FieldName = 'old_reason'
      ReadOnly = True
    end
    object qry_Empmsgoold_reason: TWideStringField
      FieldName = 'oold_reason'
      ReadOnly = True
    end
  end
  object ds_msg: TDataSource
    DataSet = qry_Empmsg
    Left = 371
    Top = 88
  end
  object qry_detail: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadetail')
    Left = 293
    Top = 176
  end
  object ds_detail: TDataSource
    DataSet = qry_detail
    Left = 355
    Top = 216
  end
end
