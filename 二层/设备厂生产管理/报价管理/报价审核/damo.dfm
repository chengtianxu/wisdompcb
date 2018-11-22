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
    CommandText = 
      'SELECT t85.*, t10.CUST_CODE, t10.ABBR_NAME,t5.EMPLOYEE_NAME, t1.' +
      'CURR_NAME, t1.CURR_CODE,'#13#10't8.PROD_CODE, t8.PRODUCT_NAME, t8.PROD' +
      'UCT_DESC, t264.CODE, t264.QTE_APPROV_DESC, t274.auth_date, t274.' +
      'auth_flag, t274.ranking, '#13#10'case when t274.auth_date is null then' +
      ' '#39#26410#23457#25209#39#13#10'         else '#39#24050#23457#25209#39' end as status_c'#13#10'FROM dbo.WZCP0085 t' +
      '85 LEFT JOIN'#13#10#9' dbo.Data0010 t10 ON t85.customer_ptr = t10.RKEY ' +
      'LEFT JOIN'#13#10#9' dbo.Data0005 t5 ON t85.QBY_EMPL_PTR = t5.RKEY LEFT ' +
      'JOIN'#13#10#9' dbo.Data0001 t1 ON t85.CURR_PTR = t1.RKEY LEFT JOIN'#13#10#9' d' +
      'bo.Data0008 t8 ON t85.CUST_PART_PTR = t8.RKEY INNER JOIN'#13#10#9' dbo.' +
      'Data0264 t264 ON t85.PROD_ROUTE_PTR = t264.RKEY INNER JOIN'#13#10#9' db' +
      'o.Data0274 t274 ON t85.rkey = t274.qte_ptr'#13#10'WHERE t85.AUDITED_ST' +
      'ATUS = 1'#13#10'AND t274.user_ptr=:rkey73'
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
    object ADS85rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      Size = 50
    end
    object ADS85customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADS85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADS85CUST_CONTACT: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'CUST_CONTACT'
    end
    object ADS85CUST_CONTACT_PHONE: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'CUST_CONTACT_PHONE'
      Size = 14
    end
    object ADS85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object ADS85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object ADS85QTE_DATE: TDateTimeField
      DisplayLabel = #25253#20215#26085#26399
      FieldName = 'QTE_DATE'
    end
    object ADS85EXPIRATION_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'EXPIRATION_DATE'
    end
    object ADS85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object ADS85APPRV_DATE: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'APPRV_DATE'
    end
    object ADS85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object ADS85NOTE_INFO: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'NOTE_INFO'
      Size = 50
    end
    object ADS85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object ADS85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADS85CURR_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'CURR_RATE'
    end
    object ADS85vatax: TBCDField
      DisplayLabel = #22686#20540#31246#29575'%'
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADS85unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADS85quantity: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
    end
    object ADS85MATL_COST: TBCDField
      DisplayLabel = #26448#26009#25104#26412
      FieldName = 'MATL_COST'
      Precision = 10
      Size = 2
    end
    object ADS85manpower_cost: TBCDField
      DisplayLabel = #20154#24037#25104#26412
      FieldName = 'manpower_cost'
      Precision = 10
      Size = 2
    end
    object ADS85ovhd_cost: TBCDField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'ovhd_cost'
      Precision = 10
      Size = 2
    end
    object ADS85outward_cost: TBCDField
      DisplayLabel = #22806#21457#25104#26412
      FieldName = 'outward_cost'
      Precision = 10
      Size = 2
    end
    object ADS85manpower: TBCDField
      DisplayLabel = #24037#26102
      FieldName = 'manpower'
      Precision = 10
      Size = 2
    end
    object ADS85research_cost: TBCDField
      DisplayLabel = #30740#21457#25104#26412
      FieldName = 'research_cost'
      Precision = 10
      Size = 2
    end
    object ADS85software_cost: TBCDField
      DisplayLabel = #36719#20214#25104#26412
      FieldName = 'software_cost'
      Precision = 10
      Size = 2
    end
    object ADS85manage_cost: TBCDField
      DisplayLabel = #31649#29702#36153#29992
      FieldName = 'manage_cost'
      Precision = 10
      Size = 2
    end
    object ADS85total_cost: TBCDField
      DisplayLabel = #20986#21378#24635#25104#26412
      FieldName = 'total_cost'
      Precision = 11
      Size = 2
    end
    object ADS85profit_rate: TBCDField
      DisplayLabel = #21033#28070'%'
      FieldName = 'profit_rate'
      Precision = 5
      Size = 2
    end
    object ADS85quote_price: TBCDField
      DisplayLabel = #19981#21547#31246#25253#20215
      FieldName = 'quote_price'
      Precision = 11
      Size = 2
    end
    object ADS85quote_taxprice: TBCDField
      DisplayLabel = #21547#31246#25253#20215
      FieldName = 'quote_taxprice'
      Precision = 11
      Size = 2
    end
    object ADS85reference: TBCDField
      DisplayLabel = #21442#32771#20215#26684
      FieldName = 'reference'
      Precision = 11
      Size = 2
    end
    object ADS85superiority: TBCDField
      DisplayLabel = #20248#21183
      FieldName = 'superiority'
      Precision = 11
      Size = 2
    end
    object ADS85manpower_price: TBCDField
      FieldName = 'manpower_price'
      Precision = 10
      Size = 2
    end
    object ADS85ovhd_price: TBCDField
      FieldName = 'ovhd_price'
      Precision = 10
      Size = 2
    end
    object ADS85CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS85ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS85CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADS85CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS85PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADS85PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS85PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      DisplayWidth = 100
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS85CODE: TStringField
      DisplayLabel = #23457#25209#27969#31243#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADS85QTE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#27969#31243
      FieldName = 'QTE_APPROV_DESC'
      Size = 40
    end
    object ADS85status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADS85auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ADS85auth_flag: TStringField
      DisplayLabel = #24403#21069#23457#25209
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ADS85ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
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
    CommandText = 'select * from Data0085'#13#10'where rkey = :rkey'
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
    object ADSA85SALES_ORDERS_ENTERED: TSmallintField
      FieldName = 'SALES_ORDERS_ENTERED'
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
    ConnectionString = 'FILE NAME=D:\vss_work\172.18.12.2.udl'
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
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 112
  end
  object qryCp85: TADOQuery
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
      'select wzcp0085.*,data0008.prod_code,product_name,product_desc,'
      'data0010.cust_code,customer_name,unit_name,'
      'data0264.code,data0264.qte_approv_desc,'
      
        'dt51.empl_code,dt51.employee_name,dt52.empl_code,dt52.employee_n' +
        'ame,'
      'curr_code,curr_name,'
      'case'
      'when (wzcp0085.audited_status=0) then '#39#26410#25552#20132#39
      'when wzcp0085.audited_status=1 then '#39#24453#23457#25209#39
      'when (wzcp0085.audited_status=2) then '#39#24050#36807#26399#39
      'when wzcp0085.audited_status=3 then '#39#24050#23457#25209#39
      'when wzcp0085.audited_status=4 then '#39#34987#36864#22238#39
      'end status85'
      'from wzcp0085'
      'left join data0010 on wzcp0085.customer_ptr=data0010.rkey'
      'left join data0008 on wzcp0085.cust_part_ptr=data0008.rkey'
      'left join data0005 dt51 on wzcp0085.qby_empl_ptr=dt51.rkey'
      'left join data0005 dt52 on wzcp0085.apprv_by_ptr=dt52.rkey'
      'left join data0264 on wzcp0085.prod_route_ptr=data0264.rkey'
      'left join data0001 on wzcp0085.curr_ptr=data0001.rkey'
      'left join data0002 on wzcp0085.unit_ptr=data0002.rkey'
      'where (1=1) '
      'And wzcp0085.rkey=:rkey85')
    Left = 272
    Top = 112
    object qryCp85rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryCp85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 50
    end
    object qryCp85customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object qryCp85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object qryCp85CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
    end
    object qryCp85CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      Size = 14
    end
    object qryCp85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object qryCp85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object qryCp85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object qryCp85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object qryCp85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object qryCp85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object qryCp85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object qryCp85NOTE_INFO: TWideStringField
      FieldName = 'NOTE_INFO'
      Size = 50
    end
    object qryCp85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object qryCp85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object qryCp85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object qryCp85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object qryCp85unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object qryCp85quantity: TIntegerField
      FieldName = 'quantity'
    end
    object qryCp85MATL_COST: TBCDField
      FieldName = 'MATL_COST'
      Precision = 10
      Size = 2
    end
    object qryCp85manpower_cost: TBCDField
      FieldName = 'manpower_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85ovhd_cost: TBCDField
      FieldName = 'ovhd_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85outward_cost: TBCDField
      FieldName = 'outward_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85manpower: TBCDField
      FieldName = 'manpower'
      Precision = 10
      Size = 2
    end
    object qryCp85research_cost: TBCDField
      FieldName = 'research_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85software_cost: TBCDField
      FieldName = 'software_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85manage_cost: TBCDField
      FieldName = 'manage_cost'
      Precision = 10
      Size = 2
    end
    object qryCp85total_cost: TBCDField
      FieldName = 'total_cost'
      Precision = 11
      Size = 2
    end
    object qryCp85profit_rate: TBCDField
      FieldName = 'profit_rate'
      Precision = 5
      Size = 2
    end
    object qryCp85quote_price: TBCDField
      FieldName = 'quote_price'
      Precision = 11
      Size = 2
    end
    object qryCp85quote_taxprice: TBCDField
      FieldName = 'quote_taxprice'
      Precision = 11
      Size = 2
    end
    object qryCp85reference: TBCDField
      FieldName = 'reference'
      Precision = 11
      Size = 2
    end
    object qryCp85superiority: TBCDField
      FieldName = 'superiority'
      Precision = 11
      Size = 2
    end
    object qryCp85manpower_price: TBCDField
      FieldName = 'manpower_price'
      Precision = 10
      Size = 2
    end
    object qryCp85ovhd_price: TBCDField
      FieldName = 'ovhd_price'
      Precision = 10
      Size = 2
    end
    object qryCp85prod_code: TStringField
      FieldName = 'prod_code'
      Size = 15
    end
    object qryCp85product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object qryCp85product_desc: TStringField
      FieldName = 'product_desc'
      Size = 200
    end
    object qryCp85cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object qryCp85customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object qryCp85unit_name: TStringField
      FieldName = 'unit_name'
    end
    object qryCp85empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object qryCp85employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object qryCp85empl_code_1: TStringField
      FieldName = 'empl_code_1'
      Size = 10
    end
    object qryCp85employee_name_1: TStringField
      FieldName = 'employee_name_1'
      Size = 16
    end
    object qryCp85curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object qryCp85curr_name: TStringField
      FieldName = 'curr_name'
    end
    object qryCp85code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object qryCp85qte_approv_desc: TStringField
      FieldName = 'qte_approv_desc'
      Size = 40
    end
    object qryCp85status85: TStringField
      FieldName = 'status85'
      ReadOnly = True
      Size = 6
    end
  end
  object qryCp86: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      'select * from wzcp0086 where quote_ptr=:rkey85')
    Left = 272
    Top = 160
    object qryCp86quote_ptr: TIntegerField
      FieldName = 'quote_ptr'
    end
    object qryCp86step_no: TIntegerField
      FieldName = 'step_no'
    end
    object qryCp86material_type: TWideStringField
      FieldName = 'material_type'
      Size = 50
    end
    object qryCp86material_price: TBCDField
      FieldName = 'material_price'
      Precision = 11
      Size = 2
    end
    object qryCp86remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object qry87: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 0  * from wzcp0087')
    Left = 272
    Top = 312
    object qry87quote_ptr: TIntegerField
      FieldName = 'quote_ptr'
    end
    object qry87step_no: TIntegerField
      FieldName = 'step_no'
    end
    object qry87INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object qry87QUAN_BOM: TBCDField
      FieldName = 'QUAN_BOM'
      Precision = 10
      Size = 2
    end
    object qry87STD_COST: TBCDField
      FieldName = 'STD_COST'
      Precision = 11
      Size = 2
    end
    object qry87VENDOR: TWideStringField
      FieldName = 'VENDOR'
      Size = 50
    end
  end
  object qry87_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select wzcp0087.*, data0017.inv_part_number from wzcp0087 '
      'inner join data0017 on wzcp0087.invent_ptr=data0017.rkey'
      'where wzcp0087.quote_ptr=0')
    Left = 232
    Top = 312
    object qry87_1quote_ptr: TIntegerField
      FieldName = 'quote_ptr'
    end
    object qry87_1step_no: TIntegerField
      FieldName = 'step_no'
    end
    object qry87_1INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object qry87_1QUAN_BOM: TBCDField
      FieldName = 'QUAN_BOM'
      Precision = 10
      Size = 2
    end
    object qry87_1STD_COST: TBCDField
      FieldName = 'STD_COST'
      Precision = 11
      Size = 2
    end
    object qry87_1VENDOR: TWideStringField
      FieldName = 'VENDOR'
      Size = 50
    end
    object qry87_1inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
  end
  object ds85: TDataSource
    DataSet = qryCp85
    Left = 232
    Top = 216
  end
  object ds86: TDataSource
    DataSet = qryCp86
    Left = 232
    Top = 264
  end
  object qry86: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 0 * from wzcp0086')
    Left = 272
    Top = 264
    object qry86quote_ptr: TIntegerField
      FieldName = 'quote_ptr'
    end
    object qry86step_no: TIntegerField
      FieldName = 'step_no'
    end
    object qry86material_type: TWideStringField
      FieldName = 'material_type'
      Size = 50
    end
    object qry86material_price: TBCDField
      FieldName = 'material_price'
      Precision = 11
      Size = 2
    end
    object qry86remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object qry85: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
      'select  * from wzcp0085 Where rkey=:rkey85')
    Left = 272
    Top = 216
    object qry85rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 50
    end
    object qry85customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object qry85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object qry85CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
    end
    object qry85CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      Size = 14
    end
    object qry85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
    object qry85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object qry85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object qry85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
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
    object qry85NOTE_INFO: TWideStringField
      FieldName = 'NOTE_INFO'
      Size = 50
    end
    object qry85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object qry85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object qry85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object qry85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object qry85unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object qry85quantity: TIntegerField
      FieldName = 'quantity'
    end
    object qry85MATL_COST: TBCDField
      FieldName = 'MATL_COST'
      Precision = 10
      Size = 2
    end
    object qry85manpower_cost: TBCDField
      FieldName = 'manpower_cost'
      Precision = 10
      Size = 2
    end
    object qry85ovhd_cost: TBCDField
      FieldName = 'ovhd_cost'
      Precision = 10
      Size = 2
    end
    object qry85outward_cost: TBCDField
      FieldName = 'outward_cost'
      Precision = 10
      Size = 2
    end
    object qry85manpower: TBCDField
      FieldName = 'manpower'
      Precision = 10
      Size = 2
    end
    object qry85research_cost: TBCDField
      FieldName = 'research_cost'
      Precision = 10
      Size = 2
    end
    object qry85software_cost: TBCDField
      FieldName = 'software_cost'
      Precision = 10
      Size = 2
    end
    object qry85manage_cost: TBCDField
      FieldName = 'manage_cost'
      Precision = 10
      Size = 2
    end
    object qry85total_cost: TBCDField
      FieldName = 'total_cost'
      Precision = 11
      Size = 2
    end
    object qry85profit_rate: TBCDField
      FieldName = 'profit_rate'
      Precision = 5
      Size = 2
    end
    object qry85quote_price: TBCDField
      FieldName = 'quote_price'
      Precision = 11
      Size = 2
    end
    object qry85quote_taxprice: TBCDField
      FieldName = 'quote_taxprice'
      Precision = 11
      Size = 2
    end
    object qry85reference: TBCDField
      FieldName = 'reference'
      Precision = 11
      Size = 2
    end
    object qry85superiority: TBCDField
      FieldName = 'superiority'
      Precision = 11
      Size = 2
    end
    object qry85manpower_price: TBCDField
      FieldName = 'manpower_price'
      Precision = 10
      Size = 2
    end
    object qry85ovhd_price: TBCDField
      FieldName = 'ovhd_price'
      Precision = 10
      Size = 2
    end
  end
  object qrytemp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 160
  end
end
