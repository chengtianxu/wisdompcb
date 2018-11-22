object DM: TDM
  OldCreateOrder = False
  Left = 510
  Top = 230
  Height = 244
  Width = 268
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object Ado181: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0181.rkey, dbo.DATA0181.VCPID, dbo.DATA0181.d' +
        '06_Ptr, dbo.DATA0181.d34_Ptr, dbo.DATA0181.STEP, dbo.DATA0181.QT' +
        'Y_BACKLOG, '
      
        'dbo.DATA0181.PANELS, dbo.DATA0181.sClass, dbo.DATA0181.d198_Ptr,' +
        ' dbo.DATA0181.d05_Ptr, dbo.DATA0181.create_date, '
      
        'dbo.DATA0181.ComputerName, dbo.DATA0181.IPAddress, dbo.DATA0181.' +
        'Remark, dbo.Data0006.WORK_ORDER_NUMBER, '
      
        'dbo.Data0025.MANU_PART_NUMBER,dbo.data0025.MANU_PART_DESC, dbo.D' +
        'ATA0181.STEP AS Expr1, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT' +
        '_NAME, dbo.Data0006.panel_ln,'
      
        'dbo.Data0006.panel_wd, dbo.Data0025.ANALYSIS_CODE_5,dbo.data0008' +
        '.PRODUCT_NAME, '
      
        'ISNULL(ROUND(dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * dbo' +
        '.DATA0181.PANELS * 0.000001, 2), 0) AS PNLArae, '
      
        'ISNULL(ROUND(dbo.DATA0181.QTY_BACKLOG * dbo.Data0025.unit_sq, 2)' +
        ', 0) AS wip_area, dbo.Data0025.unit_sq, dbo.Data0015.ABBR_NAME, '
      'dbo.Data0005.EMPLOYEE_NAME, dbo.Data0198.sName, '
      
        'case when RT_C.PARAMETER_VALUE is NULL then Data0006.panel_ln el' +
        'se RT_C.PARAMETER_VALUE end as '#38179#36793#38271#24230', '
      
        'case when RT_K.PARAMETER_VALUE is NULL then Data0006.panel_wd el' +
        'se RT_K.PARAMETER_VALUE end as '#38179#36793#23485#24230', '
      
        'case when RT_C.PARAMETER_VALUE is NULL then (ISNULL(ROUND(dbo.Da' +
        'ta0006.panel_ln * dbo.Data0006.panel_wd * dbo.DATA0181.PANELS * ' +
        '0.000001, 2), 0)) else '
      
        '(ISNULL(cast(ROUND(cast(IsNull(RT_C.PARAMETER_VALUE,0) as decima' +
        'l(18,2)) * cast(IsNull(RT_K.PARAMETER_VALUE,0) as decimal(18,2))' +
        ' * isNUll(dbo.DATA0181.PANELS,0) * 0.000001, 2) as decimal(18,2)' +
        '), 0)) end AS '#38179#36793'PNL'#38754#31215
      'FROM dbo.DATA0181 INNER JOIN'
      
        '  dbo.Data0006 ON dbo.DATA0181.d06_Ptr = dbo.Data0006.RKEY LEFT ' +
        'OUTER JOIN'
      
        '  dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY LEFT ' +
        'OUTER JOIN'
      
        '  dbo.data0008 ON dbo.data0025.PROD_CODE_PTR=dbo.data0008.Rkey I' +
        'NNER JOIN'
      
        '  dbo.Data0034 ON dbo.DATA0181.d34_Ptr = dbo.Data0034.RKEY LEFT ' +
        'OUTER JOIN'
      
        '  dbo.Data0015 ON dbo.Data0006.WHOUSE_PTR = dbo.Data0015.RKEY IN' +
        'NER JOIN'
      
        '  dbo.Data0005 ON dbo.DATA0181.d05_Ptr = dbo.Data0005.RKEY INNER' +
        ' JOIN'
      
        '  dbo.Data0198 ON dbo.DATA0181.d198_Ptr = dbo.Data0198.Rkey left' +
        ' join '
      '('
      #9'select dbo.Data0006.WORK_ORDER_NUMBER, '
      #9'data0278.PARAMETER_DESC,data0494.PARAMETER_VALUE'
      #9'from Data0006 LEFT OUTER JOIN'
      #9'Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY left join'
      #9'data0494 on data0494.custpart_ptr=data0025.rkey left join '
      #9'data0278 on data0494.PARAMETER_PTR=data0278.rkey'
      
        #9'where data0278.PARAMETER_NAME like  '#39'%RT_C%'#39' and data0278.CATEG' +
        'ORY_PTR=3 and (data0025.PARENT_PTR is NULL)'
      
        ') RT_C on Data0006.WORK_ORDER_NUMBER=RT_C.WORK_ORDER_NUMBER left' +
        ' join'
      '('
      #9'select dbo.Data0006.WORK_ORDER_NUMBER, '
      #9'data0278.PARAMETER_DESC,data0494.PARAMETER_VALUE'
      #9'from Data0006 LEFT OUTER JOIN'
      #9'Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY left join'
      #9'data0494 on data0494.custpart_ptr=data0025.rkey left join '
      #9'data0278 on data0494.PARAMETER_PTR=data0278.rkey'
      
        #9'where data0278.PARAMETER_NAME like  '#39'%RT_K%'#39' and data0278.CATEG' +
        'ORY_PTR=3 and (data0025.PARENT_PTR is NULL) '
      ') RT_K on Data0006.WORK_ORDER_NUMBER=RT_K.WORK_ORDER_NUMBER ')
    Left = 152
    Top = 24
    object Ado181rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado181VCPID: TStringField
      FieldName = 'VCPID'
      Size = 12
    end
    object Ado181d06_Ptr: TIntegerField
      FieldName = 'd06_Ptr'
    end
    object Ado181d34_Ptr: TIntegerField
      FieldName = 'd34_Ptr'
    end
    object Ado181STEP: TSmallintField
      FieldName = 'STEP'
    end
    object Ado181QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object Ado181PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object Ado181sClass: TStringField
      FieldName = 'sClass'
      Size = 5
    end
    object Ado181d198_Ptr: TIntegerField
      FieldName = 'd198_Ptr'
    end
    object Ado181d05_Ptr: TIntegerField
      FieldName = 'd05_Ptr'
    end
    object Ado181create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object Ado181ComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 30
    end
    object Ado181IPAddress: TStringField
      FieldName = 'IPAddress'
    end
    object Ado181Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object Ado181WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Ado181MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado181MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado181Expr1: TSmallintField
      FieldName = 'Expr1'
    end
    object Ado181DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado181DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado181panel_ln: TFloatField
      FieldName = 'panel_ln'
    end
    object Ado181panel_wd: TFloatField
      FieldName = 'panel_wd'
    end
    object Ado181ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object Ado181PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado181PNLArae: TFloatField
      FieldName = 'PNLArae'
      ReadOnly = True
    end
    object Ado181wip_area: TFloatField
      FieldName = 'wip_area'
      ReadOnly = True
    end
    object Ado181unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object Ado181ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado181EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado181sName: TStringField
      FieldName = 'sName'
      Size = 30
    end
    object Ado181DSDesigner: TFloatField
      FieldName = #38179#36793#38271#24230
      ReadOnly = True
    end
    object Ado181DSDesigner2: TFloatField
      FieldName = #38179#36793#23485#24230
      ReadOnly = True
    end
    object Ado181PNL: TFloatField
      FieldName = #38179#36793'PNL'#38754#31215
      ReadOnly = True
    end
  end
  object tmpQry: TADOQuery
    Connection = ADOConnection
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 34
    Top = 96
  end
  object ado198: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.data0198')
    Left = 152
    Top = 88
    object ado198Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ado198sName: TStringField
      FieldName = 'sName'
      Size = 30
    end
    object ado198sType: TWordField
      FieldName = 'sType'
    end
    object ado198Remark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
  end
end
