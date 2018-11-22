object dm: Tdm
  OldCreateOrder = False
  Left = 275
  Top = 225
  Height = 521
  Width = 633
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    ConnectionTimeout = 25
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 34
    Top = 12
  end
  object ADS85: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0085.rkey,Data0085.TNUMBER, Data0085.REF_PART_NO, '#13#10' ' +
      '     Data0085.CUST_PART_NO, Data0085.CUST_NAME,Data0085.CUST_PAR' +
      'T_DESC, '#13#10'      Data0085.quote_taxprice, Data0001.CURR_NAME, dat' +
      'a0001.curr_code,'#13#10'      Data0085.CURR_RATE, Data0085.vatax, Data' +
      '0085.MARKUP, '#13#10'      Data0085.QTE_DATE, Data0085.EXPIRATION_DATE' +
      ', data0085.ENTER_DATE,'#13#10'      Data0005.EMPLOYEE_NAME, d05.EMPL_C' +
      'ODE as REP_CODE,'#13#10'     d05.EMPLOYEE_NAME as SALES_REP_NAME,data0' +
      '008.prod_code,'#13#10'data0008.product_name,data0264.code,data0264.QTE' +
      '_APPROV_DESC,'#13#10'data0346.ROW_NAME,data0085.QBY_EMPL_PTR,data0085.' +
      'SALES_DISCOUNT,dbo.data0086.ttype2,'#13#10'dbo.data0086.description as' +
      ' '#31867#22411', data0085.ORIG_CUSTOMER, data0085.ProdUsageName,'#13#10'case Data0' +
      '085.AUDITED_STATUS when 0 then '#39#26410#25552#20132#39#13#10'when 1 then '#39#24453#23457#25209#39' when 2 t' +
      'hen '#39#24050#36807#26399#39' '#13#10'when 3 then '#39#24050#23457#25209#39' when 4 then '#39#34987#36864#22238#39' end as '#29366#24577','#13#10'Data' +
      '0085.AUDITED_STATUS,data0085.APPRV_BY_PTR,'#13#10'case data0085.QTE_UN' +
      'IT_PTR when 1 then '#39'PCS'#39' WHEN 2 THEN '#39'SET'#39#13#10'END AS '#25253#20215#21333#20301',data0085' +
      '.TUSAGE,data0085.QTE_UNITS,'#13#10' CASE WHEN (data0085.QTE_UNIT_PTR =' +
      ' 1 and data0085.TUNITS<>0 and data0085.UNIT_LEN<>0 and data0085.' +
      'UNIT_WTH<>0)'#13#10'THEN data0085.QTE_UNITS / ((data0085.UNIT_LEN*0.00' +
      '1 * data0085.UNIT_WTH*0.001)/ data0085.TUNITS )'#13#10'WHEN (data0085.' +
      'QTE_UNIT_PTR = 2 and data0085.UNIT_LEN<>0 and data0085.UNIT_WTH<' +
      '>0) THEN'#13#10'data0085.QTE_UNITS / (data0085.UNIT_LEN*0.001 * data00' +
      '85.UNIT_WTH*0.001) end AS '#26412#24065#24179#31859#23454#25253#20215',data0085.rate_margin, data0085' +
      '.SALES_ORDERS_ENTERED,'#13#10'data0085.apprv_date, data0085.cust_add2,' +
      'data0085.quote_type,'#13#10'case when TUNITS >0 then'#13#10'round(data0085.S' +
      'ALES_ORDERS_ENTERED*data0085.UNIT_LEN*data0085.UNIT_WTH*0.000001' +
      #13#10'/data0085.TUNITS,4) else 0 end as mian_ji,data0242.PaperNO,IsN' +
      'ull(data0010.CUST_CODE,'#39#39') as CUST_CODE,'#13#10'data0085.UNIT_LEN,data' +
      '0085.UNIT_WTH,data0085.TUNITS,data0085.QTE_USHEET'#13#10'FROM dbo.Data' +
      '0085 INNER JOIN'#13#10'      Data0005 ON dbo.Data0085.QBY_EMPL_PTR = d' +
      'bo.Data0005.RKEY INNER JOIN'#13#10'      Data0001 ON dbo.Data0085.CURR' +
      '_PTR = dbo.Data0001.RKEY inner join'#13#10'      data0005 as d05 on da' +
      'ta0085.srep_ptr = d05.rkey inner join '#13#10'      data0008 on data00' +
      '85.PROD_CODE_PTR=data0008.rkey inner join '#13#10'      data0264 on da' +
      'ta0085.PROD_ROUTE_PTR=data0264.rkey LEFT OUTER JOIN'#13#10'      data0' +
      '346 on data0085.ENGR_ROUTE_PTR=data0346.rkey LEFT OUTER JOIN'#13#10'  ' +
      '    data0242 on data0085.ptr_242=data0242.RKEY LEFT OUTER JOIN'#13#10 +
      '      data0010 on data0085.CUST_PTR=data0010.RKEY inner join'#13#10'  ' +
      '    data0086 on dbo.data0085.TType2=dbo.data0086.ttype2'#13#10'where d' +
      'ata0085.ttype=0 and'#13#10'           Data0085.QTE_DATE >= :dtpk1 and ' +
      #13#10'           Data0085.QTE_DATE <= :dtpk2'#13#10
    IndexFieldNames = 'TNUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end>
    Prepared = True
    Left = 88
    Top = 68
    object ADS85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      DisplayWidth = 10
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ADS85REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 12
      FieldName = 'REF_PART_NO'
    end
    object ADS85CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 14
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object ADS85CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADS85CUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 25
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object ADS85quote_taxprice: TFloatField
      DisplayLabel = #21547#31246#21333#20215
      DisplayWidth = 8
      FieldName = 'quote_taxprice'
    end
    object ADS85curr_code: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'curr_code'
      Size = 5
    end
    object ADS85CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 8
      FieldName = 'CURR_NAME'
    end
    object ADS85CURR_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 6
      FieldName = 'CURR_RATE'
    end
    object ADS85vatax: TBCDField
      DisplayLabel = #22686#20540#31246'%'
      DisplayWidth = 7
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADS85MARKUP: TFloatField
      DisplayLabel = #36130#21153#27611#21033#29575'%'
      DisplayWidth = 10
      FieldName = 'MARKUP'
    end
    object ADS85QTE_DATE: TDateTimeField
      DisplayLabel = #25253#20215#26085#26399
      DisplayWidth = 10
      FieldName = 'QTE_DATE'
    end
    object ADS85EXPIRATION_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 12
      FieldName = 'EXPIRATION_DATE'
    end
    object ADS85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS85DSDesigner2: TStringField
      DisplayWidth = 6
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS85rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS85REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADS85SALES_REP_NAME: TStringField
      DisplayLabel = #38144#21806#20195#34920
      FieldName = 'SALES_REP_NAME'
    end
    object ADS85prod_code: TStringField
      FieldName = 'prod_code'
      Size = 10
    end
    object ADS85product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object ADS85code: TStringField
      DisplayLabel = #23457#25209#27969#31243#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object ADS85QTE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#27969#31243#25551#36848
      FieldName = 'QTE_APPROV_DESC'
      Size = 40
    end
    object ADS85ROW_NAME: TStringField
      DisplayLabel = #22522#20215#21517#31216
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object ADS85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object ADS85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object ADS85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object ADS85apprv_date: TDateTimeField
      FieldName = 'apprv_date'
    end
    object ADS85cust_add2: TStringField
      DisplayLabel = #36864#22238#21407#22240
      FieldName = 'cust_add2'
      Size = 100
    end
    object ADS85quote_type: TSmallintField
      FieldName = 'quote_type'
    end
    object ADS85SALES_DISCOUNT: TBCDField
      DisplayLabel = #38144#21806#25240#25187'%'
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object ADS85DSDesigner3: TStringField
      FieldName = #25253#20215#21333#20301
      ReadOnly = True
      Size = 3
    end
    object ADS85TUSAGE: TBCDField
      DisplayLabel = #22823#26009#21033#29992#29575
      DisplayWidth = 10
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ADS85QTE_UNITS: TFloatField
      DisplayLabel = #26412#24065#23454#38469#25253#20215
      FieldName = 'QTE_UNITS'
    end
    object ADS85DSDesigner4: TFloatField
      FieldName = #26412#24065#24179#31859#23454#25253#20215
      ReadOnly = True
    end
    object ADS85CUST_PART_DESC: TStringField
      DisplayWidth = 50
      FieldName = 'CUST_PART_DESC'
      Size = 200
    end
    object ADS85rate_margin: TBCDField
      DisplayLabel = #27611#21033#29575'%'
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADS85mian_ji: TFloatField
      DisplayLabel = #19979#21333#38754#31215
      FieldName = 'mian_ji'
      ReadOnly = True
    end
    object ADS85SALES_ORDERS_ENTERED: TIntegerField
      DisplayLabel = #19979#21333#25968#37327
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object ADS85PaperNO: TStringField
      DisplayLabel = #25253#20215#26102#25928#32534#21495
      FieldName = 'PaperNO'
      Size = 18
    end
    object ADS85UNIT_LEN: TFloatField
      DisplayLabel = #25340#26495#38271
      FieldName = 'UNIT_LEN'
    end
    object ADS85UNIT_WTH: TFloatField
      DisplayLabel = #25340#26495#23485
      FieldName = 'UNIT_WTH'
    end
    object ADS85TUNITS: TIntegerField
      DisplayLabel = #25340#26495#25968
      FieldName = 'TUNITS'
    end
    object ADS85QTE_USHEET: TBCDField
      DisplayLabel = #27599#24352#22823#26009'PCS'#25968
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object ADS85ttype2: TWordField
      FieldName = 'ttype2'
    end
    object ADS85DSDesigner: TWideStringField
      FieldName = #31867#22411
    end
    object ADS85ORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADS85ENTER_DATE: TDateTimeField
      DisplayLabel = #26368#21518#20462#25913#26085#26399
      FieldName = 'ENTER_DATE'
    end
    object ADS85ProdUsageName: TStringField
      DisplayLabel = #20135#21697#29992#36884
      FieldName = 'ProdUsageName'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS85
    Left = 32
    Top = 68
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 125
    Top = 11
  end
  object ADSA85: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0085'#13#10'where rkey = :rkey'
    EnableBCD = False
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 88
    Top = 124
    object ADSA85RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADSA85TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADSA85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ADSA85CUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object ADSA85CUST_ADD1: TStringField
      FieldName = 'CUST_ADD1'
      Size = 100
    end
    object ADSA85CUST_STATE: TStringField
      FieldName = 'CUST_STATE'
      FixedChar = True
      Size = 10
    end
    object ADSA85CUST_ZIP: TStringField
      FieldName = 'CUST_ZIP'
      FixedChar = True
      Size = 10
    end
    object ADSA85CUST_PHONE: TStringField
      FieldName = 'CUST_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADSA85CUST_FAX: TStringField
      FieldName = 'CUST_FAX'
      FixedChar = True
      Size = 14
    end
    object ADSA85CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
      FixedChar = True
    end
    object ADSA85CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADSA85CUST_RFQ: TStringField
      FieldName = 'CUST_RFQ'
      FixedChar = True
      Size = 10
    end
    object ADSA85CUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object ADSA85CUST_QTE_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CUST_QTE_FACTOR'
    end
    object ADSA85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADSA85SREP_PTR: TIntegerField
      FieldName = 'SREP_PTR'
    end
    object ADSA85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object ADSA85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object ADSA85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object ADSA85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADSA85CUST_PART_NO: TStringField
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object ADSA85CUST_PART_DESC: TStringField
      FieldName = 'CUST_PART_DESC'
      Size = 200
    end
    object ADSA85REF_PART_NO: TStringField
      FieldName = 'REF_PART_NO'
    end
    object ADSA85MATL_COST: TFloatField
      Alignment = taLeftJustify
      FieldName = 'MATL_COST'
    end
    object ADSA85MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object ADSA85CURR_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CURR_RATE'
    end
    object ADSA85ENGR_ROUTE_PTR: TIntegerField
      FieldName = 'ENGR_ROUTE_PTR'
    end
    object ADSA85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object ADSA85PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object ADSA85SHIPPING_CHARGE: TFloatField
      FieldName = 'SHIPPING_CHARGE'
    end
    object ADSA85QUOTE_TYPE: TSmallintField
      FieldName = 'QUOTE_TYPE'
    end
    object ADSA85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object ADSA85EMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 128
    end
    object ADSA85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object ADSA85NOTE_INFO: TStringField
      DisplayWidth = 200
      FieldName = 'NOTE_INFO'
      Size = 400
    end
    object ADSA85USHEET: TBCDField
      Alignment = taLeftJustify
      FieldName = 'USHEET'
      Precision = 8
      Size = 2
    end
    object ADSA85QTE_USHEET: TBCDField
      Alignment = taLeftJustify
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object ADSA85QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object ADSA85QTE_UNITS: TFloatField
      Alignment = taLeftJustify
      FieldName = 'QTE_UNITS'
    end
    object ADSA85PAYMENT: TStringField
      FieldName = 'PAYMENT'
      FixedChar = True
    end
    object ADSA85SALES_DISCOUNT: TBCDField
      Alignment = taLeftJustify
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object ADSA85UNIT_LEN: TFloatField
      Alignment = taLeftJustify
      FieldName = 'UNIT_LEN'
    end
    object ADSA85UNIT_WTH: TFloatField
      Alignment = taLeftJustify
      FieldName = 'UNIT_WTH'
    end
    object ADSA85TUSAGE: TBCDField
      Alignment = taLeftJustify
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ADSA85TUNITS: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TUNITS'
    end
    object ADSA85BASE_PRICE: TFloatField
      FieldName = 'BASE_PRICE'
    end
    object ADSA85QTE_CONTROL5: TStringField
      FieldName = 'QTE_CONTROL5'
      FixedChar = True
      Size = 1
    end
    object ADSA85ttype2: TWordField
      FieldName = 'ttype2'
    end
    object ADSA85ovhd_cost: TFloatField
      Alignment = taLeftJustify
      FieldName = 'ovhd_cost'
    end
    object ADSA85base_pcscost: TFloatField
      Alignment = taLeftJustify
      FieldName = 'base_pcscost'
    end
    object ADSA85total_cost: TFloatField
      Alignment = taLeftJustify
      FieldName = 'total_cost'
    end
    object ADSA85comm_cost: TFloatField
      Alignment = taLeftJustify
      FieldName = 'comm_cost'
    end
    object ADSA85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADSA85quote_price: TFloatField
      Alignment = taLeftJustify
      FieldName = 'quote_price'
    end
    object ADSA85quote_taxprice: TFloatField
      Alignment = taLeftJustify
      FieldName = 'quote_taxprice'
    end
    object ADSA85rej_info: TMemoField
      FieldName = 'rej_info'
      BlobType = ftMemo
    end
    object ADSA85CRP_EST_QUANTITY: TFloatField
      FieldName = 'CRP_EST_QUANTITY'
    end
    object ADSA85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object ADSA85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object ADSA85rate_margin: TBCDField
      DisplayLabel = #27611#21033#29575'%'
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADSA85SALES_ORDERS_ENTERED: TIntegerField
      DisplayLabel = #19979#21333#25968#37327
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object ADSA85SpecialCrafts: TStringField
      FieldName = 'SpecialCrafts'
      Size = 200
    end
    object ADSA85ptr_242: TIntegerField
      FieldName = 'ptr_242'
    end
    object ADSA85ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADSA85ProdUsageName: TStringField
      DisplayLabel = #20135#21697#29992#36884
      FieldName = 'ProdUsageName'
      Size = 30
    end
    object ADSA85ovhd_N_cost: TFloatField
      FieldName = 'ovhd_N_cost'
    end
    object ADSA85total_N_cost: TFloatField
      FieldName = 'total_N_cost'
    end
    object ADSA85CRPEST_N_cost: TFloatField
      FieldName = 'CRPEST_N_cost'
    end
    object ADSA85SHIPPING_N_CHARGE: TFloatField
      FieldName = 'SHIPPING_N_CHARGE'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADSA85
    Left = 32
    Top = 125
  end
  object ads432: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select QTE_PTR, ADDL_CAT_PTR, AMOUNT, FREE_AMOUNT, TAX_FLAG'#13#10'fro' +
      'm data0432'#13#10'where qte_ptr = :rkey and'#13#10'           addl_cat_ptr i' +
      's not null'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 139
    Top = 69
    object ads432QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object ads432ADDL_CAT_PTR: TIntegerField
      FieldName = 'ADDL_CAT_PTR'
    end
    object ads432AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ads432FREE_AMOUNT: TFloatField
      FieldName = 'FREE_AMOUNT'
    end
    object ads432TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object ads431: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select TOP 100 PERCENT QTE_PTR, UNIT_PTR, UNIT_VALUE,ttype'#13#10'from' +
      ' data0431'#13#10'where qte_ptr= :rkey'#13#10'order by rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 89
    Top = 176
    object ads431QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object ads431UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ads431UNIT_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'UNIT_VALUE'
      OnValidate = ads431UNIT_VALUEValidate
      Size = 100
    end
    object ads431ttype: TSmallintField
      FieldName = 'ttype'
    end
    object ads431PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object ads431PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Lookup = True
    end
    object ads431SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Size = 2
      Lookup = True
    end
    object ads431UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_NAME'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Lookup = True
    end
    object ads431DATA_TYPE: TSmallintField
      FieldKind = fkLookup
      FieldName = 'DATA_TYPE'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'DATA_TYPE'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Lookup = True
    end
    object ads431min_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'min_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'min_value'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Lookup = True
    end
    object ads431max_value: TFloatField
      FieldKind = fkLookup
      FieldName = 'max_value'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'max_value'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Lookup = True
    end
    object ads431QUOTE_FLAG: TStringField
      FieldKind = fkLookup
      FieldName = 'QUOTE_FLAG'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'QUOTE_FLAG'
      KeyFields = 'UNIT_PTR'
      LookupCache = True
      Size = 1
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ads431
    Left = 32
    Top = 176
  end
  object ads278: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10' data0278.rkey,data0278.DATA_TYPE,'#13#10' data0278.PARAMETER_' +
      'NAME, '#13#10' data0278.PARAMETER_DESC,'#13#10' Data0278.SPEC_RKEY,'#13#10' data00' +
      '02.UNIT_NAME,data0278.min_value,data0278.max_value,'#13#10' Data0278.Q' +
      'UOTE_FLAG'#13#10'from data0278 inner join data0002'#13#10'on Data0278.UNIT_P' +
      'TR = Data0002.RKEY'#13#10'where CATEGORY_PTR<>1'
    Parameters = <>
    Left = 137
    Top = 176
    object ads278rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ads278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ads278SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ads278UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ads278DATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object ads278min_value: TFloatField
      FieldName = 'min_value'
    end
    object ads278max_value: TFloatField
      FieldName = 'max_value'
    end
    object ads278QUOTE_FLAG: TStringField
      FieldName = 'QUOTE_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object ADO04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG'
      'from data0004'
      'where rkey=32')
    Left = 253
    Top = 11
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 189
    Top = 11
  end
  object ads511: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *  from Data0511'#13#10'where source_ptr=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 89
    Top = 228
    object ads511source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ads511sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
      BlobType = ftGraphic
    end
    object ads511pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object ads511pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
    object ads511TOTAL_PNLS_1: TSmallintField
      FieldName = 'TOTAL_PNLS_1'
    end
    object ads511TOTAL_PNLS_2: TSmallintField
      FieldName = 'TOTAL_PNLS_2'
    end
    object ads511UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object ads511UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object ads511UNIT_UNIT: TWordField
      FieldName = 'UNIT_UNIT'
    end
    object ads511UNIT_NUM: TIntegerField
      FieldName = 'UNIT_NUM'
    end
    object ads511SHT_LEN: TFloatField
      FieldName = 'SHT_LEN'
    end
    object ads511SHT_WTH: TFloatField
      FieldName = 'SHT_WTH'
    end
    object ads511TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ads511PNL_LEN: TFloatField
      FieldName = 'PNL_LEN'
    end
    object ads511PNL_WTH: TFloatField
      FieldName = 'PNL_WTH'
    end
    object ads511UPANEL: TSmallintField
      FieldName = 'UPANEL'
    end
    object ads511PNL_LEN_2: TFloatField
      FieldName = 'PNL_LEN_2'
    end
    object ads511PNL_WTH_2: TFloatField
      FieldName = 'PNL_WTH_2'
    end
    object ads511UPANEL_2: TSmallintField
      FieldName = 'UPANEL_2'
    end
    object ads511minspace1: TFloatField
      FieldName = 'minspace1'
    end
    object ads511minspace2: TFloatField
      FieldName = 'minspace2'
    end
    object ads511pnl_lenspace: TBCDField
      FieldName = 'pnl_lenspace'
      Precision = 5
      Size = 2
    end
    object ads511pnl_wthspace: TBCDField
      FieldName = 'pnl_wthspace'
      Precision = 5
      Size = 2
    end
  end
  object DataSource4: TDataSource
    DataSet = ads511
    Left = 33
    Top = 228
  end
  object AQ280: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT data0280.rkey,Data0280.ENG_TABLE_NAME,'
      '  Data0280.DATA_TYPE,Data0278.DATA_TYPE AS fx_type,'
      '  Data0278_1.DATA_TYPE AS fy_type'
      'FROM dbo.Data0280 INNER JOIN'
      
        '      dbo.Data0278 ON dbo.Data0280.FX = dbo.Data0278.RKEY LEFT O' +
        'UTER JOIN'
      
        '      dbo.Data0278 Data0278_1 ON dbo.Data0280.FY = Data0278_1.RK' +
        'EY'
      'ORDER BY dbo.Data0280.ENG_TABLE_NAME')
    Left = 254
    Top = 124
    object AQ280rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ280ENG_TABLE_NAME: TStringField
      FieldName = 'ENG_TABLE_NAME'
      Size = 10
    end
    object AQ280DATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
    end
    object AQ280fx_type: TWordField
      FieldName = 'fx_type'
    end
    object AQ280fy_type: TWordField
      FieldName = 'fy_type'
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'WZPR085;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtpx'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vtpy'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end
      item
        Name = '@vcol0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vrow0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = #39#39
      end
      item
        Name = '@vcol'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end
      item
        Name = '@vrow'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end>
    Left = 254
    Top = 177
    object ADOStoredProc1tvalue: TStringField
      FieldName = 'tvalue'
      Size = 50
    end
  end
  object ads274: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT '#13#10'dbo.Data0073.USER_LOGIN_NAME as USER_ID' +
      ', '#13#10'      dbo.Data0073.USER_FULL_NAME, '#13#10'      dbo.Data0274.auth' +
      '_date, '#13#10'     case when Data0274.auth_date is null then '#39#26410#23457#25209#39#13#10' ' +
      '         else '#39#24050#23457#25209#39' end as '#23457#25209#29366#24577','#13#10'      dbo.Data0274.ranking, db' +
      'o.Data0274.auth_flag'#13#10'FROM dbo.Data0274 INNER JOIN'#13#10'      dbo.Da' +
      'ta0073 ON dbo.Data0274.user_ptr = dbo.Data0073.RKEY'#13#10'WHERE (dbo.' +
      'Data0274.qte_ptr = :rkey)'#13#10'ORDER BY dbo.Data0274.ranking'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1900
      end>
    Left = 88
    Top = 280
    object ads274USER_ID: TStringField
      DisplayLabel = #20154#21592#20195#30721
      FieldName = 'USER_ID'
      Size = 10
    end
    object ads274USER_FULL_NAME: TStringField
      DisplayLabel = #23457#25209#20154#21592#22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads274auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ads274ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object ads274auth_flag: TStringField
      DisplayLabel = #24403#21069#23457#25209
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ads274DSDesigner: TStringField
      FieldName = #23457#25209#29366#24577
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource5: TDataSource
    DataSet = ads274
    Left = 32
    Top = 280
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 319
    Top = 12
  end
  object AQ17: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCR' +
        'IPTION, '
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0456.ship_DATE, dbo.Data00' +
        '23.ABBR_NAME, '
      '      SUM(dbo.Data0022.QUAN_ON_HAND) AS quan_on_hand'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY'
      
        'WHERE (dbo.Data0022.QUAN_ON_HAND > 0) AND (dbo.Data0496.quote_fl' +
        'ag = 1)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DES' +
        'CRIPTION, '
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0456.ship_DATE, dbo.Data00' +
        '23.ABBR_NAME'
      'order by dbo.Data0017.INV_PART_NUMBER')
    Left = 32
    Top = 408
  end
  object AQtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 408
  end
  object DS17: TDataSource
    DataSet = AQ17
    Left = 32
    Top = 360
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 256
  end
  object qry431: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey85'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT t431.RKEY,t431.QTE_PTR,t431.UNIT_PTR,t431.UNIT_VALUE,t431' +
        '.TTYPE,'
      '       t278.PARAMETER_NAME,t278.PARAMETER_DESC'
      'FROM data0431 t431'
      ' INNER JOIN data0278 t278 ON t431.UNIT_PTR = t278.RKEY'
      'WHERE t431.QTE_PTR = :rkey85')
    Left = 216
    Top = 345
    object qry431RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry431QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object qry431UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object qry431UNIT_VALUE: TStringField
      FieldName = 'UNIT_VALUE'
      Size = 200
    end
    object qry431TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qry431PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object qry431PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
  end
  object qry85: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey85'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT data0085.*,data0001.CURR_CODE,data0001.CURR_NAME,data0346' +
        '.ROW_NAME,'
      
        '  data0005.EMPLOYEE_NAME,data0005.PHONE,data0005.EMAIL,t5.EMPLOY' +
        'EE_NAME as BJ_Name'
      
        'FROM data0085 left join data0001 on data0085.CURR_PTR=data0001.R' +
        'KEY'
      'left join data0005 on data0085.SREP_PTR=data0005.RKEY'
      'left join data0346 on data0085.ENGR_ROUTE_PTR=data0346.RKEY'
      'left join data0005 t5 on data0085.QBY_EMPL_PTR = t5.RKEY'
      'WHERE data0085.RKEY = :rkey85')
    Left = 216
    Top = 297
    object qry85RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry85TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qry85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object qry85CUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object qry85CUST_ADD1: TStringField
      FieldName = 'CUST_ADD1'
      Size = 100
    end
    object qry85CUST_ADD2: TStringField
      FieldName = 'CUST_ADD2'
      Size = 100
    end
    object qry85CUST_STATE: TStringField
      FieldName = 'CUST_STATE'
      Size = 10
    end
    object qry85CUST_ZIP: TStringField
      FieldName = 'CUST_ZIP'
      Size = 10
    end
    object qry85CUST_PHONE: TStringField
      FieldName = 'CUST_PHONE'
      Size = 14
    end
    object qry85CUST_FAX: TStringField
      FieldName = 'CUST_FAX'
      Size = 14
    end
    object qry85CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
    end
    object qry85CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      Size = 14
    end
    object qry85CUST_RFQ: TStringField
      FieldName = 'CUST_RFQ'
      Size = 10
    end
    object qry85CUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object qry85CUST_QTE_FACTOR: TFloatField
      FieldName = 'CUST_QTE_FACTOR'
    end
    object qry85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object qry85SREP_PTR: TIntegerField
      FieldName = 'SREP_PTR'
    end
    object qry85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object qry85PROMISE_SAMP_DATE: TDateTimeField
      FieldName = 'PROMISE_SAMP_DATE'
    end
    object qry85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object qry85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object qry85PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object qry85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object qry85CUST_PART_NO: TStringField
      FieldName = 'CUST_PART_NO'
      Size = 80
    end
    object qry85CUST_PART_DESC: TStringField
      FieldName = 'CUST_PART_DESC'
      Size = 200
    end
    object qry85REF_PART_NO: TStringField
      FieldName = 'REF_PART_NO'
    end
    object qry85MATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object qry85MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object qry85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object qry85ENGR_ROUTE_PTR: TIntegerField
      FieldName = 'ENGR_ROUTE_PTR'
    end
    object qry85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object qry85PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object qry85SHIPPING_CHARGE: TFloatField
      FieldName = 'SHIPPING_CHARGE'
    end
    object qry85QUOTE_TYPE: TSmallintField
      FieldName = 'QUOTE_TYPE'
    end
    object qry85SALES_ORDERS_ENTERED: TIntegerField
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object qry85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object qry85CRP_EST_QUANTITY: TFloatField
      FieldName = 'CRP_EST_QUANTITY'
    end
    object qry85EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 128
    end
    object qry85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object qry85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object qry85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object qry85NOTE_INFO: TStringField
      FieldName = 'NOTE_INFO'
      Size = 400
    end
    object qry85REJ_INFO: TMemoField
      FieldName = 'REJ_INFO'
      BlobType = ftMemo
    end
    object qry85UPANEL: TIntegerField
      FieldName = 'UPANEL'
    end
    object qry85USHEET: TBCDField
      FieldName = 'USHEET'
      Precision = 8
      Size = 2
    end
    object qry85QTE_USHEET: TBCDField
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object qry85QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object qry85QTE_UNITS: TFloatField
      FieldName = 'QTE_UNITS'
    end
    object qry85PAYMENT: TStringField
      FieldName = 'PAYMENT'
    end
    object qry85SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object qry85appd_by: TIntegerField
      FieldName = 'appd_by'
    end
    object qry85UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object qry85UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object qry85TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object qry85TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object qry85BASE_PRICE: TFloatField
      FieldName = 'BASE_PRICE'
    end
    object qry85QTE_CONTROL5: TStringField
      FieldName = 'QTE_CONTROL5'
      FixedChar = True
      Size = 1
    end
    object qry85ttype2: TWordField
      FieldName = 'ttype2'
    end
    object qry85ovhd_cost: TBCDField
      FieldName = 'ovhd_cost'
      Precision = 12
      Size = 6
    end
    object qry85base_pcscost: TBCDField
      FieldName = 'base_pcscost'
      Precision = 12
      Size = 6
    end
    object qry85total_cost: TBCDField
      FieldName = 'total_cost'
      Precision = 12
      Size = 6
    end
    object qry85comm_cost: TBCDField
      FieldName = 'comm_cost'
      Precision = 12
      Size = 6
    end
    object qry85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object qry85quote_price: TBCDField
      FieldName = 'quote_price'
      Precision = 12
      Size = 6
    end
    object qry85quote_taxprice: TBCDField
      FieldName = 'quote_taxprice'
      Precision = 12
      Size = 6
    end
    object qry85QuoteType: TIntegerField
      FieldName = 'QuoteType'
    end
    object qry85rate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object qry85SpecialCrafts: TStringField
      FieldName = 'SpecialCrafts'
      Size = 200
    end
    object qry85CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object qry85CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object qry85ROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object qry85EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qry85PHONE: TStringField
      FieldName = 'PHONE'
      Size = 14
    end
    object qry85EMAIL_1: TStringField
      FieldName = 'EMAIL_1'
      Size = 50
    end
    object qry85BJ_Name: TStringField
      FieldName = 'BJ_Name'
      Size = 16
    end
  end
  object qry432: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey85'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT t432.RKEY,t432.QTE_PTR,t432.SOURCE_PTR,t432.AMOUNT,t432.A' +
        'DDL_CAT_PTR,'
      '       t432.FREE_AMOUNT,t432.TAX_FLAG,t432.TypeMark,t61.CATEGORY'
      'FROM data0432 t432'
      ' INNER JOIN data0061 t61 ON t432.ADDL_CAT_PTR = t61.RKEY'
      'WHERE t432.QTE_PTR = :rkey85')
    Left = 216
    Top = 393
    object qry432RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry432QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object qry432SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object qry432AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object qry432ADDL_CAT_PTR: TIntegerField
      FieldName = 'ADDL_CAT_PTR'
    end
    object qry432FREE_AMOUNT: TFloatField
      FieldName = 'FREE_AMOUNT'
    end
    object qry432TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object qry432TypeMark: TIntegerField
      FieldName = 'TypeMark'
    end
    object qry432CATEGORY: TStringField
      FieldName = 'CATEGORY'
    end
  end
  object qry253: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey85'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0253.*,data0017.INV_PART_NUMBER,data0017.INV_PART_DES' +
        'CRIPTION'
      
        'from data0253 inner join data0017 on data0253.STD_INVENT_PTR=dat' +
        'a0017.RKEY'
      'where data0253.QUOTE_PTR = :rkey85')
    Left = 217
    Top = 442
    object qry253RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry253QUOTE_PTR: TIntegerField
      FieldName = 'QUOTE_PTR'
    end
    object qry253STD_INVENT_PTR: TIntegerField
      FieldName = 'STD_INVENT_PTR'
    end
    object qry253QTY: TFloatField
      FieldName = 'QTY'
    end
    object qry253price: TFloatField
      FieldName = 'price'
    end
    object qry253D0028_PTR: TIntegerField
      FieldName = 'D0028_PTR'
    end
    object qry253D0028_PRICE: TBCDField
      FieldName = 'D0028_PRICE'
      Precision = 10
      Size = 2
    end
    object qry253QTY_BOM: TWordField
      FieldName = 'QTY_BOM'
    end
    object qry253INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry253INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
  object qryTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 302
    Top = 386
  end
end
