object DM: TDM
  OldCreateOrder = False
  Left = 540
  Top = 148
  Height = 481
  Width = 428
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 204
    Top = 16
  end
  object AQ0070: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    OnCalcFields = AQ0070CalcFields
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
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
        Value = 0
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
      end
      item
        Name = 'v8'
        DataType = ftWord
        Size = -1
        Value = 8
      end
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
      'SELECT data0070.rkey,data0070.po_number,data0070.PO_REV_NO,'
      '       data0070.po_date,data0070.status,data0070.PO_TYPE,'
      
        '       data0070.PURCHASE_ORDER_TYPE,data0070.shipping_cost,data0' +
        '070.fob,'
      
        '       data0005.employee_name,data0070.MISC_CHARGE,data0070.disc' +
        'ount2_days,'
      '       data0023.supplier_name,data0070.SUPP_FAC_ADD_PTR,'
      
        '       data0070.PAYMENT_TERMS,data0070.sub_total,data0070.EXCHAN' +
        'GE_RATE,'
      '       data0015.warehouse_name,data0015.abbr_name as ware_name,'
      '       data0023.abbr_name as supp_abbrname,data0070.PRINT_DATE'
      'FROM'
      '   data0070,data0005,data0023,data0015'
      'WHERE'
      '    data0070.employee_pointer=data0005.rkey and'
      '    data0070.supplier_pointer=data0023.rkey and'
      '    data0070.WAREHOUSE_POINTER=data0015.rkey and'
      '    data0070.status <> :v1 and data0070.status <> :v2 and'
      '    data0070.status <> :v3 and data0070.status <> :v4 and'
      '    data0070.status <> :v5 and data0070.status <> :v6 and'
      '    data0070.status <> :v7 and data0070.status <> :v8 and'
      '    data0070.po_date >= :dtpk1 and data0070.po_date <= :dtpk2'
      ''
      'ORDER BY'
      '    po_number')
    Left = 39
    Top = 71
    object AQ0070rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ0070po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object AQ0070PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      FixedChar = True
      Size = 5
    end
    object AQ0070po_date: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'po_date'
    end
    object AQ0070status: TSmallintField
      FieldName = 'status'
    end
    object AQ0070PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object AQ0070PURCHASE_ORDER_TYPE: TWordField
      FieldName = 'PURCHASE_ORDER_TYPE'
    end
    object AQ0070employee_name: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'employee_name'
      Size = 16
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
      Size = 10
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
    object AQ0070sub_total: TFloatField
      FieldName = 'sub_total'
    end
    object AQ0070EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object AQ0070fob: TStringField
      FieldName = 'fob'
      Size = 15
    end
    object AQ0070warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object AQ0070discount2_days: TSmallintField
      FieldName = 'discount2_days'
    end
    object AQ0070ware_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ware_name'
      Size = 10
    end
    object AQ0070supp_abbrname: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supp_abbrname'
      Size = 10
    end
    object AQ0070in_out: TStringField
      DisplayLabel = #37319#36141#22320#28857
      FieldKind = fkCalculated
      FieldName = 'in_out'
      Size = 4
      Calculated = True
    end
    object AQ0070PRINT_DATE: TDateTimeField
      DisplayLabel = #25171#21360#26085#26399
      FieldName = 'PRINT_DATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ0070
    Left = 39
    Top = 130
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 39
    Top = 15
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Left = 106
    Top = 15
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
        Value = Null
      end>
    SQL.Strings = (
      'Select * '
      'FROM'
      '  data0070'
      'WHERE '
      ' rkey=:rkey')
    Left = 104
    Top = 71
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
    object ADO70FOB: TStringField
      FieldName = 'FOB'
      FixedChar = True
      Size = 15
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
      Size = 10
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
    object ADO70PURCHASE_ORDER_TYPE: TWordField
      FieldName = 'PURCHASE_ORDER_TYPE'
    end
    object ADO70EXPIRED_DATE: TDateTimeField
      FieldName = 'EXPIRED_DATE'
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
    object ADO70curr_code: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_code'
      LookupDataSet = AQ0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_code'
      KeyFields = 'CURRENCY_PTR'
      Size = 5
      Lookup = True
    end
    object ADO70curr_name: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_name'
      LookupDataSet = AQ0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_name'
      KeyFields = 'CURRENCY_PTR'
      Lookup = True
    end
    object ADO70factory_location: TStringField
      FieldKind = fkLookup
      FieldName = 'factory_location'
      LookupDataSet = AQ0024
      LookupKeyFields = 'rkey'
      LookupResultField = 'FACTORY_LOCATION'
      KeyFields = 'SUPP_FAC_ADD_PTR'
      Lookup = True
    end
    object ADO70shipping_lead_time: TSmallintField
      FieldKind = fkLookup
      FieldName = 'shipping_lead_time'
      LookupDataSet = AQ0024
      LookupKeyFields = 'rkey'
      LookupResultField = 'SHIPPING_LEAD_TIME'
      KeyFields = 'SUPP_FAC_ADD_PTR'
      Lookup = True
    end
    object ADO70SHIPTO_ADDRESS: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object ADO70STATE_TAX: TIntegerField
      FieldName = 'STATE_TAX'
    end
    object ADO70PURCHASE_TYPE: TStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO70
    Left = 105
    Top = 130
  end
  object AQ0001: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT rkey,curr_code,curr_name,EXCH_RATE'
      'FROM '
      '   data0001'
      'order by rkey')
    Left = 101
    Top = 194
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
    Left = 297
    Top = 68
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
      LookupDataSet = AQ0199
      LookupKeyFields = 'RKEY'
      LookupResultField = 'TAXABLE'
      KeyFields = 'MISC_CHARGE_PTR'
      Size = 1
      Lookup = True
    end
  end
  object ADO71: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO71CalcFields
    Parameters = <>
    Left = 170
    Top = 71
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
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'PRICE'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO71TAX_2: TFloatField
      DisplayLabel = #22686#20540#31246
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
      FieldName = 'DEL_DATE'
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
    object ADO71inv_part_number: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldKind = fkLookup
      FieldName = 'inv_part_number'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_name'
      KeyFields = 'INVT_PTR'
      Size = 30
      Lookup = True
    end
    object ADO71inv_part_description: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldKind = fkLookup
      FieldName = 'inv_part_description'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_description'
      KeyFields = 'INVT_PTR'
      Size = 70
      Lookup = True
    end
    object ADO71std_price: TFloatField
      FieldKind = fkCalculated
      FieldName = 'std_price'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      Calculated = True
    end
    object ADO71sim_total: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sim_total'
      Calculated = True
    end
    object ADO71tax_total: TFloatField
      DisplayLabel = #31246#37329
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      EditFormat = '0.00'
      currency = True
      Calculated = True
    end
    object ADO71price_discount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'price_discount'
      Calculated = True
    end
    object ADO71unit_name: TStringField
      FieldKind = fkLookup
      FieldName = 'unit_name'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_name'
      KeyFields = 'PURCHASE_UNIT_PTR'
      Lookup = True
    end
    object ADO71inv_number: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldKind = fkLookup
      FieldName = 'inv_number'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_part_number'
      KeyFields = 'INVT_PTR'
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO71
    Left = 171
    Top = 130
  end
  object aq0017: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select'
      
        ' rkey,inv_part_number,inv_part_description,inv_name,inv_descript' +
        'ion'
      'from'
      ' data0017'
      'order by rkey')
    Left = 39
    Top = 194
  end
  object AQ0024: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select rkey,FACTORY_LOCATION,SHIPPING_LEAD_TIME'
      'from '
      '   data0024'
      'order by rkey')
    Left = 154
    Top = 194
  end
  object AQ0015: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
    Left = 204
    Top = 194
    object AQ0015RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
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
  object AQ0199: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0199'
      'order by rkey')
    Left = 265
    Top = 194
  end
  object ADO72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO72CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from data0072')
    Left = 237
    Top = 70
    object ADO72RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO72POPTR: TIntegerField
      FieldName = 'POPTR'
    end
    object ADO72DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADO72GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
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
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO72STATE_TAX: TFloatField
      DisplayLabel = #22686#20540#31246
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
      DisplayLabel = #31867#21035
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
      currency = True
      Calculated = True
    end
    object ADO72tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      currency = True
      Calculated = True
    end
    object ADO72unit_name: TStringField
      FieldKind = fkLookup
      FieldName = 'unit_name'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_name'
      KeyFields = 'UNIT_PTR'
      Lookup = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO72
    Left = 237
    Top = 130
  end
  object ADO7011: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0011'
      'where'
      ' source_type=70 and'
      ' file_pointer=:rkey')
    Left = 299
    Top = 130
  end
  object ADO107011: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0011'
      'where'
      ' source_type=1070 and'
      ' file_pointer=:rkey')
    Left = 355
    Top = 69
  end
  object ADO0450: TADOQuery
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
      'select * from data0011'
      'where'
      ' source_type=2070 and file_pointer=:rkey'
      '')
    Left = 355
    Top = 130
  end
  object ADO0069: TADOQuery
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
        Value = Null
      end>
    SQL.Strings = (
      'select data0069.*,data0023.code,data0001.exch_rate'
      'from'
      ' data0069,data0023,data0001'
      'where'
      ' data0069.supp_ptr=data0023.rkey and'
      ' data0069.po_link_ptr=data0001.rkey and'
      ' purch_req_ptr=:rkey')
    Left = 41
    Top = 260
    object ADO0069RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO0069PURCH_REQ_PTR: TIntegerField
      FieldName = 'PURCH_REQ_PTR'
    end
    object ADO0069INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO0069SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO0069PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADO0069REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO0069QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO0069UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADO0069UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO0069CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADO0069code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADO0069exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object ADO0069o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
  end
  object ADO0204: TADOQuery
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
        Value = Null
      end>
    SQL.Strings = (
      'select data0204.*,data0023.code,data0001.exch_rate'
      'from'
      ' data0204,data0023,data0001'
      'where'
      ' data0204.supplier_ptr=data0023.rkey and'
      ' data0204.po_link_ptr=data0001.rkey and'
      ' purchase_req_ptr=:rkey')
    Left = 102
    Top = 259
    object ADO0204RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO0204PURCHASE_REQ_PTR: TIntegerField
      FieldName = 'PURCHASE_REQ_PTR'
    end
    object ADO0204DESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object ADO0204GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO0204DESCRIPTION_2: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'DESCRIPTION_2'
    end
    object ADO0204SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO0204PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADO0204G_L_PTR: TIntegerField
      FieldName = 'G_L_PTR'
    end
    object ADO0204QUANTITY_REQUIRED: TFloatField
      FieldName = 'QUANTITY_REQUIRED'
    end
    object ADO0204UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADO0204TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO0204REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO0204code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADO0204exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object ADO0204o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
  end
  object ADO0339: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'po_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'edit_empl_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'tran_type'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'tran_desc'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end
      item
        Name = 'tran_from'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 70
        Value = Null
      end
      item
        Name = 'tran_to'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 70
        Value = Null
      end
      item
        Name = 'data0071_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'data0072_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'insert into data0339'
      '(po_ptr,'
      ' EDITED_BY_PTR,'
      ' TRAN_TYPE,'
      ' TRAN_DESCRIPTION,'
      ' TRAN_FROM,'
      ' TRAN_TO,'
      ' DATA0071_PTR,'
      ' DATA0072_PTR)'
      ' values(:po_ptr,'
      '        :edit_empl_ptr,'
      '        :tran_type,'
      '        :tran_desc,'
      '        :tran_from,'
      '        :tran_to,'
      '        :data0071_ptr,'
      '        :data0072_ptr)')
    Left = 157
    Top = 326
  end
  object AQ71: TADOQuery
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
        Value = 374
      end>
    SQL.Strings = (
      'select rkey,PO_PTR,QUAN_ORD,PRICE,'
      '       REQ_DATE'
      'from data0071'
      'where po_ptr=:rkey')
    Left = 41
    Top = 326
    object AQ71rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ71PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object AQ71QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object AQ71PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object AQ71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
  end
  object AQ72: TADOQuery
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
        Value = 374
      end>
    SQL.Strings = (
      'select rkey,poptr,QUAN_ORD,UNIT_PRICE,DEL_DATE'
      'from data0072'
      'where poptr=:rkey'
      '      '
      '       ')
    Left = 101
    Top = 326
    object AQ72rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ72poptr: TIntegerField
      FieldName = 'poptr'
    end
    object AQ72QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object AQ72UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object AQ72DEL_DATE: TDateTimeField
      FieldName = 'DEL_DATE'
    end
  end
  object AQ0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 204
    Top = 259
    object AQ0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object AQ0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object AQ0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object AQ0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ASP362: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep001;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@pr_number'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = 'pr-001'
      end>
    Left = 156
    Top = 261
    object ASP362PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ASP362WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ASP362STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ASP362EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ASP362TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object ASP362CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object ASP362flag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object ASP362v_month: TSmallintField
      FieldName = 'v_month'
    end
    object ASP362USED_PERIOD_1: TFloatField
      FieldName = 'USED_PERIOD_1'
    end
    object ASP362USED_PERIOD_2: TFloatField
      FieldName = 'USED_PERIOD_2'
    end
    object ASP362USED_PERIOD_3: TFloatField
      FieldName = 'USED_PERIOD_3'
    end
    object ASP362USED_PERIOD_4: TFloatField
      FieldName = 'USED_PERIOD_4'
    end
    object ASP362USED_PERIOD_5: TFloatField
      FieldName = 'USED_PERIOD_5'
    end
    object ASP362USED_PERIOD_6: TFloatField
      FieldName = 'USED_PERIOD_6'
    end
    object ASP362USED_PERIOD_7: TFloatField
      FieldName = 'USED_PERIOD_7'
    end
    object ASP362USED_PERIOD_8: TFloatField
      FieldName = 'USED_PERIOD_8'
    end
    object ASP362USED_PERIOD_9: TFloatField
      FieldName = 'USED_PERIOD_9'
    end
    object ASP362USED_PERIOD_10: TFloatField
      FieldName = 'USED_PERIOD_10'
    end
    object ASP362USED_PERIOD_11: TFloatField
      FieldName = 'USED_PERIOD_11'
    end
    object ASP362USED_PERIOD_12: TFloatField
      FieldName = 'USED_PERIOD_12'
    end
  end
  object ASP78: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep056;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@porkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 206
    Top = 325
    object ASP78rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ASP78po_ptr: TIntegerField
      FieldName = 'po_ptr'
    end
    object ASP78user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ASP78auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ASP78ranking: TWordField
      FieldName = 'ranking'
    end
  end
  object aq0002: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select rkey,unit_code,unit_name'
      'from data0002')
    Left = 318
    Top = 194
  end
end
