object DM: TDM
  OldCreateOrder = False
  Left = 684
  Top = 135
  Height = 448
  Width = 397
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 7
  end
  object DataSource1: TDataSource
    DataSet = ADO60
    Left = 36
    Top = 64
  end
  object ado06: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ado06CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'sales_order'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = '111027001-02'
      end>
    SQL.Strings = (
      'SELECT dbo.Data0006.RKEY, dbo.Data0006.WORK_ORDER_NUMBER,'
      '      dbo.data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, '
      '      dbo.Data0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '
      
        '      dbo.Data0006.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data0' +
        '006.QUAN_REJ,'
      
        '      dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,data0006.ENGG' +
        '_STATUS,'
      
        '      dbo.Data0006.QUAN_SCH - dbo.Data0006.QUAN_REJ - dbo.Data00' +
        '06.QUAN_PROD AS wip_qty'
      'FROM dbo.Data0006 INNER JOIN'
      
        '      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO ' +
        'INNER JOIN'
      '      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY'
      'WHERE (data0492.so_no = :SALES_ORDER)'
      ''
      'order by work_order_number')
    Left = 93
    Top = 120
    object ado06CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ado06WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 22
    end
    object ado06PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
      Visible = False
    end
    object ado06QUAN_SCH: TFloatField
      DisplayLabel = #20316#19994#21333#25968#37327
      FieldName = 'QUAN_SCH'
    end
    object ado06v_status: TStringField
      DisplayLabel = #24037#20316#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 10
      Calculated = True
    end
    object ado06MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FixedChar = True
    end
    object ado06MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      FixedChar = True
      Size = 40
    end
    object ado06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado06pnl_size: TStringField
      DisplayLabel = #29983#20135#23610#23544
      FieldName = 'pnl_size'
    end
    object ado06QUAN_REJ: TFloatField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QUAN_REJ'
    end
    object ado06QUAN_PROD: TFloatField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUAN_PROD'
    end
    object ado06wip_qty: TFloatField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'wip_qty'
      ReadOnly = True
    end
    object ado06BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ado06ENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
  end
  object DataSource2: TDataSource
    DataSet = ado06
    Left = 36
    Top = 120
  end
  object ADOS6011: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 60
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 154
    Top = 177
    object ADOS6011RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOS6011FILE_POINTER: TIntegerField
      FieldName = 'FILE_POINTER'
    end
    object ADOS6011SOURCE_TYPE: TSmallintField
      FieldName = 'SOURCE_TYPE'
    end
    object ADOS6011NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADOS6011NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADOS6011NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADOS6011NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object ADOS6011memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 152
    Top = 64
  end
  object ADOQuery3: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep027;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 220
    Top = 65
    object ADOQuery3SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery3ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADOQuery3DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADOQuery3SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADOQuery3EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQuery3TO_BE_CONFIRMED: TIntegerField
      FieldName = 'TO_BE_CONFIRMED'
    end
    object ADOQuery3RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADOQuery3DISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Precision = 4
      Size = 2
    end
    object ADOQuery3TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADOQuery3RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery3PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADOQuery3PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery3PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery3PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOQuery3PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery3CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery3ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery3ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADOQuery3ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADOQuery3PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADOQuery3CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQuery3PARTS_SHIPPED: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #24050#25351#27966
      FieldName = 'PARTS_SHIPPED'
    end
    object ADOQuery3set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADOQuery3rush_charge_pct_used: TIntegerField
      FieldName = 'rush_charge_pct_used'
    end
    object ADOQuery3tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADOQuery3REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQuery3FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object ADOQuery3so_tp: TWordField
      FieldName = 'so_tp'
    end
    object ADOQuery3CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery3SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery3orders_sqft: TFloatField
      FieldName = 'orders_sqft'
      ReadOnly = True
    end
    object ADOQuery3MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery3MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery3set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOQuery3STATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 6
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    Parameters = <>
    Left = 222
    Top = 215
  end
  object aq492: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'sales_order'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.data0492.rkey, data0492.CUT_NO, dbo.data0492.SO_NO,'
      '      Data0005.EMPLOYEE_NAME,data0492.BOM_PTR,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      
        '      data0492.PLANNED_QTY,data0492.ISSUED_QTY,data0492.ISSUE_DA' +
        'TE,'
      
        '      data0492.pnl1_size, data0492.PANEL_1_QTY, data0492.UPANEL1' +
        ','
      
        '      data0492.pnl2_size, data0492.PANEL_2_QTY, data0492.UPANEL2' +
        ','
      
        'case data0492.Con_Flag when 0 then '#39#26410#30830#35748#39'  when 2 then '#39#24050#30830#35748#39' end ' +
        'as '#30830#35748#29366#24577','
      
        'case data0492.TTYPE when 0 then '#39#27491#24120#39'  WHEN 1 THEN '#39#34917#26009#39'  end AS '#25237 +
        #20135#24615#36136','
      'case  when Data0025.PARENT_PTR is null then '#39#22806#23618#39
      ' else '#39#20869#23618#39' end as '#20135#21697#23646#24615','
      'case data0492.tstatus when 0 then '#39#24050#23457#26680#39
      'when 1 then '#39#26410#23457#26680#39' when 2 then '#39#19981#23457#26680#39
      ' when 3 then '#39#24050#21462#28040#39' end as '#23457#26680#29366#24577
      'FROM dbo.data0492 INNER JOIN  dbo.Data0005 ON '
      '      dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY INNER JOIN'
      '      dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY'
      'where data0492.so_no = :SALES_ORDER')
    Left = 93
    Top = 176
    object aq492rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq492CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object aq492SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object aq492EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq492MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq492MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object aq492ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object aq492ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object aq492pnl1_size: TStringField
      FieldName = 'pnl1_size'
    end
    object aq492PANEL_1_QTY: TIntegerField
      FieldName = 'PANEL_1_QTY'
    end
    object aq492UPANEL1: TIntegerField
      FieldName = 'UPANEL1'
    end
    object aq492pnl2_size: TStringField
      FieldName = 'pnl2_size'
    end
    object aq492PANEL_2_QTY: TIntegerField
      FieldName = 'PANEL_2_QTY'
    end
    object aq492UPANEL2: TIntegerField
      FieldName = 'UPANEL2'
    end
    object aq492DSDesigner2: TStringField
      FieldName = #25237#20135#24615#36136
      ReadOnly = True
      Size = 4
    end
    object aq492PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968#37327
      FieldName = 'PLANNED_QTY'
    end
    object aq492DSDesigner: TStringField
      FieldName = #30830#35748#29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq492DSDesigner3: TStringField
      FieldName = #20135#21697#23646#24615
      ReadOnly = True
      Size = 4
    end
    object aq492DSDesigner4: TStringField
      FieldName = #23457#26680#29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq492BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
  end
  object ado0006: TADOQuery
    Connection = ADOConnection1
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
      'SELECT data0006.rkey,data0006.bom_ptr'
      'FROM Data0006'
      'WHERE rkey = :rkey')
    Left = 41
    Top = 252
    object ado0006rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado0006bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
  end
  object ADO492: TADOQuery
    Connection = ADOConnection1
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
      'select rkey,bom_ptr,data0492.CUT_NO,'
      '       data0492.PLANNED_QTY,data0492.ISSUED_QTY'
      'from data0492'
      'WHERE data0492.CUT_NO = :CUT_NO')
    Left = 95
    Top = 252
    object ADO492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO492bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
    object ADO492CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO492PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968#37327
      FieldName = 'PLANNED_QTY'
    end
    object ADO492ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
  end
  object DataSource4: TDataSource
    DataSet = aq492
    Left = 37
    Top = 176
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 222
    Top = 164
  end
  object Append60: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0060'
      'where rkey is null')
    Left = 187
    Top = 294
  end
  object Append90: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0090'
      'where rkey is null')
    Left = 246
    Top = 292
  end
  object Append102: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0102'
      'where rkey is null')
    Left = 308
    Top = 291
  end
  object ADOtemp60: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 295
    Top = 216
  end
  object aq192: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select artaxontax,aptaxontax,QTE_control2,ppc_control15,'
      
        '       custcitool,custciprod,suplcimat,custciship,CUSTCOPROD,cus' +
        'tcoTool'
      'from data0192')
    Left = 92
    Top = 316
    object aq192aptaxontax: TStringField
      DisplayLabel = #37327#26495#26159#21542#35780#23457
      FieldName = 'aptaxontax'
      FixedChar = True
      Size = 1
    end
    object aq192artaxontax: TStringField
      DisplayLabel = #26679#26495#26159#21542#35780#23457
      FieldName = 'artaxontax'
      FixedChar = True
      Size = 1
    end
    object aq192QTE_control2: TWordField
      DisplayLabel = #26159#21542#19968#23450#25253#20215
      FieldName = 'QTE_control2'
    end
    object aq192ppc_control15: TWordField
      DisplayLabel = #35780#23457#21069#26159#21542#36716#20135#30830#35748
      FieldName = 'ppc_control15'
    end
    object aq192custcitool: TStringField
      DisplayLabel = #26159#21542#21487#20197#36755#20837'set'
      FieldName = 'custcitool'
      FixedChar = True
      Size = 1
    end
    object aq192custciprod: TStringField
      DisplayLabel = #26159#21542#38145#23450#26087#26495#21495
      FieldName = 'custciprod'
      FixedChar = True
      Size = 1
    end
    object aq192suplcimat: TStringField
      DisplayLabel = #38500#22791#21697#21450#26679#26495#20197#22806#30340'so'#21333#20215#21487#20197#20026#38646
      FieldName = 'suplcimat'
      FixedChar = True
      Size = 1
    end
    object aq192custciship: TStringField
      DisplayLabel = #35746#21333#36755#20837#26102#19981#20801#35768#26356#25913#36135#24065
      FieldName = 'custciship'
      FixedChar = True
      Size = 1
    end
    object aq192CUSTCOPROD: TStringField
      DisplayLabel = #21457#31080#24310#26399#36229#36807#20801#35768#22825#25968#19981#20801#35768#19979#21333
      FieldName = 'CUSTCOPROD'
      FixedChar = True
      Size = 1
    end
    object aq192custcoTool: TStringField
      DisplayLabel = #20135#21697#21487#33021#22810#20010#23458#25143#38144#21806
      FieldName = 'custcoTool'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 293
    Top = 163
  end
  object ADO60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO60CalcFields
    CommandText = 
      'SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE as ' +
      'CUST_CODE,'#13#10' Data0025.MANU_PART_NUMBER,data0060.part_price,data0' +
      '060.tax_in_price,data0010.cust_code as custcode,'#13#10' Data0097.PO_N' +
      'UMBER,Data0005.EMPLOYEE_NAME,data0060.to_be_planned,data0010.CRE' +
      'DIT_RATING,'#13#10' Data0060.DUE_DATE,Data0060.SCH_DATE,Data0060.CUSTO' +
      'MER_PTR,data0060.RUSH_CHARGE,'#13#10' Data0060.PARTS_ORDERED,Data0060.' +
      'PARTS_SHIPPED,data0060.qty_plannned,data0010.credit_limit,'#13#10' dat' +
      'a0060.status,data0060.prod_rel,Data0060.CUST_PART_PTR,RUSH_CHARG' +
      'E_PCT_USED,'#13#10' data0025.set_qty,set_ordered,set_price,data0025.MF' +
      'G_LEAD_TIME,data0010.DAYS_EARLY_SCHEDULE,'#13#10' data0060.ORIG_REQUES' +
      'T_DATE,data0060.ORIG_SCHED_SHIP_DATE,TOTAL_ADD_L_PRICE,'#13#10' Data00' +
      '60.PURCHASE_ORDER_PTR,data0097.po_date,data0060.EXCH_RATE,data00' +
      '10.customer_name,'#13#10' data0060.REFERENCE_NUMBER,data0025.MANU_PART' +
      '_DESC,CUST_SHIP_ADDR_PTR,data0060.ISSUED_QTY'#13#10'FROM Data0005 INNE' +
      'R JOIN Data0097 INNER JOIN'#13#10'      Data0060 INNER JOIN Data0025 O' +
      'N Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'#13#10'      Data0' +
      '010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY ON'#13#10'      Data0097.' +
      'RKEY = Data0060.PURCHASE_ORDER_PTR ON'#13#10'      Data0005.RKEY = Dat' +
      'a0060.ENTERED_BY_EMPL_PTR'#13#10'WHERE (Data0060.STATUS <> 3) and (Dat' +
      'a0060.STATUS <> 4) and'#13#10'      (data0060.ENT_DATE >=:dtpk1) and (' +
      'data0060.ENT_DATE <=:dtpk2)'#13#10
    IndexFieldNames = 'SALES_ORDER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40909d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 41091d
      end>
    Prepared = True
    Left = 96
    Top = 64
    object ADO60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO60SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO60CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO60MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO60part_price: TFloatField
      FieldName = 'part_price'
    end
    object ADO60tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADO60custcode: TStringField
      FieldName = 'custcode'
      Size = 10
    end
    object ADO60PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO60EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO60to_be_planned: TIntegerField
      FieldName = 'to_be_planned'
    end
    object ADO60DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADO60SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO60CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO60RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADO60PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO60PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADO60qty_plannned: TIntegerField
      FieldName = 'qty_plannned'
    end
    object ADO60credit_limit: TFloatField
      FieldName = 'credit_limit'
    end
    object ADO60CREDIT_RATING: TWordField
      FieldName = 'CREDIT_RATING'
    end
    object ADO60status: TWordField
      FieldName = 'status'
    end
    object ADO60prod_rel: TStringField
      FieldName = 'prod_rel'
      FixedChar = True
      Size = 1
    end
    object ADO60CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO60RUSH_CHARGE_PCT_USED: TIntegerField
      FieldName = 'RUSH_CHARGE_PCT_USED'
    end
    object ADO60set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADO60set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADO60set_price: TFloatField
      FieldName = 'set_price'
    end
    object ADO60MFG_LEAD_TIME: TSmallintField
      FieldName = 'MFG_LEAD_TIME'
    end
    object ADO60DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object ADO60ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO60TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADO60PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADO60po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ADO60EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO60customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADO60REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADO60MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO60CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object ADO60v_Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_Status'
      Calculated = True
    end
    object ADO60ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 352
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 60
    Parameters = <
      item
        Name = '@rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select data0060.SALES_ORDER,data0025.MANU_PART_NUMBER,'
      'data0060.PARTS_ORDERED,data0060.SCH_DATE from Data0060 '
      'inner join Data0025 on data0060.CUST_PART_PTR=data0025.RKEY'
      'where data0060.rkey=:@rkey')
    Left = 280
    Top = 80
    object qry1SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
    end
    object qry1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      Size = 25
    end
    object qry1SCH_DATE: TDateField
      FieldName = 'SCH_DATE'
    end
    object fltfldqry1PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 280
    Top = 40
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 336
    Top = 40
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = '@rkey'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0360'
      'where so_ptr=:@rkey')
    Left = 336
    Top = 88
    object intgrfldqry2rkey: TIntegerField
      FieldName = 'rkey'
    end
    object qry2sch_date: TDateField
      FieldName = 'sch_date'
    end
    object intgrfldqry2quantity: TIntegerField
      FieldName = 'quantity'
    end
  end
end
