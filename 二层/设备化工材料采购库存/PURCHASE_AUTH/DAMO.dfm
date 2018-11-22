object DM: TDM
  OldCreateOrder = False
  Left = 605
  Top = 215
  Height = 474
  Width = 371
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 202
    Top = 16
  end
  object AQ0068: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    OnCalcFields = AQ0068CalcFields
    Parameters = <
      item
        Name = 'rkey731'
        DataType = ftString
        Size = 2
        Value = '64'
      end>
    SQL.Strings = (
      'SELECT Data0068.RKEY,Data0068.PO_REQ_NUMBER,Data0068.STATUS,'
      '       Data0068.BUYER_PTR,Data0068.TOTAL,'
      '       Data0068.EXCHANGE_RATE,Data0068.FLAG,Data0068.APPD_BY,'
      
        '       Data0068.DEPARTMENT_NAME,Data0068.REQ_DATE,data0276.auth_' +
        'flag,'
      '       data0276.auth_date,data0276.ranking,Data0015.ABBR_NAME,'
      '       Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME,'
      
        '       Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,data0276.user_p' +
        'tr,'
      '       Data0362.CODE AS bud_code,Data0362.DESCRIPTION,'
      '       Data0094.CODE,Data0094.PURCHASE_APPROV_DESC,'
      '       Data0073.USER_FULL_NAME,data0068.edited_date'
      'FROM   Data0068 INNER JOIN'
      
        '       Data0094 ON Data0068.AUTH_TYPE = dbo.Data0094.RKEY INNER ' +
        'JOIN'
      
        '       Data0015 ON Data0068.WHSE_PTR = dbo.Data0015.RKEY INNER J' +
        'OIN'
      
        '       Data0005 ON Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOI' +
        'N'
      
        '       Data0362 ON Data0068.budget_ptr = dbo.Data0362.RKEY INNER' +
        ' JOIN'
      
        '       data0276 ON Data0068.RKEY = dbo.data0276.purchase_ptr INN' +
        'ER JOIN'
      '       Data0073 ON data0276.user_ptr = dbo.Data0073.RKEY'
      'WHERE  (Data0068.STATUS = 1) and (data0276.auth_date is null)'
      '  AND (data0276.auth_flag='#39'Y'#39')'
      ''
      
        '  and (data0276.user_ptr IN (SELECT rkey FROM data0073 WHERE rpl' +
        '_pr_ptr = :RKEY731))'
      '')
    Left = 96
    Top = 71
    object AQ0068rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ0068po_req_number: TStringField
      FieldName = 'po_req_number'
      FixedChar = True
      Size = 15
    end
    object AQ0068abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object AQ0068empl_code: TStringField
      DisplayLabel = #38656#27714#20154#20195#30721
      FieldName = 'empl_code'
      Size = 5
    end
    object AQ0068EMPLOYEE_NAME: TStringField
      DisplayLabel = #38656#27714#20154#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ0068department_name: TStringField
      FieldName = 'department_name'
      Size = 10
    end
    object AQ0068req_date: TDateTimeField
      FieldName = 'req_date'
    end
    object AQ0068total: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object AQ0068exchange_rate: TFloatField
      FieldName = 'exchange_rate'
      DisplayFormat = '0.00000'
    end
    object AQ0068buyer_ptr: TIntegerField
      FieldName = 'buyer_ptr'
    end
    object AQ0068warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object AQ0068warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 30
    end
    object AQ0068code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object AQ0068purchase_approv_desc: TStringField
      FieldName = 'purchase_approv_desc'
      Size = 40
    end
    object AQ0068buyer_empl_code: TStringField
      DisplayLabel = #37319#36141#20154#21592#20195#30721
      FieldKind = fkLookup
      FieldName = 'buyer_empl_code'
      LookupDataSet = AQ0005
      LookupKeyFields = 'rkey'
      LookupResultField = 'empl_code'
      KeyFields = 'buyer_ptr'
      Size = 5
      Lookup = True
    end
    object AQ0068buyer_empl_name: TStringField
      DisplayLabel = #37319#36141#20154#21592#22995#21517
      FieldKind = fkLookup
      FieldName = 'buyer_empl_name'
      LookupDataSet = AQ0005
      LookupKeyFields = 'rkey'
      LookupResultField = 'employee_name'
      KeyFields = 'buyer_ptr'
      Size = 16
      Lookup = True
    end
    object AQ0068flag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object AQ0068v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 8
      Calculated = True
    end
    object AQ0068status: TWordField
      FieldName = 'status'
    end
    object AQ0068appd_by: TIntegerField
      FieldName = 'appd_by'
    end
    object AQ0068bud_code: TStringField
      FieldName = 'bud_code'
      Size = 10
    end
    object AQ0068DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object AQ0068auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ0068ranking: TWordField
      FieldName = 'ranking'
    end
    object AQ0068v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object AQ0068USER_FULL_NAME: TStringField
      DisplayLabel = #24403#21069#23457#25209#20154
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object AQ0068edited_date: TDateTimeField
      FieldName = 'edited_date'
    end
    object AQ0068user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object AQ0068auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ0068
    OnDataChange = DataSource1DataChange
    Left = 36
    Top = 71
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 38
    Top = 23
  end
  object AQ0005: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'Select rkey,empl_code,employee_name'
      'from data0005'
      'order by rkey')
    Left = 204
    Top = 66
  end
  object aq69: TADOQuery
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
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER AS inv_number,'
      
        '      Data0017.INV_NAME AS INV_PART_NUMBER,Data0069.req_QUANTITY' +
        ','
      '      Data0017.INV_DESCRIPTION AS INV_PART_DESCRIPTION,'
      '      Data0069.UNIT_PRICE, Data0069.o_i_flag,'
      
        '      Data0069.reply_date, Data0023.ABBR_NAME, Data0069.INVT_PTR' +
        ','
      '      Data0001.CURR_NAME, Data0002.UNIT_NAME, Data0069.REQ_DATE,'
      '      Data0496.GROUP_DESC, data0019.inv_group_desc,data0069.tax,'
      '      Data0069.reason,data0069.extra_req,data0069.tax_price'
      'FROM dbo.Data0069 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.data0019 ON dbo.Data0496.GROUP_PTR = dbo.data0019.rkey' +
        ' LEFT OUTER JOIN'
      
        '      Data0002 ON dbo.Data0069.req_UNIT_PTR = dbo.Data0002.RKEY ' +
        'LEFT OUTER JOIN'
      '      dbo.Data0023 ON '
      '      dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0069.PO_LINK_PTR = dbo.Data0001.RK' +
        'EY'
      'where  data0069.PURCH_REQ_PTR=:rkey')
    Left = 96
    Top = 120
    object aq69inv_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'inv_number'
      Size = 25
    end
    object aq69inv_part_number: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'inv_part_number'
      Size = 30
    end
    object aq69inv_part_description: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'inv_part_description'
      Size = 70
    end
    object aq69UNIT_NAME: TStringField
      DisplayLabel = #35831#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aq69unit_price: TFloatField
      DisplayLabel = #37319#36141#20215#26684
      FieldName = 'unit_price'
      DisplayFormat = '0.000'
    end
    object aq69code: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq69curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object aq69REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#20132#26399
      FieldName = 'REQ_DATE'
    end
    object aq69reply_DATE: TDateTimeField
      DisplayLabel = #22238#22797#21040#36135#26085#26399
      FieldName = 'reply_DATE'
    end
    object aq69inv_group_desc: TStringField
      DisplayLabel = #29289#26009#31867#21035
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object aq69GROUP_DESC: TStringField
      DisplayLabel = #29289#26009#23376#31867#21035
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aq69reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object aq69o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object aq69INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object aq69stack_qty: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldKind = fkLookup
      FieldName = 'stack_qty'
      LookupDataSet = ADOstock22
      LookupKeyFields = 'INVENTORY_PTR'
      LookupResultField = 'stock'
      KeyFields = 'INVT_PTR'
      Lookup = True
    end
    object aq69quantity_zaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldKind = fkLookup
      FieldName = 'quantity_zaitu'
      LookupDataSet = ADO71zaitu
      LookupKeyFields = 'INVT_PTR'
      LookupResultField = #22312#36884#25968#37327
      KeyFields = 'INVT_PTR'
      Lookup = True
    end
    object aq69extra_req: TStringField
      DisplayLabel = #29305#27530#35828#26126
      FieldName = 'extra_req'
      Size = 60
    end
    object aq69tax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax'
      Precision = 4
      Size = 2
    end
    object aq69req_QUANTITY: TBCDField
      DisplayLabel = #35831#36141#25968#37327
      FieldName = 'req_QUANTITY'
      Precision = 9
      Size = 3
    end
    object aq69tax_price: TFloatField
      DisplayLabel = #35831#36141#20215#26684
      FieldName = 'tax_price'
    end
  end
  object DataSource2: TDataSource
    DataSet = aq69
    Left = 36
    Top = 120
  end
  object aq204: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aq204CalcFields
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
      'SELECT Data0023.ABBR_NAME,Data0204.GUI_GE,Data0204.o_i_flag,'
      '      Data0204.DESCRIPTION_1,Data0204.DESCRIPTION_2,'
      
        '      Data0204.QUANTITY_REQUIRED,Data0204.UNIT_PRICE,data0204.ta' +
        'x,'
      '      Data0204.REQ_DATE, Data0001.CURR_NAME, Data0204.reason,'
      '      Data0204.reply_date, Data0002.UNIT_NAME,data0204.tax_price'
      'FROM dbo.Data0204 LEFT OUTER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0204.G_L_PTR = dbo.Data0002.RKEY L' +
        'EFT OUTER JOIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0204.PO_LINK_PTR = dbo.Data0001.RKEY LEFT OUTER JO' +
        'IN'
      
        '      dbo.Data0023 ON dbo.Data0204.SUPPLIER_PTR = dbo.Data0023.R' +
        'KEY'
      'where  data0204.purchase_req_ptr=:rkey')
    Left = 97
    Top = 171
    object aq204DESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 40
    end
    object aq204gui_ge: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'gui_ge'
      Size = 200
    end
    object aq204DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
    end
    object aq204QUANTITY_REQUIRED: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
      DisplayFormat = '0.000'
    end
    object aq204UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aq204unit_price: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'unit_price'
      DisplayFormat = '0.000'
    end
    object aq204abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq204req_date: TDateTimeField
      DisplayLabel = #35201#27714#20132#26399
      FieldName = 'req_date'
    end
    object aq204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object aq204curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object aq204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object aq204o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object aq204in_out: TStringField
      DisplayLabel = #37319#36141#22320#28857
      FieldKind = fkCalculated
      FieldName = 'in_out'
      Size = 4
      Calculated = True
    end
    object aq204tax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax'
      Precision = 4
      Size = 2
    end
    object aq204tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
  end
  object DataSource3: TDataSource
    DataSet = aq204
    Left = 36
    Top = 174
  end
  object ads276: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ads276CalcFields
    ProcedureName = 'ep057;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@purch_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 35
      end>
    Left = 97
    Top = 227
    object ads276USER_ID: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      DisplayWidth = 12
      FieldName = 'USER_ID'
      Size = 10
    end
    object ads276USER_FULL_NAME: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      DisplayWidth = 30
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads276auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      DisplayWidth = 22
      FieldName = 'auth_date'
    end
    object ads276ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      DisplayWidth = 13
      FieldName = 'ranking'
    end
    object ads276user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ads276auth_flag: TStringField
      DisplayLabel = #24403#21069#23457#25209
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ads276auth_type: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_type'
      Size = 6
      Calculated = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ads276
    Left = 35
    Top = 226
  end
  object AQ106811: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctDynamic
    LockType = ltPessimistic
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
        Value = 1068
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 96
    Top = 24
  end
  object ADOstdprice: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOstdpriceCalcFields
    DataSource = DataSource2
    Parameters = <
      item
        Name = 'invt_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 10 Data0069.QUANTITY, dbo.Data0069.UNIT_PRICE,'
      '       Data0069.REQ_DATE, dbo.Data0002.UNIT_NAME,'
      '       Data0001.CURR_NAME, dbo.Data0023.ABBR_NAME,'
      '       Data0069.o_i_flag'
      'FROM   Data0069 INNER JOIN'
      
        '       Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY INN' +
        'ER JOIN'
      '       Data0001 ON'
      '       Data0069.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'
      '       Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY'
      'WHERE  (dbo.Data0069.INVT_PTR = :invt_ptr)'
      'ORDER BY  dbo.Data0069.REQ_DATE DESC')
    Left = 224
    Top = 168
    object ADOstdpriceQUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOstdpriceUNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'UNIT_PRICE'
    end
    object ADOstdpriceREQ_DATE: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADOstdpriceUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOstdpriceCURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOstdpriceABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOstdpriceo_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADOstdpricein_out: TStringField
      DisplayLabel = #37319#36141#22320#28857
      FieldKind = fkCalculated
      FieldName = 'in_out'
      Size = 4
      Calculated = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADOstdprice
    Left = 160
    Top = 168
  end
  object ADOmicprice: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOmicpriceCalcFields
    Parameters = <
      item
        Name = 'desc_1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 60
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 10 Data0204.DESCRIPTION_1, dbo.Data0204.GUI_GE,'
      '       Data0204.QUANTITY_REQUIRED, dbo.Data0204.UNIT_PRICE,'
      
        '       Data0204.REQ_DATE, dbo.Data0204.o_i_flag, dbo.Data0001.CU' +
        'RR_NAME,'
      '       Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME'
      'FROM   Data0204 INNER JOIN'
      '       Data0001 ON'
      '       Data0204.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'
      '       Data0023 ON'
      '       Data0204.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'
      '       Data0002 ON dbo.Data0204.G_L_PTR = dbo.Data0002.RKEY'
      'where  Data0204.DESCRIPTION_1 like :desc_1'
      'ORDER BY  dbo.Data0204.REQ_DATE DESC')
    Left = 224
    Top = 223
    object ADOmicpriceDESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object ADOmicpriceGUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADOmicpriceQUANTITY_REQUIRED: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
    end
    object ADOmicpriceUNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'UNIT_PRICE'
    end
    object ADOmicpriceREQ_DATE: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADOmicpriceo_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADOmicpriceCURR_NAME: TStringField
      DisplayLabel = #36135#24065#31181#31867
      FieldName = 'CURR_NAME'
    end
    object ADOmicpriceABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOmicpriceUNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOmicpricein_out: TStringField
      DisplayLabel = #37319#36141#22320#28857
      FieldKind = fkCalculated
      FieldName = 'in_out'
      Size = 4
      Calculated = True
    end
  end
  object DataSource6: TDataSource
    DataSet = ADOmicprice
    Left = 160
    Top = 224
  end
  object DataSource7: TDataSource
    DataSet = ADO28
    Left = 161
    Top = 280
  end
  object ADO28: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO28CalcFields
    DataSource = DataSource2
    Parameters = <
      item
        Name = 'invt_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0028.PRICE_1, dbo.Data0028.AVL_FLAG, dbo.Data0028' +
        '.LEAD_TIME, '
      
        '      dbo.Data0028.TAX_2, dbo.Data0001.CURR_NAME, dbo.Data0002.U' +
        'NIT_NAME, '
      '      dbo.Data0023.ABBR_NAME'
      'FROM dbo.Data0028 INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.R' +
        'KEY'
      'where data0028.INVENTORY_PTR=:invt_ptr')
    Left = 224
    Top = 280
    object ADO28PRICE_1: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE_1'
    end
    object ADO28AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO28LEAD_TIME: TSmallintField
      DisplayLabel = #20132#36135#26102#38388'('#22825')'
      FieldName = 'LEAD_TIME'
    end
    object ADO28TAX_2: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
    end
    object ADO28CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADO28UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO28ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO28avl_type: TStringField
      DisplayLabel = #36164#26684#35748#21487
      FieldKind = fkCalculated
      FieldName = 'avl_type'
      Size = 8
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
      'FROM   Data0022 INNER JOIN Data0069 ON'
      '       Data0022.INVENTORY_PTR = Data0069.INVT_PTR'
      'where data0069.PURCH_REQ_PTR=:rkey'
      'GROUP BY  Data0022.INVENTORY_PTR')
    Left = 159
    Top = 118
  end
  object ADO71zaitu: TADOQuery
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
      'SELECT dbo.Data0071.INVT_PTR,'
      
        '      SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD + dbo.D' +
        'ata0071.QUAN_RETN)'
      '       AS '#22312#36884#25968#37327
      'FROM dbo.Data0071 INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0069 ON dbo.Data0071.INVT_PTR = dbo.Data0069.INVT_' +
        'PTR'
      
        'WHERE (dbo.Data0070.STATUS = 5) AND (dbo.Data0069.PURCH_REQ_PTR ' +
        '= :rkey)'
      'GROUP BY dbo.Data0071.INVT_PTR')
    Left = 223
    Top = 118
    object ADO71zaituINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO71zaituDSDesigner: TFloatField
      FieldName = #22312#36884#25968#37327
    end
  end
end
