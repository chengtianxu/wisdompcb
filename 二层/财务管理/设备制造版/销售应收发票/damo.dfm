object DM: TDM
  OldCreateOrder = False
  Left = 421
  Top = 233
  Height = 444
  Width = 549
  object ADOConnection1: TADOConnection
    ConnectionString = 'FILE NAME=D:\vss_work\172.18.12.2.udl'
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object AqD112: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AqD112AfterOpen
    OnCalcFields = AqD112CalcFields
    CommandText = 
      'SELECT dbo.Data0112.RKEY, dbo.Data0112.invoice_number, '#13#10'      d' +
      'bo.Data0112.INVOICE_DATE, dbo.Data0112.INVOICE_STATUS, '#13#10'      d' +
      'bo.Data0112.sales_order_ptr, data0112.empl_ptr,data0015.abbr_nam' +
      'e as abbrname15,'#13#10'      dbo.Data0010.CUST_CODE, dbo.Data0010.CUS' +
      'TOMER_NAME, '#13#10'       dbo.Data0112.CUSTOMER_PTR, dbo.Data0060.SAL' +
      'ES_ORDER, '#13#10'      dbo.Data0112.INVOICE_TOTAL, dbo.Data0001.CURR_' +
      'CODE, '#13#10'      dbo.Data0010.ABBR_NAME, dbo.Data0001.CURR_NAME, '#13#10 +
      '      dbo.Data0112.EXCHANGE_RATE, dbo.Data0105.VOUCHER, '#13#10'      ' +
      'dbo.Data0005.EMPLOYEE_NAME,Data0105.STATUS,  data0015.WAREHOUSE_' +
      'CODE,'#13#10'      data0112.amount_paid+data0112. CASH_DISC as '#24050#20184#37329#39069','#13#10 +
      '      case   data0112.INVOICE_STATUS'#13#10'      when 1 then '#39#26377#25928#30340#39' wh' +
      'en 2 then '#39#24050#20184#27454#39' when 3 then '#39#24050#21462#28040#39#13#10'     end as '#21457#31080#29366#24577',  data0010.A' +
      'CC_REC_PTR,data0112.invoice_type,'#13#10'      round(Data0112.INVOICE_' +
      'TOTAL*Data0112.EXCHANGE_RATE,2) as total_amount,'#13#10'      data0105' +
      '.rkey as rkey105, data0112.POSTED_DATE,data0112.GLPTR_STATUS'#13#10'FR' +
      'OM dbo.Data0112 LEFT OUTER JOIN'#13#10'      dbo.Data0060 ON '#13#10'      d' +
      'bo.Data0112.sales_order_ptr = dbo.Data0060.RKEY LEFT OUTER JOIN'#13 +
      #10'      dbo.Data0105 ON dbo.Data0105.SOURCE_PTR = dbo.Data0112.RK' +
      'EY AND '#13#10'      dbo.Data0105.TRANS_TYPE = 5 INNER JOIN'#13#10'      dbo' +
      '.Data0010 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0010.RKEY INNER' +
      ' JOIN'#13#10'      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR = dbo.Dat' +
      'a0001.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0112.EMPL_P' +
      'TR = dbo.Data0005.RKEY left outer join '#13#10'      data0015 on data0' +
      '112.warehouse_ptr = data0015.rkey'#13#10'WHERE '#13#10'               (data0' +
      '112.POSTED_DATE  >= :dtpk1) and'#13#10'               (data0112.POSTED' +
      '_DATE  <= :dtpk2)'
    IndexFieldNames = 'invoice_number'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37347d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38869d
      end>
    Prepared = True
    Left = 92
    Top = 88
    object AqD112RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AqD112invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object AqD112INVOICE_DATE: TDateTimeField
      DisplayLabel = #24080#40836#26085#26399
      FieldName = 'INVOICE_DATE'
    end
    object AqD112INVOICE_STATUS: TWordField
      FieldName = 'INVOICE_STATUS'
    end
    object AqD112sales_order_ptr: TIntegerField
      FieldName = 'sales_order_ptr'
    end
    object AqD112CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AqD112ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AqD112CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 20
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object AqD112CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AqD112SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object AqD112INVOICE_TOTAL: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object AqD112CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AqD112CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object AqD112STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object AqD112v_status: TStringField
      DisplayLabel = #20973#35777#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 10
      Calculated = True
    end
    object AqD112EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 5
      FieldName = 'EXCHANGE_RATE'
    end
    object AqD112VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object AqD112EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AqD112TYPE: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Size = 8
      Calculated = True
    end
    object AqD112DSDesigner: TBCDField
      FieldName = #24050#20184#37329#39069
      ReadOnly = True
      Precision = 19
    end
    object AqD112DSDesigner2: TStringField
      FieldName = #21457#31080#29366#24577
      ReadOnly = True
      Size = 6
    end
    object AqD112ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object AqD112invoice_type: TWordField
      FieldName = 'invoice_type'
    end
    object AqD112total_amount: TFloatField
      FieldName = 'total_amount'
      ReadOnly = True
    end
    object AqD112rkey105: TIntegerField
      FieldName = 'rkey105'
      ReadOnly = True
    end
    object AqD112empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object AqD112POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
    end
    object AqD112GLPTR_STATUS: TBooleanField
      DisplayLabel = #24635#24080#26631#35782
      FieldName = 'GLPTR_STATUS'
    end
    object AqD112abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object AqD112WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = AqD112
    Left = 32
    Top = 88
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 24
  end
  object ADO112: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from data0112'
      'where rkey=:rkey')
    Left = 92
    Top = 144
    object ADO112RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO112invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ADO112sales_order_ptr: TIntegerField
      FieldName = 'sales_order_ptr'
    end
    object ADO112EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO112CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADO112CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO112INVOICE_DATE: TDateTimeField
      DisplayLabel = #24080#40836#26085#26399
      FieldName = 'INVOICE_DATE'
    end
    object ADO112INVOICE_STATUS: TWordField
      FieldName = 'INVOICE_STATUS'
    end
    object ADO112SHIPPING_CHARGES: TBCDField
      FieldName = 'SHIPPING_CHARGES'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112ship_amount: TBCDField
      FieldName = 'ship_amount'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112FED_TAX_AMOUNT: TBCDField
      FieldName = 'FED_TAX_AMOUNT'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112DISCOUNT_AMOUNT: TBCDField
      FieldName = 'DISCOUNT_AMOUNT'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112INVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112TOOLING_CHARGES: TBCDField
      FieldName = 'TOOLING_CHARGES'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112amount_paid: TBCDField
      FieldName = 'amount_paid'
      Precision = 19
    end
    object ADO112CASH_DISC: TBCDField
      FieldName = 'CASH_DISC'
      Precision = 19
    end
    object ADO112amount_credited: TBCDField
      FieldName = 'amount_credited'
      Precision = 19
    end
    object ADO112EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADO112MISC_INV_DESCRIPTION: TStringField
      FieldName = 'MISC_INV_DESCRIPTION'
      FixedChar = True
      Size = 40
    end
    object ADO112COMMISION_PROCESSED: TStringField
      FieldName = 'COMMISION_PROCESSED'
      FixedChar = True
      Size = 1
    end
    object ADO112STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO112ship_tax: TBCDField
      FieldName = 'ship_tax'
      Precision = 19
    end
    object ADO112ship_tax_amount: TBCDField
      FieldName = 'ship_tax_amount'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112PERIOD_POSTED: TSmallintField
      FieldName = 'PERIOD_POSTED'
    end
    object ADO112POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
    end
    object ADO112RUSH_CHARGE_AMOUNT: TBCDField
      FieldName = 'RUSH_CHARGE_AMOUNT'
      Precision = 19
    end
    object ADO112OVERSHIP_AMOUNT: TBCDField
      FieldName = 'OVERSHIP_AMOUNT'
      DisplayFormat = '#,##0.00'#9
      Precision = 19
    end
    object ADO112CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO112ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      FixedChar = True
    end
    object ADO112ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      FixedChar = True
    end
    object ADO112ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      FixedChar = True
    end
    object ADO112ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
      FixedChar = True
    end
    object ADO112ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      FixedChar = True
    end
    object ADO112discount_pct: TBCDField
      FieldName = 'discount_pct'
      Precision = 19
    end
    object ADO112discount_days: TSmallintField
      FieldName = 'discount_days'
    end
    object ADO112net_pay: TSmallintField
      FieldName = 'net_pay'
    end
    object ADO112DUE_DATE: TDateTimeField
      DisplayLabel = #21040#26399#26085#26399
      FieldName = 'DUE_DATE'
    end
    object ADO112INVOICE_TYPE: TWordField
      FieldName = 'INVOICE_TYPE'
    end
    object ADO112GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADO112warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO112
    Left = 32
    Top = 144
  end
  object ADOD04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from Data0004'#13 +
      #10'where rkey=24'
    Parameters = <>
    Left = 144
    Top = 144
    object ADOD04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOD04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOD04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADOD64: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select t70.SALES_ORDER, t70.sales_date,'#13#10'      t8.PROD_CODE, t8.' +
      'PRODUCT_NAME, t8.PRODUCT_DESC,'#13#10'      t63.quantity, t63.price, t' +
      '63.tax_rate, '#13#10'      '#39'Y'#39' as tax_in_price,'#13#10'      t63.rkey, t63.s' +
      'o_ptr'#13#10'from WZCP0063 t63 INNER JOIN'#13#10'     WZCP0060 t60 ON t63.so' +
      '_ptr = t60.RKEY INNER JOIN'#13#10'     WZCP0070 t70 ON t60.SALES_REP_P' +
      'TR = t70.RKEY INNER JOIN'#13#10'     Data0008 t8 ON t63.prod_ptr = t8.' +
      'RKEY'#13#10'where t60.invoice_ptr=:rkey112'
    Parameters = <
      item
        Name = 'rkey112'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 91
    Top = 200
    object ADOD64SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      Size = 12
    end
    object ADOD64price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADOD64tax_rate: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADOD64quantity: TBCDField
      DisplayLabel = #20986#20179#25968#37327' '
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object ADOD64tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADOD64sales_date: TDateTimeField
      DisplayLabel = #35746#21333#36755#20837#26085#26399
      FieldName = 'sales_date'
    end
    object ADOD64so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOD64rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOD64PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADOD64PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOD64PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
  object ADO104: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0104'
      'where rkey=5')
    Left = 144
    Top = 88
    object ADO104RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO104JOURNAL_TITLE: TStringField
      FieldName = 'JOURNAL_TITLE'
      FixedChar = True
      Size = 30
    end
    object ADO104DFLT_ACCT_01: TIntegerField
      FieldName = 'DFLT_ACCT_01'
    end
    object ADO104DFLT_ACCT_02: TIntegerField
      FieldName = 'DFLT_ACCT_02'
    end
    object ADO104DFLT_ACCT_03: TIntegerField
      FieldName = 'DFLT_ACCT_03'
    end
    object ADO104DFLT_ACCT_04: TIntegerField
      FieldName = 'DFLT_ACCT_04'
    end
    object ADO104DFLT_ACCT_05: TIntegerField
      FieldName = 'DFLT_ACCT_05'
    end
    object ADO104DFLT_ACCT_06: TIntegerField
      FieldName = 'DFLT_ACCT_06'
    end
    object ADO104DFLT_ACCT_07: TIntegerField
      FieldName = 'DFLT_ACCT_07'
    end
    object ADO104DFLT_ACCT_08: TIntegerField
      FieldName = 'DFLT_ACCT_08'
    end
    object ADO104DFLT_ACCT_09: TIntegerField
      FieldName = 'DFLT_ACCT_09'
    end
    object ADO104DFLT_ACCT_10: TIntegerField
      FieldName = 'DFLT_ACCT_10'
    end
  end
  object ADO105: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from data0105'
      'where Data0105.TRANS_TYPE = 5 and'
      'Data0105.SOURCE_PTR=:rkey '
      '      ')
    Left = 208
    Top = 88
    object ADO105RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object ADO105BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADO105STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO105VOU_TYPE: TSmallintField
      FieldName = 'VOU_TYPE'
    end
    object ADO105TRANS_TYPE: TSmallintField
      FieldName = 'TRANS_TYPE'
    end
    object ADO105SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO105ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO105AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object ADO105POSTED_BY_EMPL_PTR: TIntegerField
      FieldName = 'POSTED_BY_EMPL_PTR'
    end
    object ADO105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object ADO105POSTED_DT: TDateTimeField
      FieldName = 'POSTED_DT'
    end
    object ADO105REOCCURING_TRANS_FLG: TStringField
      FieldName = 'REOCCURING_TRANS_FLG'
      FixedChar = True
      Size = 1
    end
    object ADO105REVERSE_TRANS_FLAG: TStringField
      FieldName = 'REVERSE_TRANS_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO105DATA0105_PTR_REVERSE: TIntegerField
      FieldName = 'DATA0105_PTR_REVERSE'
    end
    object ADO105SPECIAL_POSTING: TStringField
      FieldName = 'SPECIAL_POSTING'
      FixedChar = True
      Size = 1
    end
    object ADO105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADO105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADO105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADO105SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO105CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADO105casher_ptr: TIntegerField
      FieldName = 'casher_ptr'
    end
    object ADO105supervisor_ptr: TIntegerField
      FieldName = 'supervisor_ptr'
    end
  end
  object ADO106: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from data0106'
      'where GL_HEADER_PTR=:rkey')
    Left = 208
    Top = 144
    object ADO106RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADO106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 10
    end
    object ADO106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADO106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADO106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADO106INV_PTR: TIntegerField
      FieldName = 'INV_PTR'
    end
    object ADO106UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADO106PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADO106QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object Aqd105: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0105.rkey,Data0105.VOUCHER, dbo.Data0005.EMPLOYEE_NAM' +
      'E, dbo.Data0105.FYEAR, '#13#10'      dbo.Data0105.PERIOD, dbo.Data0105' +
      '.ATTACHED, dbo.Data0105.ENTERED_DT '#13#10'FROM dbo.Data0105 INNER JOI' +
      'N'#13#10'      dbo.Data0005 ON '#13#10'      dbo.Data0105.ENTERED_BY_EMPL_PT' +
      'R = dbo.Data0005.RKEY'#13#10'WHERE (dbo.Data0105.TRANS_TYPE = 5) and'#13#10 +
      '           Data0105.SOURCE_PTR=:rkey112'
    Parameters = <
      item
        Name = 'rkey112'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 200
    object Aqd105rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqd105VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object Aqd105EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqd105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object Aqd105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object Aqd105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object Aqd105ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
  end
  object ADO65: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from data0065'
      'where INVOICE_PTR=:rkey')
    Left = 256
    Top = 88
    object ADO65RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO65INVOICE_PTR: TIntegerField
      FieldName = 'INVOICE_PTR'
    end
    object ADO65ADDL_CATEGORY_PTR: TIntegerField
      FieldName = 'ADDL_CATEGORY_PTR'
    end
    object ADO65AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ADO65TAXABLE_FLAG: TStringField
      FieldName = 'TAXABLE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO65COMMISSION_FLAG: TStringField
      FieldName = 'COMMISSION_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO65FREE_AMOUNT: TBCDField
      FieldName = 'FREE_AMOUNT'
      Precision = 9
      Size = 2
    end
  end
  object Aqd508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select CURR_FYEAR, CURR_PERIOD'#13#10'from data0508'
    Parameters = <>
    Left = 256
    Top = 144
    object Aqd508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object Aqd508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
  end
  object Aqd106: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = Aqd106CalcFields
    CommandText = 
      'SELECT dbo.Data0106.DESCRIPTION, dbo.Data0106.AMOUNT, dbo.Data01' +
      '06.D_C, '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR, dbo.Data0106.CURR_P' +
      'TR, '#13#10'      dbo.Data0106.EXCH_RATE, dbo.Data0001.CURR_CODE, dbo.' +
      'Data0001.CURR_NAME, '#13#10'      dbo.Data0103.GL_ACC_NUMBER, dbo.Data' +
      '0103.GL_DESCRIPTION, '#13#10'      Data0103_1.GL_DESCRIPTION AS father' +
      '_desc, data0106.PRICE,'#13#10'      Data0103_2.GL_DESCRIPTION AS grand' +
      'father_desc'#13#10'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'#13#10'    ' +
      '  dbo.Data0103 Data0103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_' +
      '1.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0106 INNER JOIN'#13#10'  ' +
      '    dbo.Data0103 ON '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Da' +
      'ta0103.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0106.CURR_' +
      'PTR = dbo.Data0001.RKEY ON '#13#10'      Data0103_1.RKEY = dbo.Data010' +
      '3.PARENT_PTR'#13#10'where data0106.GL_HEADER_PTR=:rkey105'
    Parameters = <
      item
        Name = 'rkey105'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 256
    object Aqd106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object Aqd106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object Aqd106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object Aqd106gl_desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'gl_desc'
      ReadOnly = True
      Size = 200
      Calculated = True
    end
    object Aqd106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object Aqd106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object Aqd106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Aqd106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqd106CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqd106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Aqd106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object Aqd106father_desc: TStringField
      FieldName = 'father_desc'
      Size = 50
    end
    object Aqd106grandfather_desc: TStringField
      FieldName = 'grandfather_desc'
      Size = 50
    end
    object Aqd106PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 14
      Size = 2
    end
  end
end
