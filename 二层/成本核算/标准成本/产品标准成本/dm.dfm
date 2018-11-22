object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 809
  Top = 362
  Height = 482
  Width = 579
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ads460: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select  D460.*,D34.Dept_Code from data0460 D460 left outer join ' +
      'data0034 D34 on D460.Dept_ptr=D34.rkey '#13#10'where bom_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 96
    Top = 8
  end
  object adsProdLists: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     D25.RKEY, D10.CUST_CODE, D25.CUSTPART_ENT_DATE, D25.C' +
      'USTOMER_PTR, D25.MANU_PART_NUMBER, D10.ABBR_NAME, D25.TSTATUS, '#13 +
      #10'                      D25.BOM_STATUS, D25.MANU_PART_DESC, D25.L' +
      'AST_MODIFIED_DATE, D25.BOM_APPR_DATE, '#13#10'                      CA' +
      'SE D25.BOM_STATUS WHEN 0 THEN '#39'MI'#24453#21518#34917#39' WHEN 1 THEN '#39'BOM'#24453#23457#39' WHEN 2' +
      ' THEN '#39'BOM'#24453#21046#39' WHEN 4 THEN '#39'BOM'#24050#23457#39' END AS BOM_Status_CN,'#13#10'       ' +
      '                D25.BOM_APPR_BY, '#13#10'                      CASE D2' +
      '5.TSTATUS WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457#26680#39' WHEN 2 THEN '#39#23457#36864#22238#39' ' +
      'WHEN 3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN 5 THEN'#13#10'               ' +
      '        '#39#26816#36864#22238#39' WHEN 6 THEN '#39#26410#25552#20132#39' END AS MI_Status, D25.AUDITED_BY' +
      '_PTR, D25.AUDITED_DATE, D25.COST_APPR_BY, D25.COST_APPR_DATE, '#13#10 +
      '                      dbo.Data0005.EMPLOYEE_NAME, d15.WAREHOUSE_' +
      'CODE, d15.ABBR_NAME, Data0005_1.EMPLOYEE_NAME AS BOM_CREATENAME,' +
      ' '#13#10'                      D25.LAST_SO_DATE, D25.tot_accu_matl_per' +
      '_sqft + D25.tot_accu_OVHD_per_sqft AS biaozhunchengben, '#13#10'      ' +
      '                CASE WHEN d25.unit_sq = 0 THEN d25.LATEST_PRICE ' +
      'ELSE (d25.LATEST_PRICE / isnull(d25.unit_sq, 1)) END AS xiaoshou' +
      'jiage, '#13#10'                      dbo.Data0008.PRODUCT_NAME'#13#10'FROM  ' +
      '       dbo.Data0025 AS D25 INNER JOIN'#13#10'                      dbo' +
      '.Data0010 AS D10 ON D25.CUSTOMER_PTR = D10.RKEY LEFT OUTER JOIN'#13 +
      #10'                      dbo.Data0005 ON D25.COST_APPR_BY = dbo.Da' +
      'ta0005.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0005 ' +
      'AS Data0005_1 ON D25.BOM_APPR_BY = Data0005_1.RKEY INNER JOIN'#13#10' ' +
      '                     dbo.Data0015 AS d15 ON D25.PROD_ROUTE_PTR =' +
      ' d15.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0008 ON' +
      ' D25.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'WHERE     (D25.PARENT_PT' +
      'R IS NULL) AND (D25.BOM_STATUS IN (1))'#13#10
    Parameters = <>
    Left = 104
    Top = 72
    object adsProdListsRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsProdListsCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object adsProdListsCUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object adsProdListsCUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object adsProdListsMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsProdListsPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object adsProdListsABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object adsProdListsTSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object adsProdListsBOM_STATUS: TWordField
      FieldName = 'BOM_STATUS'
    end
    object adsProdListsMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object adsProdListsLAST_MODIFIED_DATE: TDateTimeField
      FieldName = 'LAST_MODIFIED_DATE'
    end
    object adsProdListsBOM_APPR_DATE: TDateTimeField
      FieldName = 'BOM_APPR_DATE'
    end
    object adsProdListsBOM_Status_CN: TStringField
      FieldName = 'BOM_Status_CN'
      ReadOnly = True
      Size = 8
    end
    object adsProdListsBOM_APPR_BY: TIntegerField
      FieldName = 'BOM_APPR_BY'
    end
    object adsProdListsMI_Status: TStringField
      FieldName = 'MI_Status'
      ReadOnly = True
      Size = 6
    end
    object adsProdListsAUDITED_BY_PTR: TIntegerField
      FieldName = 'AUDITED_BY_PTR'
    end
    object adsProdListsAUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object adsProdListsCOST_APPR_BY: TIntegerField
      FieldName = 'COST_APPR_BY'
    end
    object adsProdListsCOST_APPR_DATE: TDateTimeField
      FieldName = 'COST_APPR_DATE'
    end
    object adsProdListsEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object adsProdListswarehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object adsProdListsabbr_name_1: TStringField
      FieldName = 'abbr_name_1'
      Size = 10
    end
    object adsProdListsBOM_CREATENAME: TStringField
      FieldName = 'BOM_CREATENAME'
      Size = 16
    end
    object adsProdListsLAST_SO_DATE: TDateTimeField
      FieldName = 'LAST_SO_DATE'
    end
    object adsProdListsbiaozhunchengben: TFloatField
      FieldName = 'biaozhunchengben'
      ReadOnly = True
    end
    object adsProdListsxiaoshoujiage: TFloatField
      FieldName = 'xiaoshoujiage'
      ReadOnly = True
    end
  end
  object dsProdLists: TDataSource
    DataSet = adsProdLists
    Left = 104
    Top = 128
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
      
        'SELECT MANU_PART_NUMBER, MANU_PART_DESC, PARENT_PTR,QTY_BOM, BOM' +
        '_STEP,'
      
        '      CREATED_BY_EMPL_PTR, ENG_ROUTE_PTR, REMARK, ENG_NOTE, memo' +
        '_text,'
      
        '      PROD_CODE_PTR, OPT_LOT_SIZE, EST_SCRAP, SHELF_LIFE, REVIEW' +
        '_DAYS,'
      
        '      PARTS_NUM, SAMPLE_NR, QTY_ON_HAND, CUSTOMER_PTR, MFG_LEAD_' +
        'TIME,'
      
        '      LAST_SO_DATE, REPORT_UNIT_VALUE1, TSTATUS, CHECK_BY_PTR, C' +
        'HECK_DATE,'
      
        '      AUDITED_BY_PTR, AUDITED_DATE, ALLOW_EDIT_FLAG, ONHOLD_SALE' +
        'S_FLAG,'
      
        '      ONHOLD_RELEASE_FLAG, ONHOLD_PLANNING_FLAG, CUSTPART_ENT_DA' +
        'TE,'
      '      LAST_MODIFIED_BY_PTR, LAST_MODIFIED_DATE, ANALYSIS_CODE_2,'
      
        '      ANALYSIS_CODE_3,  LAYERS, green_flag, set_lngth, set_width' +
        ','
      
        '      set_qty, unit_sq, ANALYSIS_CODE_1, pcs_lngth, pcs_width, p' +
        'cs_sq,'
      
        '      ANALYSIS_CODE_5, spell_lngth, spell_width, spell_qty, spel' +
        'l_sq,'
      
        '      ANALYSIS_CODE_4, SO_UNIT, ttype, RKEY,layers_info,tot_accu' +
        '_matl_per_sqft,cost_appr_by,LATEST_PRICE'
      'FROM dbo.Data0025'
      'where rkey=:rkey'
      ''
      ' '
      ' '
      ' ')
    Left = 216
    Top = 72
    object AQY0025RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQY0025MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQY0025MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
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
      Size = 15
    end
    object AQY0025QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object AQY0025CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQY0025MFG_LEAD_TIME: TSmallintField
      FieldName = 'MFG_LEAD_TIME'
    end
    object AQY0025LAST_SO_DATE: TDateTimeField
      FieldName = 'LAST_SO_DATE'
      DisplayFormat = 'yyyy-mm-dd'
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
      Precision = 6
      Size = 2
    end
    object AQY0025set_width: TBCDField
      FieldName = 'set_width'
      Precision = 6
      Size = 2
    end
    object AQY0025set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object AQY0025unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object AQY0025ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object AQY0025pcs_lngth: TBCDField
      FieldName = 'pcs_lngth'
      Precision = 6
      Size = 2
    end
    object AQY0025pcs_width: TBCDField
      FieldName = 'pcs_width'
      Precision = 6
      Size = 2
    end
    object AQY0025pcs_sq: TFloatField
      FieldName = 'pcs_sq'
    end
    object AQY0025ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object AQY0025spell_lngth: TBCDField
      FieldName = 'spell_lngth'
      Precision = 6
      Size = 2
    end
    object AQY0025spell_width: TBCDField
      FieldName = 'spell_width'
      Precision = 6
      Size = 2
    end
    object AQY0025spell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object AQY0025spell_sq: TFloatField
      FieldName = 'spell_sq'
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
    object AQY0025tot_accu_matl_per_sqft: TFloatField
      FieldName = 'tot_accu_matl_per_sqft'
    end
    object AQY0025cost_appr_by: TIntegerField
      FieldName = 'cost_appr_by'
    end
    object AQY0025LATEST_PRICE: TFloatField
      FieldName = 'LATEST_PRICE'
    end
  end
  object DataSource2: TDataSource
    DataSet = AQY0025
    Left = 216
    Top = 128
  end
  object ads502: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *  from Data0502'#13#10'where source_ptr=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 152
    Top = 8
    object ads502source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ads502sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
      BlobType = ftGraphic
    end
    object ads502pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object ads502pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
    object ads502TOTAL_PNLS_1: TSmallintField
      FieldName = 'TOTAL_PNLS_1'
    end
    object ads502TOTAL_PNLS_2: TSmallintField
      FieldName = 'TOTAL_PNLS_2'
    end
    object ads502UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object ads502UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object ads502UNIT_UNIT: TWordField
      FieldName = 'UNIT_UNIT'
    end
    object ads502UNIT_NUM: TIntegerField
      FieldName = 'UNIT_NUM'
    end
    object ads502SHT_LEN: TFloatField
      FieldName = 'SHT_LEN'
    end
    object ads502SHT_WTH: TFloatField
      FieldName = 'SHT_WTH'
    end
    object ads502TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ads502PNL_LEN: TFloatField
      FieldName = 'PNL_LEN'
    end
    object ads502PNL_WTH: TFloatField
      FieldName = 'PNL_WTH'
    end
    object ads502UPANEL: TSmallintField
      FieldName = 'UPANEL'
    end
    object ads502PNL_LEN_2: TFloatField
      FieldName = 'PNL_LEN_2'
    end
    object ads502PNL_WTH_2: TFloatField
      FieldName = 'PNL_WTH_2'
    end
    object ads502UPANEL_2: TSmallintField
      FieldName = 'UPANEL_2'
    end
    object ads502minspace1: TFloatField
      FieldName = 'minspace1'
    end
    object ads502minspace2: TFloatField
      FieldName = 'minspace2'
    end
  end
  object ads279: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select source_PTR, PARAMETER_PTR, PARAMETER_VALUE'#13#10', IES_PROD,IE' +
      'S_CRP'#13#10'from data0279'#13#10'where  IES_PROD=1 and'#13#10'            source_' +
      'ptr= :rkey'#13#10'order by IES_CRP'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 96
    Top = 192
    object ads279source_PTR: TIntegerField
      FieldName = 'source_PTR'
    end
    object ads279PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads279PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads279IES_PROD: TSmallintField
      FieldName = 'IES_PROD'
    end
    object ads279IES_CRP: TSmallintField
      FieldName = 'IES_CRP'
    end
    object ads279PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'PARAMETER_PTR'
      Size = 10
      Lookup = True
    end
    object ads279PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'PARAMETER_PTR'
      Size = 2
      Lookup = True
    end
    object ads279UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279datatype: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkLookup
      FieldName = 'datatype'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'PARAMETER_PTR'
      Size = 4
      Lookup = True
    end
    object ads279status3: TWordField
      FieldKind = fkLookup
      FieldName = 'status3'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'STATUS3'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ads279
    Left = 96
    Top = 240
  end
  object ads278: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10' data0278.rkey,'#13#10' data0278.PARAMETER_NAME, '#13#10' data0278.P' +
      'ARAMETER_DESC,'#13#10' Data0278.SPEC_RKEY,'#13#10' data0002.UNIT_NAME,'#13#10'case' +
      ' data0278.DATA_TYPE'#13#10'when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as d' +
      'atatype,'#13#10'data0278.STATUS3'#13#10'from data0278 inner join data0002'#13#10'o' +
      'n Data0278.UNIT_PTR = Data0002.RKEY'#13#10'where CATEGORY_PTR<>1'
    Parameters = <>
    Left = 144
    Top = 192
    object ads278rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ads278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ads278SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ads278UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ads278datatype: TStringField
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object ads278STATUS3: TWordField
      FieldName = 'STATUS3'
    end
  end
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER, tooling' +
      '_rev, '#13#10'      OUTP_SPFC,tool_old_rev'#13#10'FROM Data0038'#13#10'where sourc' +
      'e_ptr=:rkey'
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
    Left = 222
    Top = 193
    object ADS38SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS38DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS38DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
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
    object ADS38DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldKind = fkLookup
      FieldName = 'DEPT_CODE'
      LookupDataSet = ads34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'DEPT_PTR'
      Size = 10
      Lookup = True
    end
    object ADS38DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldKind = fkLookup
      FieldName = 'DEPT_NAME'
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
  end
  object DataSource4: TDataSource
    DataSet = ADS38
    Left = 222
    Top = 240
  end
  object ads34: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY, DEPT_CODE, DEPT_NAME, BARCODE_ENTRY_FLAG'#13#10'from data' +
      '0034'#13#10'where TTYPE=1'
    Parameters = <>
    Left = 286
    Top = 193
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT PARAMETER_PTR,'#13#10' PARAMETER_VALUE,'#13#10' custpart_ptr,'#13#10' step_' +
      'number,'#13#10' seq_no, Doc_Flag, after_flag, flow_spfc_flag'#13#10'FROM dbo' +
      '.Data0494'#13#10'where custpart_ptr = :SOURCE_PTR '
    IndexFieldNames = 'step_number;seq_no'
    Parameters = <
      item
        Name = 'SOURCE_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 354
    Top = 194
    object ads494PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads494PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads494custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object ads494step_number: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'step_number'
    end
    object ads494seq_no: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'seq_no'
    end
    object ads494Doc_Flag: TStringField
      DisplayLabel = #25171#21360
      FieldName = 'Doc_Flag'
      FixedChar = True
      Size = 1
    end
    object ads494after_flag: TStringField
      DisplayLabel = #21518#34917
      FieldName = 'after_flag'
      FixedChar = True
      Size = 1
    end
    object ads494flow_spfc_flag: TStringField
      DisplayLabel = #37325#28857
      FieldName = 'flow_spfc_flag'
      FixedChar = True
      Size = 1
    end
    object ads494PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'PARAMETER_PTR'
      Size = 10
      Lookup = True
    end
    object ads494PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads494SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'PARAMETER_PTR'
      Size = 2
      Lookup = True
    end
    object ads494UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads494DATATYPE: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkLookup
      FieldName = 'DATATYPE'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'PARAMETER_PTR'
      Size = 4
      Lookup = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ads494
    Left = 354
    Top = 241
  end
  object ads89: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0278.PARAMETER_NAME, '#13#10'      dbo.' +
      'Data0278.PARAMETER_DESC, dbo.data0089.tvalue, dbo.Data0002.UNIT_' +
      'NAME, '#13#10'      dbo.Data0278.SPEC_RKEY,'#13#10'case data0278.DATA_TYPE'#13#10 +
      'when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as datatype'#13#10'FROM dbo.dat' +
      'a0089 INNER JOIN'#13#10'      dbo.Data0278 ON dbo.data0089.parameter_p' +
      'tr = dbo.Data0278.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Dat' +
      'a0278.UNIT_PTR = dbo.Data0002.RKEY'#13#10'where cust_part_ptr=:rkey'#13#10'O' +
      'RDER BY dbo.data0089.rkey'#13#10
    DataSource = DataSource2
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 427
    Top = 192
    object ads89PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ads89PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ads89tvalue: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'tvalue'
      Size = 50
    end
    object ads89UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads89SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ads89datatype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource6: TDataSource
    DataSet = ads89
    Left = 427
    Top = 242
  end
  object aqBOMView: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT M.Route_Step_NO,M.DOC_FLAG,M.Dept_ptr, Qty_BOM, D.Inv_Par' +
        't_Number,'
      
        '(D.inv_name + D.inv_description) as INV_Name ,D.Unit_Code,D34.De' +
        'pt_Code'
      'FROM dbo.Data0026 M left join'
      '('
      
        'select M.rKey,Inv_Part_Number,Inv_Part_Description,U.Unit_Code,i' +
        'nv_description,inv_name'
      'from data0017 M inner join data0002 U on M.STOCK_UNIT_PTR=U.rKey'
      ') D on M.INVENTORY_PTR=d.rKey'
      'left outer join data0034 D34 on M.Dept_ptr=D34.rKey '
      'WHERE Manu_BOM_Ptr=:F01'
      ' ')
    Left = 464
    Top = 305
    object aqBOMViewDept_ptr: TIntegerField
      FieldName = 'Dept_ptr'
    end
    object aqBOMViewInv_Part_Number: TStringField
      FieldName = 'Inv_Part_Number'
      Size = 25
    end
    object aqBOMViewINV_Name: TStringField
      FieldName = 'INV_Name'
      ReadOnly = True
      Size = 100
    end
    object aqBOMViewUnit_Code: TStringField
      FieldName = 'Unit_Code'
      Size = 5
    end
    object aqBOMViewDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqBOMViewDOC_FLAG: TStringField
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object aqBOMViewQty_BOM: TFloatField
      FieldName = 'Qty_BOM'
      DisplayFormat = '##0.#00000000'
    end
    object aqBOMViewRoute_Step_NO: TSmallintField
      FieldName = 'Route_Step_NO'
    end
  end
  object dsBOMView: TDataSource
    DataSet = aqBOMView
    Left = 464
    Top = 357
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 292
    Top = 9
  end
  object aqPrimaryMatl: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = aqPrimaryMatlCalcFields
    EnableBCD = False
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0026.route_step_no,data0026.dept_ptr,D34.Dept_Code,'
      
        ' Data0017.Inv_Part_Number,Data0017.Inv_Part_Description,D02.Unit' +
        '_Code,'
      'data0026.qty_bom,data0017.std_cost,'
      'data0026.qty_bom*data0017.std_cost as Cost_Pcs'
      'from data0026,data0017,Data0002 D02,data0034 D34'
      'where data0026.manu_bom_ptr=:F01 and'
      'D02.rKey=Data0017.STOCK_UNIT_PTR and'
      'D34.rKey=Data0026.Dept_ptr'
      'and data0026.flow_no=0'
      'and data0026.inventory_ptr=data0017.rkey'
      'and (d34.IS_COST_DEPT = 1 or d34.COST_DEPT_PTR is not null)'
      'order by route_step_no,data0026.dept_ptr'
      ' '
      ' ')
    Left = 73
    Top = 304
    object aqPrimaryMatlroute_step_no: TSmallintField
      FieldName = 'route_step_no'
    end
    object aqPrimaryMatldept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object aqPrimaryMatlDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqPrimaryMatlInv_Part_Number: TStringField
      FieldName = 'Inv_Part_Number'
      Size = 25
    end
    object aqPrimaryMatlInv_Part_Description: TStringField
      FieldName = 'Inv_Part_Description'
      ReadOnly = True
      Size = 100
    end
    object aqPrimaryMatlUnit_Code: TStringField
      FieldName = 'Unit_Code'
      Size = 5
    end
    object aqPrimaryMatlqty_bom: TFloatField
      DisplayWidth = 20
      FieldName = 'qty_bom'
      DisplayFormat = '##########0.###############'
    end
    object aqPrimaryMatlstd_cost: TFloatField
      FieldName = 'std_cost'
    end
    object aqPrimaryMatlCost_Pcs: TFloatField
      FieldName = 'Cost_Pcs'
      ReadOnly = True
      DisplayFormat = '##########0.###############'
    end
    object aqPrimaryMatlCost_Per_SQM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cost_Per_SQM'
      DisplayFormat = '###,###,###,##0.#####'
      Calculated = True
    end
  end
  object aqSecondaryMatl: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = aqSecondaryMatlCalcFields
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select Data0038.Dept_ptr,D34.Dept_Code,data0038.step_number,'
      
        'Data0017.Inv_Part_Number,Data0017.Inv_Part_Description,D02.Unit_' +
        'Code,'
      'data0495.qty_bom_per_sqft,data0017.std_cost,'
      'data0495.qty_bom_per_sqft*data0017.std_cost as Cost_Per_Sqft'
      'from data0038,data0495,data0017,data0034 D34,Data0002 D02'
      'where data0038.dept_ptr=data0495.dept_ptr'
      'and data0495.invent_ptr=data0017.rkey and'
      'D34.rKey=Data0038.Dept_ptr and'
      'D02.rKey=Data0017.STOCK_UNIT_PTR'
      'and data0038.source_ptr=:F01'
      'and data0038.flow_no=0'
      'and (d34.IS_COST_DEPT = 1 or d34.COST_DEPT_PTR is not null)'
      'order by Data0038.Step_number,Data0038.Dept_ptr')
    Left = 168
    Top = 304
    object aqSecondaryMatlDept_ptr: TIntegerField
      FieldName = 'Dept_ptr'
    end
    object aqSecondaryMatlDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqSecondaryMatlstep_number: TSmallintField
      FieldName = 'step_number'
    end
    object aqSecondaryMatlInv_Part_Number: TStringField
      FieldName = 'Inv_Part_Number'
      Size = 25
    end
    object aqSecondaryMatlInv_Part_Description: TStringField
      FieldName = 'Inv_Part_Description'
      ReadOnly = True
      Size = 100
    end
    object aqSecondaryMatlUnit_Code: TStringField
      FieldName = 'Unit_Code'
      Size = 5
    end
    object aqSecondaryMatlqty_bom_per_sqft: TBCDField
      FieldName = 'qty_bom_per_sqft'
      DisplayFormat = '###,###,###,##0.#####'
      Precision = 18
      Size = 8
    end
    object aqSecondaryMatlstd_cost: TFloatField
      FieldName = 'std_cost'
    end
    object aqSecondaryMatlCost_Per_Sqft: TFloatField
      FieldName = 'Cost_Per_Sqft'
      ReadOnly = True
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqSecondaryMatlCost_per_Pcs: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cost_per_Pcs'
      DisplayFormat = '###,###,###,##0.#####'
      Calculated = True
    end
  end
  object adsPrimaryMatl: TDataSource
    DataSet = aqPrimaryMatl
    Left = 72
    Top = 360
  end
  object adsSecondaryMatl: TDataSource
    DataSet = aqSecondaryMatl
    Left = 168
    Top = 359
  end
  object aqCostSum: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = aqCostSumCalcFields
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     D460.RKEY, D460.BOM_PTR, D460.FLOW_NO, D460.STEP, D46' +
        '0.DEPT_PTR, D460.MATL_PER_SQFT_1, D460.MATL_PER_SQFT_2, D460.OVE' +
        'RHEAD_PER_SQFT, '
      
        '                      D460.OVERHEAD2_PER_SQFT, D460.OVERHEAD3_PE' +
        'R_SQFT, D460.ACCU_MATL_PER_SQFT, D460.ACCU_OVHD_PER_SQFT, '
      
        '                      D460.ACCU_OVHD2_PER_SQFT AS cost_4, D460.A' +
        'CCU_OVHD3_PER_SQFT AS cost_5, D460.TOT_ACCU_MATL_PER_SQFT, D460.' +
        'TOT_ACCU_OVHD_PER_SQFT, '
      
        '                      D460.sys_value, D460.Sub_Matl_Cost, D460.P' +
        'roducingCost, D460.Sub_Producing_Cost, D34.DEPT_CODE, D460.MATL_' +
        'PER_SQFT_1 AS Matl1, '
      
        '                      D460.MATL_PER_SQFT_2 AS Matl2, D460.TOT_AC' +
        'CU_OVHD_PER_SQFT AS PCost, D460.TOT_ACCU_MATL_PER_SQFT AS MCost,' +
        ' '
      
        '                      D460.Sub_Producing_Cost AS Sub_P_Cost, D46' +
        '0.ACCU_MATL_PER_SQFT AS Total_Matl_Cost, D460.Sub_Matl_Cost AS S' +
        'ub_Cost, '
      
        '                      D460.OVERHEAD_PER_SQFT AS PCost1, D460.OVE' +
        'RHEAD2_PER_SQFT AS PCost2, D460.OVERHEAD3_PER_SQFT AS PCost3'
      'FROM         Data0460 AS D460 LEFT OUTER JOIN'
      
        '                      Data0034 AS D34 ON D460.DEPT_PTR = D34.RKE' +
        'Y'
      'where bom_ptr=:F01'
      'order by d460.step')
    Left = 264
    Top = 304
    object aqCostSumRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqCostSumSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object aqCostSumMATL_PER_SQFT_1: TFloatField
      FieldName = 'MATL_PER_SQFT_1'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumMATL_PER_SQFT_2: TFloatField
      FieldName = 'MATL_PER_SQFT_2'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumACCU_MATL_PER_SQFT: TFloatField
      FieldName = 'ACCU_MATL_PER_SQFT'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumTOT_ACCU_MATL_PER_SQFT: TFloatField
      FieldName = 'TOT_ACCU_MATL_PER_SQFT'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumSub_Matl_Cost: TBCDField
      FieldName = 'Sub_Matl_Cost'
      DisplayFormat = '###,###,###,##0.#####'
      Precision = 18
      Size = 6
    end
    object aqCostSumDept_Code: TStringField
      FieldName = 'Dept_Code'
      Size = 10
    end
    object aqCostSumMatl1: TFloatField
      FieldName = 'Matl1'
      ProviderFlags = []
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumMatl2: TFloatField
      FieldName = 'Matl2'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumSub_Cost: TFloatField
      FieldName = 'Sub_Cost'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumTotal_Matl_Cost: TFloatField
      FieldName = 'Total_Matl_Cost'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumTotal_All: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_All'
      DisplayFormat = '###,###,###,##0.#####'
      Calculated = True
    end
    object aqCostSumOVERHEAD_PER_SQFT: TFloatField
      FieldName = 'OVERHEAD_PER_SQFT'
    end
    object aqCostSumOVERHEAD2_PER_SQFT: TFloatField
      FieldName = 'OVERHEAD2_PER_SQFT'
    end
    object aqCostSumOVERHEAD3_PER_SQFT: TFloatField
      FieldName = 'OVERHEAD3_PER_SQFT'
    end
    object aqCostSumTOT_ACCU_OVHD_PER_SQFT: TFloatField
      FieldName = 'TOT_ACCU_OVHD_PER_SQFT'
    end
    object aqCostSumProducingCost: TBCDField
      FieldName = 'ProducingCost'
      Precision = 18
      Size = 8
    end
    object aqCostSumPCost1: TFloatField
      FieldName = 'PCost1'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumPCost2: TFloatField
      FieldName = 'PCost2'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumPCost3: TFloatField
      FieldName = 'PCost3'
      DisplayFormat = '###,###,###,##0.#####'
    end
    object aqCostSumTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '###,###,###,##0.#####'
      Calculated = True
    end
    object aqCostSumPCost: TFloatField
      FieldName = 'PCost'
    end
    object aqCostSumMCost: TFloatField
      FieldName = 'MCost'
    end
    object aqCostSumSub_Producing_Cost: TBCDField
      FieldName = 'Sub_Producing_Cost'
      Precision = 18
      Size = 8
    end
    object aqCostSumSub_P_Cost: TBCDField
      FieldName = 'Sub_P_Cost'
      Precision = 18
      Size = 8
    end
    object aqCostSumBOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object aqCostSumFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object aqCostSumDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object aqCostSumACCU_OVHD_PER_SQFT: TFloatField
      FieldName = 'ACCU_OVHD_PER_SQFT'
    end
    object aqCostSumsys_value: TBCDField
      FieldName = 'sys_value'
      Precision = 19
    end
    object aqCostSumcost_4: TFloatField
      FieldName = 'cost_4'
    end
    object aqCostSumcost_5: TFloatField
      FieldName = 'cost_5'
    end
  end
  object dsCostSum: TDataSource
    DataSet = aqCostSum
    Left = 264
    Top = 356
  end
  object spCostUpdate: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Update_Prod_Cost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rKey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ApprovFlag'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 392
    Top = 16
  end
  object aqProducingCost: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = aqProducingCostCalcFields
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     D460.STEP, D34.DEPT_CODE, D460.OVERHEAD_PER_SQFT, D46' +
        '0.OVERHEAD2_PER_SQFT, D460.OVERHEAD3_PER_SQFT, '
      
        '                      D460.ACCU_OVHD2_PER_SQFT AS cost_4, D460.A' +
        'CCU_OVHD3_PER_SQFT AS cost_5'
      'FROM         Data0460 AS D460 LEFT OUTER JOIN'
      
        '                      Data0034 AS D34 ON D460.DEPT_PTR = D34.RKE' +
        'Y'
      'where bom_ptr=:F01'
      'order by d460.step')
    Left = 360
    Top = 304
    object aqProducingCostDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aqProducingCostP1_PCS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'P1_PCS'
      Calculated = True
    end
    object aqProducingCostP2_PCS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'P2_PCS'
      Calculated = True
    end
    object aqProducingCostP3_PCS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'P3_PCS'
      Calculated = True
    end
    object aqProducingCostStep: TSmallintField
      FieldName = 'Step'
    end
    object aqProducingCostOverHead_Per_SQFT: TFloatField
      FieldName = 'OverHead_Per_SQFT'
    end
    object aqProducingCostOverHead2_Per_SQFT: TFloatField
      FieldName = 'OverHead2_Per_SQFT'
    end
    object aqProducingCostOverHead3_Per_SQFT: TFloatField
      FieldName = 'OverHead3_Per_SQFT'
    end
    object aqProducingCostTotal_pcs: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_pcs'
      Calculated = True
    end
    object aqProducingCostTotal_SQM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_SQM'
      Calculated = True
    end
    object aqProducingCostcost_4: TFloatField
      FieldName = 'cost_4'
    end
    object aqProducingCostcost_5: TFloatField
      FieldName = 'cost_5'
    end
  end
  object dsProducingCost: TDataSource
    DataSet = aqProducingCost
    Left = 360
    Top = 360
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 472
    Top = 104
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 184
  end
end
