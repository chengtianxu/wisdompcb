object DM: TDM
  OldCreateOrder = False
  Left = 599
  Top = 207
  Height = 484
  Width = 478
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 35
    Top = 7
  end
  object ADO60: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO60AfterOpen
    OnCalcFields = ADO60CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0060.RKEY,Data0060.SALES_ORDER,Data0010.rkey as rkey1' +
        '0,Data0010.CUST_CODE,Data0010.customer_name,'
      
        '       Data0012.ship_to_address_1,Data0025.MANU_PART_NUMBER,Data' +
        '0025.MANU_PART_DESC,Data0060.RUSH_CHARGE,'
      
        '       Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME,Data0060.TO_BE_' +
        'PLANNED,Data0060.DUE_DATE,data0012.LOCATION,'
      
        '       Data0060.PARTS_RETURNED,Data0060.SCH_DATE,Data0060.CUSTOM' +
        'ER_PTR,Data0060.RETURNED_SHIP,'
      
        '       Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,Data0060.QT' +
        'Y_PLANNNED,Data0060.STATUS,Data0060.PROD_REL,'
      
        '       Data0060.CUST_PART_PTR,Data0060.RUSH_CHARGE_PCT_USED,Data' +
        '0025.set_qty,Data0060.set_ordered,'
      
        '       Data0060.set_price,Data0060.tax_in_price,Data0060.ORIG_RE' +
        'QUEST_DATE,Data0060.ORIG_SCHED_SHIP_DATE,'
      
        '       Data0060.TOTAL_ADD_L_PRICE,Data0060.PURCHASE_ORDER_PTR,Da' +
        'ta0097.PO_DATE,Data0060.EXCH_RATE,'
      
        '       Data0060.REFERENCE_NUMBER,Data0060.CUST_SHIP_ADDR_PTR,Dat' +
        'a0025.ttype,Data0060.FOB, '
      
        '       Data0060.PART_PRICE,Data0060.PARTS_ALLOC,Data0060.so_styl' +
        'e,Data0060.so_tp,Data0060.QTE_PTR,'
      
        '       Data0001.CURR_CODE,data0060.CURRENCY_PTR,data0060.COMMISI' +
        'ON_ON_TOOLING,Data0060.ISSUED_QTY,'
      
        'data0060.SHIPPING_CONTACT,data0060.SHIP_CONTACT_PHONE,data0060.R' +
        'EPUT_QTY,data0060.REPUT_APPR_BY'
      'FROM         dbo.Data0005 INNER JOIN'
      '                      dbo.Data0097 INNER JOIN'
      '                      dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY ON dbo.Data0097.RKEY = dbo.Data0060.PURCHASE' +
        '_ORDER_PTR ON '
      
        '                      dbo.Data0005.RKEY = dbo.Data0060.ENTERED_B' +
        'Y_EMPL_PTR INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0012 ON dbo.Data0060.CUST_SHIP_ADD' +
        'R_PTR = dbo.Data0012.RKEY'
      
        'WHERE (Data0060.STATUS <> 3) and (Data0060.STATUS <> 4)   and  (' +
        'data0060.ENT_DATE >=:dtpk1) and (data0060.ENT_DATE <=:dtpk2)'
      ''
      'ORDER BY Data0060.SALES_ORDER')
    Left = 93
    Top = 64
    object ADO60RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO60SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO60rkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADO60CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO60customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADO60ship_to_address_1: TStringField
      FieldName = 'ship_to_address_1'
      Size = 100
    end
    object ADO60MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO60MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO60RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADO60PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO60EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO60TO_BE_PLANNED: TIntegerField
      FieldName = 'TO_BE_PLANNED'
    end
    object ADO60DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADO60PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ADO60SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO60CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO60RETURNED_SHIP: TIntegerField
      FieldName = 'RETURNED_SHIP'
    end
    object ADO60PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO60PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADO60QTY_PLANNNED: TIntegerField
      FieldName = 'QTY_PLANNNED'
    end
    object ADO60STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO60PROD_REL: TStringField
      FieldName = 'PROD_REL'
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
      DisplayFormat = '#0.000000'
    end
    object ADO60tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
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
    object ADO60PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO60EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO60REFERENCE_NUMBER: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      Size = 100
    end
    object ADO60CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object ADO60ttype: TWordField
      FieldName = 'ttype'
    end
    object ADO60FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object ADO60PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
      DisplayFormat = '#0.000000'
    end
    object ADO60PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADO60so_style: TWordField
      FieldName = 'so_style'
    end
    object ADO60so_tp: TWordField
      FieldName = 'so_tp'
    end
    object ADO60QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object ADO60CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO60CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO60COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object ADO60LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object ADO60ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO60SHIPPING_CONTACT: TStringField
      FieldName = 'SHIPPING_CONTACT'
      FixedChar = True
    end
    object ADO60SHIP_CONTACT_PHONE: TStringField
      FieldName = 'SHIP_CONTACT_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADO60REPUT_QTY: TIntegerField
      FieldName = 'REPUT_QTY'
    end
    object ADO60REPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
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
        Size = 10
        Value = '100018-002'
      end>
    SQL.Strings = (
      'SELECT data0492.CUT_NO,Data0006.WORK_ORDER_NUMBER,'
      '      Data0006.PROD_STATUS,data0492.PLANNED_QTY,'
      '      data0492.ISSUED_QTY,Data0006.QUAN_SCH'
      'FROM Data0006 INNER JOIN'
      '     data0492 ON Data0006.CUT_NO = data0492.CUT_NO'
      'WHERE (data0492.so_no=:sales_order) and'
      '      (Data0006.PROD_STATUS <= 3)'
      'order by work_order_number      ')
    Left = 93
    Top = 117
    object ado06CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ado06WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 22
    end
    object ado06PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
      Visible = False
    end
    object ado06PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968#37327
      FieldName = 'PLANNED_QTY'
    end
    object ado06ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ado06QUAN_SCH: TFloatField
      DisplayLabel = #24037#20316#21333#25968#37327
      FieldName = 'QUAN_SCH'
    end
    object ado06v_status: TStringField
      DisplayLabel = #24037#20316#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 10
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ado06
    Left = 36
    Top = 117
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
    Left = 148
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
    Left = 148
    Top = 62
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
    Left = 219
    Top = 64
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
      Precision = 5
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
    object ADOQuery3tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADOQuery3set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADOQuery3PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery3PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOQuery3REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
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
    object ADOQuery3PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADOQuery3PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADOQuery3CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQuery3RUSH_CHARGE_PCT_USED: TIntegerField
      FieldName = 'RUSH_CHARGE_PCT_USED'
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
    object ADOQuery3ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    Parameters = <>
    Left = 260
    Top = 236
  end
  object ado25: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'CUST_PART_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,'
      'Data0025.RKEY,data0050.cp_rev'
      'FROM  data0025 inner join data0050 on'
      '          Data0025.ANCESTOR_PTR=data0050.rkey'
      'where  Data0025.ANCESTOR_PTR=:CUST_PART_PTR')
    Left = 93
    Top = 176
    object ado25MANU_PART_NUMBER: TStringField
      DisplayLabel = #29983#20135#22411#21495
      FieldName = 'MANU_PART_NUMBER'
      FixedChar = True
    end
    object ado25MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      FixedChar = True
      Size = 40
    end
    object ado25RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado25cp_rev: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'cp_rev'
      Size = 5
    end
  end
  object ado0006: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'sales_order'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0006.rkey,data0006.bom_ptr'
      'FROM Data0006 INNER JOIN'
      '     data0492 ON Data0006.CUT_NO = data0492.CUT_NO'
      'WHERE data0492.so_no = :sales_order and'
      '      data0006.bom_ptr = :rkey'
      'order by work_order_number'
      '')
    Left = 93
    Top = 236
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
        Name = 'sales_order'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,bom_ptr'
      'from data0492'
      'WHERE data0492.so_no = :sales_order and'
      '      data0492.bom_ptr = :rkey')
    Left = 148
    Top = 236
    object ADO492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO492bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
  end
  object DataSource4: TDataSource
    DataSet = ado25
    Left = 37
    Top = 176
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 260
    Top = 173
  end
  object Append60: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0060'
      'where rkey is null')
    Left = 97
    Top = 304
  end
  object Append90: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0090'
      'where rkey is null')
    Left = 151
    Top = 304
  end
  object Append102: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0102'
      'where rkey is null')
    Left = 210
    Top = 304
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 331
    Top = 172
  end
  object ADOtemp60: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 333
    Top = 237
  end
  object aq360: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from Data0360'
      'where so_ptr= :rkey60')
    Left = 320
    Top = 32
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQuery1quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADOQuery1sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object ADOQuery1planned_qty: TIntegerField
      FieldName = 'planned_qty'
    end
  end
  object ds360: TDataSource
    DataSet = aq360
    Left = 320
    Top = 80
  end
  object adoS578: TADOQuery
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
      'select * from data0578 where d60_Ptr=:rkey')
    Left = 327
    Top = 308
  end
  object Ado273_25: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      ';with CTE as'#13#10'('#13#10'  select data0025.MANU_PART_NUMBER,Data0025.ONH' +
      'OLD_SALES_FLAG,Data0273.COPYFROMCUST_PTR,Data0273.CUSTOMER_PART_' +
      'PTR from data0273 inner join data0025 on data0273.CUSTOMER_PART_' +
      'PTR=data0025.rkey where Data0025.RKEY=:Rkey25'#13#10'  union all'#13#10'  se' +
      'lect data0025.MANU_PART_NUMBER,Data0025.ONHOLD_SALES_FLAG,Data02' +
      '73.COPYFROMCUST_PTR,Data0273.CUSTOMER_PART_PTR from Data0273 inn' +
      'er join Data0025 on data0273.CUSTOMER_PART_PTR=data0025.rkey inn' +
      'er join cte on data0273.COPYFROMCUST_PTR=CTE.CUSTOMER_PART_PTR'#13#10 +
      ')'#13#10'select * from cte where ONHOLD_SALES_FLAG=0'
    Parameters = <
      item
        Name = 'Rkey25'
        Size = -1
        Value = Null
      end>
    Left = 96
    Top = 376
  end
end
