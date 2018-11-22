object DM: TDM
  OldCreateOrder = False
  Left = 1049
  Top = 256
  Height = 430
  Width = 367
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTa64
    Left = 24
    Top = 63
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 220
    Top = 18
  end
  object ADO192: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select data0192.unit_ptr,data0192.custcoship,'
      'data0002.unit_code,data0002.unit_name'
      'from data0192 inner join data0002'
      '     on data0192.unit_ptr=data0002.rkey')
    Left = 95
    Top = 122
    object ADO192unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO192unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADO192unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO192custcoship: TStringField
      FieldName = 'custcoship'
      FixedChar = True
      Size = 1
    end
  end
  object ADO0439: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT'#9'data0439.* ,'
      
        '        data0010.cust_code,data0010.customer_name,data0010.APPLY' +
        '_IN_TRANSIT,'
      
        '        data0012.location,data0012.SHIP_TO_CONTACT,data0010.cod_' +
        'flag,data0012.overship_flag,'
      
        '        data0005.employee_name,data0012.SHIP_TO_FAX,data0015.war' +
        'ehouse_code,'
      
        'data0015.abbr_name,(case when data0439.invoice_ptr is null then ' +
        #39'N'#39' else '#39'Y'#39' end) invoice'
      ''
      
        'from data0439 inner join data0010 on data0439.customer_ptr=data0' +
        '010.rkey'
      
        '              inner join data0012 on data0439.ship_addr_ptr=data' +
        '0012.rkey'
      
        '              inner join data0005 on data0439.employee_ptr=data0' +
        '005.rkey left join data0015 on data0439.warehouse_ptr=data0015.r' +
        'key')
    Left = 96
    Top = 181
    object ADO0439rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0439delivery_no: TStringField
      DisplayLabel = #35013#36816#32534#21495
      FieldName = 'delivery_no'
      FixedChar = True
      Size = 15
    end
    object ADO0439customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO0439ship_addr_ptr: TIntegerField
      FieldName = 'ship_addr_ptr'
    end
    object ADO0439employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
    object ADO0439shipping_method: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'shipping_method'
    end
    object ADO0439cartons_no: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #35013#36816#31665#25968
      FieldName = 'cartons_no'
    end
    object ADO0439weight: TFloatField
      Alignment = taLeftJustify
      FieldName = 'weight'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO0439net_weight: TFloatField
      Alignment = taLeftJustify
      FieldName = 'net_weight'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO0439date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'date_sailing'
      DisplayFormat = 'yyyy-mm-dd'
      EditMask = '!0000-!90-90;1;_'
    end
    object ADO0439cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO0439customer_name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'customer_name'
      Size = 100
    end
    object ADO0439location: TStringField
      DisplayLabel = #35013#36816#22320#22336
      FieldName = 'location'
    end
    object ADO0439employee_name: TStringField
      DisplayLabel = #35013#36816#21592#24037
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO0439date_ent: TDateTimeField
      FieldName = 'date_ent'
    end
    object ADO0439unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO0439charge: TFloatField
      Alignment = taLeftJustify
      FieldName = 'charge'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO0439fob: TStringField
      DisplayLabel = #20132#36135#31665#23610#23544
      FieldName = 'fob'
      Size = 50
    end
    object ADO0439reference_number: TStringField
      DisplayLabel = #21253#35013#31665#23610#23544
      FieldName = 'reference_number'
      Size = 50
    end
    object ADO0439invoice_ptr: TIntegerField
      FieldName = 'invoice_ptr'
    end
    object ADO0439currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO0439SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADO0439SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
      Size = 14
    end
    object ADO0439Remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 50
    end
    object ADO0439C_N: TIntegerField
      FieldName = 'C_N'
    end
    object ADO0439print_date: TDateTimeField
      DisplayLabel = #25171#21360#26085#26399
      FieldName = 'print_date'
    end
    object ADO0439fh_location: TStringField
      DisplayLabel = #21457#36135#22320#28857
      FieldName = 'fh_location'
      Size = 50
    end
    object ADO0439Remark_bak: TStringField
      FieldName = 'Remark_bak'
      Size = 50
    end
    object ADO0439APPLY_IN_TRANSIT: TWordField
      DisplayLabel = #35013#31665#21333#26684#24335
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object ADO0439cod_flag: TStringField
      DisplayLabel = #36135#21040#20184#27454
      FieldName = 'cod_flag'
      FixedChar = True
      Size = 1
    end
    object ADO0439abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO0439invoice: TStringField
      DisplayLabel = #20986#21457#31080#21542
      FieldName = 'invoice'
      ReadOnly = True
      Size = 1
    end
    object ADO0439warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO0439warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO0439AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object ADO0439TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADO0439shipadvice_ptr: TIntegerField
      FieldName = 'shipadvice_ptr'
    end
    object ADO0439ShipRemark: TMemoField
      FieldName = 'ShipRemark'
      BlobType = ftMemo
    end
    object ADO0439SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO0439SALES_REP_Date: TDateTimeField
      FieldName = 'SALES_REP_Date'
    end
    object ADO0439depotAccept_PTR: TIntegerField
      FieldName = 'depotAccept_PTR'
    end
    object ADO0439depotAccept_Date: TDateTimeField
      FieldName = 'depotAccept_Date'
    end
    object ADO0439depotAccept_Remark: TStringField
      FieldName = 'depotAccept_Remark'
      Size = 50
    end
    object ADO0439depotSubmit_PTR: TIntegerField
      FieldName = 'depotSubmit_PTR'
    end
    object ADO0439depotSubmit_Date: TDateTimeField
      FieldName = 'depotSubmit_Date'
    end
    object ADO0439Finance_PTR: TIntegerField
      FieldName = 'Finance_PTR'
    end
    object ADO0439Finance_Date: TDateTimeField
      FieldName = 'Finance_Date'
    end
    object ADO0439Finance_Remark: TStringField
      FieldName = 'Finance_Remark'
      Size = 50
    end
    object ADO0439iStatus: TWordField
      FieldName = 'iStatus'
    end
    object ADO0439overship_flag: TWordField
      FieldName = 'overship_flag'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO0439
    Left = 32
    Top = 183
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 221
    Top = 67
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 296
    Top = 18
  end
  object ADO04: TADOStoredProc
    Connection = ADOConnection1
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
        Value = 26
      end>
    Left = 152
    Top = 66
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
  object aq43911: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 439
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 120
  end
  object ADOQuery4: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'ep031;3'
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
        Value = 57
      end>
    Left = 298
    Top = 67
    object ADOQuery4rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery4so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQuery4packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object ADOQuery4packing_slip_flag: TStringField
      FieldName = 'packing_slip_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery4sales_order: TStringField
      DisplayWidth = 12
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADOQuery4po_number: TStringField
      FieldName = 'po_number'
      Size = 25
    end
    object ADOQuery4po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ADOQuery4employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQuery4DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADOQuery4QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADOQuery4ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object ADOQuery4fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object ADOQuery4REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object ADOQuery4weigth: TFloatField
      DisplayLabel = #37325#37327
      FieldName = 'weigth'
      ReadOnly = True
    end
    object ADOQuery4MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery4MANU_PART_DESC: TStringField
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery4assigntype: TStringField
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
  end
  object ADOTa64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT'
      
        ' Data0060.SALES_ORDER, Data0060.COMMISION_ON_TOOLING, Data0060.S' +
        'CH_DATE, Data0060.ITEM_NBR, '
      
        ' Data0010.COD_FLAG, Data0060.RKEY AS rkey60, Data0060.PARTS_ORDE' +
        'RED, Data0060.PARTS_SHIPPED,'
      
        ' Data0060.PARTS_RETURNED, Data0060.SHIPPING_METHOD, Data0060.CUR' +
        'RENCY_PTR, Data0060.PART_PRICE, '
      
        ' Data0060.STATUS, data0060.fob, data0060.REFERENCE_NUMBER, Data0' +
        '060.CUST_SHIP_ADDR_PTR, Data0060.CUSTOMER_PTR, '
      
        ' Data0060.PURCHASE_ORDER_PTR, Data0060.CUST_PART_PTR, data0015.r' +
        'key rkey15, data0015.WAREHOUSE_CODE, data0015.abbr_name, '
      
        ' Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC, Data0025.OR' +
        'IG_CUSTOMER, Data0010.CUST_CODE, Data0010.CUSTOMER_NAME, data001' +
        '0.DO_SMOOTHING, '
      
        ' data0010.INVOICE_NOTE_PAD_PTR, data0010.CUSTOMER_TYPE, Data0064' +
        '.SHIPMENT_NO, Data0064.QUAN_SHIPPED, '
      
        ' Data0064.DATE_ASSIGN, data0064.ovsh_discount, Data0064.DATE_SHI' +
        'PPED, Data0064.PACKING_SLIP_FLAG, Data0064.QUAN_SHIPPED * Data00' +
        '60.PART_PRICE AS total_case, '
      
        ' Data0064.RKEY AS rkey64, Data0064.packing_list_ptr, Data0064.QU' +
        'AN_SHIPPED*data0064.REPORT_UNIT_VALUE1*0.0001 as weigth, case da' +
        'ta0064.assign_type when 0 then '#39#27491#24120#39' when 1 then '#39#36864#36135#39' end as assi' +
        'gntype, '
      
        ' Data0012.SHIP_TO_ADDRESS_1, Data0012.SHIP_TO_CONTACT, Data0012.' +
        'ZIP, Data0012.SHIP_TO_PHONE, Data0012.LOCATION, Data0012.STATE, '
      
        'Data0097.OPEN_SOS, Data0097.PO_DATE, Data0097.PO_NUMBER, Data000' +
        '1.CURR_CODE, Data0001.CURR_NAME, Data0005.EMPLOYEE_NAME'
      
        'FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.' +
        'RKEY INNER JOIN'
      ' Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
      ' Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN'
      ' Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY INNER JOIN'
      
        ' Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER J' +
        'OIN'
      ' Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY INNER JOIN'
      
        ' Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY inner j' +
        'oin data0015 on data0060.SHIP_REG_TAX_ID=data0015.rkey'
      'WHERE (Data0064.PACKING_SLIP_FLAG = '#39'0'#39')'
      ' and data0064.rkey not in (0)'
      'and data0015.WAREHOUSE_CODE like '#39'%%'#39
      'and Data0060.CUSTOMER_PTR > 0'
      'ORDER BY Data0060.SALES_ORDER, Data0064.SHIPMENT_NO'
      '')
    Left = 94
    Top = 64
    object ADOTa64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOTa64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADOTa64ITEM_NBR: TStringField
      FieldName = 'ITEM_NBR'
      FixedChar = True
      Size = 5
    end
    object ADOTa64COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOTa64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOTa64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADOTa64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ADOTa64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADOTa64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOTa64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADOTa64STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOTa64fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object ADOTa64REFERENCE_NUMBER: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object ADOTa64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOTa64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 45
    end
    object ADOTa64rkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADOTa64SHIPMENT_NO: TSmallintField
      DisplayLabel = #25209#27425
      FieldName = 'SHIPMENT_NO'
    end
    object ADOTa64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      Precision = 4
      Size = 2
    end
    object ADOTa64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object ADOTa64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADOTa64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ADOTa64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOTa64total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADOTa64rkey64: TAutoIncField
      FieldName = 'rkey64'
      ReadOnly = True
    end
    object ADOTa64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object ADOTa64SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 70
    end
    object ADOTa64SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADOTa64SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
      Size = 14
    end
    object ADOTa64LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADOTa64STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADOTa64ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object ADOTa64OPEN_SOS: TSmallintField
      FieldName = 'OPEN_SOS'
    end
    object ADOTa64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOTa64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOTa64CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOTa64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOTa64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOTa64CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object ADOTa64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOTa64PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ADOTa64CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOTa64INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ADOTa64weigth: TFloatField
      FieldName = 'weigth'
      ReadOnly = True
    end
    object ADOTa64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object ADOTa64MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOTa64MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOTa64assigntype: TStringField
      DisplayLabel = #25351#27966
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
    object ADOTa64DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADOTa64rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADOTa64WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOTa64abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOTa64CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ADOTa64ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
  end
  object ADOup64: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey64'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select remark from data0064'
      'where rkey=:rkey64')
    Left = 208
    Top = 192
    object ADOup64remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADO6411: TADOStoredProc
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
        Value = 64
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 272
    Top = 192
    object ADO6411RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO6411FILE_POINTER: TIntegerField
      FieldName = 'FILE_POINTER'
    end
    object ADO6411SOURCE_TYPE: TSmallintField
      FieldName = 'SOURCE_TYPE'
    end
    object ADO6411NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO6411NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO6411NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO6411NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object ADO6411memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object ADOupdate52: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 298
    Top = 128
  end
  object dspcmp: TDataSetProvider
    Left = 56
    Top = 328
  end
  object cds439cmpold: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 272
  end
  object cds64cmpold: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 328
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 328
  end
  object cds439cmpnow: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 264
  end
  object cds64cmpnow: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 328
  end
end
