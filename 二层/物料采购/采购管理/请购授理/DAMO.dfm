object DM: TDM
  OldCreateOrder = False
  Left = 600
  Top = 276
  Height = 505
  Width = 453
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=172.18.8.37'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 35
    Top = 7
  end
  object AQ0068: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
        Value = 0
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
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
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37257d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37987d
      end
      item
        Name = 'v7'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 7
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT data0068.rkey,po_req_number,status,flag,req_date,data0068' +
        '.TOTAL,'
      
        '       data0068.req_by,data0068.buyer_ptr,data0068.APPD_BY,data0' +
        '068.AUTH_TYPE,'
      
        '       data0068.department_name,data0068.data275_ptr,data0068.ED' +
        'ITED_DATE,'
      
        '       data0005.empl_code,data0005.employee_name,data0068.auth_d' +
        'ate,'
      
        '       data0015.abbr_name,data0068.user_name,data0068.user_phone' +
        ','
      
        '       case data0068.flag when '#39'S'#39' then '#39#29983#20135#29289#26009#39' when '#39'M'#39' then '#39#38750#29983 +
        #20135#29289#26009#39' end as v_flag,'
      
        '       case data0068.status when 1 then '#39#24453#23457#25209#39' when 2 then '#39#24453#37319#36141#39' ' +
        'when 3 then '#39#24050#25209#20934#39' when 4 then '#39#34987#36864#22238#39
      
        '      when 5 then '#39#35831#36141#21333#24050#25764#28040#39' when 6 then '#39#35831#36141#21333#24050#22788#29702#39' when 7 then '#39#26410#25552#20132 +
        #39' end as v_status, dbo.Data0034.DEPT_NAME'
      'FROM  dbo.Data0034 INNER JOIN'
      
        '           dbo.Data0068 ON dbo.Data0034.DEPT_CODE = dbo.Data0068' +
        '.DEPARTMENT_NAME CROSS JOIN'
      '           dbo.Data0015 CROSS JOIN'
      '           dbo.Data0005'
      'where data0068.WHSE_PTR=data0015.rkey and'
      '      data0068.req_by=data0005.rkey and'
      '      data0068.status <> :v1 and'
      '      data0068.status <> :v2 and'
      '      data0068.status <> :v3 and'
      '      data0068.status <> :v4 and'
      '      data0068.status <> :v5 and'
      '      data0068.status <> :v6 and'
      '      data0068.req_date >= :dtpk1 and'
      '      data0068.req_date <= :dtpk2 and data0068.status <> :v7'
      '  ')
    Left = 99
    Top = 114
    object AQ0068rkey: TAutoIncField
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
    object AQ0068department_name: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'department_name'
      Size = 10
    end
    object AQ0068data275_ptr: TIntegerField
      FieldName = 'data275_ptr'
    end
    object AQ0068auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ0068TOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object AQ0068APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object AQ0068AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object AQ0068abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object AQ0068user_name: TStringField
      DisplayLabel = #20351#29992#20154#21592
      FieldName = 'user_name'
      Size = 50
    end
    object AQ0068user_phone: TStringField
      DisplayLabel = #20351#29992#20154#21592#30005#35805
      FieldName = 'user_phone'
    end
    object AQ0068EDITED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EDITED_DATE'
    end
    object AQ0068v_flag: TStringField
      FieldName = 'v_flag'
      ReadOnly = True
      Size = 10
    end
    object AQ0068v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 12
    end
    object AQ0068DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ0068
    OnDataChange = DataSource1DataChange
    Left = 35
    Top = 114
  end
  object AQ0005: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select rkey,empl_code,employee_name'
      'from data0005'
      'order by empl_code')
    Left = 80
    Top = 296
  end
  object ADO68: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
    Left = 99
    Top = 167
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
    object ADO68REQ_TYPE: TStringField
      FieldName = 'REQ_TYPE'
      FixedChar = True
      Size = 1
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
    object ADO68user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object ADO68user_phone: TStringField
      FieldName = 'user_phone'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO68
    Left = 38
    Top = 167
  end
  object ADO69: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnNewRecord = ADO69NewRecord
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
    Left = 237
    Top = 166
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
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
    object ADO69UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO69CONVERSION_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.000'
    end
    object ADO69o_i_flag: TWordField
      DisplayLabel = #22269#22788#22269#20869#37319#36141
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
      Size = 50
    end
    object ADO69avl_flag: TStringField
      DisplayLabel = #26159#21542#36890#36807#35748#21487
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADO69tax: TBCDField
      Alignment = taLeftJustify
      FieldName = 'tax'
      DisplayFormat = '0.00'
      Precision = 4
      Size = 2
    end
    object ADO69tax_price: TFloatField
      Alignment = taLeftJustify
      FieldName = 'tax_price'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO69rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO69req_unit_ptr: TIntegerField
      FieldName = 'req_unit_ptr'
    end
    object ADO69IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object ADO69status: TBooleanField
      DisplayLabel = #23548#20837
      FieldName = 'status'
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
    object ADO69supplier_code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldKind = fkLookup
      FieldName = 'supplier_code'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'code'
      KeyFields = 'SUPP_PTR'
      Size = 10
      Lookup = True
    end
    object ADO69abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldKind = fkLookup
      FieldName = 'abbr_name'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'abbr_name'
      KeyFields = 'SUPP_PTR'
      Size = 16
      Lookup = True
    end
    object ADO69supplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplier_name'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'supplier_name'
      KeyFields = 'SUPP_PTR'
      Size = 100
      Lookup = True
    end
    object ADO69unit_code: TStringField
      DisplayLabel = #37319#36141#20195#30721
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
    object ADO69curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldKind = fkLookup
      FieldName = 'curr_name'
      LookupDataSet = aq0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_name'
      KeyFields = 'PO_LINK_PTR'
      Lookup = True
    end
    object ADO69base_to: TFloatField
      FieldKind = fkLookup
      FieldName = 'base_to'
      LookupDataSet = aq0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'base_to_other'
      KeyFields = 'PO_LINK_PTR'
      Lookup = True
    end
    object ADO69CRITICAL_MATL: TStringField
      DisplayLabel = #37325#35201
      FieldKind = fkLookup
      FieldName = 'CRITICAL_MATL'
      LookupDataSet = aq0017
      LookupKeyFields = 'rkey'
      LookupResultField = 'CRITICAL_MATL'
      KeyFields = 'INVT_PTR'
      Size = 2
      Lookup = True
    end
    object ADO69IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object ADO69req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
    object ADO69ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO69
    Left = 243
    Top = 225
  end
  object aq0017: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select'
      
        ' rkey,inv_part_number,inv_part_description,inv_name,inv_descript' +
        'ion,'
      
        'case CRITICAL_MATL_FLAG when 0 then '#39#21542#39' when 1 then '#39#26159#39' end as C' +
        'RITICAL_MATL'
      'from'
      ' data0017'
      'order by rkey')
    Left = 269
    Top = 296
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 34
    Top = 64
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
      ' file_pointer=:NPAD_PTR and'
      ' source_type=68')
    Left = 166
    Top = 226
  end
  object aq0023: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select'
      ' rkey,code,supplier_name,abbr_name'
      'from '
      ' data0023'
      'order by rkey')
    Left = 221
    Top = 296
  end
  object aq0002: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select rkey,unit_code,unit_name'
      'from data0002'
      ' order by rkey')
    Left = 173
    Top = 296
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 99
    Top = 65
  end
  object ADO362: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'budget_ptr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0362'
      ' where rkey=:budget_ptr')
    Left = 31
    Top = 296
  end
  object ADO204: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnNewRecord = ADO204NewRecord
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
    Left = 308
    Top = 165
    object ADO204RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO204PURCHASE_REQ_PTR: TIntegerField
      FieldName = 'PURCHASE_REQ_PTR'
    end
    object ADO204DESCRIPTION_1: TStringField
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object ADO204GUI_GE: TStringField
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO204DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
    end
    object ADO204SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO204PO_LINK_PTR: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'PO_LINK_PTR'
    end
    object ADO204G_L_PTR: TIntegerField
      DisplayLabel = #37319#36141#21333#20301#25351#38024
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
      FieldName = 'UNIT_PRICE'
    end
    object ADO204TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO204REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO204o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADO204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object ADO204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO204tax: TBCDField
      Alignment = taLeftJustify
      FieldName = 'tax'
      DisplayFormat = '0.00'
      Precision = 4
      Size = 2
    end
    object ADO204tax_price: TFloatField
      Alignment = taLeftJustify
      FieldName = 'tax_price'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO204rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO204status: TBooleanField
      DisplayLabel = #23548#20837
      FieldName = 'status'
    end
    object ADO204supp_code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldKind = fkLookup
      FieldName = 'supp_code'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'code'
      KeyFields = 'SUPPLIER_PTR'
      Size = 10
      Lookup = True
    end
    object ADO204abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldKind = fkLookup
      FieldName = 'abbr_name'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'abbr_name'
      KeyFields = 'SUPPLIER_PTR'
      Size = 16
      Lookup = True
    end
    object ADO204supp_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supp_name'
      LookupDataSet = aq0023
      LookupKeyFields = 'rkey'
      LookupResultField = 'supplier_name'
      KeyFields = 'SUPPLIER_PTR'
      Size = 100
      Lookup = True
    end
    object ADO204curr_name: TStringField
      DisplayLabel = #36135#24065#31181#31867
      FieldKind = fkLookup
      FieldName = 'curr_name'
      LookupDataSet = aq0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_name'
      KeyFields = 'PO_LINK_PTR'
      Lookup = True
    end
    object ADO204base_to: TFloatField
      FieldKind = fkLookup
      FieldName = 'base_to'
      LookupDataSet = aq0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'base_to_other'
      KeyFields = 'PO_LINK_PTR'
      Lookup = True
    end
    object ADO204UNIT_CODE: TStringField
      DisplayLabel = #37319#36141#21333#20301#20195#30721
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
    object ADO204IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object ADO204req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO204
    Left = 312
    Top = 224
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
    Left = 30
    Top = 241
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
  object ADS276: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep054;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_purchase'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 171
    Top = 168
    object ADS276rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS276purchase_ptr: TIntegerField
      FieldName = 'purchase_ptr'
    end
    object ADS276user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADS276auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADS276ranking: TWordField
      FieldName = 'ranking'
    end
  end
  object aq0001: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,curr_name,base_to_other'
      'from data0001'
      'order by rkey')
    Left = 127
    Top = 296
    object aq0001rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq0001curr_name: TStringField
      FieldName = 'curr_name'
    end
    object aq0001base_to_other: TFloatField
      FieldName = 'base_to_other'
    end
  end
  object ADOS276: TADOStoredProc
    Connection = ADOConnection1
    OnCalcFields = ADOS276CalcFields
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
        Value = 0
      end>
    Left = 237
    Top = 114
    object ADOS276USER_ID: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'USER_ID'
      Size = 10
    end
    object ADOS276auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ADOS276USER_FULL_NAME: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOS276user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOS276ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object ADOS276auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADOS276
    Left = 171
    Top = 114
  end
  object ADO28: TADOQuery
    Connection = ADOConnection1
    DataSource = DataSource3
    Parameters = <
      item
        Name = 'SUPP_PTR'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'INVT_PTR'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select price_1 from data0028'
      'where '
      '  SUPPLIER_PTR =:SUPP_PTR and'
      '  INVENTORY_PTR =:INVT_PTR')
    Left = 307
    Top = 111
    object ADO28price_1: TFloatField
      FieldName = 'price_1'
    end
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
    Left = 287
    Top = 6
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
    Left = 223
    Top = 7
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
    Left = 348
    Top = 7
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
      
        'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0022.TDATE, dbo.Data0022' +
        '.QUANTITY,'
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.LOCATION,'
      '      dbo.Data0022.BARCODE_ID, dbo.Data0456.REF_NUMBER,'
      '      dbo.Data0005.EMPLOYEE_NAME'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR I' +
        'NNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0015 ON'
      
        '      dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where data0022.source_ptr=:rkey')
    Left = 288
    Top = 51
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
    Left = 224
    Top = 51
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
    Left = 349
    Top = 51
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
  object ADOAP68: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0068'
      'where rkey is null')
    Left = 32
    Top = 362
    object ADOAP68RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOAP68PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOAP68USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADOAP68REQ_BY: TIntegerField
      FieldName = 'REQ_BY'
    end
    object ADOAP68BUYER_PTR: TIntegerField
      FieldName = 'BUYER_PTR'
    end
    object ADOAP68APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object ADOAP68DATA275_PTR: TIntegerField
      FieldName = 'DATA275_PTR'
    end
    object ADOAP68AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object ADOAP68WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADOAP68NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADOAP68ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADOAP68REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADOAP68AUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
    object ADOAP68STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOAP68DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADOAP68FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOAP68EDITED_DATE: TDateTimeField
      FieldName = 'EDITED_DATE'
    end
    object ADOAP68EDITED_BY_USER_PTR: TIntegerField
      FieldName = 'EDITED_BY_USER_PTR'
    end
    object ADOAP68EDITED_BY_EMP_PTR: TIntegerField
      FieldName = 'EDITED_BY_EMP_PTR'
    end
    object ADOAP68TOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object ADOAP68CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object ADOAP68EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADOAP68REQ_TYPE: TStringField
      FieldName = 'REQ_TYPE'
      FixedChar = True
      Size = 1
    end
    object ADOAP68budget_ptr: TIntegerField
      FieldName = 'budget_ptr'
    end
    object ADOAP68v_year: TSmallintField
      FieldName = 'v_year'
    end
    object ADOAP68v_month: TSmallintField
      FieldName = 'v_month'
    end
    object ADOAP68user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object ADOAP68user_phone: TStringField
      FieldName = 'user_phone'
    end
  end
  object AP69204: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltPessimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0069')
    Left = 96
    Top = 364
  end
  object ADOstdprice: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOstdpriceCalcFields
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
      'SELECT TOP 50 Data0069.QUANTITY, dbo.Data0069.UNIT_PRICE,'
      '       Data0069.REQ_DATE, dbo.Data0002.UNIT_NAME,'
      '       Data0001.CURR_NAME, dbo.Data0023.ABBR_NAME,'
      '       Data0069.o_i_flag,data0069.tax_price,data0069.tax'
      'FROM   Data0069 INNER JOIN'
      
        '       Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY INN' +
        'ER JOIN'
      '       Data0001 ON'
      '       Data0069.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'
      '       Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY'
      'WHERE  (dbo.Data0069.INVT_PTR = :invt_ptr)'
      'ORDER BY  dbo.Data0069.REQ_DATE DESC')
    Left = 376
    Top = 344
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
      Size = 16
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
    object ADOstdpricetax_price: TFloatField
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'tax_price'
    end
    object ADOstdpricetax: TFloatField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax'
    end
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
      'SELECT TOP 50 Data0204.DESCRIPTION_1, dbo.Data0204.GUI_GE,'
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
    Left = 376
    Top = 400
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
      Size = 16
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
  object DataSource8: TDataSource
    DataSet = ADOstdprice
    Left = 305
    Top = 346
  end
  object DataSource9: TDataSource
    DataSet = ADOmicprice
    Left = 308
    Top = 402
  end
end
