object DM: TDM
  OldCreateOrder = False
  Left = 528
  Top = 145
  Height = 511
  Width = 523
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 18
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
      'a0025.PROD_ROUTE_PTR, '#13#10' Data0005_1.EMPLOYEE_NAME AS employee_au' +
      'ditname, dbo.Data0025.AUDITED_DATE, '#13#10' dbo.Data0025.TSTATUS, Dat' +
      'a0005_2.EMPLOYEE_NAME AS employee_editname,'#13#10' dbo.Data0025.LAST_' +
      'MODIFIED_DATE, dbo.Data0025.SAMPLE_NR, '#13#10'   dbo.Data0025.ANALYSI' +
      'S_CODE_2, dbo.Data0025.QTY_ON_HAND, dbo.Data0025.LAYERS, dbo.Dat' +
      'a0025.green_flag, '#13#10'   CASE Data0025.ONHOLD_SALES_FLAG WHEN 0 TH' +
      'EN '#39#26377#25928#39' WHEN 1 THEN '#39#36807#26399#39' END AS overdue, '#13#10'  CASE Data0025.TSTAT' +
      'US WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457#26680#39' '#13#10'WHEN 2 THEN '#39#23457#36864#22238#39' WHEN ' +
      '3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN 5 THEN '#39#26816#36864#22238#39#13#10'              ' +
      '         WHEN 6 THEN '#39#26410#25552#20132#39' END AS state,'#13#10' CASE Data0025.ttype W' +
      'HEN 0 THEN '#39#37327#20135#39' WHEN 1 THEN '#39#26679#26495#39' END AS batch_or_former,'#13#10' dbo.D' +
      'ata0025.CHECK_DATE, dbo.Data0005.EMPLOYEE_NAME AS check_emplname' +
      #13#10'FROM         dbo.Data0008 INNER JOIN'#13#10'                      db' +
      'o.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INN' +
      'ER JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0025.CUST' +
      'OMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'                  ' +
      '    dbo.Data0005 ON dbo.Data0025.CHECK_BY_PTR = dbo.Data0005.RKE' +
      'Y LEFT OUTER JOIN'#13#10'                      dbo.Data0005 AS Data000' +
      '5_2 ON dbo.Data0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKEY LEFT ' +
      'OUTER JOIN'#13#10'                      dbo.Data0005 AS Data0005_1 ON ' +
      'dbo.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY LEFT OUTER JOIN'#13#10' ' +
      '                     dbo.Data0005 AS Data0005_3 ON dbo.Data0025.' +
      'CREATED_BY_EMPL_PTR = Data0005_3.RKEY'#13#10'where data0025.CUSTPART_E' +
      'NT_DATE >=:dtpk1 and'#13#10'           data0025.CUSTPART_ENT_DATE <=:d' +
      'tpk2 and'#13#10'           data0025.parent_ptr is null and'#13#10'  data0025' +
      '.tstatus <> :v6 and'#13#10'  data0025.tstatus <> :v0 and'#13#10'  data0025.t' +
      'status <> :v3 and'#13#10'  data0025.tstatus <> :v4 and'#13#10'  data0025.tst' +
      'atus <> :v1 and'#13#10'  data0025.tstatus <> :v5 and'#13#10'  data0025.tstat' +
      'us <> :v2'#13#10
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
        Value = 3
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
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
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 32
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
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
      '      LAST_MODIFIED_BY_PTR, LAST_MODIFIED_DATE, ANALYSIS_CODE_2,'
      
        '      ANALYSIS_CODE_3,  LAYERS, green_flag, set_lngth, set_width' +
        ','
      
        '      set_qty, unit_sq, ANALYSIS_CODE_1, pcs_lngth, pcs_width, p' +
        'cs_sq,'
      
        '      ANALYSIS_CODE_5, spell_lngth, spell_width, spell_qty, spel' +
        'l_sq, current_rev,'
      
        '      ANALYSIS_CODE_4, SO_UNIT, ttype, layers_info,QTY_ON_HAND,b' +
        'arcode_flag'
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
      FieldName = 'current_rev'
      FixedChar = True
      Size = 10
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
    object ads502pnl_lenspace: TBCDField
      FieldName = 'pnl_lenspace'
      Precision = 5
      Size = 2
    end
    object ads502pnl_wthspace: TBCDField
      FieldName = 'pnl_wthspace'
      Precision = 5
      Size = 2
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
      OnValidate = ads279PARAMETER_VALUEValidate
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
    object ads279min_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'min_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'min_value'
      KeyFields = 'PARAMETER_PTR'
      Lookup = True
    end
    object ads279max_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'max_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'max_value'
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
    CursorType = ctDynamic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT data0038.SOURCE_PTR, data0038.DEPT_PTR, '#13#10'data0038.DEF_RO' +
      'UT_INST, data0038.STEP_NUMBER, '#13#10'data0038.tooling_rev, data0038.' +
      'OUTP_SPFC,'#13#10'data0038.tool_old_rev, data0038.TOOL_REMARK'#13#10'FROM Da' +
      'ta0038 '#13#10'where source_ptr=:rkey'#13#10'order by step_number'
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
  end
  object DataSource4: TDataSource
    DataSet = ADS38
    Left = 34
    Top = 296
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
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
    Left = 91
    Top = 348
    object ads494PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads494PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      OnValidate = ads494PARAMETER_VALUEValidate
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
    DataSource = DataSource1
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
    Left = 157
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
    Left = 238
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
    Top = 34
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 349
    Top = 34
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'set_len_min'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_len_max'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_wth_min'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_wth_max'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_len_min1'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_len_max1'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_wth_min1'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'set_wth_max1'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT top 100 percent '
      'substring(manu_part_number,1,7) as number,'
      'max(substring(manu_part_number,8,2)) as rev'
      'FROM  Data0025 '
      
        'WHERE (((set_lngth >= :set_len_min) and (set_lngth <= :set_len_m' +
        'ax) and '
      
        '  (set_width >= :set_wth_min) and (set_width <= :set_wth_max)) o' +
        'r'
      
        '((set_lngth >= :set_len_min1) and (set_lngth <= :set_len_max1) a' +
        'nd '
      
        '  (set_width >= :set_wth_min1) and (set_width <= :set_wth_max1))' +
        ')'
      '  and (rkey <> :rkey) and (ttype=0)'
      ''
      'group by substring(manu_part_number,1,7)')
    Left = 328
    Top = 152
  end
  object AQ17: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCR' +
        'IPTION, '
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0456.ship_DATE, dbo.Data00' +
        '23.ABBR_NAME, '
      '      SUM(dbo.Data0022.QUAN_ON_HAND) AS quan_on_hand'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY'
      
        'WHERE (dbo.Data0022.QUAN_ON_HAND > 0) AND (dbo.Data0496.quote_fl' +
        'ag = 1)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DES' +
        'CRIPTION, '
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0456.ship_DATE, dbo.Data00' +
        '23.ABBR_NAME'
      'order by dbo.Data0017.INV_PART_NUMBER')
    Left = 360
    Top = 368
  end
  object AQtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 408
    Top = 368
  end
  object DS17: TDataSource
    DataSet = AQ17
    Left = 360
    Top = 328
  end
  object DS20: TDataSource
    DataSet = ADO20
    Left = 208
    Top = 408
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
      'select * from data0020 where source_ptr=:rkey10')
    Left = 256
    Top = 408
    object ADO20RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO20SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO20file_content: TBlobField
      FieldName = 'file_content'
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
  object ads497: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0497.PARAMETER_PTR, dbo.Data0497.PARAMETER_VA' +
      'LUE, '#13#10'    dbo.Data0497.SOURCE_PTR, dbo.Data0497.ROUTE_STEP_PTR,' +
      ' dbo.Data0497.SEQ_NO, '#13#10'                      dbo.Data0038.DEPT_' +
      'PTR, dbo.Data0038.STEP_NUMBER'#13#10'FROM         dbo.Data0038 INNER J' +
      'OIN'#13#10'          dbo.Data0497 ON dbo.Data0038.RKEY = dbo.Data0497.' +
      'ROUTE_STEP_PTR'#13#10'where data0038.source_ptr=:rkey'
    IndexFieldNames = 'step_number;dept_ptr'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 139
    Top = 347
    object ads497PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ads497PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads497SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ads497ROUTE_STEP_PTR: TIntegerField
      FieldName = 'ROUTE_STEP_PTR'
    end
    object ads497SEQ_NO: TIntegerField
      FieldName = 'SEQ_NO'
    end
    object ads497DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads497STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
  end
  object ads564: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
  object DataSource8: TDataSource
    DataSet = ads564
    Left = 204
    Top = 296
  end
end
