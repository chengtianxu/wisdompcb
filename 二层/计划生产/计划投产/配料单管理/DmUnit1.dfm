object DM: TDM
  OldCreateOrder = False
  Left = 300
  Top = 264
  Height = 607
  Width = 839
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOQALL2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39346d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39347d
      end
      item
        Name = 'ts1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'ts2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
      end
      item
        Name = 'ts3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'ts4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.data0492.rkey, dbo.data0492.TTYPE, dbo.data0492.C' +
        'UT_NO, dbo.data0492.SO_NO, dbo.data0492.PLANNED_QTY, dbo.data049' +
        '2.PRINTED_BY_PTR,'
      
        '  dbo.data0492.ISSUED_QTY, dbo.data0492.SCH_COMPL_DATE, dbo.data' +
        '0492.ISSUE_DATE, dbo.data0492.CREATED_BY_PTR, dbo.data0492.UPANE' +
        'L1,'
      
        '  dbo.data0492.PANEL_1_QTY, dbo.data0492.Con_Flag, dbo.data0492.' +
        'UPANEL2, dbo.data0492.PANEL_2_QTY, dbo.data0492.remark, dbo.data' +
        '0492.FG_QTY,'
      
        '  dbo.data0492.QTY_REJECT, dbo.data0492.TSTATUS, dbo.data0492.WI' +
        'P_QTY, dbo.data0492.waitfor_release, dbo.data0492.ORD_REQ_QTY, d' +
        'bo.data0492.pnl1_size,'
      
        '  dbo.data0492.pnl2_size, dbo.data0492.analysis_code_3, dbo.Data' +
        '0060.PARTS_ORDERED, dbo.Data0060.SCH_DATE, dbo.Data0060.REFERENC' +
        'E_NUMBER,'
      
        '  dbo.Data0060.QTY_PLANNNED, dbo.Data0025.RKEY AS d025_rkey, dbo' +
        '.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'
      
        '  dbo.Data0025.REMARK AS remark25,case isnull(dbo.Data0025.PAREN' +
        'T_PTR,0) when 0 then dbo.Data0025.EST_SCRAP else 0 end EST_SCRAP' +
        ', dbo.Data0025.PARENT_PTR, dbo.Data0097.PO_NUMBER,dbo.Data0008.P' +
        'ROD_CODE, dbo.Data0008.PRODUCT_NAME,'
      
        '  dbo.Data0005.EMPLOYEE_NAME, dbo.data0492.ISSUED_QTY * dbo.Data' +
        '0025.unit_sq AS '#25237#20135#38754#31215','
      '  dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS '#35746#21333#38754#31215','
      
        'case dbo.data0025.BARCODE_FLAG when 1 then '#39#39640#38590#24230#39' else '#39#39' end as ' +
        #39640#38590#24230','
      
        'dbo.data0025.NOPB_flag,dbo.data0025.green_flag,dbo.data0025.barc' +
        'ode_flag,dbo.data0025.CURRENT_REV,'
      
        'case when ltrim(data0025.CURRENT_REV)='#39'Y'#39' then '#39#26080#21348#32032#39' else '#39#39' end' +
        ' as '#21348#32032#35201#27714','
      
        'case Data0025.green_flag when '#39'Y'#39' then '#39'4G'#26631#35782#39'  else '#39' '#39' end as '#26631 +
        #35782'4G,'
      
        '  CASE WHEN data0060.PARTS_ORDERED > 0 THEN round(CAST(Data0492.' +
        'ISSUED_QTY * 100 AS float) / CAST(data0060.PARTS_ORDERED AS floa' +
        't), 2)'
      
        '  ELSE 0 END AS '#36229#25237#29575', dbo.Data0010.CUSTOMER_NAME, dbo.Data0025.un' +
        'it_sq, RTRIM(CONVERT(varchar(9), dbo.Data0025.set_lngth))'
      
        '  + '#39'mm * '#39' + RTRIM(CONVERT(varchar(9), dbo.Data0025.set_width))' +
        ' + '#39'mm'#39' AS set_lngthset_width, dbo.Data0010.CUST_CODE, dbo.Data0' +
        '025.set_qty,'
      
        '  dbo.Data0025.BOM_STATUS, dbo.Data0025.QTY_ON_HAND,dbo.data0025' +
        '.SAMPLE_NR,'
      
        '  CASE data0025.BOM_STATUS WHEN 0 THEN '#39#24453#21518#34917#39' WHEN 1 THEN '#39'BOM'#24453#23457#39 +
        ' WHEN 2 THEN '#39'BOM'#24453#21046#20316#39' WHEN 4 THEN '#39'BOM'#24050#23457#39' END AS bomstatus,'
      
        '  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME,case isnul' +
        'l(dbo.Data0025.PARENT_PTR,0) when 0 then dbo.data0492.QTY_REJECT' +
        ' else 0 end as PARENT_PTR2,case when dbo.data0492.ISSUED_QTY>0 t' +
        'hen (case isnull(dbo.Data0025.PARENT_PTR,0) when 0 then (round(C' +
        'AST(dbo.data0492.QTY_REJECT AS float)/CAST(dbo.data0492.ISSUED_Q' +
        'TY AS float), 4)*100) else 0 end) else 0 end as QTY_REJECT2'
      'FROM         dbo.Data0015 INNER JOIN'
      'dbo.Data0008 INNER JOIN'
      'dbo.Data0005 INNER JOIN'
      'dbo.data0492 INNER JOIN'
      
        'dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY ON dbo.' +
        'Data0005.RKEY = dbo.data0492.CREATED_BY_PTR ON'
      
        'dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR ON dbo.Data0015.R' +
        'KEY = dbo.data0492.WHOUSE_PTR INNER JOIN'
      
        'dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY LEFT ' +
        'OUTER JOIN'
      'dbo.Data0060 LEFT OUTER JOIN'
      
        'dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.R' +
        'KEY ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'
      
        'WHERE (data0492.ISSUE_DATE >= :vdate1 )  AND (data0492.ISSUE_DAT' +
        'E <= :vdate2 )'
      '  and (data0492.tstatus <> :ts1)  and (data0492.tstatus <> :ts2)'
      '  and (data0492.tstatus <> :ts3)  and (data0492.tstatus <> :ts4)')
    Left = 48
    Top = 88
    object ADOQALL2CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      DisplayWidth = 12
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQALL2MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 17
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQALL2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 21
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQALL2ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#35745#21010#25968
      DisplayWidth = 10
      FieldName = 'ORD_REQ_QTY'
    end
    object ADOQALL2PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968#37327
      DisplayWidth = 10
      FieldName = 'PLANNED_QTY'
    end
    object ADOQALL2ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      DisplayWidth = 10
      FieldName = 'ISSUED_QTY'
    end
    object ADOQALL2FG_QTY: TIntegerField
      DisplayLabel = #24050#20837#24211#25968
      DisplayWidth = 8
      FieldName = 'FG_QTY'
    end
    object ADOQALL2WIP_QTY: TIntegerField
      DisplayLabel = #22312#32447#25968
      DisplayWidth = 10
      FieldName = 'WIP_QTY'
    end
    object ADOQALL2QTY_REJECT: TIntegerField
      DisplayLabel = #25253#24223#25968
      DisplayWidth = 10
      FieldName = 'QTY_REJECT'
    end
    object ADOQALL2waitfor_release: TIntegerField
      DisplayLabel = #24453#21457#25918#25968
      FieldName = 'waitfor_release'
    end
    object ADOQALL2PANEL_1_QTY: TIntegerField
      DisplayLabel = 'A'#26495#25968#37327
      DisplayWidth = 7
      FieldName = 'PANEL_1_QTY'
    end
    object ADOQALL2UPANEL1: TIntegerField
      DisplayLabel = 'PCS/A'#26495
      DisplayWidth = 7
      FieldName = 'UPANEL1'
    end
    object ADOQALL2PANEL_2_QTY: TIntegerField
      DisplayLabel = 'B'#26495#25968#37327
      DisplayWidth = 7
      FieldName = 'PANEL_2_QTY'
    end
    object ADOQALL2UPANEL2: TIntegerField
      DisplayLabel = 'PCS/B'#26495
      DisplayWidth = 7
      FieldName = 'UPANEL2'
    end
    object ADOQALL2ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      DisplayWidth = 18
      FieldName = 'ISSUE_DATE'
    end
    object ADOQALL2printed: TStringField
      DisplayLabel = #25171#21360
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'printed'
      Size = 8
      Calculated = True
    end
    object ADOQALL2SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 13
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQALL2SCH_DATE: TDateTimeField
      DisplayLabel = #35745#21010#20132#36135#26399
      DisplayWidth = 11
      FieldName = 'SCH_DATE'
    end
    object ADOQALL2PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      DisplayWidth = 9
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQALL2QTY_PLANNNED: TIntegerField
      DisplayLabel = #24050#35745#21010#25968#37327
      DisplayWidth = 10
      FieldName = 'QTY_PLANNNED'
    end
    object ADOQALL2CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 9
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQALL2CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 33
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQALL2EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154
      DisplayWidth = 8
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#21035
      DisplayWidth = 18
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQALL2MySTATUS: TStringField
      DisplayLabel = #23457#26680#29366#24577
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'MySTATUS'
      Size = 8
      Calculated = True
    end
    object ADOQALL2unit_sq: TFloatField
      DisplayLabel = 'PCS'#38754#31215
      DisplayWidth = 15
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADOQALL2set_lngthset_width: TStringField
      DisplayLabel = #20132#36135#23610#23544
      DisplayWidth = 21
      FieldName = 'set_lngthset_width'
      ReadOnly = True
      Size = 25
    end
    object ADOQALL2set_qty: TIntegerField
      DisplayLabel = 'Pcs/Set'
      DisplayWidth = 7
      FieldName = 'set_qty'
      ReadOnly = True
    end
    object ADOQALL2MyCon_Flag: TStringField
      DisplayLabel = #30830#35748#29366#24577
      FieldKind = fkCalculated
      FieldName = 'MyCon_Flag'
      Size = 8
      Calculated = True
    end
    object ADOQALL2rkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQALL2TTYPE: TWordField
      DisplayWidth = 10
      FieldName = 'TTYPE'
    end
    object ADOQALL2SCH_COMPL_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADOQALL2CREATED_BY_PTR: TIntegerField
      DisplayWidth = 10
      FieldName = 'CREATED_BY_PTR'
    end
    object ADOQALL2PRINTED_BY_PTR: TSmallintField
      DisplayWidth = 13
      FieldName = 'PRINTED_BY_PTR'
    end
    object ADOQALL2remark: TStringField
      DisplayLabel = #25237#20135#22791#27880
      DisplayWidth = 61
      FieldName = 'remark'
      Size = 100
    end
    object ADOQALL2TSTATUS: TWordField
      DisplayWidth = 10
      FieldName = 'TSTATUS'
    end
    object ADOQALL2Con_Flag: TSmallintField
      DisplayWidth = 10
      FieldName = 'Con_Flag'
    end
    object ADOQALL2pnl1_size: TStringField
      DisplayWidth = 20
      FieldName = 'pnl1_size'
    end
    object ADOQALL2pnl2_size: TStringField
      DisplayWidth = 20
      FieldName = 'pnl2_size'
    end
    object ADOQALL2ANALYSIS_CODE_3: TStringField
      DisplayWidth = 50
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object ADOQALL2REFERENCE_NUMBER: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQALL2d025_rkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'd025_rkey'
      ReadOnly = True
    end
    object ADOQALL2remark25: TMemoField
      DisplayLabel = #21152#24037#25351#31034
      DisplayWidth = 10
      FieldName = 'remark25'
      BlobType = ftMemo
    end
    object ADOQALL2EST_SCRAP: TFloatField
      DisplayWidth = 10
      FieldName = 'EST_SCRAP'
    end
    object ADOQALL2PARENT_PTR: TIntegerField
      DisplayWidth = 10
      FieldName = 'PARENT_PTR'
    end
    object ADOQALL2PO_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQALL2bom_status: TWordField
      DisplayWidth = 10
      FieldName = 'bom_status'
    end
    object ADOQALL2MyTTYPE: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldKind = fkCalculated
      FieldName = 'MyTTYPE'
      Calculated = True
    end
    object ADOQALL2QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object ADOQALL2DSDesigner: TFloatField
      FieldName = #25237#20135#38754#31215
      ReadOnly = True
    end
    object ADOQALL2DSDesigner2: TFloatField
      FieldName = #35746#21333#38754#31215
      ReadOnly = True
    end
    object ADOQALL2DSDesigner3: TFloatField
      FieldName = #36229#25237#29575
      ReadOnly = True
    end
    object ADOQALL2bomstatus: TStringField
      DisplayLabel = 'BOM'#29366#24577
      FieldName = 'bomstatus'
      ReadOnly = True
      Size = 8
    end
    object ADOQALL2WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQALL2ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQALL2PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQALL2SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 30
    end
    object ADOQALL2PARENT_PTR2: TIntegerField
      FieldName = 'PARENT_PTR2'
      ReadOnly = True
    end
    object ADOQALL2QTY_REJECT2: TFloatField
      FieldName = 'QTY_REJECT2'
      ReadOnly = True
    end
    object ADOQALL2DSDesigner4: TStringField
      FieldName = #39640#38590#24230
      ReadOnly = True
      Size = 6
    end
    object ADOQALL2NOPB_flag: TWordField
      FieldName = 'NOPB_flag'
    end
    object ADOQALL2DSDesigner5: TStringField
      FieldName = #21348#32032#35201#27714
      ReadOnly = True
      Size = 6
    end
    object ADOQALL2DSDesigner4G: TStringField
      FieldName = #26631#35782'4G'
      ReadOnly = True
      Size = 6
    end
    object ADOQALL2green_flag: TStringField
      FieldName = 'green_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQALL2barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object ADOQALL2CURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      FixedChar = True
      Size = 10
    end
  end
  object TemADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 171
  end
  object TMPADO1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from data0502'
      'where source_ptr =:vptr')
    Left = 43
    Top = 321
    object TMPADO1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object TMPADO1source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object TMPADO1sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
    end
    object TMPADO1pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object TMPADO1pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
    object TMPADO1TOTAL_PNLS_1: TSmallintField
      FieldName = 'TOTAL_PNLS_1'
    end
    object TMPADO1TOTAL_PNLS_2: TSmallintField
      FieldName = 'TOTAL_PNLS_2'
    end
    object TMPADO1UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object TMPADO1UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object TMPADO1UNIT_UNIT: TWordField
      FieldName = 'UNIT_UNIT'
    end
    object TMPADO1UNIT_NUM: TIntegerField
      FieldName = 'UNIT_NUM'
    end
    object TMPADO1SHT_LEN: TFloatField
      FieldName = 'SHT_LEN'
    end
    object TMPADO1SHT_WTH: TFloatField
      FieldName = 'SHT_WTH'
    end
    object TMPADO1TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object TMPADO1PNL_LEN: TFloatField
      FieldName = 'PNL_LEN'
    end
    object TMPADO1PNL_WTH: TFloatField
      FieldName = 'PNL_WTH'
    end
    object TMPADO1UPANEL: TSmallintField
      FieldName = 'UPANEL'
    end
    object TMPADO1PNL_LEN_2: TFloatField
      FieldName = 'PNL_LEN_2'
    end
    object TMPADO1PNL_WTH_2: TFloatField
      FieldName = 'PNL_WTH_2'
    end
    object TMPADO1UPANEL_2: TSmallintField
      FieldName = 'UPANEL_2'
    end
    object TMPADO1minspace1: TFloatField
      FieldName = 'minspace1'
    end
    object TMPADO1minspace2: TFloatField
      FieldName = 'minspace2'
    end
  end
  object TemADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 247
  end
  object ADOQ0026: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey0025'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select RKEY, MANU_BOM_PTR, DEPT_PTR, INVENTORY_PTR, QTY_BOM, FLO' +
        'W_NO, ROUTE_STEP_NO, DOC_FLAG'
      'from data0026'
      'where '
      ' Data0026.DOC_FLAG='#39'Y'#39' and MANU_BOM_PTR = :rkey0025')
    Left = 250
    Top = 221
    object ADOQ0026RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0026MANU_BOM_PTR: TIntegerField
      FieldName = 'MANU_BOM_PTR'
    end
    object ADOQ0026DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQ0026INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOQ0026QTY_BOM: TFloatField
      FieldName = 'QTY_BOM'
    end
    object ADOQ0026FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQ0026ROUTE_STEP_NO: TSmallintField
      FieldName = 'ROUTE_STEP_NO'
    end
    object ADOQ0026DOC_FLAG: TStringField
      FieldName = 'DOC_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQALL2
    Left = 143
    Top = 53
  end
  object AQY468: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     CUT_NO, SO_NO, STEP, DEPT_PTR, INVENT_PTR, QUAN_BOM, ' +
        'STATUS, VENDOR, Invent_or,printit,supplier_ptr,offcut_qty,d541rk' +
        'ey_ptr'
      'FROM         dbo.Data0468'
      'where CUT_NO = :CUT_NO ')
    Left = 398
    Top = 174
    object AQY468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object AQY468SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object AQY468STEP: TSmallintField
      FieldName = 'STEP'
    end
    object AQY468DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object AQY468INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object AQY468QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object AQY468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object AQY468VENDOR: TStringField
      FieldName = 'VENDOR'
      FixedChar = True
      Size = 30
    end
    object AQY468Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object AQY468printit: TStringField
      FieldName = 'printit'
      FixedChar = True
      Size = 1
    end
    object AQY468supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object AQY468offcut_qty: TIntegerField
      FieldName = 'offcut_qty'
    end
    object AQY468d541rkey_ptr: TIntegerField
      FieldName = 'd541rkey_ptr'
    end
  end
  object DataSource5: TDataSource
    DataSet = ads494
    Left = 259
    Top = 21
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 72
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0278.PARAMETER_NAME,data0278.PARAMETER_DESC,dbo.data0' +
      '494.PARAMETER_VALUE,dbo.data0494.step_number,'#13#10'case data0278.DAT' +
      'A_TYPE when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39' end as datatype,data000' +
      '2.UNIT_NAME, dbo.data0494.seq_no,data0494.flow_spfc_flag'#13#10'FROM d' +
      'bo.Data0494 inner join'#13#10'dbo.data0278 on data0494.PARAMETER_PTR=d' +
      'ata0278.RKey inner join '#13#10'data0002 on Data0278.UNIT_PTR = Data00' +
      '02.RKEY'#13#10'where data0494.custpart_ptr = :SOURCE_PTR'#13#10
    Parameters = <
      item
        Name = 'SOURCE_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 331
    Top = 20
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
    object ads494step_number: TSmallintField
      FieldName = 'step_number'
    end
    object ads494datatype: TStringField
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object ads494UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ads494seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ads494flow_spfc_flag: TStringField
      FieldName = 'flow_spfc_flag'
      FixedChar = True
      Size = 1
    end
  end
  object AdoTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 320
    Top = 120
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0025.MANU_PART_NUMBER,Data0278.spec_rkey,dbo.' +
        'Data0279.PARAMETER_VALUE'
      'FROM         dbo.Data0278 INNER JOIN'
      
        '                      dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Da' +
        'ta0279.PARAMETER_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0279.SOURCE_PTR = ' +
        'dbo.Data0025.RKEY'
      '  where Data0278.spec_rkey='#39'I'#39
      '  AND dbo.Data0025.MANU_PART_NUMBER=:MANU_PART_NUMBER')
    Left = 264
    Top = 144
    object ADOQuery3MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery3spec_rkey: TStringField
      FieldName = 'spec_rkey'
      FixedChar = True
      Size = 2
    end
    object ADOQuery3PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        ' if exists(select * from tempdb..sysobjects where id=object_id('#39 +
        'tempdb..#b'#39')) '
      ' begin'
      ' drop table #b'
      ' end'
      'select 1')
    Left = 160
    Top = 159
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0025.MANU_PART_NUMBER,Data0278.spec_rkey,dbo.' +
        'Data0279.PARAMETER_VALUE'
      'FROM         dbo.Data0278 INNER JOIN'
      
        '                      dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Da' +
        'ta0279.PARAMETER_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0279.SOURCE_PTR = ' +
        'dbo.Data0025.RKEY'
      '  where Data0278.spec_rkey='#39'H'#39
      '  AND dbo.Data0025.MANU_PART_NUMBER=:MANU_PART_NUMBER')
    Left = 232
    Top = 88
    object ADOQuery2MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery2spec_rkey: TStringField
      FieldName = 'spec_rkey'
      FixedChar = True
      Size = 2
    end
    object ADOQuery2PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'INV_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  top 1 dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'#13'D' +
        'ata0017.INV_NAME,data0017.INV_DESCRIPTION,data0017.GROUP_PTR,dat' +
        'a0023.code,Data0023.RKEY as rkey23,'#13'dbo.Data0556.QUAN_ON_HAND as' +
        ' QUAN_ON_HAND2 ,'#13'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,' +
        'dbo.Data0016.LOCATION,'#13'Data0556.REMARK,Data0558.remark,'#39#20313#26009#24211#23384#39' AS' +
        ' XY_1,dbo.Data0556.QUAN_ON_HAND as QUAN_ON_HAND2,dbo.Data0556.LE' +
        'N_SIZE,dbo.Data0556.WEI_SIZE'#13'FROM         dbo.Data0017 INNER JOI' +
        'N'#13'dbo.Data0556 ON dbo.Data0017.RKEY = dbo.Data0556.RKEY17 INNER ' +
        'JOIN'#13'dbo.Data0557 ON dbo.Data0557.D556_PTR = dbo.Data0556.RKEY I' +
        'NNER JOIN'#13'dbo.Data0558 ON dbo.Data0557.D558_PTR = dbo.Data0558.R' +
        'KEY INNER JOIN'#13'dbo.Data0016 ON dbo.Data0558.RKEY16 = dbo.Data001' +
        '6.RKEY left join'#13'dbo.Data0023 ON dbo.data0556.SUPP_PTR = dbo.Dat' +
        'a0023.RKEY INNER JOIN'#13'dbo.Data0002 ON data0017.stock_unit_ptr=db' +
        'o.Data0002.rkey'#13'WHERE   (dbo.Data0556.QUAN_ON_HAND > 0) and dbo.' +
        'Data0556.Status=1 and dbo.Data0017.INV_PART_NUMBER=:INV_PART_NUM' +
        'BER'#13'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER'
      ', dbo.'
      
        'Data0017.INV_NAME,'#13'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAM' +
        'E,dbo.Data0016.LOCATION,data0017.INV_DESCRIPTION,data0017.GROUP_' +
        'PTR,'#13'Data0556.REMARK,Data0558.remark,data0023.code,Data0023.RKEY' +
        ',dbo.Data0556.QUAN_ON_HAND,dbo.Data0017.QUAN_ON_HAND,dbo.Data055' +
        '6.LEN_SIZE,dbo.Data0556.WEI_SIZE'#13'ORDER BY dbo.Data0017.INV_PART_' +
        'NUMBER')
    Left = 328
    Top = 176
  end
  object ADO22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0022.INVENTORY_PTR, dbo.Dat' +
        'a0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_D' +
        'ESCRIPTION, '
      
        '                      dbo.Data0022.QUAN_ON_HAND, dbo.Data0022.QU' +
        'AN_TO_BE_STOCKED, dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_' +
        'TO_BE_STOCKED AS ValQty, '
      
        '                      dbo.Data0022.RKEY, dbo.Data0456.CREATE_DAT' +
        'E, dbo.Data0456.GRN_NUMBER, dbo.Data0023.SUPPLIER_NAME, dbo.Data' +
        '0016.LOCATION, '
      
        '                      dbo.Data0002.UNIT_CODE, dbo.Data0022.EXPIR' +
        'E_DATE,data0022.SUPPLIER2,data0456.supp_ptr'
      'FROM         dbo.Data0016 INNER JOIN'
      '                      dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY ON dbo.Data0016.RKEY = dbo.Data0022.LOCATIO' +
        'N_PTR INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY'
      
        'WHERE     (dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_S' +
        'TOCKED > 0) AND (dbo.Data0022.INVENTORY_PTR = :rkey17)'
      'ORDER BY dbo.Data0022.EXPIRE_DATE')
    Left = 520
    Top = 88
    object ADO22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22QUAN_on_hand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_on_hand'
      Precision = 9
      Size = 3
    end
    object ADO22QUAN_TO_BE_STOCKED: TBCDField
      DisplayLabel = #24050#20998#37197#25968
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 9
      Size = 2
    end
    object ADO22ValQty: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValQty'
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object ADO22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO22GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO22SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 20
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO22LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADO22SUPPLIER2: TStringField
      DisplayLabel = #21407#20379#24212#21830#25110#25209#21495
      DisplayWidth = 10
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO22supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
  end
  object ADO468: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CUT_NO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, dbo.data0492.CUT_NO, dbo.data0492.' +
        'ISSUE_DATE, '
      
        '                      dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.Q' +
        'UAN_ASSIGN AS ValQty, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_' +
        'NAME, dbo.Data0468.QUAN_BOM, '
      
        '                      dbo.Data0468.QUAN_ISSUED, dbo.Data0468.qua' +
        'n_alloc, dbo.Data0468.VENDOR, dbo.Data0005.EMPLOYEE_NAME, dbo.da' +
        'ta0492.con_date, dbo.Data0468.RKEY, '
      
        '                      dbo.Data0017.RKEY AS rkey17, dbo.Data0002.' +
        'UNIT_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART' +
        '_DESC, '
      
        '                      dbo.Data0015.ABBR_NAME,data0468.d541rkey_p' +
        'tr'
      'FROM         dbo.Data0005 INNER JOIN'
      '                      dbo.Data0034 INNER JOIN'
      '                      dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY ON dbo.Data0034.RKEY = dbo.Data0468.DEPT_P' +
        'TR INNER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0468.CUT_NO = dbo.' +
        'data0492.CUT_NO ON dbo.Data0005.RKEY = dbo.data0492.CREATED_BY_P' +
        'TR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0492.WHOUSE_PTR = ' +
        'dbo.Data0015.RKEY'
      '                      where dbo.data0492.CUT_NO= :CUT_NO ')
    Left = 518
    Top = 158
    object ADO468INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO468INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO468INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADO468ValQty: TFloatField
      FieldName = 'ValQty'
      ReadOnly = True
    end
    object ADO468DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO468DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO468QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object ADO468QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object ADO468quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ADO468VENDOR: TStringField
      FieldName = 'VENDOR'
      Size = 30
    end
    object ADO468EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO468con_date: TDateTimeField
      FieldName = 'con_date'
    end
    object ADO468RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO468rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object ADO468UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO468MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO468MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO468ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO468d541rkey_ptr: TIntegerField
      FieldName = 'd541rkey_ptr'
    end
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'CUT_NO_2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'MANU_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'AddPeiEshu'
        DataType = ftFloat
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'exec CheckPeiEshu :CUT_NO, :CUT_NO_2,:MANU_PART_NUMBER,:AddPeiEs' +
        'hu')
    Left = 128
    Top = 328
    object ADOQuery6ReturnQ: TIntegerField
      FieldName = 'ReturnQ'
      ReadOnly = True
    end
  end
  object ADOQuery7: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'CUT_NO'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'INV_PART_NUMBER'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'INV_PART_NUMBER_1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT   Data0017.INV_PART_NUMBER,*'
      'FROM         dbo.Data0468  inner join'
      'Data0017 ON Data0468.INVENT_PTR = Data0017.RKEY                 '
      'where Data0468.CUT_NO=:CUT_NO'
      #13'and Data0468.Invent_or=0'
      #13'and Data0017.INV_PART_NUMBER=:INV_PART_NUMBER'
      #13'and Data0017.INV_PART_NUMBER=:INV_PART_NUMBER_1')
    Left = 392
    Top = 280
  end
  object ADOQuery8: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0025.MANU_PART_NUMBER,dbo.Data0502.PNL_LEN,db' +
        'o.Data0502.PNL_WTH'
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      Data0502 ON dbo.Data0025.RKEY = dbo.Data05' +
        '02.source_ptr '
      '  where '
      '   dbo.Data0025.MANU_PART_NUMBER=:MANU_PART_NUMBER')
    Left = 80
    Top = 424
    object ADOQuery8MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery8PNL_LEN: TFloatField
      FieldName = 'PNL_LEN'
    end
    object ADOQuery8PNL_WTH: TFloatField
      FieldName = 'PNL_WTH'
    end
  end
  object ADOQuery9: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'declare @parent_ptr Integer '
      'declare @MANU_PART_NUMBER varchar(50)'
      'set @MANU_PART_NUMBER=:MANU_PART_NUMBER'
      ''
      ''
      ''
      ''
      'select  @parent_ptr =parent_ptr from data0025'
      'where MANU_PART_NUMBER=@MANU_PART_NUMBER'
      ''
      'if isnull(@parent_ptr,'#39#39')='#39#39
      'begin'
      'select @MANU_PART_NUMBER as MANU_PART_NUMBER'
      'end '
      'else'
      'begin'
      'select MANU_PART_NUMBER from data0025'
      'where rkey=@parent_ptr'
      'end')
    Left = 200
    Top = 328
    object ADOQuery9MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
  end
  object ADOQuery10: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'exec checktiliaodan :MANU_PART_NUMBER')
    Left = 400
    Top = 224
    object ADOQuery10ReturnQ: TIntegerField
      FieldName = 'ReturnQ'
      ReadOnly = True
    end
  end
  object ADOQuery11: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'rkey541'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'declare @result Integer'
      'select  @result=a.check_person '
      'from data0545 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d541_ptr=:rkey541'
      'and check_status=0'
      'order by d34_index'
      ''
      'if @@rowcount>0    '
      'begin    '
      'select 1 as ReturnT   '
      'end    '
      'else    '
      'select 0 as  ReturnT  --'#21028#26029#26159#21542#26377#26410#23457#26680#30340#26367#26009#21333
      ''
      '  ')
    Left = 392
    Top = 328
    object ADOQuery11ReturnT: TIntegerField
      FieldName = 'ReturnT'
      ReadOnly = True
    end
  end
  object ADOQuery12: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      ''
      'select Invent_or FROM data0468'
      'where  CUT_NO=:CUT_NO')
    Left = 200
    Top = 416
    object ADOQuery12Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
  end
  object ADOQuery13: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'INV_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select RKEY from Data0017 '
      'where INV_PART_NUMBER=:INV_PART_NUMBER')
    Left = 392
    Top = 384
    object ADOQuery13RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object ADOQuery14: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select PPC_CONTROL4 from data0192')
    Left = 392
    Top = 440
    object ADOQuery14PPC_CONTROL4: TWordField
      FieldName = 'PPC_CONTROL4'
    end
  end
  object ADOQueryTmp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQALL2CalcFields
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'exec data0468_INVENT_PTR :CUT_NO')
    Left = 304
    Top = 432
  end
  object ADOQuery15: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'INV_PART_NUMBER'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Code_2'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @INV_PART_NUMBER varchar(100)'
      'declare @Code_2 varchar(50)'
      'set @INV_PART_NUMBER=:INV_PART_NUMBER'
      'set @Code_2=:Code_2'
      ''
      ''
      ''
      
        'IF EXISTS(Select * From sysobjects where xtype='#39'U'#39' AND Object_ID' +
        '(N'#39'Temp_QUAN_ON_HAND'#39')=id)                                     '
      'begin                                           '
      
        '   drop table Temp_QUAN_ON_HAND                                 ' +
        '         '
      'end  '
      ''
      ''
      'create table Temp_QUAN_ON_HAND'
      '('
      'INV_PART_NUMBER varchar(100),'
      'code23 varchar(50),'
      'QUAN_ON_HAND2 float,'
      'XY_1 varchar(50),'
      'LOCATION varchar(50)'
      ''
      ')'
      ''
      ''
      'insert into Temp_QUAN_ON_HAND'
      'select *  from'
      '('
      
        'SELECT TOP (100) PERCENT  dbo.Data0017.INV_PART_NUMBER,data0023.' +
        'code as code23 ,'#13'SUM(dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QU' +
        'AN_TO_BE_STOCKED) AS QUAN_ON_HAND2'#13','#39#26222#36890#24211#23384#39' AS XY_1,dbo.Data0016.' +
        'LOCATION'#13' '
      ' '#13'FROM         dbo.Data0017 INNER JOIN'#13'    '
      
        'dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR I' +
        'NNER JOIN'#13'    '
      
        'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER J' +
        'OIN'#13'    '
      
        'dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY IN' +
        'NER JOIN'#13'    '
      
        'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER ' +
        'JOIN'#13'    '
      
        'dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RK' +
        'EY INNER JOIN '#13'    '
      
        'dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY '#13' lef' +
        't join data0391 d391 on data0022.rkey391=d391.rkey '
      
        #13'WHERE   (dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_ST' +
        'OCKED > 0)'#13'         '
      
        ' and dbo.Data0496.quote_flag=1  and dbo.Data0017.INV_PART_NUMBER' +
        '=@INV_PART_NUMBER'#13'       '
      ' and dbo.Data0023.code=@Code_2'
      #13'GROUP BY  dbo.Data0017.INV_PART_NUMBER,data0023.code,'
      'dbo.Data0017.QUAN_ON_HAND,dbo.Data0016.LOCATION,d391.status'
      ''
      ''
      ''
      'union all'
      ''
      ''
      
        'SELECT  dbo.Data0017.INV_PART_NUMBER,dbo.Data0023.CODE as code23' +
        ','#13'SUM(dbo.DATA0134.QUAN_ON_HAND) AS Qty,'#39'VMI'#24211#23384#39' AS XY_1,dbo.Data' +
        '0016.LOCATION'#13' '#13'FROM         dbo.DATA0134 INNER JOIN'#13'      '
      
        'dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER J' +
        'OIN'#13'      '
      
        'dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY I' +
        'NNER JOIN'#13'     '
      
        ' dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY I' +
        'NNER JOIN'#13'      '
      
        'dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER ' +
        'JOIN'#13'      '
      
        'dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER ' +
        'JOIN'#13'      '
      
        'dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY IN' +
        'NER JOIN'#13'      '
      
        'dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY'#13' left' +
        ' join data0391 d391 on data0134.rkey391=d391.rkey'
      ' '#13'WHERE     (dbo.DATA0134.QUAN_ON_HAND > 0)'#13'         '
      ' and dbo.Data0496.quote_flag=1  '
      'and dbo.Data0017.INV_PART_NUMBER=@INV_PART_NUMBER'#13'           '
      'and dbo.Data0023.code=@Code_2'
      'GROUP BY  dbo.Data0017.INV_PART_NUMBER,dbo.Data0023.CODE,'
      'dbo.Data0017.QUAN_ON_HAND,dbo.Data0016.LOCATION,d391.status'
      ')A'
      ''
      ''
      ''
      ''
      
        ' select INV_PART_NUMBER,code23 ,LOCATION,QUAN_ON_HAND_ABBR_NAME=' +
        'sum(QUAN_ON_HAND2)  from Temp_QUAN_ON_HAND'#13' '
      'group by INV_PART_NUMBER,code23,LOCATION'#13' ')
    Left = 536
    Top = 240
    object ADOQuery15INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 100
    end
    object ADOQuery15code23: TStringField
      FieldName = 'code23'
      Size = 50
    end
    object ADOQuery15LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 50
    end
    object ADOQuery15QUAN_ON_HAND_ABBR_NAME: TFloatField
      FieldName = 'QUAN_ON_HAND_ABBR_NAME'
      ReadOnly = True
    end
  end
  object TMP: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 628
    Top = 356
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 156
    Top = 268
  end
end
