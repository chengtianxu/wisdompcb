object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 312
  Height = 449
  Width = 509
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'C:\Program Files\Common Files\System\OLE DB\Data Links\68.udl'
    Left = 48
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ads273
    Left = 48
    Top = 104
  end
  object ads273: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0273.RKEY,Data0273.ECN_NO, Data0273.STATUS, Data0273.' +
      'SOURCE, '#13#10'      Data0010.CUST_CODE, Data0010.CUSTOMER_NAME, '#13#10'  ' +
      '    Data0005.EMPLOYEE_NAME, Data0273.ENTERED_DATE, '#13#10'      Data0' +
      '005_1.EMPLOYEE_NAME AS authemployee, Data0273.VERIFIED_DATE, '#13#10' ' +
      '     dbo.Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC, '#13#10' ' +
      '     Data0025_1.MANU_PART_NUMBER AS copytonumber, '#13#10'      Data00' +
      '25_1.MANU_PART_DESC AS copytodesc, Data0273.Tooling_close, '#13#10'cas' +
      'e Data0273.STATUS when 0 then '#39#26410#25552#20132#39' '#13#10'                          ' +
      '               when 1 then '#39#24453#32467#26696#39#13#10'                              ' +
      '           when 2 then '#39#24050#32467#26696#39' end as tstatus,'#13#10'case data0273.sour' +
      'ce when 1 then '#39#20869#37096#39' when 2 then '#39#22806#37096#39' end as tsource,'#13#10'case data0' +
      '273.tooling_close '#13#10' when 1 then '#39#37327#20135#36716#37327#20135#39' '#13#10' when 2 then '#39#37327#20135#36716#26679#26495#39#13 +
      #10' when 3 then '#39#26679#26495#36716#26679#26495#39#13#10' when 4 then '#39#26679#26495#36716#37327#20135#39' end as ttype,'#13#10'data0' +
      '273.CUSTOMER_PART_PTR'#13#10'FROM dbo.Data0273 INNER JOIN'#13#10'      dbo.D' +
      'ata0010 ON dbo.Data0273.CUSTOMER_PTR = dbo.Data0010.RKEY INNER J' +
      'OIN'#13#10'      dbo.Data0005 ON dbo.Data0273.ENTERED_BY = dbo.Data000' +
      '5.RKEY INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0273.CO' +
      'PYFROMCUST_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'      dbo.Data002' +
      '5 Data0025_1 ON '#13#10'      dbo.Data0273.CUSTOMER_PART_PTR = Data002' +
      '5_1.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON dbo.D' +
      'ata0273.VERIFIED_BY = Data0005_1.RKEY'#13#10'where Data0273.ENTERED_DA' +
      'TE >=:dtpk1 '#13#10'  and  Data0273.ENTERED_DATE <=:dtpk2 '#13#10'  and data' +
      '0273.status <> :v0'#13#10'  and data0273.status <> :v1'#13#10'  and data0273' +
      '.status <> :v2'#13#10
    IndexFieldNames = 'ECN_NO'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
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
        Name = 'v0'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'v1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'v2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end>
    Left = 112
    Top = 104
    object ads273RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads273ECN_NO: TStringField
      DisplayLabel = 'ECN'#32534#21495
      FieldName = 'ECN_NO'
      Size = 10
    end
    object ads273STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ads273SOURCE: TSmallintField
      FieldName = 'SOURCE'
    end
    object ads273CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads273CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 20
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ads273EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads273ENTERED_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'ENTERED_DATE'
    end
    object ads273authemployee: TStringField
      DisplayLabel = #32467#26696#20154#21592
      FieldName = 'authemployee'
      Size = 16
    end
    object ads273VERIFIED_DATE: TDateTimeField
      DisplayLabel = #32467#26696#26085#26399
      FieldName = 'VERIFIED_DATE'
    end
    object ads273MANU_PART_NUMBER: TStringField
      DisplayLabel = #21464#26356#21069#26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads273MANU_PART_DESC: TStringField
      DisplayLabel = #21464#26356#21069#23458#25143#22411#21495
      DisplayWidth = 25
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads273copytonumber: TStringField
      DisplayLabel = #21464#26356#21518#26412#21378#32534#21495
      FieldName = 'copytonumber'
    end
    object ads273copytodesc: TStringField
      DisplayLabel = #21464#26356#21518#23458#25143#22411#21495
      DisplayWidth = 25
      FieldName = 'copytodesc'
      Size = 80
    end
    object ads273Tooling_close: TWordField
      FieldName = 'Tooling_close'
    end
    object ads273tstatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'tstatus'
      ReadOnly = True
      Size = 6
    end
    object ads273tsource: TStringField
      DisplayLabel = #26469#28304
      FieldName = 'tsource'
      ReadOnly = True
      Size = 4
    end
    object ads273ttype: TStringField
      DisplayLabel = #21464#26356#31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 10
    end
    object ads273CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 32
  end
  object ads04: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from data0004'#13#10 +
      'where rkey=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 70
      end>
    Left = 325
    Top = 34
    object ads04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ads04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ads04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 264
    Top = 32
  end
  object adsa273: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'SELECT RKEY, CUSTOMER_PTR, CUSTOMER_PART_PTR, COPYFROMCUST_PTR, ' +
      #13#10'      ENTERED_BY, VERIFIED_BY, ENTERED_DATE, VERIFIED_DATE, ST' +
      'ATUS, SOURCE, '#13#10'      TEXT1, TEXT2, TEXT3, TEXT4, ECN_NO, text, ' +
      'Tooling_close, remark, '#13#10'      last_modi_by_ptr, last_modi_date,' +
      ' ECNB1, ECNB2, ECNB3, ECNB4, ECNB5, ECNA1, '#13#10'      ECNA2, ECNA3,' +
      ' ECNA4, ECNA5, ECNSTART, del'#13#10'FROM dbo.Data0273'#13#10'where rkey=:rke' +
      'y'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 152
    object adsa273RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsa273CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object adsa273CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
    object adsa273COPYFROMCUST_PTR: TIntegerField
      FieldName = 'COPYFROMCUST_PTR'
    end
    object adsa273ENTERED_BY: TIntegerField
      FieldName = 'ENTERED_BY'
    end
    object adsa273VERIFIED_BY: TIntegerField
      FieldName = 'VERIFIED_BY'
    end
    object adsa273ENTERED_DATE: TDateTimeField
      FieldName = 'ENTERED_DATE'
    end
    object adsa273VERIFIED_DATE: TDateTimeField
      FieldName = 'VERIFIED_DATE'
    end
    object adsa273STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object adsa273SOURCE: TSmallintField
      FieldName = 'SOURCE'
    end
    object adsa273TEXT1: TStringField
      FieldName = 'TEXT1'
      Size = 70
    end
    object adsa273TEXT2: TStringField
      FieldName = 'TEXT2'
      Size = 70
    end
    object adsa273TEXT3: TStringField
      FieldName = 'TEXT3'
      Size = 70
    end
    object adsa273TEXT4: TStringField
      FieldName = 'TEXT4'
      Size = 200
    end
    object adsa273ECN_NO: TStringField
      FieldName = 'ECN_NO'
      Size = 10
    end
    object adsa273text: TStringField
      FieldName = 'text'
      Size = 500
    end
    object adsa273Tooling_close: TWordField
      FieldName = 'Tooling_close'
    end
    object adsa273remark: TStringField
      FieldName = 'remark'
      Size = 200
    end
    object adsa273last_modi_by_ptr: TIntegerField
      FieldName = 'last_modi_by_ptr'
    end
    object adsa273last_modi_date: TDateTimeField
      FieldName = 'last_modi_date'
    end
    object adsa273ECNB1: TStringField
      FieldName = 'ECNB1'
      Size = 100
    end
    object adsa273ECNB2: TStringField
      FieldName = 'ECNB2'
      Size = 100
    end
    object adsa273ECNB3: TStringField
      FieldName = 'ECNB3'
      Size = 100
    end
    object adsa273ECNB4: TStringField
      FieldName = 'ECNB4'
      Size = 100
    end
    object adsa273ECNB5: TStringField
      FieldName = 'ECNB5'
      Size = 100
    end
    object adsa273ECNA1: TStringField
      FieldName = 'ECNA1'
      Size = 100
    end
    object adsa273ECNA2: TStringField
      FieldName = 'ECNA2'
      Size = 100
    end
    object adsa273ECNA3: TStringField
      FieldName = 'ECNA3'
      Size = 100
    end
    object adsa273ECNA4: TStringField
      FieldName = 'ECNA4'
      Size = 100
    end
    object adsa273ECNA5: TStringField
      FieldName = 'ECNA5'
      Size = 100
    end
    object adsa273ECNSTART: TWordField
      FieldName = 'ECNSTART'
    end
    object adsa273del: TWordField
      FieldName = 'del'
    end
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
      
        '      CREATED_BY_EMPL_PTR, ENG_ROUTE_PTR,PROD_ROUTE_PTR, REMARK,' +
        ' ENG_NOTE, memo_text,'
      
        '      PROD_CODE_PTR, OPT_LOT_SIZE, EST_SCRAP, SHELF_LIFE, REVIEW' +
        '_DAYS,'
      '      PARTS_NUM, SAMPLE_NR, CUSTOMER_PTR, MFG_LEAD_TIME,'
      
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
      '      ANALYSIS_CODE_4, SO_UNIT, ttype, RKEY,layers_info,'
      
        '       ANCESTOR_PTR, CURRENT_REV,barcode_flag, QTY_PARENTBOM, NO' +
        'PB_flag,TUSAGE,'
      'REACH,flod_number,ZDR_TYPE,layers_image,ORIG_CUSTOMER'
      'FROM dbo.Data0025'
      'where rkey=:rkey'
      ' ')
    Left = 185
    Top = 104
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
    object AQY0025ANCESTOR_PTR: TIntegerField
      FieldName = 'ANCESTOR_PTR'
    end
    object AQY0025CURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      FixedChar = True
      Size = 10
    end
    object AQY0025barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object AQY0025TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object AQY0025NOPB_flag: TWordField
      FieldName = 'NOPB_flag'
    end
    object AQY0025QTY_PARENTBOM: TWordField
      FieldName = 'QTY_PARENTBOM'
    end
    object AQY0025REACH: TBooleanField
      FieldName = 'REACH'
    end
    object AQY0025flod_number: TIntegerField
      FieldName = 'flod_number'
    end
    object AQY0025ZDR_TYPE: TWideStringField
      FieldName = 'ZDR_TYPE'
      Size = 50
    end
    object AQY0025layers_image: TBlobField
      FieldName = 'layers_image'
    end
    object AQY0025ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
  end
  object ads502: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
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
    Left = 241
    Top = 104
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
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT rkey,SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, '#13#10'STEP_NUMBER, ' +
      'tooling_rev, OUTP_SPFC,tool_old_rev'#13#10'FROM Data0038'#13#10'where source' +
      '_ptr=:rkey'
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
    Left = 296
    Top = 105
    object ADS38rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
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
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT PARAMETER_PTR,'#13#10' PARAMETER_VALUE,'#13#10' custpart_ptr,'#13#10' step_' +
      'number,'#13#10' seq_no, Doc_Flag, after_flag, flow_spfc_flag,outp_spfc' +
      '_flag'#13#10'FROM dbo.Data0494'#13#10'where custpart_ptr = :SOURCE_PTR '
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
    Left = 347
    Top = 105
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
    object ads494outp_spfc_flag: TStringField
      FieldName = 'outp_spfc_flag'
      FixedChar = True
      Size = 1
    end
  end
  object ads279: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select source_PTR, PARAMETER_PTR, PARAMETER_VALUE'#13#10', IES_PROD,IE' +
      'S_CRP'#13#10'from data0279'#13#10'where  source_ptr= :rkey'#13#10'order by IES_CRP'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 454
    Top = 105
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
  end
  object DataSource2: TDataSource
    DataSet = adsa273
    Left = 48
    Top = 152
  end
  object ads_ed38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0038.STEP_NUMBER, dbo.Data0034.DE' +
      'PT_CODE, '#13#10'      dbo.Data0034.DEPT_NAME, dbo.Data0038.tool_old_r' +
      'ev, dbo.Data0038.tooling_rev, '#13#10'      dbo.Data0038.TOOL_REMARK'#13#10 +
      'FROM dbo.Data0038 INNER JOIN'#13#10'      dbo.Data0034 ON dbo.Data0038' +
      '.DEPT_PTR = dbo.Data0034.RKEY'#13#10'where SOURCE_PTR=:rkey25'#13#10'ORDER B' +
      'Y dbo.Data0038.STEP_NUMBER'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 3000
      end>
    Left = 298
    Top = 160
    object ads_ed38STEP_NUMBER: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'STEP_NUMBER'
    end
    object ads_ed38DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads_ed38DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads_ed38tool_old_rev: TStringField
      DisplayLabel = #24037#20855'('#26087#29256#26412')'
      FieldName = 'tool_old_rev'
      Size = 10
    end
    object ads_ed38tooling_rev: TStringField
      DisplayLabel = #24037#20855'('#26032#29256#26412')'
      FieldName = 'tooling_rev'
      Size = 10
    end
    object ads_ed38TOOL_REMARK: TStringField
      DisplayLabel = #24037#20855#22791#27880#20449#24687
      FieldName = 'TOOL_REMARK'
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = ads_ed38
    Left = 240
    Top = 160
  end
  object ads06: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    OnCalcFields = ads06CalcFields
    CommandText = 
      'SELECT Data0006.RKEY,'#13#10'     Data0006.WORK_ORDER_NUMBER, '#13#10'      ' +
      'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'  ' +
      '    dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PANELS, dbo.Data0056.' +
      'STEP, '#13#10'      dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'#13#10'd' +
      'ata0006.prod_status'#13#10'FROM dbo.Data0034 INNER JOIN'#13#10'      dbo.Dat' +
      'a0056 ON '#13#10'      dbo.Data0034.RKEY = dbo.Data0056.DEPT_PTR RIGHT' +
      ' OUTER JOIN'#13#10'      dbo.Data0006 INNER JOIN'#13#10'      dbo.Data0025 O' +
      'N dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY ON '#13#10'      dbo.Data00' +
      '56.WO_PTR = dbo.Data0006.RKEY'#13#10'where data0006.bom_ptr=:rkey25 an' +
      'd'#13#10'data0006.prod_status<>9 and'#13#10'data0006.prod_status<>4 and'#13#10'dat' +
      'a0006.prod_status<>5 and'#13#10'data0006.prod_status<>6 and'#13#10'data0006.' +
      'prod_status<>202'#13#10'order by Data0006.WORK_ORDER_NUMBER'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 299
    Top = 216
    object ads06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads06prod_status: TSmallintField
      FieldName = 'prod_status'
    end
    object ads06WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads06MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads06MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads06QTY_BACKLOG: TFloatField
      DisplayLabel = #22312#32447#25968#37327'PCS'
      FieldName = 'QTY_BACKLOG'
    end
    object ads06PANELS: TIntegerField
      DisplayLabel = #22312#32447#25968#37327'PAN'
      FieldName = 'PANELS'
    end
    object ads06STEP: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'STEP'
    end
    object ads06DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads06DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads06C_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'C_status'
      Size = 10
      Calculated = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ads06
    Left = 242
    Top = 215
  end
  object ads_clone06: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0006.RKEY,'#13#10'     Data0006.WORK_ORDER_NUMBER, '#13#10'    da' +
      'ta0006.prod_status'#13#10'FROM dbo.Data0034 INNER JOIN'#13#10'      dbo.Data' +
      '0056 ON '#13#10'      dbo.Data0034.RKEY = dbo.Data0056.DEPT_PTR RIGHT ' +
      'OUTER JOIN'#13#10'      dbo.Data0006 INNER JOIN'#13#10'      dbo.Data0025 ON' +
      ' dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY ON '#13#10'      dbo.Data005' +
      '6.WO_PTR = dbo.Data0006.RKEY'#13#10'where data0006.bom_ptr=:rkey25 and' +
      #13#10'data0006.prod_status<>9 and'#13#10'data0006.prod_status<>4 and'#13#10'data' +
      '0006.prod_status<>5 and'#13#10'data0006.prod_status<>6 and'#13#10'data0006.p' +
      'rod_status<>202'#13#10'order by Data0006.WORK_ORDER_NUMBER'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 352
    Top = 216
    object ads_clone06RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads_clone06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads_clone06prod_status: TSmallintField
      FieldName = 'prod_status'
    end
  end
  object ads497: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select PARAMETER_PTR, PARAMETER_VALUE, SOURCE_PTR, ROUTE_STEP_PT' +
      'R, SEQ_NO'#13#10'from data0497'#13#10'where ROUTE_STEP_PTR is null'
    Parameters = <>
    Left = 405
    Top = 106
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
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 400
    Top = 32
  end
end
