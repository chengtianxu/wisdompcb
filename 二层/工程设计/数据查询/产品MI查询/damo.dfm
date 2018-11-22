object DM: TDM
  OldCreateOrder = False
  Left = 744
  Top = 206
  Height = 544
  Width = 685
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 18
  end
  object ADS25: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER, dbo' +
      '.Data0025.MANU_PART_DESC,'#13#10' dbo.Data0010.CUST_CODE, dbo.Data0010' +
      '.ABBR_NAME, '#13#10'                      dbo.Data0008.PROD_CODE, dbo.' +
      'Data0008.PRODUCT_NAME, dbo.Data0025.ANALYSIS_CODE_1, '#13#10'Data0005_' +
      '3.EMPLOYEE_NAME AS employee_createname, '#13#10'                      ' +
      'dbo.Data0025.CUSTPART_ENT_DATE, dbo.Data0025.PROD_ROUTE_PTR, '#13#10'D' +
      'ata0005_1.EMPLOYEE_NAME AS employee_auditname, dbo.Data0025.AUDI' +
      'TED_DATE, '#13#10'                      dbo.Data0025.TSTATUS, dbo.Data' +
      '0025.set_qty, '#13#10'Data0005_2.EMPLOYEE_NAME AS employee_editname, d' +
      'bo.Data0025.LAST_MODIFIED_DATE, data0025.ORIG_CUSTOMER,'#13#10'       ' +
      '               dbo.Data0025.SAMPLE_NR, dbo.Data0025.ANALYSIS_COD' +
      'E_2,dbo.Data0025.ANALYSIS_CODE_5,'#13#10' dbo.Data0025.QTY_ON_HAND, db' +
      'o.Data0025.LAYERS, dbo.Data0025.green_flag,  '#13#10'  CASE Data0025.O' +
      'NHOLD_SALES_FLAG WHEN 0 THEN '#39#26377#25928#39' WHEN 1 THEN '#39#36807#26399#39' END AS overdu' +
      'e, '#13#10'  CASE Data0025.TSTATUS WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457#26680#39 +
      ' WHEN 2 THEN '#39#23457#36864#22238#39' '#13#10'WHEN 3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN 5 ' +
      'THEN '#39#26816#36864#22238#39#13#10'                       WHEN 6 THEN '#39#26410#25552#20132#39' END AS stat' +
      'e, data0025.unit_sq,'#13#10'CASE Data0025.ttype WHEN 0 THEN '#39#37327#20135#39' WHEN ' +
      '1 THEN '#39#26679#26495#39' END AS batch_or_former, dbo.Data0025.TUSAGE,'#13#10'd10_2.' +
      'CUST_CODE as ORIG_CUST_CODE,dbo.Data0025.set_lngth,dbo.Data0025.' +
      'set_width,data0025.CPJS,Data0025.DrillRemark'#13#10'FROM         dbo.D' +
      'ata0008 INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Da' +
      'ta0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'           ' +
      '           dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0' +
      '010.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0005 AS ' +
      'Data0005_2 ON dbo.Data0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKE' +
      'Y LEFT OUTER JOIN'#13#10'                      dbo.Data0005 AS Data000' +
      '5_1 ON dbo.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY LEFT OUTER ' +
      'JOIN'#13#10'                      dbo.Data0005 AS Data0005_3 ON dbo.Da' +
      'ta0025.CREATED_BY_EMPL_PTR = Data0005_3.RKEY'#13#10'left JOIN Data0010' +
      ' d10_2 on d10_2.ABBR_NAME = Data0025.ORIG_CUSTOMER'#13#10'where data00' +
      '25.CUSTPART_ENT_DATE >=:dtpk1 and'#13#10'           data0025.CUSTPART_' +
      'ENT_DATE <=:dtpk2 and'#13#10'           data0025.parent_ptr is null an' +
      'd'#13#10'           data0025.tstatus <> :v6 and  data0025.tstatus <> :' +
      'v0 and'#13#10'           data0025.tstatus <> :v3 and  data0025.tstatus' +
      ' <> :v4 and'#13#10'           data0025.tstatus <> :v1 and  data0025.ts' +
      'tatus <> :v5 and'#13#10'           data0025.tstatus <> :v2 '#13#10'         ' +
      ' and  data0025.ONHOLD_SALES_FLAG = 0'#13#10
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end
      item
        Name = 'v0'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end>
    Prepared = True
    Left = 97
    Top = 72
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
      DisplayWidth = 80
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
    object ADS25set_qty: TIntegerField
      DisplayLabel = #20132#36135#21333#20803#25968
      FieldName = 'set_qty'
    end
    object bcdfldADS25set_lngth: TBCDField
      DisplayLabel = #20132#36135'set'#38271
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object bcdfldADS25set_width: TBCDField
      DisplayLabel = #20132#36135'set'#23485
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object ADS25TUSAGE: TBCDField
      DisplayLabel = #22823#26009#21033#29992#29575
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object ADS25unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq'
    end
    object ADS25ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object ADS25ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADS25ORIG_CUST_CODE: TStringField
      FieldName = 'ORIG_CUST_CODE'
      Size = 10
    end
    object ADS25CPJS: TStringField
      DisplayLabel = #20135#21697#38454#25968
      FieldName = 'CPJS'
      Size = 30
    end
    object ADS25DrillRemark: TStringField
      FieldName = 'DrillRemark'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 32
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 32
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
        '_text, '
      
        '      PROD_CODE_PTR, OPT_LOT_SIZE, EST_SCRAP, SHELF_LIFE, REVIEW' +
        '_DAYS, '
      
        '      PARTS_NUM, SAMPLE_NR, QTY_ON_HAND, CUSTOMER_PTR, MFG_LEAD_' +
        'TIME, '
      
        '      LAST_SO_DATE, REPORT_UNIT_VALUE1, TSTATUS, CHECK_BY_PTR, C' +
        'HECK_DATE, '
      
        '      AUDITED_BY_PTR, AUDITED_DATE, ALLOW_EDIT_FLAG, ONHOLD_SALE' +
        'S_FLAG, '
      
        '      ONHOLD_RELEASE_FLAG, ONHOLD_PLANNING_FLAG, CUSTPART_ENT_DA' +
        'TE, '
      
        '      LAST_MODIFIED_BY_PTR, LAST_MODIFIED_DATE, ANALYSIS_CODE_2,' +
        ' '
      
        '      ANALYSIS_CODE_3,  LAYERS, green_flag, set_lngth, set_width' +
        ', QTY_PARENTBOM,'
      
        '      set_qty, unit_sq, ANALYSIS_CODE_1, pcs_lngth, pcs_width, p' +
        'cs_sq, nopb_flag,'
      
        '      ANALYSIS_CODE_5, spell_lngth, spell_width, spell_qty, spel' +
        'l_sq, current_rev,amp_mb,'
      
        '      ANALYSIS_CODE_4, SO_UNIT, ttype, RKEY,layers_info,barcode_' +
        'flag,data0025.TUSAGE,REACH,'
      
        'flod_number,ZDR_TYPE,layers_image,ORIG_CUSTOMER,MinRing,DiffMark' +
        ',ProdGrade,RoHS,Compress,DrillRemark,grade_code'
      'FROM dbo.Data0025'
      'where rkey=:rkey'
      ' ')
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
      Size = 30
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
      DisplayFormat = '0.00000000'
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
      DisplayFormat = '0.00000000'
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
    object AQY0025barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object AQY0025current_rev: TStringField
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
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object intgrfldAQY0025flod_number: TIntegerField
      FieldName = 'flod_number'
    end
    object strngfldAQY0025ZDR_TYPE: TStringField
      FieldName = 'ZDR_TYPE'
    end
    object AQY0025layers_image: TBlobField
      FieldName = 'layers_image'
    end
    object strngfldAQY0025ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
    object AQY0025REACH: TBooleanField
      FieldName = 'REACH'
    end
    object AQY0025MinRing: TBCDField
      DisplayLabel = #26368#23567'Ring'#29615
      FieldName = 'MinRing'
      Precision = 10
    end
    object AQY0025DiffMark: TWideStringField
      DisplayLabel = #21046#36896#38590#24230
      FieldName = 'DiffMark'
    end
    object AQY0025ProdGrade: TWideStringField
      FieldName = 'ProdGrade'
      Size = 8
    end
    object AQY0025RoHS: TBooleanField
      FieldName = 'RoHS'
    end
    object AQY0025Compress: TStringField
      FieldName = 'Compress'
    end
    object AQY0025DrillRemark: TStringField
      FieldName = 'DrillRemark'
      Size = 100
    end
    object AQY0025grade_code: TStringField
      FieldName = 'grade_code'
      Size = 10
    end
    object AQY0025amp_mb: TStringField
      FieldName = 'amp_mb'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = AQY0025
    Left = 32
    Top = 136
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
    Left = 89
    Top = 190
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
    Left = 89
    Top = 242
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
    Left = 32
    Top = 242
  end
  object ads278: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10' data0278.rkey,'#13#10' data0278.PARAMETER_NAME, '#13#10' data0278.P' +
      'ARAMETER_DESC,'#13#10' Data0278.SPEC_RKEY,'#13#10' data0002.UNIT_NAME,'#13#10'case' +
      ' data0278.DATA_TYPE'#13#10'when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as d' +
      'atatype,'#13#10'data0278.STATUS3,data0278.min_value,data0278.max_value' +
      #13#10'from data0278 inner join data0002'#13#10'on Data0278.UNIT_PTR = Data' +
      '0002.RKEY'#13#10'where CATEGORY_PTR<>1'
    Parameters = <>
    Left = 139
    Top = 244
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
    object ads278min_value: TFloatField
      FieldName = 'min_value'
    end
    object ads278max_value: TFloatField
      FieldName = 'max_value'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 228
    Top = 33
  end
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT data0038.SOURCE_PTR, data0038.DEPT_PTR,'#13#10'data0038.DEF_ROU' +
      'T_INST, data0038.STEP_NUMBER, '#13#10'data0038.tooling_rev, data0038.O' +
      'UTP_SPFC,'#13#10'data0038.tool_old_rev,'#13#10'data0034.dept_code,data0034.d' +
      'ept_name,'#13#10'data0038.grade_note,'#13#10'data0034. BARCODE_ENTRY_FLAG'#13#10'F' +
      'ROM Data0038 inner join data0034'#13#10'on data0038.dept_ptr=data0034.' +
      'rkey'#13#10'where data0038.source_ptr=:rkey'#13#10
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
    object ADS38dept_code: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object ADS38dept_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADS38BARCODE_ENTRY_FLAG: TStringField
      DisplayLabel = #36807#25968
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object ADS38grade_note: TWideStringField
      FieldName = 'grade_note'
      Size = 2048
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS38
    Left = 34
    Top = 296
  end
  object DataSource5: TDataSource
    DataSet = ads494
    Left = 35
    Top = 349
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
    Left = 92
    Top = 403
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
    Left = 32
    Top = 402
  end
  object DataSource7: TDataSource
    DataSet = ADS279_0
    Left = 203
    Top = 245
  end
  object ADS279_0: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select source_PTR, PARAMETER_PTR, PARAMETER_VALUE'#13#10', IES_PROD,IE' +
      'S_CRP'#13#10'from data0279'#13#10'where  IES_PROD=0 and'#13#10'            source_' +
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
    Left = 267
    Top = 245
    object ads279_0source_ptr: TIntegerField
      FieldName = 'source_PTR'
    end
    object ads279_0PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads279_0PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads279_0IES_PROD: TSmallintField
      FieldName = 'IES_PROD'
    end
    object ads279_0IES_CRP: TSmallintField
      FieldName = 'IES_CRP'
    end
    object ads279_0PARAMETER_NAME: TStringField
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
    object ads279_0PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279_0SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'PARAMETER_PTR'
      Size = 2
      Lookup = True
    end
    object ads279_0UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279_0datatype: TStringField
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
  end
  object AQ280: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT data0280.rkey,Data0280.ENG_TABLE_NAME,'
      '  Data0280.DATA_TYPE,Data0278.DATA_TYPE AS fx_type,'
      '  Data0278_1.DATA_TYPE AS fy_type'
      'FROM dbo.Data0280 INNER JOIN'
      
        '      dbo.Data0278 ON dbo.Data0280.FX = dbo.Data0278.RKEY LEFT O' +
        'UTER JOIN'
      
        '      dbo.Data0278 Data0278_1 ON dbo.Data0280.FY = Data0278_1.RK' +
        'EY'
      'ORDER BY dbo.Data0280.ENG_TABLE_NAME')
    Left = 165
    Top = 84
    object AQ280rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ280ENG_TABLE_NAME: TStringField
      FieldName = 'ENG_TABLE_NAME'
      Size = 10
    end
    object AQ280DATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
    end
    object AQ280fx_type: TWordField
      FieldName = 'fx_type'
    end
    object AQ280fy_type: TWordField
      FieldName = 'fy_type'
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'WZPR085;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtpx'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vtpy'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vcol0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vrow0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vcol'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end
      item
        Name = '@vrow'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end>
    Left = 230
    Top = 84
    object ADOStoredProc1tvalue: TStringField
      FieldName = 'tvalue'
      Size = 50
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 33
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 349
    Top = 33
  end
  object DS20: TDataSource
    DataSet = ADO20
    Left = 200
    Top = 408
  end
  object DataSource8: TDataSource
    DataSet = ads564
    Left = 204
    Top = 296
  end
  object ads564: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select rkey,rec_no, SOURCE_PTR, file_name, in_date, remark'#13#10' fro' +
      'm Data0564'#13#10'where SOURCE_PTR=:rkey'#13#10'order by rec_no'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 269
    Top = 296
    object ads564rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads564rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object ads564SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ads564file_name: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'file_name'
      Size = 50
    end
    object ads564in_date: TDateTimeField
      DisplayLabel = #19978#20256#26085#26399
      FieldName = 'in_date'
    end
    object ads564remark: TStringField
      DisplayLabel = #22791#27880#35828#26126
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADO101: TADOQuery
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
      
        'select data0101.LOG_NUMBER,data0101.LOG_DATE,data0101.DEFECT_MAI' +
        'N,'
      'data0148.rkey as rkey148,'
      'data0148.rec_no, data0148.file_name, data0148.remark'
      'from data0101'
      'inner join data0148 on data0148.SOURCE_PTR=data0101.rkey'
      'where data0101.CUSTOMER_PART_PTR=:rkey25'
      'order by data0148.rec_no')
    Left = 400
    Top = 136
    object ADO101LOG_NUMBER: TStringField
      FieldName = 'LOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADO101LOG_DATE: TDateTimeField
      FieldName = 'LOG_DATE'
    end
    object ADO101rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADO101file_name: TStringField
      FieldName = 'file_name'
      Size = 50
    end
    object ADO101remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO101rkey148: TAutoIncField
      FieldName = 'rkey148'
      ReadOnly = True
    end
    object ADO101DEFECT_MAIN: TWideStringField
      FieldName = 'DEFECT_MAIN'
      Size = 50
    end
  end
  object DS101: TDataSource
    DataSet = ADO101
    Left = 472
    Top = 128
  end
  object DataSource9: TDataSource
    DataSet = Ado240
    Left = 400
    Top = 248
  end
  object Ado240: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'd25RKey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  Data0240.Rkey, Data0240.D25_PTR, Data0240.file_name, Dat' +
        'a0240.Indate, Data0240.InUser, Data0240.Remark'
      'from dbo.data0240 '
      'where Data0240.D25_PTR=:d25RKey')
    Left = 464
    Top = 248
    object Ado240Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado240D25_PTR: TIntegerField
      FieldName = 'D25_PTR'
    end
    object Ado240file_name: TStringField
      FieldName = 'file_name'
      Size = 50
    end
    object Ado240Indate: TDateTimeField
      FieldName = 'Indate'
    end
    object Ado240Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object Ado240InUser: TIntegerField
      FieldName = 'InUser'
    end
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 528
    Top = 248
  end
  object ADO20: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT [RKEY]'
      '      ,[SOURCE_PTR]'
      '      ,[file_name]'
      '      ,[Indate]'
      '      ,[remark]'
      '  FROM [Data0020]'
      'where'
      '[source_ptr]=:rkey10')
    Left = 256
    Top = 408
    object ADO20RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO20SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO20file_name: TStringField
      DisplayLabel = #25991#26723#21517#31216
      FieldName = 'file_name'
      Size = 50
    end
    object ADO20Indate: TDateTimeField
      DisplayLabel = #23384#26723#26085#26399
      FieldName = 'Indate'
    end
    object ADO20remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 150
    end
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT D494.PARAMETER_PTR'#13#10#9' , D494.PARAMETER_VALUE'#13#10#9' , D494.cu' +
      'stpart_ptr'#13#10#9' , d278.PARAMETER_Name AS Parameter_Readonly'#13#10#9' , d' +
      '278.PARAMETER_DESC AS Parameter_DESC_ReadOnly'#13#10#9' , D494.step_num' +
      'ber'#13#10#9' , D494.seq_no'#13#10#9' , D494.Doc_Flag'#13#10#9' , D494.after_flag'#13#10#9' ' +
      ', D494.flow_spfc_flag'#13#10#9' , D494.outp_spfc_flag'#13#10#9' , d38.dept_ptr' +
      #13#10#9' , d494.TaskTopLimt'#13#10#9' , d494.TaskLowLimt'#13#10#9' , D494.InnerTopL' +
      'imt'#13#10#9' , d494.InnerLowLimt'#13#10#9' , D494.SpecialNote'#13#10#9' , d278.DATA_' +
      'TYPE'#13#10#9' '#13#10'FROM'#13#10#9'Data0494 D494'#13#10#9'INNER JOIN data0038 D38'#13#10#9#9'ON D' +
      '494.custpart_ptr = d38.SOURCE_PTR AND d494.step_number = d38.ste' +
      'p_number'#13#10#9'INNER JOIN data0278 d278'#13#10#9#9'ON d278.rkey = d494.PARAM' +
      'ETER_PTR'#13#10'WHERE'#13#10#9'custpart_ptr = :SOURCE_PTR'
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
    Left = 91
    Top = 348
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
    object strngfldads494outp_spfc_flag: TStringField
      FieldName = 'outp_spfc_flag'
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
    object ads494min_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'min_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'min_value'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads494max_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'max_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'max_value'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object intgrfldads494dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ads494Parameter_Readonly: TStringField
      FieldName = 'Parameter_Readonly'
      ReadOnly = True
      Size = 10
    end
    object ads494Parameter_DESC_ReadOnly: TStringField
      FieldName = 'Parameter_DESC_ReadOnly'
    end
    object fltfldads494TaskTopLimt: TFloatField
      FieldName = 'TaskTopLimt'
    end
    object fltfldads494TaskLowLimt: TFloatField
      FieldName = 'TaskLowLimt'
    end
    object fltfldads494InnerTopLimt: TFloatField
      FieldName = 'InnerTopLimt'
    end
    object fltfldads494InnerLowLimt: TFloatField
      FieldName = 'InnerLowLimt'
    end
    object ads494DATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object ads494SpecialNote: TStringField
      FieldName = 'SpecialNote'
      Size = 200
    end
  end
  object qryFtp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'IDKey'
        DataType = ftString
        Size = 2
        Value = #39#39
      end>
    SQL.Strings = (
      
        'SELECT IDKey, FileName, Ftp_Ptr, FtpDir, Ftp_fileName, UploadTim' +
        'e, UploadUser_d05ptr, GroupIDKey, BEnable from Tier3_CustomerFil' +
        'es'
      'where IDkey=:IDKey')
    Left = 536
    Top = 368
    object qryFtpIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFtpFtp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object qryFtpFtpDir: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object qryFtpFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFtpUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object qryFtpUploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object qryFtpGroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpBEnable: TBooleanField
      FieldName = 'BEnable'
    end
  end
  object dsFile: TDataSource
    DataSet = qryFile
    Left = 496
    Top = 368
  end
  object qryFileList: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select rkey25,FtpIDKey,FileType from Data0025_FileList'
      'where groups = 0 and rkey25=:rkey')
    Left = 576
    Top = 368
  end
  object qryFile: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT Tier3_CustomerFiles.[FileName],Data0005.EMPLOYEE_NAME,Tie' +
        'r3_CustomerFiles.UploadTime'
      
        #9#9',Data0025_FileList.filetype,Tier3_CustomerFiles.IDKey,Tier3_Cu' +
        'stomerFiles.Ftp_fileName'
      ' FROM Data0025_FileList '
      
        #9#9#9'inner join  Tier3_CustomerFiles on Data0025_FileList.FtpIDKey' +
        ' = Tier3_CustomerFiles.IDKey'
      
        #9#9#9'INNER join Data0005 on Data0005.RKEY = Tier3_CustomerFiles.Up' +
        'loadUser_d05ptr'
      
        'WHERE Data0025_FileList.groups = 0 and Data0025_FileList.rkey25=' +
        ':rkey')
    Left = 464
    Top = 368
    object qryFileFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFileEMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qryFileUploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object qryFilefiletype: TWordField
      FieldName = 'filetype'
    end
    object qryFilestrType: TStringField
      DisplayLabel = #25991#20214#31867#22411
      FieldKind = fkCalculated
      FieldName = 'strType'
      Calculated = True
    end
    object qryFileIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFileFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
  end
  object qryFtp2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'IDKey'
        DataType = ftString
        Size = 2
        Value = #39#39
      end>
    SQL.Strings = (
      
        'SELECT IDKey, FileName, Ftp_Ptr, FtpDir, Ftp_fileName, UploadTim' +
        'e, UploadUser_d05ptr, GroupIDKey, BEnable from Tier3_CustomerFil' +
        'es'
      'where IDkey=:IDKey')
    Left = 544
    Top = 424
    object StringField1: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object StringField2: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object IntegerField1: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object StringField3: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object StringField4: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object IntegerField2: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object StringField5: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object BooleanField1: TBooleanField
      FieldName = 'BEnable'
    end
  end
  object dsFile2: TDataSource
    DataSet = qryFile2
    Left = 496
    Top = 424
  end
  object qryFileList2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select rkey25,FtpIDKey,filetype,groups,dept_ptr  from Data0025_F' +
        'ileList'
      'where groups = 1 and rkey25=:rkey')
    Left = 592
    Top = 424
  end
  object qryFile2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT Tier3_CustomerFiles.[FileName],Data0005.EMPLOYEE_NAME,Tie' +
        'r3_CustomerFiles.UploadTime'
      
        #9#9',Data0025_FileList.filetype,Tier3_CustomerFiles.IDKey,Tier3_Cu' +
        'stomerFiles.Ftp_fileName'
      #9#9',Data0034.DEPT_NAME,Data0034.DEPT_CODE'
      ' FROM Data0025_FileList '
      
        #9#9#9'inner join  Tier3_CustomerFiles on Data0025_FileList.FtpIDKey' +
        ' = Tier3_CustomerFiles.IDKey'
      
        #9#9#9'INNER join Data0005 on Data0005.RKEY = Tier3_CustomerFiles.Up' +
        'loadUser_d05ptr'
      
        #9#9#9'LEFT join Data0034 on Data0034.rkey = Data0025_FileList.dept_' +
        'ptr'
      
        'WHERE Data0025_FileList.groups = 1 and  Data0025_FileList.rkey25' +
        '=:rkey ')
    Left = 456
    Top = 424
    object qryFile2FileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFile2EMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qryFile2UploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object qryFile2filetype: TWordField
      FieldName = 'filetype'
    end
    object qryFile2IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFile2Ftp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFile2DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
  end
  object ads26: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select Data0026.RKEY,Data0026.MANU_BOM_PTR,Data0026.DEPT_PTR,Dat' +
      'a0026.INVENTORY_PTR,Data0026.FLOW_NO,Data0026.D498_ptr'#13#10#9#9',Data0' +
      '026.QTY_BOM,Data0026.ROUTE_STEP_NO,Data0026.DOC_FLAG,Data0026.VE' +
      'NDOR,Data0026.supplier_ptr,Data0017.GROUP_PTR'#13#10#9#9',Data0034.DEPT_' +
      'NAME,Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_DES' +
      'CRIPTION,Data0002.UNIT_CODE'#13#10#9#9',Data0023.ABBR_NAME,Data0498.BOM_' +
      'NAME'#13#10'from Data0026 '#13#10#9#9'inner join data0034 on Data0026.DEPT_PTR' +
      ' = Data0034.RKEY'#13#10#9#9'inner join Data0017 on Data0026.INVENTORY_PT' +
      'R = Data0017.RKEY'#13#10#9#9'INNER join Data0002 on Data0017.STOCK_UNIT_' +
      'PTR = Data0002.RKEY'#13#10#9#9'LEFT join Data0023 on Data0026.supplier_p' +
      'tr = Data0023.RKEY'#13#10#9#9'LEFT JOIN Data0498 ON Data0026.d498_PTR = ' +
      'Data0498.RKEY                                '#13#10'where Data0026.FL' +
      'OW_NO =1 AND  Data0026.MANU_BOM_PTR = :rkey26'#13#10
    IndexFieldNames = 'ROUTE_STEP_NO'
    Parameters = <
      item
        Name = 'rkey26'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 400
    Top = 361
    object ads26RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads26MANU_BOM_PTR: TIntegerField
      FieldName = 'MANU_BOM_PTR'
    end
    object ads26DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads26INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ads26QTY_BOM: TFloatField
      DisplayLabel = #29992#37327
      FieldName = 'QTY_BOM'
      DisplayFormat = '##0.#00000000'
    end
    object ads26ROUTE_STEP_NO: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'ROUTE_STEP_NO'
    end
    object ads26DOC_FLAG: TStringField
      DisplayLabel = #26159#21542#21015#21360
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
    object ads26VENDOR: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'VENDOR'
      Size = 30
    end
    object ads26DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads26INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads26FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ads26UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ads26supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object ads26ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ads26INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads26INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads26GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ads26D498_ptr: TIntegerField
      FieldName = 'D498_ptr'
    end
    object ads26BOM_NAME: TStringField
      DisplayLabel = 'BOM'#31867#22411#21517
      FieldName = 'BOM_NAME'
      FixedChar = True
      Size = 10
    end
  end
  object ds26: TDataSource
    DataSet = ads26
    Left = 344
    Top = 361
  end
end
