object DM: TDM
  OldCreateOrder = False
  Left = 404
  Top = 204
  Height = 328
  Width = 330
  object con_dept: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 30
    Top = 24
  end
  object qry_dept: TADOQuery
    Connection = con_dept
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, departmentname, departmentcode, superior, charg' +
        'ename, departmentration, departmentcount, scarcity,'
      
        'overproofcount,max_overproof_percent,pre_outduty,dept_totalratio' +
        'n,dept_totalcount,dept_total_outduty'
      'FROM         dbo.datadepartment')
    Left = 88
    Top = 24
    object qry_deptrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_deptdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry_deptdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object qry_deptsuperior: TIntegerField
      FieldName = 'superior'
    end
    object qry_deptchargename: TWideStringField
      FieldName = 'chargename'
    end
    object qry_deptdepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object qry_deptdepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object qry_deptscarcity: TIntegerField
      FieldName = 'scarcity'
    end
    object qry_deptoverproofcount: TIntegerField
      FieldName = 'overproofcount'
    end
    object qry_deptmax_overproof_percent: TIntegerField
      FieldName = 'max_overproof_percent'
    end
    object qry_deptpre_outduty: TIntegerField
      FieldName = 'pre_outduty'
    end
    object qry_deptstr_proof_percent: TStringField
      FieldKind = fkCalculated
      FieldName = 'str_proof_percent'
      ReadOnly = True
      Required = True
      Calculated = True
    end
    object qry_deptstr_over_percent: TStringField
      FieldKind = fkCalculated
      FieldName = 'str_over_percent'
      Calculated = True
    end
    object qry_deptdept_totalration: TIntegerField
      FieldName = 'dept_totalration'
    end
    object qry_deptdept_totalcount: TIntegerField
      FieldName = 'dept_totalcount'
    end
    object qry_deptdept_total_outduty: TIntegerField
      FieldName = 'dept_total_outduty'
    end
  end
  object ds_dept: TDataSource
    DataSet = qry_dept
    Left = 152
    Top = 24
  end
  object ADOTMP: TADOQuery
    Connection = con_dept
    Parameters = <>
    Left = 224
    Top = 24
  end
  object update_emp_trun: TADOQuery
    Connection = con_dept
    Parameters = <>
    SQL.Strings = (
      'insert into  employee_station_turn_rule(departmentid,Positionid)'
      'select * from  ( select '
      'distinct departmentid,position '
      'from employeemsg   '
      'join datadepartment '
      'on employeemsg.departmentid=datadepartment.rkey'
      'join datadetail '
      'on employeemsg.position=datadetail.rkey '
      'where employeemsg.status=1 and datadetail.dictid=1 ) as mirror'
      'where   not exists(select * from employee_station_turn_rule '
      
        'where departmentid=mirror.departmentid and Positionid=mirror.pos' +
        'ition)'
      ''
      'update employee_station_turn_rule'
      'set visible=0 '
      'from employee_station_turn_rule'
      'where not exists'
      '(select rkey from employeemsg where status=1 and  '
      
        '     employee_station_turn_rule.departmentid=employeemsg.departm' +
        'entid'
      'and  employee_station_turn_rule.Positionid=employeemsg.Position)'
      ''
      'update employee_station_turn_rule'
      'set visible=1 '
      'from employee_station_turn_rule'
      'where  exists'
      '(select rkey from employeemsg where status=1 and  '
      
        '     employee_station_turn_rule.departmentid=employeemsg.departm' +
        'entid'
      'and  employee_station_turn_rule.Positionid=employeemsg.Position)')
    Left = 88
    Top = 128
  end
  object ds1: TADODataSet
    Connection = con_dept
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeInsert = ds1BeforeInsert
    BeforeDelete = ds1BeforeDelete
    CommandText = 
      'select a.*,b.departmentname,c.item, round(a.circle/12.0,2) as ci' +
      'rcleyear'#13#10'from  employee_station_turn_rule a '#13#10'join datadepartme' +
      'nt b on a.departmentid=b.rkey'#13#10'join datadetail c on a.positionid' +
      '=c.rkey'#13#10'where a.visible=1'
    Parameters = <>
    Left = 90
    Top = 80
    object ds1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ds1departmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object ds1Positionid: TIntegerField
      FieldName = 'Positionid'
    end
    object ds1circle: TIntegerField
      FieldName = 'circle'
    end
    object ds1visible: TIntegerField
      FieldName = 'visible'
    end
    object ds1remark1: TWideStringField
      FieldName = 'remark1'
      Size = 50
    end
    object ds1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ds1item: TWideStringField
      FieldName = 'item'
    end
    object ds1circleyear: TBCDField
      FieldName = 'circleyear'
      ReadOnly = True
      Precision = 17
      Size = 6
    end
  end
  object emp_trun: TDataSource
    DataSet = ds1
    Left = 152
    Top = 80
  end
end
