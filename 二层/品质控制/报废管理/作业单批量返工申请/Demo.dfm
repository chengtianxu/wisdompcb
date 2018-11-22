object DM: TDM
  OldCreateOrder = False
  Left = 354
  Top = 314
  Height = 490
  Width = 637
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADO203
    Left = 312
    Top = 104
  end
  object ADO257: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0257.v_ttype, dbo.DATA0257.Remark, dbo.DATA02' +
        '57.rkey73, dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_' +
        'NAME'
      'FROM         dbo.Data0073 RIGHT OUTER JOIN'
      
        '                      dbo.DATA0257 ON dbo.Data0073.RKEY = dbo.DA' +
        'TA0257.rkey73')
    Left = 56
    Top = 168
    object ADO257v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ADO257Remark: TWideStringField
      FieldName = 'Remark'
      Size = 100
    end
    object ADO257rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADO257USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO257USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
  end
  object ADO258: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    DataSource = DS257
    Parameters = <
      item
        Name = 'v_ttype'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0258.v_ttype, dbo.DATA0258.rkey34, dbo.DATA02' +
        '58.seq_no, dbo.DATA0258.name_no, dbo.Data0073.USER_FULL_NAME'
      'FROM       dbo.DATA0258 left join'
      
        '           dbo.Data0073 ON dbo.DATA0258.name_no = dbo.Data0073.R' +
        'KEY'
      'where      v_ttype=:v_ttype order by seq_no')
    Left = 56
    Top = 240
    object ADO258v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ADO258rkey34: TIntegerField
      FieldName = 'rkey34'
    end
    object ADO258seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADO258DEPT_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'DEPT_CODE'
      LookupDataSet = ADO34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'rkey34'
      Lookup = True
    end
    object ADO258DEPT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DEPT_NAME'
      LookupDataSet = ADO34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'rkey34'
      Lookup = True
    end
    object ADO258name_no: TIntegerField
      FieldName = 'name_no'
    end
    object ADO258USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object ADO239: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0239')
    Left = 504
    Top = 80
    object ADO239rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ADO239DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO239DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
    object ADO239STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADO239tooling_rev: TStringField
      FieldName = 'tooling_rev'
      FixedChar = True
      Size = 10
    end
    object ADO239TOOL_REMARK: TStringField
      FieldName = 'TOOL_REMARK'
      Size = 50
    end
    object ADO239Old_Step_NO: TIntegerField
      FieldName = 'Old_Step_NO'
    end
  end
  object ADO260: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0260')
    Left = 444
    Top = 248
    object ADO260rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ADO260dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO260user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO260auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO260PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ADO260seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADO260auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
    object ADO260Information: TIntegerField
      FieldName = 'Information'
    end
  end
  object ADO252: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT pcs_qty,pnl_qty,rkey203,rkey06 FROM DATA0252')
    Left = 392
    Top = 184
    object ADO252rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ADO252rkey06: TIntegerField
      FieldName = 'rkey06'
    end
    object ADO252pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
    object ADO252pnl_qty: TIntegerField
      FieldName = 'pnl_qty'
    end
  end
  object ADO34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0034')
    Left = 136
    Top = 256
    object ADO34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO34TTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
    object ADO34OUT_SOURCE: TWordField
      FieldName = 'OUT_SOURCE'
    end
    object ADO34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO34ACTIVE_FLAG: TWordField
      FieldName = 'ACTIVE_FLAG'
    end
    object ADO34SUPERVISOR_PTR: TIntegerField
      FieldName = 'SUPERVISOR_PTR'
    end
    object ADO34PCS_AS_UNIT: TWordField
      FieldName = 'PCS_AS_UNIT'
    end
    object ADO34UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO34BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object ADO34DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO34GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ADO34IS_COST_DEPT: TWordField
      FieldName = 'IS_COST_DEPT'
    end
    object ADO34COST_DEPT_PTR: TIntegerField
      FieldName = 'COST_DEPT_PTR'
    end
    object ADO34DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
    end
    object ADO34SCHEDULE_FLAG: TStringField
      FieldName = 'SCHEDULE_FLAG'
      Size = 1
    end
    object ADO34SEQ_NO: TIntegerField
      FieldName = 'SEQ_NO'
    end
    object ADO34BARCODE_ENTRY_FLAG: TStringField
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object ADO34ALLOW_SPLIT_LOTS: TStringField
      FieldName = 'ALLOW_SPLIT_LOTS'
      Size = 1
    end
    object ADO34PRINTING_RESOURCE: TStringField
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object ADO34SETUP_TIME_PER_LOT: TStringField
      FieldName = 'SETUP_TIME_PER_LOT'
      Size = 200
    end
    object ADO34QUEUE_TIME: TStringField
      FieldName = 'QUEUE_TIME'
      Size = 200
    end
    object ADO34PROCESS_TIME: TStringField
      FieldName = 'PROCESS_TIME'
      Size = 200
    end
    object ADO34PROCESS_TIME_B: TStringField
      FieldName = 'PROCESS_TIME_B'
      Size = 200
    end
    object ADO34IS_CYCLE: TWordField
      FieldName = 'IS_CYCLE'
    end
    object ADO34CYCLE_TIME: TStringField
      FieldName = 'CYCLE_TIME'
      Size = 200
    end
    object ADO34OVERHEAD_FORMULA: TStringField
      FieldName = 'OVERHEAD_FORMULA'
      Size = 200
    end
    object ADO34OVERHEAD2_FORMULA: TStringField
      FieldName = 'OVERHEAD2_FORMULA'
      Size = 200
    end
    object ADO34OVERHEAD3_FORMULA: TStringField
      FieldName = 'OVERHEAD3_FORMULA'
      Size = 200
    end
    object ADO34Inst_Flag: TStringField
      FieldName = 'Inst_Flag'
      Size = 1
    end
    object ADO34EQUIPMENT_PTR: TIntegerField
      FieldName = 'EQUIPMENT_PTR'
    end
    object ADO34QTY_EQP_LIMIT: TIntegerField
      FieldName = 'QTY_EQP_LIMIT'
    end
    object ADO34SETUP_SYS: TBCDField
      FieldName = 'SETUP_SYS'
      Precision = 6
    end
    object ADO34QUEUE_SYS: TBCDField
      FieldName = 'QUEUE_SYS'
      Precision = 6
    end
    object ADO34PROCESS_SYS: TBCDField
      FieldName = 'PROCESS_SYS'
      Precision = 6
    end
    object ADO34PROCESS_SYS_B: TBCDField
      FieldName = 'PROCESS_SYS_B'
      Precision = 6
    end
    object ADO34CYCLE_TIME_SYS: TBCDField
      FieldName = 'CYCLE_TIME_SYS'
      Precision = 6
    end
    object ADO34SEQ_NR: TIntegerField
      FieldName = 'SEQ_NR'
    end
    object ADO34PPC_TIME: TDateTimeField
      FieldName = 'PPC_TIME'
    end
    object ADO34PPC_BOM: TIntegerField
      FieldName = 'PPC_BOM'
    end
    object ADO34PPC_CYCLE_TIME: TIntegerField
      FieldName = 'PPC_CYCLE_TIME'
    end
    object ADO34PPC_CYCLE_LOT: TFloatField
      FieldName = 'PPC_CYCLE_LOT'
    end
    object ADO34PPC_LAST_LOT: TIntegerField
      FieldName = 'PPC_LAST_LOT'
    end
    object ADO34PPC_STATUS: TWordField
      FieldName = 'PPC_STATUS'
    end
    object ADO34PR_ID: TStringField
      FieldName = 'PR_ID'
      FixedChar = True
      Size = 2
    end
    object ADO34SPEC_FLAG: TWordField
      FieldName = 'SPEC_FLAG'
    end
    object ADO34PERMIT_SPLIT_LOT: TWordField
      FieldName = 'PERMIT_SPLIT_LOT'
    end
    object ADO34VISIBLE_IN_MI: TWordField
      FieldName = 'VISIBLE_IN_MI'
    end
    object ADO34WO_DAYS: TIntegerField
      FieldName = 'WO_DAYS'
    end
    object ADO34matl_cost_per_sq: TFloatField
      FieldName = 'matl_cost_per_sq'
    end
    object ADO34GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADO34output_flag: TWordField
      FieldName = 'output_flag'
    end
    object ADO34matcost_flag: TWordField
      FieldName = 'matcost_flag'
    end
    object ADO34cost_name: TStringField
      FieldName = 'cost_name'
      FixedChar = True
      Size = 15
    end
    object ADO34wage_flag: TBooleanField
      FieldName = 'wage_flag'
    end
    object ADO34Work_Para: TStringField
      FieldName = 'Work_Para'
      Size = 500
    end
  end
  object aq257: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'v_ttype'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select v_ttype,remark,rkey73 from data0257 where v_ttype=:v_ttyp' +
        'e')
    Left = 136
    Top = 168
    object aq257v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object aq257remark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
    object aq257rkey73: TIntegerField
      FieldName = 'rkey73'
    end
  end
  object DS257: TDataSource
    DataSet = ADO257
    Left = 224
    Top = 192
  end
  object DS258: TDataSource
    DataSet = ADO258
    Left = 232
    Top = 264
  end
  object aq203: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0203 where rkey=:rkey203')
    Left = 168
    Top = 84
    object aq203rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq203return_code: TStringField
      FieldName = 'return_code'
      Size = 10
    end
    object aq203user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object aq203ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object aq203submit: TDateTimeField
      FieldName = 'submit'
    end
    object aq203CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object aq203dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object aq203v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object aq203status: TWordField
      FieldName = 'status'
    end
    object aq203WTYPE_step: TIntegerField
      FieldName = 'WTYPE_step'
    end
    object aq203describe: TWideStringField
      FieldName = 'describe'
      Size = 200
    end
    object aq203reason: TWideStringField
      FieldName = 'reason'
      Size = 200
    end
    object aq203scheme: TWideStringField
      FieldName = 'scheme'
      Size = 200
    end
    object aq203panel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object aq203pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'table_name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where table_name=:table_name')
    Left = 405
    Top = 38
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADO06: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT   D06.RKEY, D06.PANEL_A_B, ROUND(d25.unit_sq * D56.QTY_BA' +
      'CKLOG, 4) AS Qty_SMQ, D06.wtype AS wtype06,'#13#10' d34.DEPT_CODE, d34' +
      '.DEPT_NAME, d34.WO_DAYS, '#13#10'   d34.DEPT_PTR AS deptptr, d34.TTYPE' +
      ', D06.QUAN_SCH, D56.FLOW_NO, D06.WORK_ORDER_NUMBER, '#13#10'D06.PROD_S' +
      'TATUS, D06.QUAN_REJ, DATEDIFF(minute, '#13#10' D56.INTIME, GETDATE()) ' +
      '/ 60.00 AS TimeDiff, D06.QUAN_PROD, D06.QUAN_ALLREJ, D56.INTIME,' +
      ' '#13#10'D06.REFERENCE_PTR, d25.PARENT_PTR, D06.PANELS, '#13#10'   D56.PANEL' +
      'S AS PNL_ONLine, D06.BOM_PTR, d25.MANU_PART_NUMBER, d25.MANU_PAR' +
      'T_DESC,'#13#10' D56.STEP, D56.RKEY AS d56_rkey, D56.WTYPE, '#13#10'    d25.S' +
      'AMPLE_NR, D06.FLOW_NO AS Flow_NO_06, D06.SCH_COMPL_DATE, D56.REF' +
      'ERENCE, '#13#10'D06.PARTS_PER_PANEL, D56.QTY_BACKLOG, D56.TO_BE_STOCKE' +
      'D, '#13#10'  D56.DEPT_PTR, D492.SO_NO, D492.CUT_NO, D08.PRODUCT_NAME, ' +
      'D10.CUST_CODE, D06.ENT_DATETIME, d25.unit_sq,'#13#10' (D06.panel_ln*D0' +
      '6.panel_wd*0.000001) / D06.PARTS_PER_PANEL  AS  unit_sq_includin' +
      'gBoader,'#13#10' D56.QTY_BACKLOG * d25.unit_sq AS prod_Square , D60.so' +
      '_oldnew, D60.REFERENCE_NUMBER, D492.WHOUSE_PTR, '#13#10'd15.ABBR_NAME ' +
      'AS FacNm, d25.RKEY AS rkey25 '#13#10#13#10'FROM         dbo.Data0025 AS d2' +
      '5 INNER JOIN'#13#10'                   dbo.Data0006 AS D06 ON D06.BOM_' +
      'PTR = d25.RKEY INNER JOIN'#13#10'                   dbo.Data0056 AS D5' +
      '6 ON D56.WO_PTR = D06.RKEY INNER JOIN'#13#10'                   dbo.Da' +
      'ta0034 AS d34 ON D56.DEPT_PTR = d34.RKEY INNER JOIN'#13#10'           ' +
      '        dbo.data0492 AS D492 ON D492.CUT_NO = D06.CUT_NO INNER J' +
      'OIN'#13#10'                   dbo.Data0008 AS D08 ON D08.RKEY = d25.PR' +
      'OD_CODE_PTR INNER JOIN'#13#10'                   dbo.Data0015 AS d15 O' +
      'N D56.LOC_PTR = d15.RKEY INNER JOIN'#13#10'                   dbo.Data' +
      '0010 AS D10 ON D492.COMPLETED = D10.RKEY LEFT OUTER JOIN'#13#10'      ' +
      '             dbo.Data0060 AS D60 ON D492.SO_NO = D60.SALES_ORDER' +
      #13#10'WHERE     D06.prod_status in (3,4,5) and D06.wtype in (0,1,3) ' +
      'and D56.wtype=0'#13#10'                  and D06.rkey not in(select wo' +
      '_ptr from data0238)'#13#10'                 and D25.rkey=:rkey25 and D' +
      '56.dept_ptr=:rkey34'#13#10
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    Left = 311
    Top = 20
    object ADO06RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO06PANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object ADO06Qty_SMQ: TFloatField
      FieldName = 'Qty_SMQ'
      ReadOnly = True
    end
    object ADO06wtype06: TWordField
      FieldName = 'wtype06'
    end
    object ADO06DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO06DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO06WO_DAYS: TIntegerField
      FieldName = 'WO_DAYS'
    end
    object ADO06deptptr: TIntegerField
      FieldName = 'deptptr'
    end
    object ADO06TTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
    object ADO06QUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object ADO06FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADO06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADO06PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADO06QUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object ADO06TimeDiff: TBCDField
      FieldName = 'TimeDiff'
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object ADO06QUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object ADO06QUAN_ALLREJ: TIntegerField
      FieldName = 'QUAN_ALLREJ'
    end
    object ADO06INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object ADO06REFERENCE_PTR: TIntegerField
      FieldName = 'REFERENCE_PTR'
    end
    object ADO06PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object ADO06PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADO06PNL_ONLine: TIntegerField
      FieldName = 'PNL_ONLine'
    end
    object ADO06BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ADO06MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO06MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO06STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADO06d56_rkey: TIntegerField
      FieldName = 'd56_rkey'
      ReadOnly = True
    end
    object ADO06WTYPE: TSmallintField
      FieldName = 'WTYPE'
    end
    object ADO06SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object ADO06Flow_NO_06: TSmallintField
      FieldName = 'Flow_NO_06'
    end
    object ADO06SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADO06REFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object ADO06PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ADO06QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ADO06TO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object ADO06DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO06SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADO06CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO06PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO06CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO06ENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object ADO06unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADO06unit_sq_includingBoader: TFloatField
      FieldName = 'unit_sq_includingBoader'
      ReadOnly = True
    end
    object ADO06prod_Square: TFloatField
      FieldName = 'prod_Square'
      ReadOnly = True
    end
    object ADO06so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 10
    end
    object ADO06REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 100
    end
    object ADO06WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADO06FacNm: TStringField
      FieldName = 'FacNm'
      Size = 10
    end
    object ADO06rkey25: TIntegerField
      FieldName = 'rkey25'
      ReadOnly = True
    end
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 488
    Top = 176
  end
  object aqr006: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0006.work_order_number,data0056.step,data0034.dept_na' +
        'me,'
      
        'isnull(data0056.QTY_BACKLOG,0) as QTY_BACKLOG,isnull(data0056.PA' +
        'NELS,0) as PANELS,data0252.rkey06,'
      'data0252.pnl_qty,data0252.pcs_qty'
      'from data0252'
      'inner join data0006'
      'on data0252.rkey06=data0006.rkey'
      'left join data0056'
      'on data0056.wo_ptr=data0006.rkey'
      'left join data0034'
      'on data0056.dept_ptr=data0034.rkey'
      'where data0252.rkey203=:rkey203')
    Left = 208
    Top = 16
    object aqr006work_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object aqr006step: TSmallintField
      FieldName = 'step'
    end
    object aqr006dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object aqr006QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object aqr006PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object aqr006rkey06: TIntegerField
      FieldName = 'rkey06'
    end
    object aqr006pnl_qty: TIntegerField
      FieldName = 'pnl_qty'
    end
    object aqr006pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
  end
  object aqr239: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey203'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0034.dept_code,data0034.dept_name,data0034.BARCODE_EN' +
        'TRY_FLAG,'
      'data0239.dept_ptr,data0239.step_number,data0239.old_step_no'
      'from data0239'
      'inner join data0034'
      'on data0239.dept_ptr=data0034.rkey'
      'where data0239.rkey203=:rkey203'
      'order by data0239.step_number')
    Left = 136
    Top = 8
    object aqr239dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object aqr239dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object aqr239BARCODE_ENTRY_FLAG: TStringField
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object aqr239dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object aqr239step_number: TSmallintField
      FieldName = 'step_number'
    end
    object aqr239old_step_no: TIntegerField
      FieldName = 'old_step_no'
    end
  end
  object ADO203: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT         dbo.DATA0203.rkey, dbo.DATA0203.return_code, dbo.' +
      'DATA0203.user_ptr, dbo.DATA0203.ENT_DATE, '#13#10'                    ' +
      '  dbo.DATA0203.submit, dbo.DATA0203.CUST_PART_PTR, dbo.DATA0203.' +
      'dept_ptr, dbo.DATA0203.v_ttype, dbo.DATA0203.status,'#13#10'          ' +
      '            case Data0203.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39 +
      #24453#23457#25209#39' when 2 then '#39#24050#23457#25209#39' when 3 then '#39#24050#36864#22238#39'  when 4 then '#39#24050#30830#35748#39' end ' +
      'as tstatus, '#13#10'                      dbo.DATA0203.WTYPE_step, dbo' +
      '.DATA0203.describe, dbo.DATA0203.reason, dbo.DATA0203.scheme, db' +
      'o.DATA0203.panel_qty, '#13#10'                      dbo.DATA0203.pcs_q' +
      'ty, dbo.DATA0257.Remark,dbo.Data0025.MANU_PART_NUMBER, '#13#10'       ' +
      '               dbo.Data0025.MANU_PART_DESC, dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, dbo.Data0005.employee_name as ABBR_N' +
      'AME'#13#10'FROM         dbo.DATA0203 INNER JOIN'#13#10'                  dbo' +
      '.DATA0257 ON dbo.DATA0257.v_ttype = dbo.DATA0203.v_ttype INNER J' +
      'OIN'#13#10'                  dbo.Data0025 ON dbo.DATA0203.CUST_PART_PT' +
      'R = dbo.Data0025.RKEY INNER JOIN'#13#10'                  dbo.Data0034' +
      ' ON dbo.DATA0203.dept_ptr = dbo.Data0034.RKEY INNER JOIN'#13#10'      ' +
      '            dbo.Data0005 ON dbo.DATA0203.user_ptr = dbo.Data0005' +
      '.RKEY '#13#10'WHERE  DATA0203.ent_date>=:vdate1'#13#10'             and data' +
      '0203.ent_date<=:vdate2'#13#10
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 80
    Top = 88
    object ADO203rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO203return_code: TStringField
      FieldName = 'return_code'
      Size = 10
    end
    object ADO203user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO203ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO203submit: TDateTimeField
      FieldName = 'submit'
    end
    object ADO203CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO203dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO203v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ADO203status: TWordField
      FieldName = 'status'
    end
    object ADO203tstatus: TStringField
      FieldName = 'tstatus'
      ReadOnly = True
      Size = 6
    end
    object ADO203WTYPE_step: TIntegerField
      FieldName = 'WTYPE_step'
    end
    object ADO203describe: TWideStringField
      FieldName = 'describe'
      Size = 200
    end
    object ADO203reason: TWideStringField
      FieldName = 'reason'
      Size = 200
    end
    object ADO203scheme: TWideStringField
      FieldName = 'scheme'
      Size = 200
    end
    object ADO203panel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object ADO203pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
    object ADO203Remark: TWideStringField
      FieldName = 'Remark'
      Size = 100
    end
    object ADO203MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO203MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO203DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO203DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO203ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object qryMIStep: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 545
    Top = 145
  end
  object ads260: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select  '#13#10'data0260.rkey203,'#13#10'data0260.dept_ptr,data0034.dept_nam' +
      'e,'#13#10'data0260.user_ptr,data0005.employee_name,'#13#10'data0260.auth_dat' +
      'e,'#13#10'data0260.PUTH_INFO,'#13#10'data0260.seq_no,'#13#10'data0260.auth_flag '#13#10 +
      'from data0260 '#13#10'left join data0005 on data0260.user_ptr=data0005' +
      '.rkey'#13#10'join data0034 on  data0260.dept_ptr=data0034.rkey'#13#10'join d' +
      'ata0203 on data0260.rkey203=data0203.rkey'#13#10'where data0260.rkey20' +
      '3 =:rkey'#13#10'order by data0260.seq_no'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 560
    Top = 221
    object ads260rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object ads260dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ads260dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ads260user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ads260employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ads260auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ads260PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ads260seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ads260auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
  end
  object DataSource2: TDataSource
    DataSet = ads260
    Left = 504
    Top = 264
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 440
    Top = 312
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     BIG_DEPT_PTR, DEPT_CODE'
      'FROM         dbo.Data0034'
      ''
      'where DEPT_CODE = :DEPT_CODE')
    Left = 232
    Top = 320
    object ADOQuery3DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery3BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     BIG_DEPT_PTR, DEPT_CODE'
      'FROM         dbo.Data0034'
      ''
      'where DEPT_CODE = :DEPT_CODE')
    Left = 232
    Top = 368
    object ADOQuery4BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
    object ADOQuery4DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 309
    Top = 228
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 308
    Top = 179
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 308
    Top = 272
  end
  object tmp3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 308
    Top = 320
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 352
  end
end
