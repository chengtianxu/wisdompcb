object DM: TDM
  OldCreateOrder = False
  Left = 470
  Top = 309
  Height = 207
  Width = 229
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object DS85: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = DS85CalcFields
    CommandText = 
      'SELECT Data0085.TNUMBER,Data0008.PROD_CODE,Data0005_1.EMPL_CODE,' +
      'Data0005_1.employee_name as sales_name,Data0010.CUST_CODE, '#13#10'   ' +
      '    Data0085.CUST_NAME AS customer_name,Data0085.REF_PART_NO,Dat' +
      'a0085.CUST_PART_NO,Data0085.TUNITS, '#13#10'       Data0085.QTE_DATE,D' +
      'ata0085.UNIT_LEN,Data0085.UNIT_WTH,Data0085.MARKUP,Data0001.CURR' +
      '_CODE, '#13#10'       Data0005.EMPLOYEE_NAME,Data0085.TTYPE,Data0085.A' +
      'UDITED_STATUS,Data0085.quote_taxprice, '#13#10'       Data0008.PRODUCT' +
      '_NAME,Data0085.vatax,Data0085.EXPIRATION_DATE,data0085.ENTER_DAT' +
      'E,Data0085.rate_margin,Data0085.TUSAGE'#13#10'FROM   Data0010 RIGHT OU' +
      'TER JOIN'#13#10'       Data0008 INNER JOIN'#13#10'       Data0001 INNER JOIN' +
      #13#10'       Data0085 ON Data0001.RKEY = Data0085.CURR_PTR INNER JOI' +
      'N'#13#10'       Data0005 ON Data0085.QBY_EMPL_PTR = Data0005.RKEY ON D' +
      'ata0008.RKEY = Data0085.PROD_CODE_PTR INNER JOIN'#13#10'       Data000' +
      '5 as Data0005_1 ON Data0085.SREP_PTR = Data0005_1.RKEY ON Data00' +
      '10.RKEY = Data0085.CUST_PTR'
    IndexFieldNames = 'TNUMBER'
    Parameters = <>
    Left = 80
    Top = 56
    object DS85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      Size = 10
    end
    object DS85REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'REF_PART_NO'
    end
    object DS85CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object DS85TUNITS: TIntegerField
      DisplayLabel = 'PCS/'#25340#29256#21333#20803
      FieldName = 'TUNITS'
    end
    object DS85QTE_DATE: TDateTimeField
      DisplayLabel = #25253#20215#26085#26399
      FieldName = 'QTE_DATE'
    end
    object DS85UNIT_LEN: TFloatField
      DisplayLabel = #21333#20803#38271#24230
      FieldName = 'UNIT_LEN'
    end
    object DS85UNIT_WTH: TFloatField
      DisplayLabel = #21333#20803#23485#24230
      FieldName = 'UNIT_WTH'
    end
    object DS85quote_taxprice: TBCDField
      DisplayLabel = #21547#31246#21333#20215
      FieldName = 'quote_taxprice'
      Precision = 12
      Size = 6
    end
    object DS85vatax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object DS85CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object DS85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object DS85TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object DS85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object DS85type: TStringField
      DisplayLabel = #25253#20215#27169#24335
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
    object DS85status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'status'
      Calculated = True
    end
    object DS85MARKUP: TFloatField
      DisplayLabel = #25240#29575
      FieldName = 'MARKUP'
    end
    object DS85cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object DS85customer_name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'customer_name'
      ReadOnly = True
      Size = 100
    end
    object DS85PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object DS85PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object DS85EXPIRATION_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRATION_DATE'
    end
    object DS85ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object DS85rate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object DS85TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object DS85EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object DS85sales_name: TStringField
      FieldName = 'sales_name'
      Size = 16
    end
  end
  object ADS85_17: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADS85_17CalcFields
    CommandText = 
      'SELECT DISTINCT '#13#10'       Data0085.TNUMBER,Data0008.PROD_CODE,Dat' +
      'a0005_1.EMPL_CODE,Data0005_1.employee_name as sales_name,Data001' +
      '0.CUST_CODE, '#13#10'       Data0085.CUST_NAME AS customer_name,Data00' +
      '85.REF_PART_NO,Data0085.CUST_PART_NO,Data0085.TUNITS, '#13#10'       D' +
      'ata0085.QTE_DATE,Data0085.UNIT_LEN,Data0085.UNIT_WTH,Data0085.MA' +
      'RKUP,Data0001.CURR_CODE, '#13#10'       Data0005.EMPLOYEE_NAME,Data008' +
      '5.TTYPE,Data0085.AUDITED_STATUS,Data0085.quote_taxprice, '#13#10'     ' +
      '  Data0008.PRODUCT_NAME,Data0085.vatax,Data0085.EXPIRATION_DATE,' +
      'Data0017.INV_PART_NUMBER, '#13#10'       Data0017.INV_NAME,Data0017.IN' +
      'V_DESCRIPTION,Data0253.QTY_BOM,Data0085.ENTER_DATE,Data0023.ABBR' +
      '_NAME,'#13#10'       Data0085.rate_margin,Data0085.TUSAGE'#13#10'FROM   Data' +
      '0023 INNER JOIN'#13#10'       Data0028 ON dbo.Data0023.RKEY = dbo.Data' +
      '0028.SUPPLIER_PTR RIGHT OUTER JOIN'#13#10'       Data0253 INNER JOIN'#13#10 +
      '       Data0008 INNER JOIN'#13#10'       Data0001 INNER JOIN'#13#10'       D' +
      'ata0085 ON Data0001.RKEY = Data0085.CURR_PTR INNER JOIN'#13#10'       ' +
      'Data0005 ON Data0085.QBY_EMPL_PTR = Data0005.RKEY ON Data0008.RK' +
      'EY = Data0085.PROD_CODE_PTR INNER JOIN'#13#10'       Data0005 as Data0' +
      '005_1 ON Data0085.SREP_PTR = Data0005_1.RKEY ON Data0253.QUOTE_P' +
      'TR = Data0085.RKEY INNER JOIN'#13#10'       Data0017 ON Data0253.STD_I' +
      'NVENT_PTR = Data0017.RKEY ON Data0028.RKEY = Data0253.D0028_PTR ' +
      'LEFT OUTER JOIN'#13#10'       Data0010 ON Data0085.CUST_PTR = Data0010' +
      '.RKEY'
    Parameters = <>
    Left = 80
    Top = 112
    object ADS85_17TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ADS85_17PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS85_17cust_code: TStringField
      DisplayLabel = #23458#25143#20195#21495
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object ADS85_17REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'REF_PART_NO'
    end
    object ADS85_17CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object ADS85_17TUNITS: TIntegerField
      DisplayLabel = 'PCS/'#25340#29256#21333#20803
      FieldName = 'TUNITS'
    end
    object ADS85_17QTE_DATE: TDateTimeField
      DisplayLabel = #25253#20215#26085#26399
      FieldName = 'QTE_DATE'
    end
    object ADS85_17UNIT_LEN: TFloatField
      DisplayLabel = #21333#20803#38271#24230
      FieldName = 'UNIT_LEN'
    end
    object ADS85_17UNIT_WTH: TFloatField
      DisplayLabel = #21333#20803#23485#24230
      FieldName = 'UNIT_WTH'
    end
    object ADS85_17quote_taxprice: TBCDField
      DisplayLabel = #21547#31246#21333#20215
      FieldName = 'quote_taxprice'
      Precision = 12
      Size = 10
    end
    object ADS85_17CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS85_17EMPLOYEE_NAME: TStringField
      DisplayLabel = #21046#21333#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS85_17TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADS85_17AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object ADS85_17type: TStringField
      DisplayLabel = #25253#20215#27169#24335
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
    object ADS85_17status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'status'
      Calculated = True
    end
    object ADS85_17MARKUP: TFloatField
      DisplayLabel = #25240#29575
      FieldName = 'MARKUP'
    end
    object ADS85_17customer_name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'customer_name'
      ReadOnly = True
      Size = 100
    end
    object ADS85_17INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS85_17INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS85_17INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS85_17PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS85_17vatax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADS85_17EXPIRATION_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRATION_DATE'
    end
    object ADS85_17QTY_BOM: TWordField
      DisplayLabel = #23618#21387#27604#20363
      FieldName = 'QTY_BOM'
    end
    object ADS85_17ENTER_DATE: TDateTimeField
      FieldName = 'ENTER_DATE'
    end
    object ADS85_17ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS85_17rate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object ADS85_17TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object ADS85_17EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS85_17sales_name: TStringField
      FieldName = 'sales_name'
      Size = 16
    end
  end
end
