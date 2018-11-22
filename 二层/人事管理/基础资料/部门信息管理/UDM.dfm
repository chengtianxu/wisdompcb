object DM: TDM
  OldCreateOrder = False
  Left = 310
  Top = 293
  Height = 314
  Width = 486
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
    OnCalcFields = qry_deptCalcFields
    OnEditError = qry_deptEditError
    OnPostError = qry_deptPostError
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  invalid,rkey, departmentname, departmentcode, superior, ' +
        'chargename, departmentration, departmentcount, scarcity,'
      
        'overproofcount,max_overproof_percent,pre_outduty,dept_totalratio' +
        'n,dept_totalcount,dept_total_outduty'
      'FROM         dbo.datadepartment'
      'where invalid=0')
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
    object qry_deptinvalid: TBooleanField
      DisplayLabel = #20572#29992
      FieldName = 'invalid'
      OnGetText = qry_deptinvalidGetText
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
    Left = 424
    Top = 8
  end
end
