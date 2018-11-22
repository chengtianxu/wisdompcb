object DM: TDM
  OldCreateOrder = False
  Left = 574
  Top = 129
  Height = 534
  Width = 400
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 10
  end
  object AQ0068: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    OnCalcFields = AQ0068CalcFields
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
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dept_code'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT data0068.rkey,po_req_number,status,flag,req_date,'
      '       data0068.req_by,data0068.buyer_ptr,'
      '       data0068.data275_ptr,data0068.auth_date,'
      '       data0005.empl_code,data0005.employee_name,'
      '       data0015.abbr_name,data0068.ent_date,data0068.edited_date'
      'from data0068,data0005,data0015'
      'where'
      '      data0068.req_by=data0005.rkey and'
      '      data0068.whse_ptr=data0015.rkey and'
      '      data0068.status <> :v1 and'
      '      data0068.status <> :v2 and'
      '      data0068.status <> :v3 and'
      '      data0068.status <> :v4 and'
      '      data0068.status <> :v5 and'
      '      data0068.status <> :v6 and data0068.status <> :v7 and'
      '      data0068.req_date >= :dtpk1 and'
      '      data0068.req_date <= :dtpk2 and'
      '      data0068.department_name =:dept_code'
      'order by po_req_number     ')
    Left = 96
    Top = 119
    object AQ0068rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ0068po_req_number: TStringField
      FieldName = 'po_req_number'
      FixedChar = True
      Size = 15
    end
    object AQ0068status: TWordField
      FieldName = 'status'
    end
    object AQ0068flag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object AQ0068req_date: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      FieldName = 'req_date'
    end
    object AQ0068req_by: TIntegerField
      FieldName = 'req_by'
    end
    object AQ0068buyer_ptr: TIntegerField
      FieldName = 'buyer_ptr'
    end
    object AQ0068empl_code: TStringField
      FieldName = 'empl_code'
      Size = 5
    end
    object AQ0068employee_name: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'employee_name'
    end
    object AQ0068v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 16
      Calculated = True
    end
    object AQ0068v_flag: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_flag'
      Size = 10
      Calculated = True
    end
    object AQ0068data275_ptr: TIntegerField
      FieldName = 'data275_ptr'
    end
    object AQ0068auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ0068abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object AQ0068ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object AQ0068edited_date: TDateTimeField
      FieldName = 'edited_date'
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ0068
    OnDataChange = DataSource1DataChange
    Left = 32
    Top = 121
  end
  object ADO68: TADOQuery
    Connection = ADOConnection1
    CursorType = ctDynamic
    LockType = ltPessimistic
    AfterDelete = ADO68AfterDelete
    OnPostError = ADO68PostError
    Parameters = <
      item
        Name = 'key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      ' from data0068'
      'where '
      ' rkey=:key')
    Left = 96
    Top = 175
    object ADO68RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO68PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADO68USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO68REQ_BY: TIntegerField
      FieldName = 'REQ_BY'
    end
    object ADO68BUYER_PTR: TIntegerField
      FieldName = 'BUYER_PTR'
    end
    object ADO68APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object ADO68DATA275_PTR: TIntegerField
      FieldName = 'DATA275_PTR'
    end
    object ADO68AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object ADO68WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADO68NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADO68ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO68REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO68AUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
    object ADO68STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO68DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADO68FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO68EDITED_DATE: TDateTimeField
      FieldName = 'EDITED_DATE'
    end
    object ADO68EDITED_BY_USER_PTR: TIntegerField
      FieldName = 'EDITED_BY_USER_PTR'
    end
    object ADO68EDITED_BY_EMP_PTR: TIntegerField
      FieldName = 'EDITED_BY_EMP_PTR'
    end
    object ADO68TOTAL: TFloatField
      Alignment = taLeftJustify
      FieldName = 'TOTAL'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO68CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object ADO68EXCHANGE_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EXCHANGE_RATE'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
    object ADO68budget_ptr: TIntegerField
      FieldName = 'budget_ptr'
    end
    object ADO68v_year: TSmallintField
      FieldName = 'v_year'
    end
    object ADO68v_month: TSmallintField
      FieldName = 'v_month'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO68
    Left = 96
    Top = 223
  end
  object ADO69: TADOQuery
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
      'select * '
      'from'
      ' data0069'
      'where purch_req_ptr=:rkey')
    Left = 226
    Top = 162
    object ADO69RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO69PURCH_REQ_PTR: TIntegerField
      FieldName = 'PURCH_REQ_PTR'
    end
    object ADO69INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO69SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO69PO_LINK_PTR: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'PO_LINK_PTR'
    end
    object ADO69REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO69QUANTITY: TFloatField
      Alignment = taLeftJustify
      FieldName = 'QUANTITY'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO69UNIT_PRICE: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20215
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO69UNIT_PTR: TIntegerField
      DisplayLabel = #21333#20301#25351#38024
      FieldName = 'UNIT_PTR'
    end
    object ADO69CONVERSION_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.000'
    end
    object ADO69o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADO69reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#36135#26399
      FieldName = 'reply_date'
    end
    object ADO69reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO69extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object ADO69inv_part_number: TStringField
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
    object ADO69inv_part_description: TStringField
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
    object ADO69unit_code: TStringField
      FieldKind = fkLookup
      FieldName = 'unit_code'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_code'
      KeyFields = 'UNIT_PTR'
      Size = 5
      Lookup = True
    end
    object ADO69unit_name: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldKind = fkLookup
      FieldName = 'unit_name'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_name'
      KeyFields = 'UNIT_PTR'
      Lookup = True
    end
    object ADO69inv_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldKind = fkLookup
      FieldName = 'inv_number'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'inv_part_number'
      KeyFields = 'INVT_PTR'
      Size = 25
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO69
    Left = 227
    Top = 210
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
    Left = 277
    Top = 279
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 31
    Top = 61
  end
  object ADO6811: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'NPAD_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from data0011'
      'where '
      ' source_type=68 and'
      ' file_pointer=:NPAD_PTR')
    Left = 32
    Top = 281
  end
  object aq0002: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select rkey,unit_code,unit_name'
      'from data0002'
      ' order by rkey')
    Left = 217
    Top = 279
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 96
    Top = 61
  end
  object ADO204: TADOQuery
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
      'select * '
      'from'
      ' data0204'
      'where purchase_req_ptr=:rkey')
    Left = 297
    Top = 162
    object ADO204RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO204PURCHASE_REQ_PTR: TIntegerField
      FieldName = 'PURCHASE_REQ_PTR'
    end
    object ADO204DESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object ADO204GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO204DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
      Size = 40
    end
    object ADO204SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO204PO_LINK_PTR: TIntegerField
      DisplayLabel = #36135#24065
      FieldName = 'PO_LINK_PTR'
    end
    object ADO204G_L_PTR: TIntegerField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'G_L_PTR'
    end
    object ADO204QUANTITY_REQUIRED: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO204UNIT_PRICE: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21333#20215
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO204TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO204REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO204o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADO204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#36135#26399
      FieldName = 'reply_date'
    end
    object ADO204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO204UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldKind = fkLookup
      FieldName = 'UNIT_CODE'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_code'
      KeyFields = 'G_L_PTR'
      Size = 5
      Lookup = True
    end
    object ADO204UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = aq0002
      LookupKeyFields = 'rkey'
      LookupResultField = 'unit_name'
      KeyFields = 'G_L_PTR'
      Lookup = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO204
    Left = 297
    Top = 210
  end
  object AQ04: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
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
        Value = 22
      end>
    Left = 32
    Top = 225
    object AQ04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object AQ04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object AQ04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ads276: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
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
    Left = 160
    Top = 280
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
    object ads276auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
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
  end
  object DataSource5: TDataSource
    DataSet = ads276
    Left = 97
    Top = 281
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'po_req_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0017.INV_PART_NUMBER,'
      '       Data0017.INV_PART_DESCRIPTION, dbo.Data0071.QUAN_ORD,'
      '       Data0071.QUAN_RECD,data0071.rkey'
      'FROM   Data0070 INNER JOIN'
      
        '       Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR INNER' +
        ' JOIN'
      '       Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY'
      'where data0071.quan_recd>0 and'
      '      data0070.fob = :po_req_number       ')
    Left = 268
    Top = 8
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
    DataSet = ADOQuery3
    Left = 204
    Top = 9
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'po_req_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0072.DESCRIPTION,'
      '       Data0072.GUI_GE, dbo.Data0072.QUAN_ORD,'
      '       Data0072.QUANTITY_RECEIVED,data0072.rkey'
      'FROM   Data0070 INNER JOIN'
      '       Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR'
      'where  data0072.QUANTITY_RECEIVED>0 and'
      '       data0070.fob = :po_req_number')
    Left = 329
    Top = 9
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
  object ADOQuery5: TADOQuery
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
      
        'SELECT Data0456.GRN_NUMBER, dbo.Data0022.TDATE, dbo.Data0022.QUA' +
        'NTITY,'
      '       Data0015.WAREHOUSE_CODE, dbo.Data0016.LOCATION,'
      '       Data0022.BARCODE_ID, dbo.Data0456.REF_NUMBER,'
      '       Data0005.EMPLOYEE_NAME'
      'FROM   Data0456 INNER JOIN'
      
        '       Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNE' +
        'R JOIN'
      '       Data0005 ON'
      '       Data0456.CREATE_BY = dbo.Data0005.RKEY LEFT OUTER JOIN'
      '       Data0016 ON'
      '       Data0022.LOCATION_PTR = dbo.Data0016.RKEY LEFT OUTER JOIN'
      '       Data0015 ON dbo.Data0022.WHOUSE_PTR = dbo.Data0015.RKEY'
      'where data0022.source_ptr=:rkey      ')
    Left = 269
    Top = 58
    object ADOQuery5GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery5TDATE: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'TDATE'
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
    object ADOQuery5BARCODE_ID: TStringField
      DisplayLabel = #26465#24418#21527#32534#21495
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ADOQuery5REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADOQuery5EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource7: TDataSource
    DataSet = ADOQuery5
    Left = 205
    Top = 58
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
    Left = 330
    Top = 58
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
  object Aq69: TADOQuery
    Connection = ADOConnection1
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
      'SELECT Data0017.INV_NAME,Data0017.INV_DESCRIPTION,'
      '       Data0002.UNIT_NAME,Data0069.QUANTITY,'
      '       Data0069.REQ_DATE,Data0069.reply_date,'
      '       Data0069.reason,data0069.extra_req'
      'FROM   Data0069 INNER JOIN'
      '       Data0002 ON Data0069.UNIT_PTR = Data0002.RKEY INNER JOIN'
      '       Data0017 ON Data0069.INVT_PTR = Data0017.RKEY'
      'where data0069.purch_req_ptr=:rkey       ')
    Left = 90
    Top = 352
    object Aq69INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aq69INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aq69extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object Aq69UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aq69QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object Aq69REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object Aq69reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#36135#26399
      FieldName = 'reply_date'
    end
    object Aq69reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
  end
  object Aq204: TADOQuery
    Connection = ADOConnection1
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
      'SELECT  Data0204.DESCRIPTION_1, dbo.Data0204.GUI_GE,'
      '        Data0002.UNIT_NAME, dbo.Data0204.QUANTITY_REQUIRED,'
      '        Data0204.REQ_DATE, dbo.Data0204.reply_date,'
      '        Data0204.reason'
      'FROM    Data0002 INNER JOIN'
      '        Data0204 ON dbo.Data0002.RKEY = dbo.Data0204.G_L_PTR'
      'where data0204.purchase_req_ptr=:rkey        ')
    Left = 128
    Top = 352
    object Aq204DESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object Aq204GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object Aq204UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aq204QUANTITY_REQUIRED: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
    end
    object Aq204REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object Aq204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#36135#26399
      FieldName = 'reply_date'
    end
    object Aq204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
  end
  object DataSource8: TDataSource
    DataSet = Aq69
    Left = 39
    Top = 354
  end
end
