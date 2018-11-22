object DM: TDM
  OldCreateOrder = False
  Left = 916
  Top = 225
  Height = 375
  Width = 336
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
    Left = 256
    Top = 48
  end
  object AQ68: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ68AfterOpen
    AfterScroll = AQ68AfterScroll
    OnCalcFields = AQ68CalcFields
    Parameters = <
      item
        Name = 'rkey73'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0068.*,'
      '       data0005.empl_code,data0005.employee_name,'
      '       data0015.abbr_name,data0015.warehouse_code,'
      '      data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'
      '      data0362.code code362,data0362.DESCRIPTION,'
      
        '      data0276.auth_date authdate276,data0276.ranking,data0276.u' +
        'ser_ptr authUser_ptr,dbo.data0276.auth_flag,data0276.rkey rkey27' +
        '6,'
      '      Data0073.USER_FULL_NAME'
      
        'from data0068 inner join  data0005 on data0068.req_by=data0005.r' +
        'key inner join'
      
        '                        data0015 on data0068.WHSE_PTR=data0015.r' +
        'key inner join'
      
        '                        data0094 on  data0068.auth_type=data0094' +
        '.rkey inner join '
      
        '                        data0362 on data0068.budget_ptr=data0362' +
        '.rkey INNER JOIN    '
      
        '                        data0276 ON Data0068.RKEY = dbo.data0276' +
        '.purchase_ptr INNER JOIN'
      
        '                        Data0073 ON data0276.user_ptr = dbo.Data' +
        '0073.RKEY'
      'where (Data0068.STATUS in (1,3)) '
      'and (data0073.rpl_pr_ptr =:rkey73) ')
    Left = 59
    Top = 106
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
      DisplayLabel = #25552#20132#26085#26399
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
      FieldName = 'code94'
      Size = 5
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
    object AQ68EDITED_BY_USER_PTR: TIntegerField
      FieldName = 'EDITED_BY_USER_PTR'
    end
    object AQ68EDITED_BY_EMP_PTR: TIntegerField
      FieldName = 'EDITED_BY_EMP_PTR'
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
    object AQ68USER_FULL_NAME: TStringField
      DisplayLabel = #24453#23457#20154
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object AQ68ranking: TWordField
      FieldName = 'ranking'
    end
    object AQ68authUser_ptr: TIntegerField
      FieldName = 'authUser_ptr'
    end
    object AQ68auth_flag: TStringField
      DisplayLabel = #24403#21069#23457#25209
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object AQ68rkey276: TAutoIncField
      FieldName = 'rkey276'
      ReadOnly = True
    end
    object AQ68authdate276: TDateTimeField
      FieldName = 'authdate276'
    end
    object AQ68user_name: TStringField
      DisplayLabel = #20351#29992#20154#21592
      FieldName = 'user_name'
      Size = 50
    end
    object AQ68user_phone: TStringField
      DisplayLabel = #20351#29992#20154#21592#30005#35805
      FieldName = 'user_phone'
    end
  end
  object AQ69: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0069 .*,data0017.inv_part_number,data0017.inv_descrip' +
        'tion,'
      'data0017.inv_name,data0017.quan_on_hand CurrStQty,'
      'data0002.unit_code,data0002.unit_name ,qty_zaitu='
      
        '(select SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QU' +
        'AN_RETN) '
      '   FROM Data0071 INNER JOIN'
      '   Data0070 ON Data0071.PO_PTR = Data0070.RKEY'
      '   WHERE Data0070.STATUS = 5'
      '   and data0071.invt_ptr=data0069.INVT_PTR),'
      
        'VMI_QTY=(select isnull(SUM(dbo.Data0134.QUAN_ON_HAND),0) from da' +
        'ta0134 where dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY),'
      'case data0017.CRITICAL_MATL_FLAG when 0 then '#39#21542#39
      'when 1 then '#39#26159#39' end as CRITICAL_MATL'
      ' from data0069  '
      'inner join data0017 on data0069.INVT_PTR=data0017.rkey'
      ' inner join data0002 on data0069.UNIT_PTR=data0002.rkey'
      'where data0069 .purch_req_ptr=:rkey'
      ' ')
    Left = 53
    Top = 158
    object AQ69inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 25
    end
    object AQ69inv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'inv_part_number'
      Size = 30
    end
    object AQ69inv_description: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'inv_description'
      LookupResultField = 'inv_description'
      Size = 70
    end
    object AQ69unit_name: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'unit_name'
      LookupResultField = 'unit_name'
    end
    object AQ69QUANTITY: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #35831#36141#25968#37327
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
    object AQ69reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#36135#26399
      FieldName = 'reply_date'
    end
    object AQ69unit_code: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'unit_code'
      LookupResultField = 'unit_code'
      Size = 5
    end
    object AQ69o_i_flag: TWordField
      DisplayLabel = #22269#22806'/'#22269#20869#37319#36141
      FieldName = 'o_i_flag'
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
    object AQ69SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object AQ69INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object AQ69RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ69avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object AQ69CurrStQty: TFloatField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'CurrStQty'
    end
    object AQ69qty_zaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldName = 'qty_zaitu'
      ReadOnly = True
    end
    object AQ69CRITICAL_MATL: TStringField
      DisplayLabel = #37325#35201
      FieldName = 'CRITICAL_MATL'
      ReadOnly = True
      Size = 2
    end
    object AQ69VMI_QTY: TBCDField
      FieldName = 'VMI_QTY'
      ReadOnly = True
      Precision = 32
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
  end
  object AQ204: TADOQuery
    Connection = ADOCon
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
      
        'select data0204 .*,data0002.unit_code,data0002.unit_name  from d' +
        'ata0204 inner join data0002 on data0204.G_L_PTR=data0002.rkey'
      'where data0204.purchase_req_ptr=:rkey')
    Left = 52
    Top = 213
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
      FieldName = 'UNIT_NAME'
    end
    object AQ204REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object AQ204reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object AQ204QUANTITY_REQUIRED: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object AQ204reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object AQ204UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
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
    Left = 8
    Top = 155
  end
  object DS3: TDataSource
    DataSet = AQ204
    Left = 8
    Top = 211
  end
  object DS1: TDataSource
    DataSet = AQ68
    Left = 8
    Top = 104
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
      
        'select rkey,file_pointer,source_type,note_pad_line_1  from data0' +
        '011 where  file_pointer=:rkey68 and  source_type=68')
    Left = 32
    Top = 272
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 264
    Top = 104
  end
  object ADOstdprice: TADOQuery
    Connection = ADOCon
    Filtered = True
    LockType = ltReadOnly
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
    Left = 168
    Top = 160
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
  object ADOmicprice: TADOQuery
    Connection = ADOCon
    Filtered = True
    LockType = ltReadOnly
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
    Left = 168
    Top = 215
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
  object ADO28: TADOQuery
    Connection = ADOCon
    Filtered = True
    LockType = ltReadOnly
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
    Left = 168
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
end
