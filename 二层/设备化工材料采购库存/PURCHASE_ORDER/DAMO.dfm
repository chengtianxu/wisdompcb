object DM: TDM
  OldCreateOrder = False
  Left = 479
  Top = 165
  Height = 505
  Width = 529
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 180
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
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
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
      end
      item
        Name = 'v8'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
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
      
        'SELECT data0070.rkey,data0070.po_number,data0070.PO_REV_NO,data0' +
        '070.DATE_EDITED,'
      
        '       data0070.po_date,data0070.status,data0070.PO_TYPE,data007' +
        '0.STATE_TAX,'
      
        '       data0070.PURCHASE_ORDER_TYPE,data0070.shipping_cost,data0' +
        '070.fob,'
      
        '       data0005.employee_name,data0070.MISC_CHARGE,data0070.disc' +
        'ount2_days,'
      
        '       data0023.supplier_name,data0070.SUPP_FAC_ADD_PTR,data0070' +
        '.PRINT_TIME,'
      
        '       data0070.PAYMENT_TERMS,data0070.sub_total,data0070.EXCHAN' +
        'GE_RATE,data0023.fax,'
      
        '       data0015.warehouse_name,data0015.abbr_name as ware_name,d' +
        'ata0023.phone,'
      
        '       data0023.abbr_name as supp_abbrname,data0070.SECOND_WHSE_' +
        'PTR,data0070.print_date'
      'FROM'
      '    data0070,data0005,data0023,data0015'
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
      DisplayLabel = #37319#36141#32534#21495
      FieldName = 'po_number'
      Size = 15
    end
    object AQ0070PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      FixedChar = True
      Size = 10
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
      Size = 40
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
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'fob'
      Size = 15
    end
    object AQ0070warehouse_name: TStringField
      DisplayLabel = #24037#21378#38271#21517
      FieldName = 'warehouse_name'
      Size = 70
    end
    object AQ0070discount2_days: TSmallintField
      DisplayLabel = #37319#36141#22320#28857#26631#35782
      FieldName = 'discount2_days'
    end
    object AQ0070ware_name: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 8
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
    object AQ0070SECOND_WHSE_PTR: TIntegerField
      FieldName = 'SECOND_WHSE_PTR'
    end
    object AQ0070PRINT_TIME: TDateTimeField
      FieldName = 'PRINT_TIME'
    end
    object AQ0070STATE_TAX: TIntegerField
      FieldName = 'STATE_TAX'
    end
    object AQ0070DATE_EDITED: TDateTimeField
      FieldName = 'DATE_EDITED'
    end
    object AQ0070fax: TStringField
      FieldName = 'fax'
    end
    object AQ0070phone: TStringField
      FieldName = 'phone'
    end
    object AQ0070print_date: TDateTimeField
      FieldName = 'print_date'
    end
    object AQ0070if_print: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'if_print'
      Size = 6
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ0070
    Left = 39
    Top = 130
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 41
    Top = 16
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 106
    Top = 15
  end
  object DataSource2: TDataSource
    DataSet = ADO70
    Left = 106
    Top = 130
  end
  object ADO200: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
    LockType = ltBatchOptimistic
    OnCalcFields = ADO71CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from data0071'
      'where rkey is null')
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
    object ADO71QUAN_ORD: TBCDField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
      Precision = 9
      Size = 3
    end
    object ADO71QUAN_IN_INSP: TBCDField
      DisplayLabel = #35831#36141#25968#37327
      FieldName = 'QUAN_IN_INSP'
      Precision = 9
      Size = 3
    end
    object ADO71QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 9
      Size = 3
    end
    object ADO71QUAN_RETN: TBCDField
      FieldName = 'QUAN_RETN'
      Precision = 9
      Size = 3
    end
    object ADO71QUAN_INVD: TBCDField
      FieldName = 'QUAN_INVD'
      Precision = 9
      Size = 3
    end
    object ADO71tax_price: TBCDField
      DisplayLabel = #35831#36141#20215#26684
      FieldName = 'tax_price'
      Precision = 9
      Size = 3
    end
    object ADO71PRICE: TBCDField
      DisplayLabel = #37319#36141#20215#26684
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object ADO71TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
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
    object ADO71CONVERSION_FACTOR: TBCDField
      FieldName = 'CONVERSION_FACTOR'
      Precision = 7
      Size = 2
    end
    object ADO71PRINTED_DATE: TDateTimeField
      FieldName = 'PRINTED_DATE'
    end
    object ADO71reason: TStringField
      DisplayLabel = #37319#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO71extra_req: TStringField
      DisplayLabel = #29305#27530#35828#26126
      FieldName = 'extra_req'
      Size = 60
    end
    object ADO71recd_DATE: TDateTimeField
      FieldName = 'recd_DATE'
    end
    object ADO71inv_part_number: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldKind = fkLookup
      FieldName = 'inv_part_number'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_part_number'
      KeyFields = 'INVT_PTR'
      Size = 25
      Lookup = True
    end
    object ADO71INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #25551#36848
      FieldKind = fkLookup
      FieldName = 'INV_PART_DESCRIPTION'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_part_description'
      KeyFields = 'INVT_PTR'
      Size = 100
      Lookup = True
    end
    object ADO71inv_number: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldKind = fkLookup
      FieldName = 'inv_number'
      LookupDataSet = aq0017
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
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_description'
      KeyFields = 'INVT_PTR'
      Size = 70
      Lookup = True
    end
    object ADO71invdesc_extra: TStringField
      DisplayLabel = #35268#26684#21152#35828#26126
      FieldKind = fkCalculated
      FieldName = 'invdesc_extra'
      Size = 130
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
    object ADO71sim_total: TCurrencyField
      DisplayLabel = #21512#35745
      FieldKind = fkCalculated
      FieldName = 'sim_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ADO71tax_total: TFloatField
      DisplayLabel = #31246#37329
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO71
    Left = 170
    Top = 130
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
    Left = 232
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
  object ADO72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADO72CalcFields
    Parameters = <>
    Left = 237
    Top = 71
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
      Size = 60
    end
    object ADO72GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO72QUAN_ORD: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_ORD'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72QUAN_INVD: TFloatField
      FieldName = 'QUAN_INVD'
    end
    object ADO72UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72STATE_TAX: TFloatField
      DisplayLabel = #31246#29575'%'
      FieldName = 'STATE_TAX'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
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
    object ADO72reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO72tax_price: TFloatField
      FieldName = 'tax_price'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO72recd_date: TDateTimeField
      FieldName = 'recd_date'
    end
    object ADO72QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
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
    LockType = ltBatchOptimistic
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
    Left = 432
    Top = 68
  end
  object ADO107011: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
    Left = 368
    Top = 68
  end
  object ADO0450: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
      ' source_type=2070 and file_pointer=:rkey')
    Left = 297
    Top = 130
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
    Left = 170
    Top = 316
  end
  object AQ0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 228
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
    Left = 170
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
    Left = 228
    Top = 316
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
    object ASP78auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ASP78remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'supp_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select tax_id_number,analysis_code1,analysis_code2 from data0023'
      'where rkey = :supp_ptr')
    Left = 41
    Top = 375
    object ADOQuery3tax_id_number: TStringField
      FieldName = 'tax_id_number'
      FixedChar = True
    end
    object ADOQuery3analysis_code1: TStringField
      FieldName = 'analysis_code1'
    end
    object ADOQuery3analysis_code2: TStringField
      FieldName = 'analysis_code2'
    end
  end
  object adoap68: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0068'
      'where rkey is null')
    Left = 109
    Top = 375
    object adoap68RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adoap68PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object adoap68USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object adoap68REQ_BY: TIntegerField
      FieldName = 'REQ_BY'
    end
    object adoap68BUYER_PTR: TIntegerField
      FieldName = 'BUYER_PTR'
    end
    object adoap68APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object adoap68DATA275_PTR: TIntegerField
      FieldName = 'DATA275_PTR'
    end
    object adoap68AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object adoap68WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object adoap68budget_ptr: TIntegerField
      FieldName = 'budget_ptr'
    end
    object adoap68NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object adoap68ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object adoap68REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object adoap68AUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
    object adoap68STATUS: TWordField
      FieldName = 'STATUS'
    end
    object adoap68DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object adoap68FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object adoap68EDITED_DATE: TDateTimeField
      FieldName = 'EDITED_DATE'
    end
    object adoap68EDITED_BY_USER_PTR: TIntegerField
      FieldName = 'EDITED_BY_USER_PTR'
    end
    object adoap68EDITED_BY_EMP_PTR: TIntegerField
      FieldName = 'EDITED_BY_EMP_PTR'
    end
    object adoap68TOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object adoap68CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object adoap68EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object adoap68v_year: TSmallintField
      FieldName = 'v_year'
    end
    object adoap68v_month: TSmallintField
      FieldName = 'v_month'
    end
  end
  object AP69204: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0069')
    Left = 170
    Top = 375
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0017.INV_PART_NUMBER,'
      '       Data0017.INV_PART_DESCRIPTION, dbo.Data0071.QUAN_ORD,'
      '       Data0071.QUAN_RECD,data0071.rkey'
      'FROM   Data0070 INNER JOIN'
      
        '       Data0071 ON dbo.Data0070.RKEY = Data0071.PO_PTR INNER JOI' +
        'N'
      '       Data0017 ON dbo.Data0071.INVT_PTR = Data0017.RKEY'
      'where data0071.quan_recd>0 and'
      '      Data0071.PO_PTR = :rkey       ')
    Left = 355
    Top = 316
    object ADOQuery3PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery3INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#21495
      DisplayWidth = 31
      FieldName = 'INV_PART_NUMBER'
    end
    object ADOQuery3INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#25551#36848
      DisplayWidth = 42
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ADOQuery3QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery3QUAN_RECD: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery3rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSource6: TDataSource
    DataSet = ADOQuery4
    Left = 297
    Top = 316
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0072.DESCRIPTION,'
      '       Data0072.GUI_GE, dbo.Data0072.QUAN_ORD,'
      '       Data0072.QUANTITY_RECEIVED,data0072.rkey'
      'FROM   Data0070 INNER JOIN'
      '       Data0072 ON Data0070.RKEY = Data0072.POPTR'
      'where  data0072.QUANTITY_RECEIVED>0 and'
      '       Data0072.POPTR = :rkey')
    Left = 453
    Top = 316
    object ADOQuery4PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#32534#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery4DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADOQuery4GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 50
    end
    object ADOQuery4QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery4QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADOQuery4rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource6
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
      
        'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.ship_DATE, dbo.Data' +
        '0022.QUANTITY, '
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.LOCATION, '
      '      dbo.Data0022.BARCODE_ID, dbo.Data0456.DELIVER_NUMBER, '
      '      dbo.Data0005.EMPLOYEE_NAME'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR I' +
        'NNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0015 ON '
      
        '      dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where data0022.source_ptr=:rkey      ')
    Left = 355
    Top = 374
    object ADOQuery5GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery6DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOQuery6ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ADOQuery5QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQuery5WAREHOUSE_CODE: TStringField
      DisplayLabel = #23384#25918#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery5LOCATION: TStringField
      DisplayLabel = #23384#25918#20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQuery5EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery5BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource7: TDataSource
    DataSet = ADOQuery6
    Left = 297
    Top = 374
  end
  object ADOQuery7: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource6
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
      'SELECT Data0456.GRN_NUMBER, dbo.Data0235.DATE_RECD,'
      '       Data0235.QUAN_RECD, dbo.Data0456.REF_NUMBER,'
      '       Data0005.EMPLOYEE_NAME'
      'FROM   Data0456 INNER JOIN'
      
        '       Data0235 ON dbo.Data0456.RKEY = dbo.Data0235.GRN_PTR INNE' +
        'R JOIN'
      '       Data0005 ON dbo.Data0235.EMPL_PTR = dbo.Data0005.RKEY'
      'where data0235.d0072_ptr=:rkey       ')
    Left = 454
    Top = 374
    object ADOQuery6GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery6DATE_RECD: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'DATE_RECD'
    end
    object ADOQuery6QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery6REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADOQuery6EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADO78: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    OnCalcFields = ADO78CalcFields
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
        Value = 0
      end>
    Left = 355
    Top = 256
    object ADO78user_id: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'user_id'
      Size = 10
    end
    object ADO78user_full_name: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADO78auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ADO78ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object ADO78user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO78auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADO78
    Left = 297
    Top = 258
  end
  object ADO28: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey23'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey17'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select PRICE_1 from data0028'
      'where SUPPLIER_PTR=:rkey23 and'
      '      INVENTORY_PTR=:rkey17')
    Left = 370
    Top = 133
    object ADO28PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
  end
  object buyemp05: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,EMPLOYEE_NAME'
      'from data0005'
      'where BUYER_FLAG='#39'Y'#39
      'order by rkey')
    Left = 446
    Top = 193
  end
  object AQ0001: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep055;2'
    Parameters = <>
    Left = 106
    Top = 194
  end
  object aq0017: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep056;5'
    Parameters = <>
    Left = 40
    Top = 196
  end
  object AQ0024: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep056;6'
    Parameters = <>
    Left = 172
    Top = 194
  end
  object aq0002: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep056;7'
    Parameters = <>
    Left = 370
    Top = 192
  end
  object ADO0069: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep056;9'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey68'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 43
    Top = 263
    object ADO0069RKEY: TIntegerField
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
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO0069UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'UNIT_PRICE'
    end
    object ADO0069UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO0069CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADO0069o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADO0069reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object ADO0069reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO0069extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object ADO0069code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object ADO0069BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ADO0069inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ADO0069inv_description: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'inv_description'
      Size = 70
    end
    object ADO0069abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO0069unit_name: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_name'
    end
    object ADO0069curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object ADO0069tax: TBCDField
      FieldName = 'tax'
      Precision = 4
      Size = 2
    end
    object ADO0069tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO0069req_quantity: TBCDField
      FieldName = 'req_quantity'
      Precision = 9
      Size = 3
    end
    object ADO0069req_unit_ptr: TIntegerField
      FieldName = 'req_unit_ptr'
    end
  end
  object ADO0204: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'ep056;10'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey68'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 107
    Top = 264
    object ADO0204RKEY: TIntegerField
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
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO0204DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
      FixedChar = True
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
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
    end
    object ADO0204UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
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
    object ADO0204o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADO0204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object ADO0204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO0204code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object ADO0204BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ADO0204abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO0204curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object ADO0204unit_name: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_name'
    end
    object ADO0204tax: TBCDField
      FieldName = 'tax'
      Precision = 4
      Size = 2
    end
    object ADO0204tax_price: TFloatField
      FieldName = 'tax_price'
    end
  end
  object ADO04: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    ProcedureName = 'ep120;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 46
      end>
    Left = 276
    Top = 196
    object ADO04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object AQ0199: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'ep056;11'
    Parameters = <>
    Left = 326
    Top = 196
  end
  object AQ71: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'ep056;12'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey70'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 44
    Top = 320
    object AQ71rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ71PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object AQ71QUAN_ORD: TBCDField
      FieldName = 'QUAN_ORD'
      Precision = 9
      Size = 3
    end
    object AQ71PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object AQ71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
  end
  object AQ72: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'ep056;13'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey70'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 108
    Top = 320
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
  object ADO70: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    ProcedureName = 'ep056;14'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey70'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 104
    Top = 72
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
      FieldName = 'EXCHANGE_RATE'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
    object ADO70SHIPPING_COST: TFloatField
      FieldName = 'SHIPPING_COST'
    end
    object ADO70FEDERAL_TAX: TBCDField
      FieldName = 'FEDERAL_TAX'
      Precision = 4
      Size = 2
    end
    object ADO70STATE_TAX: TIntegerField
      FieldName = 'STATE_TAX'
    end
    object ADO70SUB_TOTAL: TFloatField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object ADO70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADO70SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object ADO70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO70SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
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
    object ADO70FOB: TStringField
      FieldName = 'FOB'
      Size = 15
    end
    object ADO70MISC_CHARGE: TFloatField
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
    object ADO70MULTIPLE_FACTOR: TBCDField
      FieldName = 'MULTIPLE_FACTOR'
      Precision = 4
      Size = 2
    end
    object ADO70CITY_AMOUNT: TBCDField
      FieldName = 'CITY_AMOUNT'
      Precision = 4
      Size = 2
    end
    object ADO70COUNTY_AMOUNT: TBCDField
      FieldName = 'COUNTY_AMOUNT'
      Precision = 4
      Size = 2
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
      Size = 10
    end
    object ADO70PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object ADO70CASH_DISCOUNT: TBCDField
      FieldName = 'CASH_DISCOUNT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 4
      Size = 2
    end
    object ADO70DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADO70CASH_DISCOUNT2: TBCDField
      FieldName = 'CASH_DISCOUNT2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 4
      Size = 2
    end
    object ADO70DISCOUNT2_DAYS: TSmallintField
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
    object ADO70SHIPTO_ADDRESS: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object ADO70PURCHASE_TYPE: TStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 10
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
    object ADO70shipping_lead_time: TIntegerField
      FieldKind = fkLookup
      FieldName = 'shipping_lead_time'
      LookupDataSet = AQ0024
      LookupKeyFields = 'rkey'
      LookupResultField = 'SHIPPING_LEAD_TIME'
      KeyFields = 'SUPP_FAC_ADD_PTR'
      Lookup = True
    end
  end
end
