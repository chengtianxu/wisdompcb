object DM: TDM
  OldCreateOrder = False
  Left = 806
  Top = 395
  Height = 336
  Width = 435
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object ADODepart: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 152
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOShowChild
    Left = 248
    Top = 32
  end
  object ADOShowChild: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select RKEY,departmentcode,departmentname,superior,case invalid ' +
        'when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end as states,departmentration' +
        ','
      
        'case when departmentration >0 then convert(varchar,cast(100*cast' +
        '(overproofcount as decimal(8,2))/departmentration as decimal(8,2' +
        '))) +'#39'%'#39' '
      '        when departmentration =0 then '#39'0.00%'#39' end  as outofrate,'
      
        ' departmentcount,scarcity, overproofcount, max_overproof_percent' +
        ', pre_outduty, dept_totalration, dept_totalcount, dept_total_out' +
        'duty '
      ',case NeedBox when 0 then '#39#19981#20998#37197#39' when 1 then '#39#20998#37197#39' end as ShoeBox'
      'from datadepartment'
      'where 1=1 ')
    Left = 152
    Top = 104
    object ADOShowChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOShowChilddepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object ADOShowChilddepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOShowChildsuperior: TIntegerField
      FieldName = 'superior'
    end
    object ADOShowChildstates: TStringField
      FieldName = 'states'
      ReadOnly = True
      Size = 4
    end
    object ADOShowChilddepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object ADOShowChildoutofrate: TStringField
      FieldName = 'outofrate'
      ReadOnly = True
      Size = 31
    end
    object ADOShowChilddepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object ADOShowChildscarcity: TIntegerField
      FieldName = 'scarcity'
    end
    object ADOShowChildoverproofcount: TIntegerField
      FieldName = 'overproofcount'
    end
    object ADOShowChildmax_overproof_percent: TIntegerField
      FieldName = 'max_overproof_percent'
    end
    object ADOShowChildpre_outduty: TIntegerField
      FieldName = 'pre_outduty'
    end
    object ADOShowChilddept_totalration: TIntegerField
      FieldName = 'dept_totalration'
    end
    object ADOShowChilddept_totalcount: TIntegerField
      FieldName = 'dept_totalcount'
    end
    object ADOShowChilddept_total_outduty: TIntegerField
      FieldName = 'dept_total_outduty'
    end
    object ADOShowChildShoeBox: TStringField
      DisplayLabel = #26159#21542#20998#38795#26588
      FieldName = 'ShoeBox'
      ReadOnly = True
      Size = 6
    end
  end
  object ADOAddorEdit: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 240
    Top = 104
  end
end
