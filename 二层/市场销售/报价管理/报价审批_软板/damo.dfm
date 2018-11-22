object DM: TDM
  OldCreateOrder = False
  Left = 394
  Top = 217
  Height = 418
  Width = 333
  object DataSource1: TDataSource
    DataSet = ADS85
    Left = 32
    Top = 68
  end
  object ADS85: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADS85CalcFields
    CommandText = 
      'SELECT Data0085.RKEY,Data0085.TNUMBER,Data0085.REF_PART_NO, '#13#10'  ' +
      '     Data0085.CUST_PART_NO,Data0085.CUST_NAME, '#13#10'       Data0085' +
      '.quote_taxprice,Data0001.CURR_NAME, '#13#10'       Data0001.CURR_CODE,' +
      'Data0085.CURR_RATE,Data0085.vatax, '#13#10'       Data0085.MARKUP,Data' +
      '0085.QTE_DATE,Data0085.EXPIRATION_DATE, '#13#10'       Data0005.EMPLOY' +
      'EE_NAME,D05.EMPL_CODE as REP_CODE, '#13#10'       D05.EMPLOYEE_NAME as' +
      ' SALES_REP_NAME,Data0008.PROD_CODE, '#13#10'       Data0008.PRODUCT_NA' +
      'ME,Data0264.CODE, '#13#10'       Data0264.QTE_APPROV_DESC,Data0346.ROW' +
      '_NAME, '#13#10'       Data0085.QBY_EMPL_PTR,Data0085.AUDITED_STATUS, '#13 +
      #10'       Data0085.APPRV_BY_PTR,Data0085.APPRV_DATE, '#13#10'       Data' +
      '0085.cust_add2,Data0274.auth_date,Data0274.auth_flag, '#13#10'       D' +
      'ata0274.ranking,dbo.data0086.ttype2,'#13#10#9'   dbo.data0086.descripti' +
      'on as '#31867#22411','#13#10'       case Data0085.quote_type when 0 then '#39#20869#38144#39#13#10'   ' +
      '    else '#39#36716#21378#39' end as '#38144#21806#26041#24335',data0085.SALES_ORDERS_ENTERED,'#13#10'      ' +
      ' case Data0085.qte_unit_ptr when 1 then '#39'PCS'#39#13#10'       when 2 the' +
      'n '#39'SET'#39' end as '#25253#20215#21333#20301',Data0085.rate_margin,'#13#10'case when TUNITS >0 t' +
      'hen'#13#10'round(data0085.SALES_ORDERS_ENTERED*data0085.UNIT_LEN*data0' +
      '085.UNIT_WTH*0.000001/TUNITS,2)'#13#10'else 0 end as mian_ji,data0085.' +
      'orig_customer,'#13#10'isNULL(Round(case Data0085.QTE_UNIT_PTR when 1 t' +
      'hen (Data0085.quote_taxprice+d8501.cost) else ((Data0085.quote_t' +
      'axprice+d8501.cost)/Data0085.TUNITS) end,7),Data0085.quote_taxpr' +
      'ice) as V_tax'#13#10'FROM   Data0085 INNER JOIN'#13#10'       Data0005 ON Da' +
      'ta0085.QBY_EMPL_PTR = Data0005.RKEY INNER JOIN'#13#10'       Data0001 ' +
      'ON Data0085.CURR_PTR = Data0001.RKEY INNER JOIN'#13#10'       Data0005' +
      ' as d05 ON Data0085.SREP_PTR = D05.RKEY INNER JOIN'#13#10'       Data0' +
      '008 ON '#13#10'       Data0085.PROD_CODE_PTR = Data0008.RKEY INNER JOI' +
      'N'#13#10'       Data0264 ON '#13#10'       Data0085.PROD_ROUTE_PTR = Data026' +
      '4.RKEY INNER JOIN'#13#10'       Data0346 ON '#13#10'       Data0085.ENGR_ROU' +
      'TE_PTR = Data0346.RKEY INNER JOIN'#13#10'       Data0274 ON Data0085.R' +
      'KEY = Data0274.qte_ptr inner join'#13#10'       data0086 on dbo.data00' +
      '85.TType2=dbo.data0086.ttype2 left join'#13#10'       Data0010 on Data' +
      '0085.CUST_PTR=Data0010.RKEY  left join '#13#10'      ('#13#10'        select' +
      ' Data0085.TNUMBER,SUM(cost) as cost '#13#10'        from Data008501 in' +
      'ner join '#13#10'        Data0085 on Data008501.D0085_Ptr=Data0085.RKE' +
      'Y '#13#10'        group by Data0085.TNUMBER'#13#10'       ) d8501 on d8501.T' +
      'NUMBER=Data0085.TNUMBER'#13#10'WHERE  Data0085.AUDITED_STATUS = 1 and'#13 +
      #10'       data0274.user_ptr=:rkey73'
    IndexFieldNames = 'TNUMBER'
    Parameters = <
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
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
      FieldName = 'curr_code'
      Size = 5
    end
    object ADS85CURR_NAME: TStringField
      DisplayLabel = #36135#24065
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
      DisplayLabel = #25240#35753#29575'%'
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
    object ADS85DSDesigner: TStringField
      DisplayWidth = 8
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
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
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'apprv_date'
    end
    object ADS85cust_add2: TStringField
      FieldName = 'cust_add2'
      Size = 100
    end
    object ADS85DSDesigner2: TStringField
      FieldName = #38144#21806#26041#24335
      ReadOnly = True
      Size = 4
    end
    object ADS85DSDesigner3: TStringField
      FieldName = #25253#20215#21333#20301
      ReadOnly = True
      Size = 3
    end
    object ADS85ststus_c: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'ststus_c'
      Size = 8
      Calculated = True
    end
    object ADS85auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADS85auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ADS85ranking: TWordField
      FieldName = 'ranking'
    end
    object ADS85rate_margin: TBCDField
      DisplayLabel = #27611#21033#29575
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADS85SALES_ORDERS_ENTERED: TIntegerField
      DisplayLabel = #19979#21333#25968#37327
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object ADS85mian_ji: TFloatField
      DisplayLabel = #19979#21333#38754#31215
      FieldName = 'mian_ji'
      ReadOnly = True
    end
    object ADS85ttype2: TWordField
      FieldName = 'ttype2'
    end
    object ADS85orig_customer: TStringField
      FieldName = 'orig_customer'
      Size = 10
    end
    object ADS85V_tax: TFloatField
      FieldName = 'V_tax'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADSA85
    Left = 32
    Top = 125
  end
  object ADSA85: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0085'#13#10'where rkey = :rkey'
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
      FieldName = 'NOTE_INFO'
      Size = 200
    end
    object ADSA85UPANEL: TIntegerField
      FieldName = 'UPANEL'
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
    object ADSA85CRP_EST_QUANTITY: TBCDField
      Alignment = taLeftJustify
      FieldName = 'CRP_EST_QUANTITY'
      Precision = 12
      Size = 6
    end
    object ADSA85SHIPPING_CHARGE: TBCDField
      Alignment = taLeftJustify
      FieldName = 'SHIPPING_CHARGE'
      Precision = 12
      Size = 6
    end
    object ADSA85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object ADSA85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object ADSA85rate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADSA85SALES_ORDERS_ENTERED: TIntegerField
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object ADSA85ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
  end
  object DataSource3: TDataSource
    DataSet = ads431
    Left = 32
    Top = 176
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
      Size = 100
    end
    object ads431ttype: TWordField
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
      Lookup = True
    end
    object ads431SPEC_RKEY: TStringField
      FieldKind = fkLookup
      FieldName = 'SPEC_RKEY'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'SPEC_RKEY'
      KeyFields = 'UNIT_PTR'
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
      Lookup = True
    end
    object ads431DATA_TYPE: TSmallintField
      FieldKind = fkLookup
      FieldName = 'DATA_TYPE'
      LookupDataSet = ads278
      LookupKeyFields = 'rkey'
      LookupResultField = 'DATA_TYPE'
      KeyFields = 'UNIT_PTR'
      Lookup = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ads511
    Left = 33
    Top = 228
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
  end
  object DataSource5: TDataSource
    DataSet = ads274
    Left = 32
    Top = 280
  end
  object ads274: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
  object ads278: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10' data0278.rkey,data0278.DATA_TYPE,'#13#10' data0278.PARAMETER_' +
      'NAME, '#13#10' data0278.PARAMETER_DESC,'#13#10' Data0278.SPEC_RKEY,'#13#10' data00' +
      '02.UNIT_NAME'#13#10'from data0278 inner join data0002'#13#10'on Data0278.UNI' +
      'T_PTR = Data0002.RKEY'#13#10'where CATEGORY_PTR<>1'
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
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 34
    Top = 12
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 125
    Top = 11
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 189
    Top = 11
  end
  object ADO8501: TADOQuery
    Connection = ADOConnection1
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
      
        'SELECT     rkey, D0085_Ptr, Cost_Name, Cost, Total_Cost, Flag_ta' +
        'x'
      'FROM         Data008501'
      'where  D0085_Ptr = :rkey')
    Left = 216
    Top = 72
    object ADO8501rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO8501D0085_Ptr: TIntegerField
      FieldName = 'D0085_Ptr'
    end
    object ADO8501Cost_Name: TStringField
      FieldName = 'Cost_Name'
      Size = 50
    end
    object ADO8501Cost: TFloatField
      FieldName = 'Cost'
    end
    object ADO8501Flag_tax: TStringField
      FieldName = 'Flag_tax'
      FixedChar = True
      Size = 10
    end
    object ADO8501Total_Cost: TFloatField
      FieldName = 'Total_Cost'
    end
  end
end
