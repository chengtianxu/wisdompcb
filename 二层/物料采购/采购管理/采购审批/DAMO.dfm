object DM: TDM
  OldCreateOrder = False
  Left = 545
  Top = 233
  Height = 346
  Width = 319
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 176
    Top = 15
  end
  object ADO70: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO70CalcFields
    Parameters = <
      item
        Name = 'rkey73'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT data0070.*,'
      '       data0023.abbr_name,'
      '       data0024.FACTORY_LOCATION,data0078.auth_flag,'
      
        '       data0015.warehouse_code,data0015.warehouse_name,data0015.' +
        'ABBR_NAME as '#24037#21378#31616#31216','
      '       data0001.curr_code,data0001.curr_name,'
      '       data0005.empl_code,data0005.employee_name,'
      '       data0078.auth_date,data0078.ranking,data0078.user_ptr'
      
        'FROM DATA0070,data0023,data0024,data0015,data0001,data0005,data0' +
        '078'
      'where data0070.supplier_pointer=data0023.rkey and'
      '      data0070.supp_fac_add_ptr=data0024.rkey and'
      '      data0070.warehouse_pointer=data0015.rkey and'
      '      data0070.employee_pointer=data0005.rkey and'
      '      data0070.currency_ptr=data0001.rkey and'
      '      data0078.po_ptr=data0070.rkey and'
      '      data0070.status=1 and (data0078.auth_date is null) and'
      
        ' (data0078.user_ptr IN (SELECT rkey FROM data0073 WHERE rpl_po_p' +
        'tr = :rkey73))'
      'and data0078.auth_flag='#39'Y'#39
      ''
      'ORDER BY'
      '  PO_NUMBER')
    Left = 94
    Top = 76
    object ADO70RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADO70CSI_USER_POINTER: TIntegerField
      FieldName = 'CSI_USER_POINTER'
    end
    object ADO70EMPLOYEE_POINTER: TIntegerField
      FieldName = 'EMPLOYEE_POINTER'
    end
    object ADO70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object ADO70SUPP_FAC_ADD_PTR: TIntegerField
      FieldName = 'SUPP_FAC_ADD_PTR'
    end
    object ADO70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object ADO70EDIT_BY_EMPL_PTR: TIntegerField
      FieldName = 'EDIT_BY_EMPL_PTR'
    end
    object ADO70STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO70EXCHANGE_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EXCHANGE_RATE'
      DisplayFormat = '0.00000'
    end
    object ADO70SHIPPING_COST: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SHIPPING_COST'
      DisplayFormat = '0.000'
    end
    object ADO70FEDERAL_TAX: TFloatField
      FieldName = 'FEDERAL_TAX'
    end
    object ADO70SUB_TOTAL: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '0.000'
    end
    object ADO70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADO70SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object ADO70SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
      FixedChar = True
    end
    object ADO70PO_DATE: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'PO_DATE'
    end
    object ADO70CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 40
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
    object a: TStringField
      FieldName = 'FOB'
    end
    object ADO70MISC_CHARGE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'MISC_CHARGE'
      DisplayFormat = '0.000'
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
    object ADO70CITY_AMOUNT: TFloatField
      FieldName = 'CITY_AMOUNT'
    end
    object ADO70COUNTY_AMOUNT: TFloatField
      FieldName = 'COUNTY_AMOUNT'
    end
    object ADO70COLLECT_PREPAID: TStringField
      FieldName = 'COLLECT_PREPAID'
      FixedChar = True
      Size = 1
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
    object ADO70STATE_INVT_TAX_FLAG: TStringField
      FieldName = 'STATE_INVT_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO70CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO70SECOND_WHSE_PTR: TIntegerField
      FieldName = 'SECOND_WHSE_PTR'
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
    end
    object ADO70DISCOUNT_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADO70CASH_DISCOUNT2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CASH_DISCOUNT2'
      DisplayFormat = '0.00'
    end
    object ADO70DISCOUNT2_DAYS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADO70PURCHASE_ORDER_TYPE: TWordField
      FieldName = 'PURCHASE_ORDER_TYPE'
    end
    object ADO70EXPIRED_DATE: TDateTimeField
      FieldName = 'EXPIRED_DATE'
    end
    object ADO70ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADO70ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
    end
    object ADO70ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
    end
    object ADO70ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
    end
    object ADO70ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
    end
    object ADO70code: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO70FACTORY_LOCATION: TStringField
      FieldName = 'FACTORY_LOCATION'
    end
    object ADO70warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO70warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 30
    end
    object ADO70curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADO70curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ADO70empl_code: TStringField
      FieldName = 'empl_code'
      Size = 5
    end
    object ADO70employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO70v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADO70v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object ADO70auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO70ranking: TWordField
      FieldName = 'ranking'
    end
    object ADO70in_out: TStringField
      DisplayLabel = #37319#36141#22320#28857
      FieldKind = fkCalculated
      FieldName = 'in_out'
      Size = 6
      Calculated = True
    end
    object ADO70SHIPTO_ADDRESS: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object ADO70PURCHASE_TYPE: TStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 10
    end
    object ADO70STATE_TAX: TIntegerField
      FieldName = 'STATE_TAX'
    end
    object ADO70user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO70auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ADO70DSDesigner: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO70
    OnDataChange = DataSource1DataChange
    Left = 33
    Top = 75
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 96
    Top = 18
  end
  object DataSource2: TDataSource
    DataSet = ADO71
    Left = 34
    Top = 135
  end
  object DataSource3: TDataSource
    DataSet = ADO72
    Left = 34
    Top = 191
  end
  object ADO71: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO71CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 31
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0071.RKEY, dbo.Data0071.PO_PTR, dbo.Data0071.' +
        'INVT_PTR, dbo.Data0071.QUAN_ORD, dbo.Data0071.QUAN_RECD, dbo.Dat' +
        'a0071.QUAN_IN_INSP, '
      
        '                      dbo.Data0071.QUAN_RETN, dbo.Data0071.QUAN_' +
        'INVD, dbo.Data0071.PRICE, dbo.Data0071.TAX_2, dbo.Data0071.DISCO' +
        'UNT, '
      
        '                      dbo.Data0071.REQ_DATE, dbo.Data0071.QUAN_R' +
        'EJD, dbo.Data0071.WO_PTR, dbo.Data0071.PURCHASE_UNIT_PTR, dbo.Da' +
        'ta0071.CONVERSION_FACTOR, '
      
        '                      dbo.Data0071.PRINTED_DATE, dbo.Data0071.re' +
        'ason, dbo.Data0071.extra_req, dbo.Data0071.avl_flag, dbo.Data007' +
        '1.tax_price, dbo.Data0071.rohs, '
      
        '                 dbo.Data0071.IF_CAF,dbo.Data0071.IF_urgency, db' +
        'o.Data0017.INV_PART_NUMBER AS partnumber,'
      
        '                     ROUND(data0071.QUAN_ORD * data0071.tax_pric' +
        'e, 4) '
      '                      AS so_total,'
      
        '                      vmi_qty=(select sum(data0134.quan_on_hand)' +
        '  from data0134 where data0134.inventory_ptr=data0071.INVT_PTR),'
      
        '                      dbo.Data0017.INV_NAME AS inv_part_number, ' +
        'dbo.Data0017.INV_DESCRIPTION AS inv_part_description, dbo.Data00' +
        '02.UNIT_CODE, dbo.Data0002.UNIT_NAME, '
      
        '                      dbo.Data0017.QUAN_ON_HAND AS quantity_stoc' +
        'k, CASE data0017.CRITICAL_MATL_FLAG WHEN 0 THEN '#39#21542#39' WHEN 1 THEN ' +
        #39#26159#39' END AS CRITICAL_MATL, '
      
        '                      dbo.Data0068.PO_REQ_NUMBER, dbo.Data0034.D' +
        'EPT_NAME, dbo.Data0005.EMPLOYEE_NAME'
      'FROM         dbo.Data0068 LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
        'Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NA' +
        'ME = dbo.Data0034.DEPT_CODE RIGHT OUTER JOIN'
      
        '                      dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Da' +
        'ta0069.PURCH_REQ_PTR RIGHT OUTER JOIN'
      '                      dbo.Data0071 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0071.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT' +
        '_PTR = dbo.Data0002.RKEY ON dbo.Data0069.RKEY = dbo.Data0071.rke' +
        'y69'
      'where'
      ' data0071.po_ptr=:rkey')
    Left = 96
    Top = 136
    object ADO71RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO71PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object ADO71INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
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
      FieldName = 'PRICE'
    end
    object ADO71TAX_2: TFloatField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
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
    object ADO71sim_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sim_total'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Calculated = True
    end
    object ADO71tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      Calculated = True
    end
    object ADO71partnumber: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'partnumber'
      Size = 25
    end
    object ADO71inv_part_number: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'inv_part_number'
      Size = 30
    end
    object ADO71inv_part_description: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'inv_part_description'
      Size = 70
    end
    object ADO71reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO71quantity_stock: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'quantity_stock'
    end
    object ADO71quantity_zaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldKind = fkLookup
      FieldName = 'quantity_zaitu'
      LookupDataSet = ADO71zaitu
      LookupKeyFields = 'INVT_PTR'
      LookupResultField = #22312#36884#25968#37327
      KeyFields = 'INVT_PTR'
      Lookup = True
    end
    object ADO71tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO71unit_code: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'unit_code'
      Size = 5
    end
    object ADO71unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADO71rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO71avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADO71CRITICAL_MATL: TStringField
      FieldName = 'CRITICAL_MATL'
      ReadOnly = True
      Size = 2
    end
    object ADO71IF_urgency: TBooleanField
      DisplayLabel = #32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object ADO71extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
      Size = 50
    end
    object ADO71IF_CAF: TWideStringField
      DisplayLabel = #32784'CAF'
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object ADO71PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADO71DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO71EMPLOYEE_NAME: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO71so_total: TBCDField
      FieldName = 'so_total'
      ReadOnly = True
      Precision = 27
      Size = 8
    end
    object ADO71vmi_qty: TBCDField
      FieldName = 'vmi_qty'
      ReadOnly = True
      Precision = 32
    end
  end
  object ADO72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO72CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 31
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0072.RKEY, dbo.Data0072.POPTR, dbo.Data0072.D' +
        'ESCRIPTION, dbo.Data0072.GUI_GE, dbo.Data0072.QUAN_ORD, dbo.Data' +
        '0072.QUAN_INVD, '
      
        '                      dbo.Data0072.UNIT_PRICE, dbo.Data0072.STAT' +
        'E_TAX, dbo.Data0072.GL_PTR, dbo.Data0072.QUANTITY_RECEIVED, dbo.' +
        'Data0072.DESCRIPTION2, '
      
        '                      dbo.Data0072.DEL_DATE, dbo.Data0072.UNIT_P' +
        'TR, dbo.Data0072.PRINTED_DATE, dbo.Data0072.reason, dbo.Data0072' +
        '.tax_price, dbo.Data0072.rohs, '
      
        '                      dbo.Data0072.IF_urgency, dbo.Data0002.UNIT' +
        '_CODE, dbo.Data0002.UNIT_NAME, dbo.Data0068.PO_REQ_NUMBER, dbo.D' +
        'ata0005.EMPLOYEE_NAME, '
      
        '                      dbo.Data0034.DEPT_NAME, ROUND(data0072.QUA' +
        'N_ORD * data0072.tax_price, 4) '
      '                      AS so_total'
      'FROM         dbo.Data0068 LEFT OUTER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NA' +
        'ME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
        'Data0005.RKEY RIGHT OUTER JOIN'
      
        '                      dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Da' +
        'ta0204.PURCHASE_REQ_PTR RIGHT OUTER JOIN'
      '                      dbo.Data0072 INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = db' +
        'o.Data0002.RKEY ON dbo.Data0204.RKEY = dbo.Data0072.rkey204'
      'where '
      'poptr=:rkey')
    Left = 96
    Top = 190
    object ADO72RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO72POPTR: TIntegerField
      FieldName = 'POPTR'
    end
    object ADO72DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADO72GUI_GE: TStringField
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO72QUAN_INVD: TFloatField
      FieldName = 'QUAN_INVD'
    end
    object ADO72QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADO72STATE_TAX: TFloatField
      FieldName = 'STATE_TAX'
    end
    object ADO72GL_PTR: TIntegerField
      FieldName = 'GL_PTR'
    end
    object ADO72QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADO72DESCRIPTION2: TStringField
      FieldName = 'DESCRIPTION2'
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
      DisplayFormat = '0.000'
      Calculated = True
    end
    object ADO72tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      Calculated = True
    end
    object ADO72reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO72tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO72unit_code: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'unit_code'
      Size = 5
    end
    object ADO72unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADO72rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO72IF_urgency: TBooleanField
      DisplayLabel = #32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object ADO72PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADO72EMPLOYEE_NAME: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO72DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object fltfldADO72so_total: TFloatField
      FieldName = 'so_total'
      ReadOnly = True
    end
  end
  object ADO200: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 31
      end>
    SQL.Strings = (
      'select data0200.*,data0199.TAXABLE'
      'from'
      '  data0200,data0199'
      'where'
      '  data0200.misc_charge_ptr=data0199.rkey and '
      '  poptr=:rkey')
    Left = 154
    Top = 76
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
      FieldName = 'TAXABLE'
      FixedChar = True
      Size = 1
    end
  end
  object adosp: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltPessimistic
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
        Value = 2070
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 208
    Top = 75
  end
  object DataSource4: TDataSource
    DataSet = ASP78
    Left = 34
    Top = 247
  end
  object ASP78: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ASP78CalcFields
    ProcedureName = 'ep053;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@po_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 100
      end>
    Left = 97
    Top = 248
    object ASP78user_id: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'user_id'
      Size = 10
    end
    object ASP78user_full_name: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'user_full_name'
      Size = 30
    end
    object ASP78auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ASP78ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object ASP78user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ASP78auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ASP78remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ASP78auth_type: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_type'
      Size = 6
      Calculated = True
    end
  end
  object ADO71zaitu: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
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
      'SELECT dbo.Data0071.INVT_PTR,'
      
        '      SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD + dbo.D' +
        'ata0071.QUAN_RETN)'
      '       AS '#22312#36884#25968#37327
      'FROM dbo.Data0071 INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY IN' +
        'NER JOIN'
      '      dbo.Data0071 Data0071_1 ON '
      '      dbo.Data0071.INVT_PTR = Data0071_1.INVT_PTR'
      'WHERE (dbo.Data0070.STATUS = 5) AND (Data0071_1.PO_PTR = :rkey)'
      'GROUP BY dbo.Data0071.INVT_PTR')
    Left = 159
    Top = 137
    object ADO71zaituINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO71zaituDSDesigner: TFloatField
      FieldName = #22312#36884#25968#37327
    end
  end
  object qryFile: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'supp'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'invt'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      
        'SELECT Tier3_CustomerFiles.[FileName],Tier3_CustomerFiles.Ftp_Fi' +
        'leName,Tier3_CustomerFiles.Ftp_ptr'
      #9#9',Tier3_CustomerFiles.UploadTime,data0005.EMPLOYEE_NAME'
      'FROM Tier3_CustomerFiles'
      
        #9#9'INNER JOIN Data0028_FileList ON Data0028_FileList.FtpIDKey = T' +
        'ier3_CustomerFiles.IDKey'
      
        #9#9'INNER JOIN Data0028 ON Data0028.RKEY = Data0028_FileList.rkey2' +
        '8 '
      
        #9#9'INNER JOIN Data0005 on Data0005.RKEY = Tier3_CustomerFiles.Upl' +
        'oadUser_d05ptr'
      
        'WHERE Data0028.SUPPLIER_PTR=  :supp   AND DATA0028.INVENTORY_PTR' +
        ' = :invt')
    Left = 200
    Top = 240
    object qryFileFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFileFtp_FileName: TStringField
      FieldName = 'Ftp_FileName'
      FixedChar = True
      Size = 38
    end
    object qryFileFtp_ptr: TIntegerField
      FieldName = 'Ftp_ptr'
    end
    object qryFileUploadTime: TDateTimeField
      DisplayLabel = #25991#20214#19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object qryFileEMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object dsFile: TDataSource
    DataSet = qryFile
    Left = 240
    Top = 240
  end
end
