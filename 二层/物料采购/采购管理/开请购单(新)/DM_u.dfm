object DM: TDM
  OldCreateOrder = False
  Left = 629
  Top = 411
  Height = 398
  Width = 343
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 240
    Top = 120
  end
  object AQ68: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = AQ68AfterOpen
    AfterScroll = AQ68AfterScroll
    OnCalcFields = AQ68CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT data0068.*,'
      '       data0005.empl_code,data0005.employee_name,'
      '       data0015.abbr_name,data0015.warehouse_code,'
      '      data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'
      '      data0362.code code362,data0362.DESCRIPTION'
      
        'from data0068 inner join  data0005 on data0068.req_by=data0005.r' +
        'key inner join'
      
        'data0015 on data0068.WHSE_PTR=data0015.rkey inner join data0094 ' +
        'on '
      
        'data0068.auth_type=data0094.rkey inner join data0362 on data0068' +
        '.budget_ptr=data0362.rkey')
    Left = 51
    Top = 90
    object AQ68rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ68po_req_number: TStringField
      DisplayLabel = #35831#36141#21333#21495
      FieldName = 'po_req_number'
      FixedChar = True
      Size = 15
    end
    object AQ68status: TWordField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object AQ68flag: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object AQ68req_date: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      FieldName = 'req_date'
    end
    object AQ68req_by: TIntegerField
      FieldName = 'req_by'
    end
    object AQ68buyer_ptr: TIntegerField
      FieldName = 'buyer_ptr'
    end
    object AQ68empl_code: TStringField
      FieldName = 'empl_code'
      Size = 5
    end
    object AQ68employee_name: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'employee_name'
    end
    object AQ68v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 16
      Calculated = True
    end
    object AQ68v_flag: TStringField
      DisplayLabel = #31867#21035
      FieldKind = fkCalculated
      FieldName = 'v_flag'
      Size = 10
      Calculated = True
    end
    object AQ68department_name: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'department_name'
      Size = 10
    end
    object AQ68data275_ptr: TIntegerField
      FieldName = 'data275_ptr'
    end
    object AQ68auth_date: TDateTimeField
      DisplayLabel = #25552#20132#37319#36141#26085#26399
      FieldName = 'auth_date'
    end
    object AQ68TOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object AQ68AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object AQ68abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object AQ68ent_date: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'ent_date'
    end
    object AQ68edited_date: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'edited_date'
    end
    object AQ68warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object AQ68PURCHASE_APPROV_DESC: TStringField
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object AQ68DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object AQ68code94: TStringField
      DisplayWidth = 15
      FieldName = 'code94'
      Size = 15
    end
    object AQ68code362: TStringField
      FieldName = 'code362'
      Size = 10
    end
    object AQ68USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object AQ68APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object AQ68WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object AQ68budget_ptr: TIntegerField
      FieldName = 'budget_ptr'
    end
    object AQ68NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object AQ68CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object AQ68EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object AQ68v_year: TSmallintField
      FieldName = 'v_year'
    end
    object AQ68v_month: TSmallintField
      FieldName = 'v_month'
    end
    object AQ68REQ_TYPE: TStringField
      FieldName = 'REQ_TYPE'
      FixedChar = True
      Size = 1
    end
    object AQ68user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object AQ68user_phone: TStringField
      FieldName = 'user_phone'
    end
  end
  object AQ69: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterPost = AQ69AfterPost
    OnCalcFields = AQ69CalcFields
    OnNewRecord = AQ69NewRecord
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
      'select * from data0069 where purch_req_ptr=:rkey')
    Left = 189
    Top = 238
    object AQ69inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldKind = fkCalculated
      FieldName = 'inv_name'
      Size = 25
      Calculated = True
    end
    object AQ69inv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'inv_part_number'
      LookupResultField = 'inv_name'
      Size = 30
      Calculated = True
    end
    object AQ69INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'INV_DESCRIPTION'
      Size = 80
      Calculated = True
    end
    object AQ69unit_name: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      LookupResultField = 'unit_name'
      Calculated = True
    end
    object AQ69QUANTITY: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object AQ69REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object AQ69reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object AQ69extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
      Size = 50
    end
    object AQ69unit_code: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldKind = fkCalculated
      FieldName = 'unit_code'
      LookupResultField = 'unit_code'
      Size = 5
      Calculated = True
    end
    object AQ69reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object AQ69o_i_flag: TWordField
      DisplayLabel = #22269#22806'/'#22269#20869#37319#36141
      FieldName = 'o_i_flag'
    end
    object AQ69avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object AQ69CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object AQ69PURCH_REQ_PTR: TIntegerField
      FieldName = 'PURCH_REQ_PTR'
    end
    object AQ69UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object AQ69PO_LINK_PTR: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'PO_LINK_PTR'
    end
    object AQ69unit_code_1: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldKind = fkCalculated
      FieldName = 'unit_code_1'
      Calculated = True
    end
    object AQ69req_unit_ptr: TIntegerField
      FieldName = 'req_unit_ptr'
    end
    object AQ69INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object AQ69RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ69CRITICAL_MATL: TStringField
      FieldKind = fkCalculated
      FieldName = 'CRITICAL_MATL'
      Size = 4
      Calculated = True
    end
    object AQ69IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object AQ69req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
    object AQ69CONSIGN_ONHAND_QTY: TIntegerField
      DisplayLabel = #23433#20840#24211#23384
      FieldKind = fkCalculated
      FieldName = 'CONSIGN_ONHAND_QTY'
      Calculated = True
    end
    object AQ69REPORT_VALUE2: TIntegerField
      DisplayLabel = #26368#39640#24211#23384
      FieldKind = fkCalculated
      FieldName = 'REPORT_VALUE2'
      Calculated = True
    end
  end
  object AQ204: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterPost = AQ204AfterPost
    OnCalcFields = AQ204CalcFields
    OnNewRecord = AQ204NewRecord
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
      'select * from data0204 where purchase_req_ptr=:rkey')
    Left = 188
    Top = 293
    object AQ204DESCRIPTION_1: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object AQ204GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object AQ204DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
    end
    object AQ204UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldKind = fkCalculated
      FieldName = 'UNIT_NAME'
      Calculated = True
    end
    object AQ204QUANTITY_REQUIRED: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object AQ204REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object AQ204UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldKind = fkCalculated
      FieldName = 'UNIT_CODE'
      Size = 5
      Calculated = True
    end
    object AQ204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object AQ204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object AQ204o_i_flag: TWordField
      DisplayLabel = #22269#20869'/'#22269#22806
      FieldName = 'o_i_flag'
    end
    object AQ204G_L_PTR: TIntegerField
      DisplayLabel = #37319#36141#21333#20301#25351#38024
      FieldName = 'G_L_PTR'
    end
    object AQ204PURCHASE_REQ_PTR: TIntegerField
      FieldName = 'PURCHASE_REQ_PTR'
    end
    object AQ204RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ204IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object AQ204req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
  end
  object DS2: TDataSource
    DataSet = AQ69
    Left = 144
    Top = 235
  end
  object DS3: TDataSource
    DataSet = AQ204
    Left = 144
    Top = 291
  end
  object DS1: TDataSource
    DataSet = AQ68
    Left = 9
    Top = 89
  end
  object ADO11: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey68'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select *  from data0011 where  file_pointer=:rkey68 and  source_' +
        'type=68')
    Left = 32
    Top = 272
  end
  object AQ17: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ17AfterOpen
    CommandText = 
      'select d17.rkey,d17.inv_part_number,d17.inv_description,d17.inv_' +
      'name,d17.STOCK_PURCH,'#13#10'       d17.PURCH_UNIT_PTR,d17.STOCK_UNIT_' +
      'PTR, '#13#10'       case d17.CRITICAL_MATL_FLAG when 0 then '#39#21542#39' when 1' +
      ' then '#39#26159#39' end as CRITICAL_MATL,'#13#10'       d2.unit_code,d2.unit_nam' +
      'e,d2a.unit_code st_nu_code ,d2a.unit_name st_un_name,d17.inspect' +
      ',d17. REPORT_VALUE2, d17.CONSIGN_ONHAND_QTY'#13#10'from   data0017 d17' +
      ' inner join data0002  d2 on d17.PURCH_UNIT_PTR=d2.rkey inner joi' +
      'n '#13#10'       data0002 d2a on d17.STOCK_UNIT_PTR=d2a.rkey'#13#10'where  d' +
      '17.STOP_PURCH='#39'N'#39#13#10'order by d17.inv_part_number'
    IndexFieldNames = 'rkey'
    Parameters = <>
    Prepared = True
    Left = 240
    Top = 56
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 240
    Top = 176
  end
  object AQ69_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = AQ69CalcFields
    OnNewRecord = AQ69NewRecord
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
      
        'select data0069 .*, data0017.inv_part_number,data0017.inv_descri' +
        'ption,data0017.inv_name ,'
      
        'data0002.unit_code,data0002.unit_name,data0002_1.unit_code unit_' +
        'code_1,data0017.CRITICAL_MATL_FLAG'
      'from dbo.Data0069 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0069.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 AS data0002_1 ON dbo.Data0069' +
        '.req_unit_ptr = data0002_1.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0069.UNIT_PTR = db' +
        'o.Data0002.RKEY'
      ' where data0069 .purch_req_ptr=:rkey')
    Left = 61
    Top = 158
    object StringField1: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 25
    end
    object StringField2: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 150
      FieldName = 'inv_part_number'
      LookupResultField = 'inv_name'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 150
      FieldName = 'INV_DESCRIPTION'
      Size = 80
    end
    object StringField4: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'unit_name'
      LookupResultField = 'unit_name'
    end
    object FloatField1: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object StringField5: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object StringField6: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'unit_code'
      LookupResultField = 'unit_code'
      Size = 5
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object WordField1: TWordField
      DisplayLabel = #22269#22806'/'#22269#20869#37319#36141
      FieldName = 'o_i_flag'
    end
    object StringField8: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object FloatField2: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object IntegerField1: TIntegerField
      FieldName = 'PURCH_REQ_PTR'
    end
    object IntegerField2: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'PO_LINK_PTR'
    end
    object StringField9: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'unit_code_1'
    end
    object IntegerField4: TIntegerField
      FieldName = 'req_unit_ptr'
    end
    object IntegerField5: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ69_1CRITICAL_MATL_FLAG: TWordField
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object AQ69_1IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object AQ69_1req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
  end
  object AQ204_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = AQ204CalcFields
    OnNewRecord = AQ204NewRecord
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
      
        'select data0204 .*,data0002.unit_code,data0002.unit_name  from d' +
        'ata0204 '
      'inner join data0002 on data0204.G_L_PTR=data0002.rkey'
      'where data0204 .purchase_req_ptr=:rkey')
    Left = 60
    Top = 205
    object StringField10: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object StringField11: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object StringField12: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION_2'
    end
    object StringField13: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
    end
    object FloatField3: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object StringField14: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object StringField15: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object WordField2: TWordField
      DisplayLabel = #22269#20869'/'#22269#22806
      FieldName = 'o_i_flag'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = #37319#36141#21333#20301#25351#38024
      FieldName = 'G_L_PTR'
    end
    object IntegerField7: TIntegerField
      FieldName = 'PURCHASE_REQ_PTR'
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ204_1IF_urgency: TBooleanField
      DisplayLabel = #26159#21542#32039#24613#29289#26009
      FieldName = 'IF_urgency'
    end
    object AQ204_1req_quantity: TBCDField
      DisplayLabel = #35831#36141#26102#38656#27714#25968#37327
      FieldName = 'req_quantity'
      Precision = 12
      Size = 2
    end
  end
  object DS2_1: TDataSource
    DataSet = AQ69_1
    Left = 8
    Top = 155
  end
  object DS3_1: TDataSource
    DataSet = AQ204_1
    Left = 8
    Top = 211
  end
end
