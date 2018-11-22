object DM: TDM
  OldCreateOrder = False
  Left = 491
  Top = 261
  Height = 350
  Width = 317
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Fromissue_date'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'Toissue_date'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.data0492.rkey, dbo.data0492.TTYPE, dbo.data0492.C' +
        'UT_NO, dbo.data0492.SO_NO, dbo.data0492.ORD_REQ_QTY, dbo.data049' +
        '2.ISSUE_DATE, dbo.Data0060.ORIG_CUSTOMER,'
      
        '                      dbo.data0492.PLANNED_QTY, dbo.data0492.ISS' +
        'UED_QTY, dbo.data0492.PANEL_1_QTY, dbo.data0492.UPANEL1, dbo.dat' +
        'a0492.PANEL_2_QTY,  dbo.data0492.cite_qryonhand,'
      
        '                      dbo.data0492.UPANEL2, dbo.Data0025.MANU_PA' +
        'RT_NUMBER, dbo.Data0025.MANU_PART_DESC,dbo.data0060.PARTS_ORDERE' +
        'D,dbo.data0060.so_oldnew,dbo.data0097.PO_NUMBER,'
      
        ' Data0025.unit_sq * data0492.ORD_REQ_QTY AS area3, Data0025. LAY' +
        'ERS,'
      ' Data0025.unit_sq * data0492.ISSUED_QTY AS area1, '
      
        ' Data0025.unit_sq * (data0492.ISSUED_QTY - data0492.ORD_REQ_QTY)' +
        ' AS area2, '
      ' Data0025.unit_sq*Data0060.PARTS_ORDERED AS area_4,'
      'case when data0492.upanel1 >0 then data0492.ORD_REQ_QTY*'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data0492.upanel' +
        '1'
      'when data0492.upanel2 >0 then data0492.ORD_REQ_QTY*'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/data0492.upanel' +
        '2'
      'else Data0025.unit_sq * data0492.ORD_REQ_QTY end as area3_1,'
      ''
      'case when data0492.upanel1 >0 then data0492.ISSUED_QTY*'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data0492.upanel' +
        '1'
      'when data0492.upanel2 >0 then data0492.ISSUED_QTY*'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/data0492.upanel' +
        '2'
      'else Data0025.unit_sq * data0492.ISSUED_QTY end as area1_1,'
      ''
      
        'case when data0492.upanel1 >0 then (data0492.ISSUED_QTY - data04' +
        '92.ORD_REQ_QTY)*'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data0492.upanel' +
        '1'
      
        'when data0492.upanel2 >0 then (data0492.ISSUED_QTY - data0492.OR' +
        'D_REQ_QTY)*'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/data0492.upanel' +
        '2'
      
        'else Data0025.unit_sq * (data0492.ISSUED_QTY - data0492.ORD_REQ_' +
        'QTY) end as area2_1,'
      ''
      'case when data0492.upanel1 >0 then'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data0492.upanel' +
        '1'
      'when data0492.upanel2 >0 then'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      
        '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/data0492.upanel' +
        '2'
      'else Data0025.unit_sq end as unit_sq_1,'
      ''
      'data0492.operation_rate as  rate, '
      
        '  CASE data0492.tstatus WHEN 0 THEN '#39#24050#23457#26680#39' WHEN 1 THEN '#39#26410#23457#26680#39' WHEN' +
        ' 2 THEN '#39#19981#23457#26680#39' WHEN 3 THEN '#39#24050#21462#28040#39' END AS status, '
      '                       dbo.data0492.QTY_REJECT, '
      
        'dbo.Data0060.PARTS_ALLOC * (1 + dbo.Data0060.RUSH_CHARGE * 0.01)' +
        ' / dbo.Data0060.EXCH_RATE AS MyPART_PRICE, '
      
        '                      dbo.data0492.ISSUED_QTY - dbo.data0492.ORD' +
        '_REQ_QTY as APP_QUAN, '
      
        '                      CASE data0492.TTYPE WHEN 0 THEN '#39#27491#24120#25237#20135#39' WHE' +
        'N 1 THEN '#39#34917#26009#25237#20135#39' WHEN 2 THEN '#39#25353'MRB'#37325#25237#39' WHEN 3 THEN '#39#25353'MRB'#36820#20462#39' WHEN 4' +
        ' THEN '#39#25353#26495#21495#25237#20135#39' END'
      
        '                       AS MyData0492TTYPE, dbo.Data0060.SCH_DATE' +
        ', dbo.Data0008.PRODUCT_NAME, dbo.data0492.analysis_code_3, dbo.D' +
        'ata0010.CUST_CODE, '
      
        '                      dbo.Data0010.ABBR_NAME, dbo.Data0008.PROD_' +
        'CODE, dbo.data0492.pnl1_size, dbo.data0492.pnl2_size, dbo.Data00' +
        '25.unit_sq, dbo.data0492.remark, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0025.T' +
        'USAGE, dbo.Data0015.WAREHOUSE_CODE,dbo.data0414.number as d414nu' +
        'mber,dbo.data0415.number as d415number,'
      
        'round(data0492.PLANNED_QTY/(1+data0025.EST_SCRAP*0.01),0,1)-data' +
        '0492.ORD_REQ_QTY as rw_caotou_qty,'
      
        'round((round(data0492.PLANNED_QTY/(1+data0025.EST_SCRAP*0.01),0,' +
        '1)-data0492.ORD_REQ_QTY)*dbo.Data0025.unit_sq,3) as rw_caotou_mi' +
        'anji, '
      
        'case isnull(dbo.Data0025.PARENT_PTR,0) when 0 then data0025.EST_' +
        'SCRAP else 0 end EST_SCRAP,dbo.data0492.FG_QTY, dbo.data0492.WIP' +
        '_QTY, dbo.data0492.waitfor_release,case when dbo.data0492.ISSUED' +
        '_QTY>0 then (case isnull(dbo.Data0025.PARENT_PTR,0) when 0 then ' +
        '(round(CAST(dbo.data0492.QTY_REJECT AS float)/CAST(dbo.data0492.' +
        'ISSUED_QTY AS float), 4)*100) else 0 end) else 0 end as QTY_REJE' +
        'CT2'
      'FROM    dbo.data0492   INNER JOIN'
      
        '                     dbo.Data0025  ON dbo.Data0025.RKEY = dbo.da' +
        'ta0492.BOM_PTR INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0492.CREATED_BY_PT' +
        'R = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0492.WHOUSE_PTR = ' +
        'dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0492.COMPLETED = d' +
        'bo.Data0010.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.data0492.SO_NO = dbo.D' +
        'ata0060.SALES_ORDER  LEFT OUTER JOIN'
      
        '                      dbo.data0414 ON dbo.data0492.mrb_ptr = dbo' +
        '.data0414.rkey LEFT OUTER JOIN'
      
        '                      dbo.data0415 ON dbo.data0414.d415_ptr = db' +
        'o.data0415.rkey  LEFT OUTER JOIN'
      
        '                      dbo.data0097 on dbo.data0060.PURCHASE_ORDE' +
        'R_PTR=dbo.data0097.Rkey'
      'WHERE    issue_date >=:Fromissue_date and'
      ' issue_date < :Toissue_date')
    Left = 144
    Top = 16
    object ADOQuery1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADOQuery1CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1SO_NO: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#35745#21010#25968
      FieldName = 'ORD_REQ_QTY'
    end
    object ADOQuery1PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968
      FieldName = 'PLANNED_QTY'
    end
    object ADOQuery1ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968
      FieldName = 'ISSUED_QTY'
    end
    object ADOQuery1area3: TFloatField
      DisplayLabel = #24453#35745#21010#38754#31215
      FieldName = 'area3'
      ReadOnly = True
    end
    object ADOQuery1area1: TFloatField
      DisplayLabel = #25237#20135#38754#31215
      FieldName = 'area1'
      ReadOnly = True
    end
    object ADOQuery1area2: TFloatField
      DisplayLabel = #36229#25237#38754#31215
      FieldName = 'area2'
      ReadOnly = True
    end
    object ADOQuery1rate: TFloatField
      DisplayLabel = #36229#25237#65285
      FieldName = 'rate'
      ReadOnly = True
    end
    object ADOQuery1ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#26009#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1MyPART_PRICE: TBCDField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'MyPART_PRICE'
      ReadOnly = True
      Precision = 19
    end
    object ADOQuery1APP_QUAN: TIntegerField
      FieldName = 'APP_QUAN'
    end
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1MyData0492TTYPE: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldName = 'MyData0492TTYPE'
      ReadOnly = True
      Size = 12
    end
    object ADOQuery1sch_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_date'
    end
    object ADOQuery1analysis_code_3: TStringField
      DisplayLabel = #22823#26009#35268#26684
      FieldName = 'analysis_code_3'
      Size = 50
    end
    object ADOQuery1PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQuery1pnl1_size: TStringField
      DisplayLabel = 'PNLA'#23610#23544
      FieldName = 'pnl1_size'
    end
    object ADOQuery1pnl2_size: TStringField
      DisplayLabel = 'PNLB'#23610#23544
      FieldName = 'pnl2_size'
    end
    object ADOQuery1unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq'
    end
    object ADOQuery1remark2: TStringField
      DisplayLabel = #36229#25237#21407#22240#21450#22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object ADOQuery1employee_name: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQuery1status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1qty_reject: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'qty_reject'
    end
    object ADOQuery1PANEL_1_QTY: TIntegerField
      DisplayLabel = 'A'#26495#25968
      FieldName = 'PANEL_1_QTY'
    end
    object ADOQuery1UPANEL1: TIntegerField
      DisplayLabel = 'A'#26495'PCS'
      FieldName = 'UPANEL1'
    end
    object ADOQuery1PANEL_2_QTY: TIntegerField
      DisplayLabel = 'B'#26495#25968
      FieldName = 'PANEL_2_QTY'
    end
    object ADOQuery1cite_qryonhand: TIntegerField
      DisplayLabel = #24341#29992#24211#23384'PCS'#25968#37327
      FieldName = 'cite_qryonhand'
    end
    object ADOQuery1UPANEL2: TIntegerField
      DisplayLabel = 'B'#26495'PCS'
      FieldName = 'UPANEL2'
    end
    object ADOQuery1warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADOQuery1TUSAGE: TBCDField
      DisplayLabel = #22823#26009#21033#29992#29575
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object ADOQuery1area3_1: TFloatField
      DisplayLabel = #24453#35745#21010#38754#31215
      FieldName = 'area3_1'
      ReadOnly = True
    end
    object ADOQuery1area1_1: TFloatField
      DisplayLabel = #25237#20135#38754#31215
      FieldName = 'area1_1'
      ReadOnly = True
    end
    object ADOQuery1area2_1: TFloatField
      DisplayLabel = #36229#25237#38754#31215
      FieldName = 'area2_1'
      ReadOnly = True
    end
    object ADOQuery1unit_sq_1: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq_1'
      ReadOnly = True
    end
    object ADOQuery1d414number: TStringField
      FieldName = 'd414number'
      Size = 15
    end
    object ADOQuery1d415number: TStringField
      FieldName = 'd415number'
      Size = 15
    end
    object ADOQuery1PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery1area_4: TFloatField
      FieldName = 'area_4'
    end
    object ADOQuery1so_oldnew: TStringField
      DisplayLabel = #35746#21333#26032#26087
      FieldName = 'so_oldnew'
      Size = 4
    end
    object ADOQuery1rw_caotou_qty: TFloatField
      DisplayLabel = #20154#20026#36229#25237#25968#37327
      FieldName = 'rw_caotou_qty'
      ReadOnly = True
    end
    object ADOQuery1rw_caotou_mianji: TFloatField
      DisplayLabel = #20154#20026#36229#25237#38754#31215
      FieldName = 'rw_caotou_mianji'
      ReadOnly = True
    end
    object ADOQuery1FG_QTY: TIntegerField
      FieldName = 'FG_QTY'
    end
    object ADOQuery1WIP_QTY: TIntegerField
      FieldName = 'WIP_QTY'
    end
    object ADOQuery1waitfor_release: TIntegerField
      FieldName = 'waitfor_release'
    end
    object ADOQuery1QTY_REJECT2: TFloatField
      FieldName = 'QTY_REJECT2'
      ReadOnly = True
    end
    object ADOQuery1EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ADOQuery1ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADOQuery1LAYERS: TWordField
      FieldName = 'LAYERS'
    end
  end
  object TemADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 96
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 144
    Top = 96
  end
  object AdoWDetails: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
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
      
        'SELECT dbo.data0006.rkey,dbo.Data0006.WORK_ORDER_NUMBER, dbo.Dat' +
        'a0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data000' +
        '6.QUAN_SCH, '
      
        'dbo.Data0006.QUAN_REJ, dbo.Data0006.QUAN_PROD, dbo.Data0056.QTY_' +
        'BACKLOG AS '#22312#32447#25968#37327'PCS, '
      
        'case dbo.Data0006.PROD_STATUS when 2 then '#39#24453#21457#25918#39' when 3 then '#39#29983#20135#20013 +
        #39' when 4 then '#39#22806#21457#29983#20135#39' when 5 then '#39#24453#20837#20179#39' when 6 then '#39#24453#20998#37197#39' when 9 ' +
        'then '#39#29983#20135#32467#26463#39' when 102 then '#39#29983#20135#21069#26242#32531#39' when 103 then '#39#29983#20135#20013#26242#32531#39' when 202' +
        ' then '#39#21462#28040#39' end as PROD_STATUS, '
      
        'dbo.Data0006.SCH_COMPL_DATE, dbo.Data0006.ACT_COMPL_DATE, dbo.Da' +
        'ta0006.RELEASE_DATE, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_N' +
        'AME, '
      
        'dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0006.' +
        'PANELS, dbo.Data0006.pnl_size, dbo.Data0056.PANELS AS '#22312#32447'PNL'#25968', '
      'dbo.Data0006.PARTS_PER_PANEL'
      'FROM dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0006 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0006.BOM_PTR INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY LEFT OUTER JOIN'
      '                      dbo.Data0034 RIGHT OUTER JOIN'
      
        '                      dbo.Data0056 ON dbo.Data0034.RKEY = dbo.Da' +
        'ta0056.DEPT_PTR ON dbo.Data0006.RKEY = dbo.Data0056.WO_PTR'
      'WHERE (dbo.Data0006.CUT_NO = :CUT_NO) ')
    Left = 48
    Top = 168
  end
  object AdoViewSales: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
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
      
        'select dbo.data0060.SALES_ORDER,dbo.Data0060.PARTS_ORDERED,DATA0' +
        '535.QTY_PLANNED,data0060.ISSUED_QTY,data0060.TO_BE_PLANNED'
      'from dbo.DATA0535 INNER JOIN'
      'dbo.Data0060 ON dbo.DATA0535.SALES_ORDER = Data0060.SALES_ORDER'
      'where dbo.DATA0535.CUT_NO =:CUT_NO')
    Left = 152
    Top = 168
    object AdoViewSalesSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object AdoViewSalesPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object AdoViewSalesQTY_PLANNED: TIntegerField
      FieldName = 'QTY_PLANNED'
    end
    object AdoViewSalesISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object AdoViewSalesTO_BE_PLANNED: TIntegerField
      FieldName = 'TO_BE_PLANNED'
    end
  end
  object adoField: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    BeforeInsert = adoFieldBeforeInsert
    BeforeDelete = adoFieldBeforeDelete
    Parameters = <
      item
        Name = 'key419'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldO' +
        'rder, FieldWidth, IsDisplay'
      ' from data0849 '
      'where D419_ptr= :key419  and D073_ptr=:rkey73')
    Left = 48
    Top = 240
  end
  object DataSource3: TDataSource
    DataSet = adoField
    Left = 120
    Top = 240
  end
end
