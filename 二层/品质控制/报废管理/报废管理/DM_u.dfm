object DM: TDM
  OldCreateOrder = False
  Left = 438
  Top = 211
  Height = 386
  Width = 361
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADOQAll2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40909d
      end
      item
        Name = 'vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40978d
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0058.*, Data0025.MANU_PART_NUMBER,'
      '       Data0025.MANU_PART_DESC,'
      '       Data0006.WORK_ORDER_NUMBER, Data0039.REJ_CODE,'
      '       Data0039.REJECT_DESCRIPTION, Data0005_2.EMPLOYEE_NAME,'
      '       Data0005_1.EMPLOYEE_NAME AS AuditEMPLOYEE_NAM,'
      '       Data0034_1.DEPT_CODE, Data0034_1.DEPT_NAME,'
      '       b.DEPT_CODE AS RepDEPT_CODE, b.DEPT_NAME AS RepDEPT_NAME,'
      
        '      data0006.PROD_STATUS,data0006.BOM_PTR as BOM_ptr1,data0015' +
        '.abbr_name '
      'FROM dbo.Data0058 INNER JOIN'
      '      dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY '
      '      inner join data0492 on data0006.cut_no=data0492.cut_no '
      
        '      inner join data0015 on data0058.warehouse_ptr=data0015.rke' +
        'y INNER JOIN'
      
        '      dbo.Data0039 ON dbo.Data0058.REJECT_PTR = dbo.Data0039.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY L' +
        'EFT OUTER JOIN'
      '      dbo.Data0005 Data0005_1 ON'
      
        '      dbo.Data0058.AUDIT_EMPL_PTR = Data0005_1.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0005 Data0005_2 ON'
      '      dbo.Data0058.EMPL_PTR = Data0005_2.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0034 b ON dbo.Data0058.RESP_DEPT_PTR = b.RKEY LEFT' +
        ' OUTER JOIN'
      
        '      dbo.Data0034 Data0034_1 ON dbo.Data0058.DEPT_PTR = Data003' +
        '4_1.RKEY'
      'where (data0058.ttype = 0) and'
      '      (data0058.tdatetime  >= :vdate1 ) and'
      '      (data0058.tdatetime  <= :vdate2 )'
      ' ')
    Left = 40
    Top = 88
    object ADOQAll2MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQAll2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQAll2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQAll2MRB_NO: TStringField
      DisplayLabel = #25253#24223#21333#21495
      FieldName = 'MRB_NO'
      FixedChar = True
      Size = 10
    end
    object ADOQAll2WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOQAll2TRAN_PTR: TIntegerField
      FieldName = 'TRAN_PTR'
    end
    object ADOQAll2DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQAll2REJECT_PTR: TIntegerField
      FieldName = 'REJECT_PTR'
    end
    object ADOQAll2QTY_ORG_REJ: TIntegerField
      DisplayLabel = #30003#35831#25968#37327
      FieldName = 'QTY_ORG_REJ'
    end
    object ADOQAll2QTY_REJECT: TFloatField
      DisplayLabel = #25209#20934#25968#37327
      FieldName = 'QTY_REJECT'
    end
    object ADOQAll2PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQAll2FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADOQAll2STEP: TIntegerField
      FieldName = 'STEP'
    end
    object ADOQAll2EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOQAll2TDATETIME: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'TDATETIME'
    end
    object ADOQAll2AUDIT_EMPL_PTR: TIntegerField
      FieldName = 'AUDIT_EMPL_PTR'
    end
    object ADOQAll2AUDIT_DATETIME: TDateTimeField
      DisplayLabel = #25209#20934#26085#26399
      FieldName = 'AUDIT_DATETIME'
    end
    object ADOQAll2RESP_DEPT_PTR: TIntegerField
      FieldName = 'RESP_DEPT_PTR'
    end
    object ADOQAll2REFERENCE: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE'
      FixedChar = True
      Size = 30
    end
    object ADOQAll2TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOQAll2WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQAll2REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQAll2REJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQAll2EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQAll2AuditEMPLOYEE_NAM: TStringField
      DisplayLabel = #25209#20934#20154
      FieldName = 'AuditEMPLOYEE_NAM'
      Size = 16
    end
    object ADOQAll2DEPT_CODE: TStringField
      DisplayLabel = #30003#35831#24037#24207
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQAll2DEPT_NAME: TStringField
      DisplayLabel = #30003#35831#24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQAll2RepDEPT_CODE: TStringField
      DisplayLabel = #36131#20219#24037#24207
      FieldName = 'RepDEPT_CODE'
      Size = 10
    end
    object ADOQAll2RepDEPT_NAME: TStringField
      DisplayLabel = #36131#20219#24037#24207#21517#31216
      FieldName = 'RepDEPT_NAME'
      Size = 30
    end
    object ADOQAll2StepNow: TIntegerField
      FieldName = 'StepNow'
    end
    object ADOQAll2PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADOQAll2BOM_ptr1: TIntegerField
      FieldName = 'BOM_ptr1'
    end
    object ADOQAll2abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQAll2warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object Tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 40
    Top = 160
  end
  object ADOQ0006: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey0006'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * from data0006  where rkey = :rkey0006'
      ''
      '')
    Left = 192
    Top = 32
    object ADOQ0006RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0006WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQ0006CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQ0006BEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object ADOQ0006PANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object ADOQ0006WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADOQ0006USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADOQ0006EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOQ0006BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ADOQ0006SUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object ADOQ0006PRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object ADOQ0006ENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object ADOQ0006PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADOQ0006ENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object ADOQ0006QUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object ADOQ0006QUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object ADOQ0006QUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object ADOQ0006PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQ0006REMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object ADOQ0006ENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object ADOQ0006SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADOQ0006PROJ_START_DATE: TDateTimeField
      FieldName = 'PROJ_START_DATE'
    end
    object ADOQ0006PROJ_COMPL_DATE: TDateTimeField
      FieldName = 'PROJ_COMPL_DATE'
    end
    object ADOQ0006CANCEL_HOLD_DATE: TDateTimeField
      FieldName = 'CANCEL_HOLD_DATE'
    end
    object ADOQ0006ACT_COMPL_DATE: TDateTimeField
      FieldName = 'ACT_COMPL_DATE'
    end
    object ADOQ0006RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADOQ0006PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ADOQ0006EDITED_BY: TIntegerField
      FieldName = 'EDITED_BY'
    end
    object ADOQ0006PLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object ADOQ0006RELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object ADOQ0006TRAV_PRINTED_BY_PTR: TIntegerField
      FieldName = 'TRAV_PRINTED_BY_PTR'
    end
    object ADOQ0006FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQ0006WIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object ADOQ0006PPC_FLAG: TSmallintField
      FieldName = 'PPC_FLAG'
    end
    object ADOQ0006REFERENCE_PTR: TIntegerField
      FieldName = 'REFERENCE_PTR'
    end
    object ADOQ0006panel_ln: TFloatField
      FieldName = 'panel_ln'
    end
    object ADOQ0006panel_wd: TFloatField
      FieldName = 'panel_wd'
    end
    object ADOQ0006wtype: TWordField
      FieldName = 'wtype'
    end
    object ADOQ0006put_type: TWordField
      FieldName = 'put_type'
    end
    object ADOQ0006MATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object ADOQ0006OVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object ADOQ0006pnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object ADOQ0006from_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object ADOQ0006QUAN_ALLREJ: TIntegerField
      FieldName = 'QUAN_ALLREJ'
    end
    object ADOQ0006QUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
  end
  object ADOQ0058: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey0058'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * from data0058 where rkey = :rkey0058'
      ''
      '')
    Left = 192
    Top = 88
    object ADOQ0058RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0058MRB_NO: TStringField
      FieldName = 'MRB_NO'
      FixedChar = True
      Size = 10
    end
    object ADOQ0058WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOQ0058TRAN_PTR: TIntegerField
      FieldName = 'TRAN_PTR'
    end
    object ADOQ0058DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQ0058REJECT_PTR: TIntegerField
      FieldName = 'REJECT_PTR'
    end
    object ADOQ0058QTY_ORG_REJ: TIntegerField
      FieldName = 'QTY_ORG_REJ'
    end
    object ADOQ0058QTY_REJECT: TFloatField
      FieldName = 'QTY_REJECT'
    end
    object ADOQ0058PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQ0058BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ADOQ0058FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADOQ0058STEP: TIntegerField
      FieldName = 'STEP'
    end
    object ADOQ0058EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOQ0058TDATETIME: TDateTimeField
      FieldName = 'TDATETIME'
    end
    object ADOQ0058AUDIT_EMPL_PTR: TIntegerField
      FieldName = 'AUDIT_EMPL_PTR'
    end
    object ADOQ0058AUDIT_DATETIME: TDateTimeField
      FieldName = 'AUDIT_DATETIME'
    end
    object ADOQ0058RESP_DEPT_PTR: TIntegerField
      FieldName = 'RESP_DEPT_PTR'
    end
    object ADOQ0058REFERENCE: TStringField
      FieldName = 'REFERENCE'
      FixedChar = True
      Size = 30
    end
    object ADOQ0058TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOQ0058StepNow: TIntegerField
      FieldName = 'StepNow'
    end
    object ADOQ0058warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADOQ564834: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 40
    Top = 224
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 128
    Top = 168
  end
end
