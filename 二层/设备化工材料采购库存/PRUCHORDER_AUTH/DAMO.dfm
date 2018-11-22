object DM: TDM
  OldCreateOrder = False
  Left = 444
  Top = 189
  Height = 346
  Width = 319
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SJ_V20_SAMPLE;Data Source=w18'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 168
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
      '       data0015.warehouse_code,data0015.warehouse_name,'
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
      '      (data0070.status=1) and (data0078.auth_date is null) and'
      
        ' (data0078.user_ptr IN (SELECT rkey FROM data0073 WHERE rpl_po_p' +
        'tr = :rkey73))'
      'and  data0078.auth_flag='#39'Y'#39
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
    object ADO70FOB: TStringField
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
      Size = 4
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
    Left = 88
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
      'select data0071.*,'
      '       data0017.inv_part_number as partnumber,'
      '       data0017.inv_name as inv_part_number,'
      '       data0017.inv_description as inv_part_description,'
      '       data0002.unit_code,data0002.unit_name'
      'from data0071,data0017,data0002'
      'where'
      ' data0071.invt_ptr=data0017.rkey and'
      ' data0071.PURCHASE_UNIT_PTR=data0002.rkey and'
      ' data0071.po_ptr=:rkey')
    Left = 95
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
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO71tax_price: TFloatField
      DisplayLabel = #35831#36141#20215
      FieldName = 'tax_price'
      DisplayFormat = '0.000'
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
      DisplayFormat = '0.000'
      EditFormat = '0.000'
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
      FieldKind = fkLookup
      FieldName = 'quantity_stock'
      LookupDataSet = ADOstock22
      LookupKeyFields = 'INVENTORY_PTR'
      LookupResultField = 'stock'
      KeyFields = 'INVT_PTR'
      Lookup = True
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
    object ADO71unit_code: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'unit_code'
      Size = 5
    end
    object ADO71unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
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
      'select data0072.*,data0002.unit_code,data0002.unit_name'
      'from'
      ' data0072,data0002'
      'where data0072.unit_ptr=data0002.rkey and '
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
      DisplayLabel = #20215#26684
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
      DisplayFormat = '0.000'
      Calculated = True
    end
    object ADO72tax_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax_total'
      DisplayFormat = '0.000'
      Calculated = True
    end
    object ADO72reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO72tax_price: TFloatField
      DisplayLabel = #35831#36141#20215
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
    object ASP78remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object ASP78auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ASP78auth_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'auth_type'
      Size = 6
      Calculated = True
    end
  end
  object ADOstock22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0022.INVENTORY_PTR,'
      '       SUM(Data0022.QUAN_ON_HAND) AS stock'
      'FROM   Data0022 INNER JOIN Data0071 ON'
      '       Data0022.INVENTORY_PTR = Data0071.INVT_PTR'
      'where data0071.PO_PTR=:rkey'
      'GROUP BY  Data0022.INVENTORY_PTR')
    Left = 154
    Top = 136
    object ADOstock22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOstock22stock: TFloatField
      FieldName = 'stock'
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
    Left = 223
    Top = 137
    object ADO71zaituINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO71zaituDSDesigner: TFloatField
      FieldName = #22312#36884#25968#37327
    end
  end
end
