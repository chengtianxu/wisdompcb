object DM: TDM
  OldCreateOrder = False
  Left = 279
  Top = 163
  Height = 454
  Width = 655
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 32
    Top = 72
  end
  object AQY0025: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT RKEY,MANU_PART_NUMBER, MANU_PART_DESC, PARENT_PTR,QTY_BOM' +
        ', BOM_STEP,'
      
        '      CREATED_BY_EMPL_PTR, ENG_ROUTE_PTR, REMARK, ENG_NOTE, memo' +
        '_text,'
      
        '      PROD_CODE_PTR, OPT_LOT_SIZE, EST_SCRAP, SHELF_LIFE, REVIEW' +
        '_DAYS,'
      
        '      PARTS_NUM, SAMPLE_NR, PROD_ROUTE_PTR, CUSTOMER_PTR, MFG_LE' +
        'AD_TIME,'
      
        '      LAST_SO_DATE, REPORT_UNIT_VALUE1, TSTATUS, CHECK_BY_PTR, C' +
        'HECK_DATE,'
      
        '      AUDITED_BY_PTR, AUDITED_DATE, ALLOW_EDIT_FLAG, ONHOLD_SALE' +
        'S_FLAG,'
      
        '      ONHOLD_RELEASE_FLAG, ONHOLD_PLANNING_FLAG, CUSTPART_ENT_DA' +
        'TE,'
      
        '      LAST_MODIFIED_BY_PTR, LAST_MODIFIED_DATE, ANALYSIS_CODE_2,' +
        'TUSAGE,'
      
        '      ANALYSIS_CODE_3,  LAYERS, green_flag, set_lngth, set_width' +
        ',QTY_PARENTBOM,'
      
        '      set_qty, unit_sq, ANALYSIS_CODE_1, pcs_lngth, pcs_width, p' +
        'cs_sq,nopb_flag,'
      
        '      ANALYSIS_CODE_5, spell_lngth, spell_width, spell_qty, spel' +
        'l_sq, current_rev,'
      
        '      ANALYSIS_CODE_4, SO_UNIT, ttype, layers_info,QTY_ON_HAND,b' +
        'arcode_flag,quality_status,quality_user,quality_date'
      'FROM dbo.Data0025'
      'where rkey=:rkey')
    Left = 89
    Top = 136
    object AQY0025RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQY0025MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQY0025MANU_PART_DESC: TStringField
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object AQY0025PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object AQY0025QTY_BOM: TWordField
      FieldName = 'QTY_BOM'
    end
    object AQY0025BOM_STEP: TWordField
      FieldName = 'BOM_STEP'
    end
    object AQY0025CREATED_BY_EMPL_PTR: TIntegerField
      FieldName = 'CREATED_BY_EMPL_PTR'
    end
    object AQY0025ENG_ROUTE_PTR: TIntegerField
      FieldName = 'ENG_ROUTE_PTR'
    end
    object AQY0025PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object AQY0025REMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object AQY0025ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object AQY0025memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
    object AQY0025PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object AQY0025OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object AQY0025EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object AQY0025SHELF_LIFE: TIntegerField
      FieldName = 'SHELF_LIFE'
    end
    object AQY0025REVIEW_DAYS: TSmallintField
      FieldName = 'REVIEW_DAYS'
    end
    object AQY0025PARTS_NUM: TIntegerField
      FieldName = 'PARTS_NUM'
    end
    object AQY0025SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 30
    end
    object AQY0025CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQY0025MFG_LEAD_TIME: TSmallintField
      FieldName = 'MFG_LEAD_TIME'
    end
    object AQY0025LAST_SO_DATE: TDateTimeField
      FieldName = 'LAST_SO_DATE'
    end
    object AQY0025REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object AQY0025TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object AQY0025CHECK_BY_PTR: TIntegerField
      FieldName = 'CHECK_BY_PTR'
    end
    object AQY0025CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object AQY0025AUDITED_BY_PTR: TIntegerField
      FieldName = 'AUDITED_BY_PTR'
    end
    object AQY0025AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object AQY0025ALLOW_EDIT_FLAG: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQY0025ONHOLD_SALES_FLAG: TWordField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object AQY0025ONHOLD_RELEASE_FLAG: TWordField
      FieldName = 'ONHOLD_RELEASE_FLAG'
    end
    object AQY0025ONHOLD_PLANNING_FLAG: TWordField
      FieldName = 'ONHOLD_PLANNING_FLAG'
    end
    object AQY0025CUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object AQY0025LAST_MODIFIED_BY_PTR: TIntegerField
      FieldName = 'LAST_MODIFIED_BY_PTR'
    end
    object AQY0025LAST_MODIFIED_DATE: TDateTimeField
      FieldName = 'LAST_MODIFIED_DATE'
    end
    object AQY0025ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object AQY0025ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object AQY0025LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object AQY0025green_flag: TStringField
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object AQY0025set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object AQY0025set_width: TBCDField
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object AQY0025set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object AQY0025unit_sq: TFloatField
      FieldName = 'unit_sq'
      DisplayFormat = '0.00000000'
    end
    object AQY0025ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object AQY0025pcs_lngth: TBCDField
      FieldName = 'pcs_lngth'
      Precision = 7
      Size = 3
    end
    object AQY0025pcs_width: TBCDField
      FieldName = 'pcs_width'
      Precision = 7
      Size = 3
    end
    object AQY0025pcs_sq: TFloatField
      FieldName = 'pcs_sq'
      DisplayFormat = '0.00000000'
    end
    object AQY0025ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object AQY0025spell_lngth: TBCDField
      FieldName = 'spell_lngth'
      Precision = 7
      Size = 3
    end
    object AQY0025spell_width: TBCDField
      FieldName = 'spell_width'
      Precision = 7
      Size = 3
    end
    object AQY0025spell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object AQY0025spell_sq: TFloatField
      FieldName = 'spell_sq'
      DisplayFormat = '0.00000000'
    end
    object AQY0025ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
      Size = 30
    end
    object AQY0025SO_UNIT: TStringField
      FieldName = 'SO_UNIT'
      Size = 6
    end
    object AQY0025ttype: TWordField
      FieldName = 'ttype'
    end
    object AQY0025layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object AQY0025QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object AQY0025barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object AQY0025current_rev: TStringField
      DisplayLabel = #21348#32032#35201#27714#65288'Y/N'#65289
      FieldName = 'current_rev'
      FixedChar = True
      Size = 10
    end
    object AQY0025QTY_PARENTBOM: TWordField
      FieldName = 'QTY_PARENTBOM'
    end
    object AQY0025nopb_flag: TWordField
      FieldName = 'nopb_flag'
    end
    object AQY0025TUSAGE: TBCDField
      DisplayLabel = #22823#26009#21033#29992#29575
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object AQY0025quality_status: TBooleanField
      FieldName = 'quality_status'
    end
    object AQY0025quality_user: TIntegerField
      FieldName = 'quality_user'
    end
    object AQY0025quality_date: TDateTimeField
      FieldName = 'quality_date'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Prepared = True
    Left = 167
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 228
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 24
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 349
    Top = 24
  end
  object ADO31: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select SOURCE_PTR, STEP_NUMBER, DEPT_PTR, QA_CONFIRMATION, SCRAP' +
        '_QTY_reason, '
      
        'gaffer_confirmation, FLOW_QTY, rece_gaffetconfir, technology_dif' +
        'f '
      'from DATA0031'
      'where source_ptr=:rkey25'
      'order by step_number')
    Left = 200
    Top = 168
    object ADO31SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO31STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADO31DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO31QA_CONFIRMATION: TStringField
      FieldName = 'QA_CONFIRMATION'
      Size = 400
    end
    object ADO31SCRAP_QTY_reason: TStringField
      FieldName = 'SCRAP_QTY_reason'
      Size = 400
    end
    object ADO31gaffer_confirmation: TStringField
      FieldName = 'gaffer_confirmation'
      Size = 400
    end
    object ADO31rece_gaffetconfir: TStringField
      FieldName = 'rece_gaffetconfir'
      Size = 50
    end
    object ADO31technology_diff: TStringField
      FieldName = 'technology_diff'
      Size = 200
    end
    object ADO31FLOW_QTY: TStringField
      FieldName = 'FLOW_QTY'
      Size = 50
    end
  end
  object aq31: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
    SQL.Strings = (
      
        'select * from data0031 where source_ptr=:rkey25 and dept_ptr=:rk' +
        'ey34  ')
    Left = 248
    Top = 176
    object aq31SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object aq31STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object aq31DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object aq31QA_CONFIRMATION: TStringField
      FieldName = 'QA_CONFIRMATION'
      Size = 400
    end
    object aq31SCRAP_QTY_reason: TStringField
      FieldName = 'SCRAP_QTY_reason'
      Size = 400
    end
    object aq31gaffer_confirmation: TStringField
      FieldName = 'gaffer_confirmation'
      Size = 400
    end
    object aq31rece_gaffetconfir: TStringField
      FieldName = 'rece_gaffetconfir'
      Size = 50
    end
    object aq31technology_diff: TStringField
      FieldName = 'technology_diff'
      Size = 200
    end
    object aq31FLOW_QTY: TStringField
      FieldName = 'FLOW_QTY'
      Size = 50
    end
  end
  object ADS31: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = ADS31BeforeOpen
    OnCalcFields = ADS31CalcFields
    CommandText = 
      'select data0031.SOURCE_PTR, data0031.STEP_NUMBER, data0031.DEPT_' +
      'PTR, data0031.QA_CONFIRMATION, data0031.SCRAP_QTY_reason, '#13#10'data' +
      '0031.gaffer_confirmation, data0031.FLOW_QTY, data0031.rece_gaffe' +
      'tconfir, data0031.technology_diff,data0034.dept_name,data0025.MA' +
      'NU_PART_NUMBER '#13#10'from DATA0031'#13#10'inner join data0034 on data0031.' +
      'dept_ptr=data0034.rkey'#13#10'inner join data0025 on data0031.source_p' +
      'tr=data0025.rkey'#13#10'where source_ptr=:rkey25'#13#10'order by step_number' +
      #13#10
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 296
    Top = 176
    object ADS31SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS31STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADS31DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS31QA_CONFIRMATION: TStringField
      FieldName = 'QA_CONFIRMATION'
      Size = 400
    end
    object ADS31SCRAP_QTY_reason: TStringField
      FieldName = 'SCRAP_QTY_reason'
      Size = 400
    end
    object ADS31gaffer_confirmation: TStringField
      FieldName = 'gaffer_confirmation'
      Size = 400
    end
    object ADS31rece_gaffetconfir: TStringField
      FieldName = 'rece_gaffetconfir'
      Size = 50
    end
    object ADS31technology_diff: TStringField
      FieldName = 'technology_diff'
      Size = 200
    end
    object ADS31dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADS31MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS31FLOW_QTY: TStringField
      FieldName = 'FLOW_QTY'
      Size = 50
    end
    object ADS31WideStringField: TWideStringField
      FieldKind = fkCalculated
      FieldName = #24037#33402#21442#25968
      Size = 2000
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = AQY0025
    Left = 32
    Top = 136
  end
  object DataSource4: TDataSource
    DataSet = ADS38
    Left = 34
    Top = 296
  end
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeOpen = ADS38BeforeOpen
    OnCalcFields = ADS38CalcFields
    CommandText = 
      'SELECT data0038.SOURCE_PTR, data0038.DEPT_PTR, '#13#10'data0038.DEF_RO' +
      'UT_INST, data0038.STEP_NUMBER, '#13#10'data0038.tooling_rev, data0038.' +
      'OUTP_SPFC,'#13#10'data0038.tool_old_rev, data0038.TOOL_REMARK,data0038' +
      '.grade_note'#13#10'FROM Data0038 '#13#10'where source_ptr=:rkey'#13#10'order by st' +
      'ep_number'
    IndexFieldNames = 'step_number'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 89
    Top = 296
    object ADS38SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS38DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS38DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
    object ADS38STEP_NUMBER: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'STEP_NUMBER'
    end
    object ADS38tooling_rev: TStringField
      DisplayLabel = #24037#20855#29256#26412
      FieldName = 'tooling_rev'
      FixedChar = True
      Size = 10
    end
    object ADS38OUTP_SPFC: TBCDField
      DisplayLabel = #20135#20986#31995#25968
      FieldName = 'OUTP_SPFC'
      Precision = 19
    end
    object ADS38tool_old_rev: TStringField
      FieldName = 'tool_old_rev'
      Size = 10
    end
    object ADS38TOOL_REMARK: TStringField
      FieldName = 'TOOL_REMARK'
      Size = 50
    end
    object ADS38dept_code: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldKind = fkLookup
      FieldName = 'dept_code'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Size = 10
      Lookup = True
    end
    object ADS38dept_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'DEPT_PTR'
      Size = 30
      Lookup = True
    end
    object ADS38BARCODE_ENTRY_FLAG: TStringField
      DisplayLabel = #36807#25968
      FieldKind = fkLookup
      FieldName = 'BARCODE_ENTRY_FLAG'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'BARCODE_ENTRY_FLAG'
      KeyFields = 'DEPT_PTR'
      Size = 1
      Lookup = True
    end
    object ADS38grade_note: TWideStringField
      FieldName = 'grade_note'
      Size = 2048
    end
    object ADS38WideStringField: TWideStringField
      DisplayWidth = 2000
      FieldKind = fkCalculated
      FieldName = #24037#33402#21442#25968
      Size = 2000
      Calculated = True
    end
  end
  object ads34: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY, DEPT_CODE, DEPT_NAME, BARCODE_ENTRY_FLAG'#13#10'from data' +
      '0034'#13#10'where TTYPE=1'
    Parameters = <>
    Left = 140
    Top = 296
  end
  object ADS25: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER,'#13#10'  ' +
      'dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, dbo.Data001' +
      '0.ABBR_NAME, '#13#10'  dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NA' +
      'ME, '#13#10' dbo.Data0025.ANALYSIS_CODE_1, Data0005_3.EMPLOYEE_NAME AS' +
      ' employee_createname, '#13#10' dbo.Data0025.CUSTPART_ENT_DATE, dbo.Dat' +
      'a0025.PROD_ROUTE_PTR, dbo.data0025.quality_status,'#13#10' Data0005_1.' +
      'EMPLOYEE_NAME AS employee_auditname, dbo.Data0025.AUDITED_DATE, ' +
      #13#10' dbo.Data0025.TSTATUS, Data0005_2.EMPLOYEE_NAME AS employee_ed' +
      'itname,'#13#10' dbo.Data0025.LAST_MODIFIED_DATE, dbo.Data0025.SAMPLE_N' +
      'R, '#13#10'   dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.QTY_ON_HAND, ' +
      'dbo.Data0025.LAYERS, dbo.Data0025.green_flag, '#13#10'   CASE Data0025' +
      '.ONHOLD_SALES_FLAG WHEN 0 THEN '#39#26377#25928#39' WHEN 1 THEN '#39#36807#26399#39' END AS over' +
      'due, '#13#10'  CASE Data0025.TSTATUS WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457 +
      #26680#39' '#13#10'WHEN 2 THEN '#39#23457#36864#22238#39' WHEN 3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN ' +
      '5 THEN '#39#26816#36864#22238#39#13#10'                       WHEN 6 THEN '#39#26410#25552#20132#39' END AS st' +
      'ate,'#13#10' CASE Data0025.ttype WHEN 0 THEN '#39#37327#20135#39' WHEN 1 THEN '#39#26679#26495#39' END' +
      ' AS batch_or_former,'#13#10'case data0025.quality_status when 0 then '#39 +
      #26410#32467#26696#39' when 1 then '#39#24050#32467#26696#39' end as quality_state,'#13#10' dbo.Data0025.CHEC' +
      'K_DATE, dbo.Data0005.EMPLOYEE_NAME AS check_emplname'#13#10'FROM      ' +
      '   dbo.Data0008 INNER JOIN'#13#10'                      dbo.Data0025 O' +
      'N dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'   ' +
      '                   dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = d' +
      'bo.Data0010.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data' +
      '0005 ON dbo.Data0025.CHECK_BY_PTR = dbo.Data0005.RKEY LEFT OUTER' +
      ' JOIN'#13#10'                      dbo.Data0005 AS Data0005_2 ON dbo.D' +
      'ata0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKEY LEFT OUTER JOIN'#13#10 +
      '                      dbo.Data0005 AS Data0005_1 ON dbo.Data0025' +
      '.AUDITED_BY_PTR = Data0005_1.RKEY LEFT OUTER JOIN'#13#10'             ' +
      '         dbo.Data0005 AS Data0005_3 ON dbo.Data0025.CREATED_BY_E' +
      'MPL_PTR = Data0005_3.RKEY'#13#10'where data0025.CUSTPART_ENT_DATE >=:d' +
      'tpk1 and'#13#10'           data0025.CUSTPART_ENT_DATE-1 <=:dtpk2 and'#13#10 +
      '           data0025.parent_ptr is null and'#13#10'  data0025.tstatus =' +
      '1'#13#10
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37987d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end>
    Prepared = True
    Left = 89
    Top = 80
    object ADS25rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS25MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS25MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADS25CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 8
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS25ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS25PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      DisplayWidth = 8
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS25PRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS25employee_createname: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'employee_createname'
      Size = 16
    end
    object ADS25CUSTPART_ENT_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ADS25employee_auditname: TStringField
      DisplayLabel = #23457#26680#20154#21592
      FieldName = 'employee_auditname'
      Size = 16
    end
    object ADS25AUDITED_DATE: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AUDITED_DATE'
    end
    object ADS25employee_editname: TStringField
      DisplayLabel = #20462#35746#20154#21592
      FieldName = 'employee_editname'
      Size = 16
    end
    object ADS25LAST_MODIFIED_DATE: TDateTimeField
      DisplayLabel = #20462#35746#26085#26399
      FieldName = 'LAST_MODIFIED_DATE'
    end
    object ADS25SAMPLE_NR: TStringField
      DisplayLabel = #26679#26495#32534#21495
      FieldName = 'SAMPLE_NR'
      Size = 15
    end
    object ADS25ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADS25QTY_ON_HAND: TIntegerField
      DisplayLabel = #29616#26377#24211#23384
      FieldName = 'QTY_ON_HAND'
    end
    object ADS25overdue: TStringField
      DisplayLabel = #38144#21806#29366#24577
      FieldName = 'overdue'
      ReadOnly = True
      Size = 4
    end
    object ADS25state: TStringField
      DisplayLabel = #23457#26680#29366#24577
      FieldName = 'state'
      ReadOnly = True
      Size = 6
    end
    object ADS25batch_or_former: TStringField
      DisplayLabel = #23646#24615
      FieldName = 'batch_or_former'
      ReadOnly = True
      Size = 4
    end
    object ADS25LAYERS: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYERS'
    end
    object ADS25green_flag: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object ADS25TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADS25PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object ADS25ANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADS25CHECK_DATE: TDateTimeField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'CHECK_DATE'
    end
    object ADS25check_emplname: TStringField
      DisplayLabel = #26816#26597#20154#21592
      FieldName = 'check_emplname'
      Size = 16
    end
    object ADS25quality_status: TBooleanField
      FieldName = 'quality_status'
    end
    object ADS25quality_state: TStringField
      FieldName = 'quality_state'
      ReadOnly = True
      Size = 6
    end
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,' +
      ' '#13#10'      dbo.Data0494.PARAMETER_VALUE, dbo.Data0002.UNIT_CODE,'#13#10 +
      '      data0494.step_number'#13#10'FROM dbo.Data0494 INNER JOIN'#13#10'      ' +
      'dbo.Data0278 ON '#13#10'      dbo.Data0494.PARAMETER_PTR = dbo.Data027' +
      '8.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0278.UNIT_PTR =' +
      ' dbo.Data0002.RKEY'#13#10'where data0494.custpart_ptr = :source_ptr an' +
      'd'#13#10'           Data0494.PARAMETER_VALUE <> :value and'#13#10'          ' +
      ' data0494.doc_flag='#39'Y'#39#13#10'order by data0494.step_number, data0494.' +
      'seq_no'
    Parameters = <
      item
        Name = 'source_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    Left = 288
    Top = 277
    object ads494PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ads494PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object ads494PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads494UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ads494step_number: TSmallintField
      FieldName = 'step_number'
    end
  end
  object ads192: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'SELECT ENG_CONTROL2, ENG_CONTROL16'#13#10'FROM dbo.Data0192'
    Parameters = <>
    Left = 249
    Top = 279
    object ads192ENG_CONTROL2: TWordField
      DisplayLabel = #19981#26174#31034#20026#31354#30340#21046#31243#21442#25968
      FieldName = 'ENG_CONTROL2'
    end
    object ads192ENG_CONTROL16: TWordField
      DisplayLabel = #19981#26174#31034#20026#31354#30340#20840#23616#21442#25968
      FieldName = 'ENG_CONTROL16'
    end
  end
end
