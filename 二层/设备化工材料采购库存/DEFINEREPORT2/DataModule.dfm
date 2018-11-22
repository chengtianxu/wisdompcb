object DM: TDM
  OldCreateOrder = False
  Left = 434
  Top = 217
  Height = 385
  Width = 433
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=SJ_V20_LIVE_2;Data Source=WINXP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 16
  end
  object ADOdata0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 183
    Top = 17
    object ADOdata0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADOdata0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADOdata0493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADOdata0493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADOdata0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADOdata0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ado207: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0457.GON_NUMBER, dbo.Data0017.INV_PART_NUMBER, '
      '      Data0017.INV_PART_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      Data0496.GROUP_DESC, dbo.Data0034.DEPT_CODE,'
      
        '      Data0034.DEPT_NAME, dbo.Data0207.TDATE, dbo.Data0207.QUANT' +
        'ITY,'
      '      Data0207.RTN_QUANTITY,'
      
        '      ROUND(dbo.Data0022.PRICE / dbo.Data0022.EXCHANGE_RATE, 4) ' +
        'as STANDARD_COST,'
      '      Data0468.CUT_NO, dbo.Data0468.SO_NO,data0022.BARCODE_ID'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0207.DEPT_PTR = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0022 ON '
      '      dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY LEFT OUTER JOIN'
      '      dbo.Data0468 ON dbo.Data0207.D0468_PTR = dbo.Data0468.RKEY'
      'WHERE (dbo.Data0207.QUANTITY > 0)')
    Left = 246
    Top = 16
    object ado207GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333
      DisplayWidth = 14
      FieldName = 'GON_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado207INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 26
      FieldName = 'INV_PART_NUMBER'
    end
    object ado207INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      DisplayWidth = 40
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ado207GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 12
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado207GROUP_DESC: TStringField
      DisplayLabel = #31867#21035#25551#36848
      DisplayWidth = 16
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ado207DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      DisplayWidth = 12
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ado207DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 18
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ado207TDATE: TDateTimeField
      DisplayLabel = #21457#25918#26085#26399
      DisplayWidth = 22
      FieldName = 'TDATE'
    end
    object ado207QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 12
      FieldName = 'QUANTITY'
    end
    object ado207RTN_QUANTITY: TFloatField
      DisplayLabel = #36864#36824#25968#37327
      DisplayWidth = 12
      FieldName = 'RTN_QUANTITY'
    end
    object ado207STANDARD_COST: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      DisplayWidth = 12
      FieldName = 'STANDARD_COST'
    end
    object ado207CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333
      DisplayWidth = 15
      FieldName = 'CUT_NO'
      Size = 12
    end
    object ado207SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SO_NO'
      Size = 10
    end
    object ado207BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
  end
  object ADO22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER,data0017.inv_name,'
      '      Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      SUM(dbo.Data0022.QUAN_ON_HAND) AS quan_total,'
      
        '      SUM(dbo.Data0022.QUAN_ON_HAND * dbo.Data0022.PRICE / dbo.D' +
        'ata0022.EXCHANGE_RATE)'
      '       / SUM(dbo.Data0022.QUAN_ON_HAND) AS avl_price,'
      
        '      SUM(dbo.Data0022.QUAN_ON_HAND * dbo.Data0022.PRICE / dbo.D' +
        'ata0022.EXCHANGE_RATE)'
      '       AS amount, dbo.Data0002.UNIT_CODE,'
      '      dbo.Data0023.ABBR_NAME as ABBR_NAME23 '
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0022.WHOUSE_PTR = dbo.Data0015.RKE' +
        'Y INNER JOIN'
      '      dbo.Data0002 ON'
      '      dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      '      dbo.Data0023 ON'
      
        '      dbo.Data0022.SUPPLIER_PTR = dbo.Data0023.RKEY LEFT OUTER J' +
        'OIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'WHERE (dbo.Data0022.QUAN_ON_HAND > 0)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER,data0017.inv_name,Data0017' +
        '.INV_DESCRIPTION,'
      
        '      dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE, Data0023.' +
        'ABBR_NAME'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 118
    Top = 16
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 29
      FieldName = 'INV_PART_NUMBER'
    end
    object ADO22GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO22quan_total: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 18
      FieldName = 'quan_total'
    end
    object ADO22avl_price: TFloatField
      DisplayLabel = #24179#22343#20215#26684
      DisplayWidth = 15
      FieldName = 'avl_price'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADO22amount: TFloatField
      DisplayLabel = #21512#35745#37329#39069
      DisplayWidth = 15
      FieldName = 'amount'
      DisplayFormat = '0'
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object ADO22INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME23'
      Size = 10
    end
  end
  object ado0022: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0022.BARCODE_ID , dbo.Data0017.INV_PART_NUMBER,'
      '      Data0017.INV_part_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      Data0015.WAREHOUSE_CODE, dbo.Data0016.CODE AS code16,'
      '      Data0456.GRN_NUMBER, dbo.Data0023.ABBR_NAME AS code23,'
      '      Data0022.QUANTITY, dbo.Data0022.QUAN_ON_HAND,'
      
        '      Data0022.QUAN_IN_INSP, Data0022.TDATE, Data0022.EXPIRE_DAT' +
        'E,'
      '      Data0001.CURR_CODE, Data0022.EXCHANGE_RATE,'
      '      ROUND(dbo.Data0022.PRICE / dbo.Data0022.EXCHANGE_RATE, 4)'
      '      AS hkd_price,Data0070.PO_NUMBER'
      'FROM dbo.Data0070 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR RI' +
        'GHT OUTER JOIN'
      '      dbo.Data0001 INNER JOIN'
      '      dbo.Data0496 INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0022.SUPPLIER_PTR = dbo.Data0023.R' +
        'KEY ON'
      '      dbo.Data0496.RKEY = dbo.Data0017.GROUP_PTR INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0022.WHOUSE_PTR = dbo.Data0015.RKE' +
        'Y ON'
      '      dbo.Data0001.RKEY = dbo.Data0022.CURRENCY_PTR ON'
      
        '      dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR LEFT OUTER JOI' +
        'N'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where  dbo.Data0022.QUANTITY>0')
    Left = 302
    Top = 16
    object ado0022BARCODE_ID: TStringField
      DisplayLabel = 'BARCODE'
      DisplayWidth = 18
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ado0022INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 35
      FieldName = 'INV_PART_NUMBER'
    end
    object ado0022INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      DisplayWidth = 48
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ado0022GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado0022WAREHOUSE_CODE: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 9
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado0022code16: TStringField
      DisplayLabel = #20301#32622
      DisplayWidth = 9
      FieldName = 'code16'
      FixedChar = True
      Size = 5
    end
    object ado0022GRN_NUMBER: TStringField
      DisplayLabel = #25910#26009#21333
      DisplayWidth = 18
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado0022code23: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 11
      FieldName = 'code23'
      Size = 5
    end
    object ado0022QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 18
      FieldName = 'QUANTITY'
    end
    object ado0022QUAN_ON_HAND: TFloatField
      DisplayLabel = #29616#26377#25968#37327
      DisplayWidth = 18
      FieldName = 'QUAN_ON_HAND'
    end
    object ado0022QUAN_IN_INSP: TFloatField
      DisplayLabel = #22312#26816#26597#25968#37327
      DisplayWidth = 18
      FieldName = 'QUAN_IN_INSP'
    end
    object ado0022CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado0022EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 18
      FieldName = 'EXCHANGE_RATE'
    end
    object ado0022hkd_price: TFloatField
      DisplayLabel = #26412#20301#24065#20215#26684
      DisplayWidth = 18
      FieldName = 'hkd_price'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ado0022TDATE: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      DisplayWidth = 19
      FieldName = 'TDATE'
    end
    object ado0022EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 19
      FieldName = 'EXPIRE_DATE'
    end
    object ado0022PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
  object Aq53: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey278'
        DataType = ftInteger
        Size = 1
        Value = 99
      end>
    SQL.Strings = (
      'SELECT Data0008.PROD_CODE,'
      
        '      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0050.CUSTOMER_P' +
        'ART_DESC,'
      
        '      dbo.Data0050.CP_REV, dbo.Data0010.ABBR_NAME AS abbr_name10' +
        ', '
      '      SUM(dbo.Data0053.QTY_ON_HAND) AS quantity_hand, '
      
        '      ROUND(SUM(dbo.Data0053.QTY_ON_HAND * dbo.Data0047.PARAMETE' +
        'R_VALUE), 4) AS mianji,'
      
        '      SUM(dbo.Data0053.QTY_ON_HAND * dbo.Data0050.LATEST_PRICE) ' +
        'AS amount'
      'FROM dbo.Data0053 INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0050.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0047 ON dbo.Data0025.RKEY = dbo.Data0047.SOURCE_PO' +
        'INTER'
      
        'WHERE (dbo.Data0053.QTY_ON_HAND > 0) AND (dbo.Data0025.PARENT_PT' +
        'R = 0) AND'
      '      (dbo.Data0047.PARAMETER_PTR = :rkey278)'
      'GROUP BY dbo.Data0050.CUSTOMER_PART_NUMBER,'
      '      dbo.Data0050.CUSTOMER_PART_DESC, dbo.Data0010.ABBR_NAME,'
      '      dbo.Data0050.CP_REV, dbo.Data0008.PROD_CODE'
      'ORDER BY dbo.Data0050.CUSTOMER_PART_NUMBER')
    Left = 54
    Top = 72
    object Aq53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411
      DisplayWidth = 10
      FieldName = 'PROD_CODE'
      Size = 5
    end
    object Aq53CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 24
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object Aq53CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #37096#20214#25551#36848
      DisplayWidth = 53
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object Aq53CP_REV: TStringField
      DisplayLabel = #20462#35746#26412
      DisplayWidth = 8
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object Aq53quantity_hand: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 16
      FieldName = 'quantity_hand'
    end
    object Aq53amount: TFloatField
      DisplayLabel = #21512#35745#37329#39069
      DisplayWidth = 16
      FieldName = 'amount'
    end
    object Aq53abbr_name10: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'abbr_name10'
      Size = 10
    end
    object Aq53mianji: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'mianji'
      ReadOnly = True
    end
  end
  object ADO53: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT dbo.Data0006.WORK_ORDER_NUMBER, '
      
        '      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0050.CUSTOMER_P' +
        'ART_DESC, '
      
        '      dbo.Data0050.CP_REV, dbo.Data0008.PROD_CODE, dbo.Data0010.' +
        'CUST_CODE, '
      
        '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.CODE, dbo.Data00' +
        '16.LOCATION, '
      
        '      dbo.Data0053.QUANTITY, dbo.Data0053.QTY_ON_HAND, dbo.Data0' +
        '053.MFG_DATE, '
      '      dbo.Data0053.REFERENCE_NUMBER, dbo.Data0050.LATEST_PRICE'
      'FROM dbo.Data0053 INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0050.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_' +
        'PTR INNER JOIN'
      '      dbo.Data0008 ON '
      
        '      dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.Data0098 ON dbo.Data0053.RMA_PTR = dbo.Data0098.RKEY L' +
        'EFT OUTER JOIN'
      
        '      dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006' +
        '.RKEY'
      
        'WHERE (dbo.Data0053.QUANTITY > 0) AND (dbo.Data0025.PARENT_PTR =' +
        ' 0)'
      
        'ORDER BY dbo.Data0010.CUST_CODE, dbo.Data0050.CUSTOMER_PART_NUMB' +
        'ER')
    Left = 118
    Top = 72
    object ADO53WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      DisplayWidth = 22
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 16
    end
    object ADO53CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 16
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO53CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#37096#20214#25551#36848
      DisplayWidth = 43
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ADO53CP_REV: TStringField
      DisplayLabel = #20462#35746#26412
      DisplayWidth = 11
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADO53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035
      DisplayWidth = 10
      FieldName = 'PROD_CODE'
      Size = 5
    end
    object ADO53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 15
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADO53WAREHOUSE_CODE: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 12
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO53CODE: TStringField
      DisplayLabel = #20301#32622
      DisplayWidth = 9
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADO53LOCATION: TStringField
      DisplayLabel = #20301#32622#25551#36848
      DisplayWidth = 18
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO53QUANTITY: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      DisplayWidth = 13
      FieldName = 'QUANTITY'
    end
    object ADO53QTY_ON_HAND: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 16
      FieldName = 'QTY_ON_HAND'
    end
    object ADO53MFG_DATE: TDateTimeField
      DisplayLabel = #21046#36896#26085#26399
      DisplayWidth = 19
      FieldName = 'MFG_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO53REFERENCE_NUMBER: TStringField
      DisplayLabel = #38468#21152#21442#32771
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO53LATEST_PRICE: TFloatField
      DisplayLabel = #26368#26032#20215#26684
      DisplayWidth = 23
      FieldName = 'LATEST_PRICE'
    end
  end
  object ado52: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0060.SALES_ORDER, dbo.data0439.de' +
        'livery_no, '
      
        '      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0050.CUSTOMER_P' +
        'ART_DESC, '
      
        '      dbo.Data0050.CP_REV, dbo.Data0008.PROD_CODE, dbo.Data0010.' +
        'CUST_CODE, '
      
        '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.CODE, dbo.Data00' +
        '52.QUAN_SHP, '
      '      dbo.Data0064.part_price, '
      
        '      dbo.Data0052.QUAN_SHP * dbo.Data0064.part_price AS amount,' +
        ' '
      '      dbo.Data0064.DATE_SHIPPED, dbo.Data0064.SHIPMENT_NO'
      'FROM dbo.Data0052 INNER JOIN'
      
        '      dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data0064.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_' +
        'PTR INNER JOIN'
      '      dbo.Data0008 ON '
      
        '      dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data04' +
        '39.rkey'
      
        'WHERE (dbo.Data0052.QUAN_SHP > 0) AND (dbo.Data0025.PARENT_PTR =' +
        ' 0)'
      
        'ORDER BY dbo.Data0010.CUST_CODE, dbo.Data0050.CUSTOMER_PART_NUMB' +
        'ER,'
      '                    data0060.sales_order,data0064.shipment_no')
    Left = 174
    Top = 72
    object ado52SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 15
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 10
    end
    object ado52delivery_no: TStringField
      DisplayLabel = #35013#31665#21333
      DisplayWidth = 17
      FieldName = 'delivery_no'
      FixedChar = True
      Size = 15
    end
    object ado52CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 23
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ado52CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#37096#20214#25551#36848
      DisplayWidth = 41
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ado52CP_REV: TStringField
      DisplayLabel = #20462#35746#26412
      DisplayWidth = 9
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ado52PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      DisplayWidth = 11
      FieldName = 'PROD_CODE'
      Size = 5
    end
    object ado52CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 11
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ado52WAREHOUSE_CODE: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 13
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado52CODE: TStringField
      DisplayLabel = #20301#32622
      DisplayWidth = 7
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ado52QUAN_SHP: TFloatField
      DisplayLabel = #20986#20179#25968#37327
      DisplayWidth = 15
      FieldName = 'QUAN_SHP'
    end
    object ado52part_price: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 15
      FieldName = 'part_price'
    end
    object ado52amount: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 15
      FieldName = 'amount'
      ReadOnly = True
    end
    object ado52DATE_SHIPPED: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      DisplayWidth = 18
      FieldName = 'DATE_SHIPPED'
    end
    object ado52SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 19
      FieldName = 'SHIPMENT_NO'
    end
  end
  object ADO439: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT data0439.delivery_no, Data0010.CUST_CODE,'
      '      data0439.date_sailing,data0439.cartons_no,data0439.charge,'
      
        '      Data0530.MAWB_NO,Data0060.SALES_ORDER,data0439.fob,Data006' +
        '0.DUE_DATE,'
      '      Data0064.SHIPMENT_NO,Data0050.CUSTOMER_PART_NUMBER,'
      
        '      Data0097.PO_NUMBER,Data0097.PO_DATE,data0439.reference_num' +
        'ber,'
      
        '      Data0005.EMPLOYEE_NAME,Data0064.QUAN_SHIPPED,data0439.weig' +
        'ht,'
      
        '      Data0064.part_price,data0439.Remark,data0439.c_n,data0439.' +
        'net_weight,'
      
        '      ROUND(Data0064.part_price * Data0064.QUAN_SHIPPED / Data00' +
        '60.EXCH_RATE,'
      
        '       4) AS amount,Data0112.invoice_number,Data0050.CUSTOMER_PA' +
        'RT_DESC'
      'FROM dbo.data0439 INNER JOIN'
      'Data0010 ON data0439.customer_ptr = dbo.Data0010.RKEY INNER JOIN'
      
        'Data0064 ON data0439.rkey = dbo.Data0064.packing_list_ptr INNER ' +
        'JOIN'
      'Data0060 ON Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'
      
        'Data0050 ON Data0060.CUST_PART_PTR = dbo.Data0050.RKEY INNER JOI' +
        'N'
      'Data0005 ON Data0064.ENT_EMPL_PTR = dbo.Data0005.RKEY INNER JOIN'
      'Data0097 ON'
      'Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY LEFT OUTER JOIN'
      
        'Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RKEY LEFT OU' +
        'TER JOIN'
      'Data0530 ON dbo.data0439.rkey = dbo.Data0530.D0439_PTR'
      'WHERE (dbo.Data0064.QUAN_SHIPPED > 0)'
      
        'ORDER BY dbo.data0439.delivery_no,dbo.Data0060.SALES_ORDER,dbo.D' +
        'ata0064.SHIPMENT_NO ')
    Left = 231
    Top = 72
    object ADO439delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#32534#21495
      DisplayWidth = 18
      FieldName = 'delivery_no'
      FixedChar = True
      Size = 15
    end
    object ADO439invoice_number: TStringField
      DisplayLabel = #21457#31080#21495#30721
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object ADO439CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADO439date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      DisplayWidth = 22
      FieldName = 'date_sailing'
    end
    object ADO439cartons_no: TIntegerField
      DisplayLabel = #35013#36816#31665#25968#37327
      DisplayWidth = 12
      FieldName = 'cartons_no'
    end
    object ADO439charge: TFloatField
      DisplayLabel = #35013#36816#36153#29992
      DisplayWidth = 12
      FieldName = 'charge'
    end
    object ADO439MAWB_NO: TStringField
      DisplayLabel = #25552#21333#21495
      DisplayWidth = 17
      FieldName = 'MAWB_NO'
    end
    object ADO439SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO439SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 12
      FieldName = 'SHIPMENT_NO'
    end
    object ADO439CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 12
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO439PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 21
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO439PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#35746#21333#26085#26399
      DisplayWidth = 22
      FieldName = 'PO_DATE'
    end
    object ADO439EMPLOYEE_NAME: TStringField
      DisplayLabel = #25351#27966#21592#24037
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO439part_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'part_price'
    end
    object ADO439amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADO439fob: TStringField
      FieldName = 'fob'
    end
    object ADO439DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADO439reference_number: TStringField
      FieldName = 'reference_number'
    end
    object ADO439QUAN_SHIPPED: TIntegerField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO439weight: TFloatField
      FieldName = 'weight'
    end
    object ADO439Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object ADO439c_n: TIntegerField
      FieldName = 'c_n'
    end
    object ADO439net_weight: TFloatField
      FieldName = 'net_weight'
    end
    object ADO439CUSTOMER_PART_DESC: TStringField
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
  end
  object ADO530: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT data0439.delivery_no, dbo.Data0112.invoice_number, '
      
        '      dbo.Data0010.CUST_CODE, dbo.data0439.date_sailing, dbo.dat' +
        'a0439.cartons_no, '
      
        '      dbo.data0439.charge, dbo.Data0530.MAWB_NO, dbo.Data0530.HA' +
        'WB_NO, '
      
        '      dbo.Data0530.FLIGHT_NO, dbo.Data0530.DEPA_DATE, dbo.Data00' +
        '60.SALES_ORDER, '
      
        '      dbo.Data0064.SHIPMENT_NO, dbo.Data0050.CUSTOMER_PART_NUMBE' +
        'R, '
      
        '      dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE, dbo.Data0064' +
        '.QUAN_SHIPPED, '
      '      dbo.Data0064.part_price, '
      
        '      ROUND(dbo.Data0064.part_price * dbo.Data0064.QUAN_SHIPPED ' +
        '/ dbo.Data0060.EXCH_RATE,'
      '       4) AS amount'
      'FROM dbo.data0439 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.data0439.customer_ptr = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0064 ON dbo.data0439.rkey = dbo.Data0064.packing_l' +
        'ist_ptr INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      '      dbo.Data0097 ON '
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0530 ON dbo.data0439.rkey = dbo.Data0530.D0439_PTR' +
        ' LEFT OUTER JOIN'
      
        '      dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RK' +
        'EY'
      'WHERE (dbo.Data0064.QUAN_SHIPPED > 0)'
      'ORDER BY  dbo.Data0530.MAWB_NO, dbo.Data0530.HAWB_NO, '
      
        '                    dbo.Data0530.FLIGHT_NO, dbo.Data0530.DEPA_DA' +
        'TE')
    Left = 294
    Top = 72
    object ADO530MAWB_NO: TStringField
      DisplayLabel = #25552#21333#21495
      DisplayWidth = 18
      FieldName = 'MAWB_NO'
    end
    object ADO530HAWB_NO: TStringField
      DisplayLabel = #21103#25552#21333#21495
      DisplayWidth = 20
      FieldName = 'HAWB_NO'
    end
    object ADO530FLIGHT_NO: TStringField
      DisplayLabel = #36816#36755#24037#20855#21495
      DisplayWidth = 20
      FieldName = 'FLIGHT_NO'
    end
    object ADO530DEPA_DATE: TDateTimeField
      DisplayLabel = #21457#36816#26085#26399
      DisplayWidth = 22
      FieldName = 'DEPA_DATE'
    end
    object ADO530delivery_no: TStringField
      DisplayLabel = #35013#31665#21333
      DisplayWidth = 17
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO530invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      DisplayWidth = 16
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object ADO530CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 12
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADO530cartons_no: TIntegerField
      DisplayLabel = #31665#25968
      DisplayWidth = 12
      FieldName = 'cartons_no'
    end
    object ADO530charge: TFloatField
      DisplayLabel = #35013#36816#36153#29992
      DisplayWidth = 15
      FieldName = 'charge'
    end
    object ADO530SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 18
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 10
    end
    object ADO530SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 11
      FieldName = 'SHIPMENT_NO'
    end
    object ADO530CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 21
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO530PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      DisplayWidth = 21
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO530PO_DATE: TDateTimeField
      DisplayLabel = #35746#21333#26085#26399
      DisplayWidth = 14
      FieldName = 'PO_DATE'
    end
    object ADO530QUAN_SHIPPED: TFloatField
      DisplayLabel = #35013#36816#25968#37327
      DisplayWidth = 15
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO530part_price: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 14
      FieldName = 'part_price'
    end
    object ADO530amount: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 18
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object ADO112: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0112.invoice_number, dbo.data0439' +
        '.delivery_no, '
      
        '      dbo.Data0112.ship_amount, dbo.Data0112.RUSH_CHARGE_AMOUNT,' +
        ' '
      '      dbo.Data0112.INVOICE_TOTAL, dbo.Data0010.CUST_CODE, '
      '      dbo.Data0112.INVOICE_DATE, dbo.Data0060.SALES_ORDER, '
      '      dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.SHIPMENT_NO, '
      
        '      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0097.PO_NUMBER,' +
        ' '
      '      dbo.Data0097.PO_DATE, dbo.Data0064.part_price, '
      
        '      dbo.Data0112.SHIPPING_CHARGES, dbo.Data0112.FED_TAX_AMOUNT' +
        ', '
      
        '      dbo.Data0112.ship_tax_amount, dbo.Data0112.DISCOUNT_AMOUNT' +
        ', '
      '      dbo.Data0112.OVERSHIP_AMOUNT'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR IN' +
        'NER JOIN'
      '      dbo.Data0112 INNER JOIN'
      
        '      dbo.data0439 ON dbo.Data0112.packing_list_ptr = dbo.data04' +
        '39.rkey ON '
      
        '      dbo.Data0064.packing_list_ptr = dbo.Data0112.packing_list_' +
        'ptr INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      '      dbo.Data0097 ON '
      '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'
      'where dbo.Data0112.INVOICE_TOTAL>0'
      'ORDER BY dbo.Data0112.invoice_number')
    Left = 53
    Top = 127
    object ADO112invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      DisplayWidth = 19
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object ADO112delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      DisplayWidth = 18
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO112CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 15
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADO112INVOICE_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      DisplayWidth = 15
      FieldName = 'INVOICE_DATE'
    end
    object ADO112INVOICE_TOTAL: TFloatField
      DisplayLabel = #24635#35745#37329#39069
      DisplayWidth = 15
      FieldName = 'INVOICE_TOTAL'
      DisplayFormat = '0.00'
    end
    object ADO112ship_amount: TFloatField
      DisplayLabel = #20215#27454
      DisplayWidth = 11
      FieldName = 'ship_amount'
    end
    object ADO112OVERSHIP_AMOUNT: TFloatField
      DisplayLabel = #28322#35013#37329#39069
      DisplayWidth = 11
      FieldName = 'OVERSHIP_AMOUNT'
    end
    object ADO112RUSH_CHARGE_AMOUNT: TFloatField
      DisplayLabel = #36214#24037#36153#29992
      DisplayWidth = 12
      FieldName = 'RUSH_CHARGE_AMOUNT'
    end
    object ADO112DISCOUNT_AMOUNT: TFloatField
      DisplayLabel = #38144#21806#25240#25187
      DisplayWidth = 13
      FieldName = 'DISCOUNT_AMOUNT'
    end
    object ADO112FED_TAX_AMOUNT: TFloatField
      DisplayLabel = #22686#20540#31246
      DisplayWidth = 16
      FieldName = 'FED_TAX_AMOUNT'
      DisplayFormat = '0.00'
    end
    object ADO112SHIPPING_CHARGES: TFloatField
      DisplayLabel = #35013#36816#36153#29992
      DisplayWidth = 11
      FieldName = 'SHIPPING_CHARGES'
    end
    object ADO112ship_tax_amount: TFloatField
      DisplayLabel = #35013#36816#31246#37329
      DisplayWidth = 12
      FieldName = 'ship_tax_amount'
    end
    object ADO112SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 14
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 10
    end
    object ADO112SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 13
      FieldName = 'SHIPMENT_NO'
    end
    object ADO112QUAN_SHIPPED: TFloatField
      DisplayLabel = #35013#36816#25968#37327
      DisplayWidth = 11
      FieldName = 'QUAN_SHIPPED'
    end
    object ADO112part_price: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 10
      FieldName = 'part_price'
    end
    object ADO112CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 17
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO112PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      DisplayWidth = 28
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO112PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#35746#21333#26085#26399
      DisplayWidth = 16
      FieldName = 'PO_DATE'
    end
  end
  object ADO0112: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0112.invoice_number, dbo.Data0112' +
        '.INVOICE_TOTAL, '
      '      dbo.Data0010.CUST_CODE, dbo.Data0112.INVOICE_DATE, '
      
        '      dbo.Data0060.SALES_ORDER, dbo.Data0050.CUSTOMER_PART_NUMBE' +
        'R, '
      '      dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE, '
      '      dbo.Data0112.ship_tax_amount, dbo.Data0112.TOOLING_CHARGES'
      'FROM dbo.Data0050 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0050.RKEY = dbo.Data0060.CUST_PART' +
        '_PTR INNER JOIN'
      '      dbo.Data0097 ON '
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      '      dbo.Data0112 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY ON '
      '      dbo.Data0060.RKEY = dbo.Data0112.sales_order_ptr'
      'WHERE (dbo.Data0112.TOOLING_CHARGES > 0)'
      'ORDER BY dbo.Data0112.invoice_number')
    Left = 118
    Top = 128
    object StringField1: TStringField
      DisplayLabel = #21457#31080#32534#21495
      DisplayWidth = 14
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object StringField2: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      DisplayWidth = 15
      FieldName = 'INVOICE_DATE'
    end
    object ADO112TOOLING_CHARGES: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      DisplayWidth = 12
      FieldName = 'TOOLING_CHARGES'
    end
    object FloatField1: TFloatField
      DisplayLabel = #31246#37329
      DisplayWidth = 12
      FieldName = 'ship_tax_amount'
    end
    object FloatField2: TFloatField
      DisplayLabel = #24635#35745#37329#39069
      DisplayWidth = 12
      FieldName = 'INVOICE_TOTAL'
    end
    object StringField3: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 10
    end
    object StringField4: TStringField
      DisplayLabel = #23458#25143#37096#20214
      DisplayWidth = 21
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object StringField5: TStringField
      DisplayLabel = #37319#36141#35746#21333
      DisplayWidth = 23
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #37319#36141#35746#21333#26085#26399
      DisplayWidth = 16
      FieldName = 'PO_DATE'
    end
  end
  object AQ0070: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = AQ0070CalcFields
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
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
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end
      item
        Name = 'v7'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 7
      end>
    SQL.Strings = (
      'SELECT data0070.rkey,data0070.po_number,data0070.PO_REV_NO,'
      '       data0070.po_date,data0070.status,data0070.PO_TYPE,'
      
        '       data0070.PURCHASE_ORDER_TYPE,data0070.shipping_cost,data0' +
        '070.fob,'
      
        '       data0005.empl_code,data0005.employee_name,data0070.MISC_C' +
        'HARGE,'
      
        '       data0023.code,data0023.supplier_name,data0070.SUPP_FAC_AD' +
        'D_PTR,'
      
        '       data0070.PAYMENT_TERMS,data0070.sub_total,data0070.EXCHAN' +
        'GE_RATE,'
      '       data0023.phone,data0023.fax'
      'FROM'
      '    data0070,data0005,data0023'
      'WHERE'
      '    data0070.employee_pointer=data0005.rkey and'
      '    data0070.supplier_pointer=data0023.rkey and'
      ''
      '    data0070.status <> :v1 and data0070.status <> :v2 and'
      '    data0070.status <> :v3 and data0070.status <> :v4 and'
      '    data0070.status <> :v5 and data0070.status <> :v6 and'
      '    data0070.status <> :v7 '
      ''
      'ORDER BY'
      '    po_number'
      '')
    Left = 52
    Top = 191
    object AQ0070po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object AQ0070PO_REV_NO: TStringField
      FieldName = 'PO_REV_NO'
      FixedChar = True
      Size = 5
    end
    object AQ0070po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object AQ0070PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object AQ0070PURCHASE_ORDER_TYPE: TWordField
      FieldName = 'PURCHASE_ORDER_TYPE'
    end
    object AQ0070empl_code: TStringField
      FieldName = 'empl_code'
      Size = 5
    end
    object AQ0070employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object AQ0070code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object AQ0070supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 30
    end
    object AQ0070v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 10
      Calculated = True
    end
    object AQ0070v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 4
      Calculated = True
    end
    object AQ0070shipping_cost: TFloatField
      FieldName = 'shipping_cost'
    end
    object AQ0070MISC_CHARGE: TFloatField
      FieldName = 'MISC_CHARGE'
    end
    object AQ0070SUPP_FAC_ADD_PTR: TIntegerField
      FieldName = 'SUPP_FAC_ADD_PTR'
    end
    object AQ0070PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object AQ0070fob: TStringField
      FieldName = 'fob'
      Size = 15
    end
    object AQ0070sub_total: TFloatField
      FieldName = 'sub_total'
    end
    object AQ0070EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object AQ0070status: TWordField
      FieldName = 'status'
    end
    object AQ0070phone: TStringField
      FieldName = 'phone'
    end
    object AQ0070fax: TStringField
      FieldName = 'fax'
    end
  end
  object ADO70: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 82
      end>
    SQL.Strings = (
      'Select * '
      'FROM'
      '  data0070'
      'WHERE '
      ' rkey=:rkey')
    Left = 112
    Top = 191
    object ADO70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADO70EXCHANGE_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EXCHANGE_RATE'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
    object ADO70SHIPPING_COST: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SHIPPING_COST'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO70FEDERAL_TAX: TFloatField
      FieldName = 'FEDERAL_TAX'
    end
    object ADO70SUB_TOTAL: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SUB_TOTAL'
      currency = True
    end
    object ADO70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
      FixedChar = True
    end
    object ADO70SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADO70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO70SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
      FixedChar = True
    end
    object ADO70CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADO70DISCOUNT_AMOUNT: TFloatField
      FieldName = 'DISCOUNT_AMOUNT'
    end
    object ADO70DATE_EDITED: TDateTimeField
      FieldName = 'DATE_EDITED'
    end
    object ADO70PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object ADO70FOB: TStringField
      FieldName = 'FOB'
      FixedChar = True
    end
    object ADO70MISC_CHARGE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'MISC_CHARGE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO70PRINT_DATE: TDateTimeField
      FieldName = 'PRINT_DATE'
    end
    object ADO70PRINT_TIME: TDateTimeField
      FieldName = 'PRINT_TIME'
    end
    object ADO70MULTIPLE_FACTOR: TFloatField
      FieldName = 'MULTIPLE_FACTOR'
    end
    object ADO70PO_REV_NO: TStringField
      FieldName = 'PO_REV_NO'
      FixedChar = True
      Size = 5
    end
    object ADO70PAYMENT_TERMS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PAYMENT_TERMS'
    end
    object ADO70CASH_DISCOUNT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CASH_DISCOUNT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO70DISCOUNT_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADO70CASH_DISCOUNT2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CASH_DISCOUNT2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO70DISCOUNT2_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADO70ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      FixedChar = True
    end
    object ADO70ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      FixedChar = True
    end
    object ADO70ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      FixedChar = True
    end
    object ADO70ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
      FixedChar = True
    end
    object ADO70ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      FixedChar = True
    end
    object ADO70SHIPTO_ADDRESS: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object ADO70curr_code: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_code'
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_code'
      KeyFields = 'CURRENCY_PTR'
      Size = 5
      Lookup = True
    end
    object ADO70curr_name: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_name'
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_name'
      KeyFields = 'CURRENCY_PTR'
      Lookup = True
    end
    object ADO70factory_location: TStringField
      FieldKind = fkLookup
      FieldName = 'factory_location'
      LookupKeyFields = 'rkey'
      LookupResultField = 'FACTORY_LOCATION'
      KeyFields = 'SUPP_FAC_ADD_PTR'
      Lookup = True
    end
    object ADO70PURCHASE_TYPE: TStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 10
    end
    object ADO70STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO70STATE_MISC_TAX_FLAG: TStringField
      FieldName = 'STATE_MISC_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO70SUPP_FAC_ADD_PTR: TIntegerField
      FieldName = 'SUPP_FAC_ADD_PTR'
    end
  end
  object ADO71: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADO71CalcFields
    Parameters = <>
    SQL.Strings = (
      'select DATA0071.*,DATA0002.UNIT_NAME '
      'from data0071 INNER JOIN DATA0002'
      'ON DATA0071.PURCHASE_UNIT_PTR=data0002.rkey'
      'where po_ptr=82')
    Left = 168
    Top = 194
    object ADO71QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
    end
    object ADO71QUAN_IN_INSP: TFloatField
      FieldName = 'QUAN_IN_INSP'
    end
    object ADO71QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
    object ADO71QUAN_INVD: TFloatField
      FieldName = 'QUAN_INVD'
    end
    object ADO71PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71TAX_2: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71DEL_DATE: TDateTimeField
      FieldName = 'recd_DATE'
    end
    object ADO71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO71QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
    object ADO71WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO71PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO71CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO71PRINTED_DATE: TDateTimeField
      FieldName = 'PRINTED_DATE'
    end
    object ADO71inv_number: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldKind = fkLookup
      FieldName = 'inv_number'
      LookupDataSet = ado0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_name'
      KeyFields = 'INVT_PTR'
      Size = 30
      Lookup = True
    end
    object ADO71invpart_desc: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldKind = fkLookup
      FieldName = 'invpart_desc'
      LookupDataSet = ado0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_description'
      KeyFields = 'INVT_PTR'
      Size = 70
      Lookup = True
    end
    object ADO71inv_part_number: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldKind = fkLookup
      FieldName = 'inv_part_number'
      LookupDataSet = ado0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_part_number'
      KeyFields = 'INVT_PTR'
      Size = 25
      Lookup = True
    end
    object ADO71inv_part_description: TStringField
      DisplayLabel = #25551#36848
      FieldKind = fkLookup
      FieldName = 'inv_part_description'
      LookupDataSet = ado0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'INV_PART_DESCRIPTION'
      KeyFields = 'INVT_PTR'
      Size = 100
      Lookup = True
    end
    object ADO71invdesc_extra: TStringField
      DisplayLabel = #35268#26684#21152#35828#26126
      FieldKind = fkCalculated
      FieldName = 'invdesc_extra'
      Size = 130
      Calculated = True
    end
    object ADO71sim_total: TFloatField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'sim_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
    object ADO71tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
    object ADO71UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO71reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO71extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
      Size = 60
    end
    object ADO71tax_price: TFloatField
      DisplayLabel = #35831#36141#20215
      FieldName = 'tax_price'
    end
    object ADO71INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
  end
  object ADO107011: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0011'
      'where'
      ' source_type=1070 and'
      ' file_pointer=:rkey')
    Left = 180
    Top = 247
    object ADO107011NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO107011NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO107011NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO107011NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 129
  end
  object ADO200: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
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
      'select *'
      'from'
      '  data0200'
      'where'
      '  poptr=:rkey')
    Left = 313
    Top = 191
    object ADO200RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO200POPTR: TIntegerField
      FieldName = 'POPTR'
    end
    object ADO200MISC_CHARGE_PTR: TIntegerField
      FieldName = 'MISC_CHARGE_PTR'
    end
    object ADO200AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ADO200TAXABLE: TStringField
      FieldKind = fkLookup
      FieldName = 'TAXABLE'
      LookupKeyFields = 'RKEY'
      LookupResultField = 'TAXABLE'
      KeyFields = 'MISC_CHARGE_PTR'
      Size = 1
      Lookup = True
    end
  end
  object ADO72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADO72CalcFields
    Parameters = <>
    SQL.Strings = (
      'select data0072.*,data0002.unit_name'
      ' from data0072 inner join data0002'
      ' on data0072.UNIT_PTR=data0002.rkey')
    Left = 218
    Top = 192
    object ADO72DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADO72QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72QUAN_INVD: TFloatField
      FieldName = 'QUAN_INVD'
    end
    object ADO72UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72STATE_TAX: TFloatField
      FieldName = 'STATE_TAX'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72GL_PTR: TIntegerField
      FieldName = 'GL_PTR'
    end
    object ADO72QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADO72DESCRIPTION2: TStringField
      FieldName = 'DESCRIPTION2'
      Size = 40
    end
    object ADO72DEL_DATE: TDateTimeField
      FieldName = 'DEL_DATE'
    end
    object ADO72UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO72PRINTED_DATE: TDateTimeField
      FieldName = 'PRINTED_DATE'
    end
    object ADO72sim_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sim_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ADO72tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ADO72unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO72GUI_GE: TStringField
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO72reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO72tax_price: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_price'
      Calculated = True
    end
    object ADO72taxprice_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'taxprice_total'
      Calculated = True
    end
  end
  object ado0017: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select rkey,'
      '       inv_part_number,'
      '       INV_PART_DESCRIPTION,'
      '       inv_name,'
      '       inv_description'
      'from data0017')
    Left = 352
    Top = 72
    object ado0017rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado0017inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ado0017INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object ado0017inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object ado0017inv_description: TStringField
      FieldName = 'inv_description'
      Size = 70
    end
  end
  object AQ0015: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'whse_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select * from   data0015'
      'where rkey=:whse_ptr'
      'order by rkey')
    Left = 265
    Top = 192
    object AQ0015WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ0015WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object AQ0015ENG_NAME: TStringField
      FieldName = 'ENG_NAME'
      Size = 70
    end
    object AQ0015ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ0015ADDRESS_LINE_1: TStringField
      FieldName = 'ADDRESS_LINE_1'
      Size = 70
    end
    object AQ0015ADDRESS_LINE_2: TStringField
      FieldName = 'ADDRESS_LINE_2'
      Size = 70
    end
    object AQ0015ADDRESS_LINE_3: TStringField
      FieldName = 'ADDRESS_LINE_3'
      Size = 30
    end
    object AQ0015STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object AQ0015ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object AQ0015PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
      Size = 14
    end
    object AQ0015FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object AQ0015TELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object AQ0015WEB: TStringField
      FieldName = 'WEB'
      Size = 50
    end
    object AQ0015EMPLOYEE_PTR_1: TIntegerField
      FieldName = 'EMPLOYEE_PTR_1'
    end
    object AQ0015EMPLOYEE_PTR_2: TIntegerField
      FieldName = 'EMPLOYEE_PTR_2'
    end
    object AQ0015EMPLOYEE_PTR_3: TIntegerField
      FieldName = 'EMPLOYEE_PTR_3'
    end
    object AQ0015WAREHOUSE_TYPE: TWordField
      FieldName = 'WAREHOUSE_TYPE'
    end
    object AQ0015o_warehouse_name: TStringField
      FieldName = 'o_warehouse_name'
      Size = 70
    end
    object AQ0015o_eng_name: TStringField
      FieldName = 'o_eng_name'
      Size = 70
    end
    object AQ0015o_address_1: TStringField
      FieldName = 'o_address_1'
      Size = 70
    end
    object AQ0015o_address_2: TStringField
      FieldName = 'o_address_2'
      Size = 80
    end
    object AQ0015o_address_3: TStringField
      FieldName = 'o_address_3'
      Size = 50
    end
    object AQ0015o_state: TStringField
      FieldName = 'o_state'
      FixedChar = True
      Size = 10
    end
    object AQ0015o_zip: TStringField
      FieldName = 'o_zip'
      FixedChar = True
      Size = 10
    end
    object AQ0015o_phone: TStringField
      FieldName = 'o_phone'
      FixedChar = True
      Size = 14
    end
    object AQ0015o_fax: TStringField
      FieldName = 'o_fax'
      FixedChar = True
      Size = 14
    end
    object AQ0015o_telex: TStringField
      FieldName = 'o_telex'
      Size = 30
    end
    object AQ0015o_web: TStringField
      FieldName = 'o_web'
      Size = 50
    end
    object AQ0015purchase_order: TStringField
      FieldName = 'purchase_order'
      Size = 15
    end
    object AQ0015o_purchase_order: TStringField
      FieldName = 'o_purchase_order'
      Size = 15
    end
    object AQ0015picture: TBlobField
      FieldName = 'picture'
    end
    object AQ0015o_picture: TBlobField
      FieldName = 'o_picture'
    end
  end
  object ADO7011: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = 1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0011'
      'where'
      ' source_type=70 and'
      ' file_pointer=:rkey')
    Left = 248
    Top = 248
    object ADO7011NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO7011NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO7011NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO7011NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
  end
  object ADO0450: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'select * from data0011'
      'where'
      ' source_type=2070 and file_pointer=:rkey')
    Left = 288
    Top = 136
  end
end
