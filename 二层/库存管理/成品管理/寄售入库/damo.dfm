object DM: TDM
  OldCreateOrder = False
  Left = 458
  Top = 252
  Height = 368
  Width = 411
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADS153: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
      'C, dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0010.CUST_CODE, '#13#10#9'  db' +
      'o.Data0010.CUSTOMER_NAME, dbo.Data0010.ABBR_NAME, dbo.DATA0153.P' +
      'O_NUMBER, dbo.Data0001.CURR_CODE, dbo.DATA0153.MFG_DATE, '#13#10#9'  db' +
      'o.data0439.delivery_no, dbo.Data0005.EMPLOYEE_NAME, CAST(dbo.DAT' +
      'A0153.PRICE AS float) AS price, dbo.DATA0153.TAX_RATE, '#13#10#9'  dbo.' +
      'Data0001.CURR_NAME, dbo.DATA0153.EXCH_RATE, dbo.DATA0153.REMARK,' +
      ' dbo.DATA0153.QUANTITY, dbo.DATA0153.QTY_ON_HAND, '#13#10#9'  dbo.DATA0' +
      '153.rkey, dbo.DATA0153.CUSTOMER_PTR, dbo.DATA0153.CUSTPART_PTR, ' +
      'dbo.DATA0153.CURRENCY_PTR,'#13#10#9'  dbo.Data0060.SALES_ORDER, dbo.Dat' +
      'a0025.unit_sq, dbo.DATA0153.QUANTITY*dbo.Data0025.unit_sq as inA' +
      'rea, dbo.DATA0153.SHIP_PTR,'#13#10#9'  dbo.Data0008.PROD_CODE, dbo.Data' +
      '0008.PRODUCT_NAME'#13#10'FROM  dbo.Data0060 RIGHT OUTER JOIN'#13#10'      db' +
      'o.data0439 RIGHT OUTER JOIN'#13#10'      dbo.Data0064 RIGHT OUTER JOIN' +
      #13#10'      dbo.Data0001 INNER JOIN'#13#10'      dbo.DATA0153 INNER JOIN'#13#10 +
      '      dbo.Data0010 ON dbo.DATA0153.CUSTOMER_PTR = dbo.Data0010.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR ' +
      '= dbo.Data0025.RKEY ON dbo.Data0001.RKEY = dbo.DATA0153.CURRENCY' +
      '_PTR INNER JOIN'#13#10'      dbo.Data0005 ON dbo.DATA0153.EMPL_PTR = d' +
      'bo.Data0005.RKEY ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR ON' +
      ' '#13#10'      dbo.data0439.rkey = dbo.Data0064.packing_list_ptr ON db' +
      'o.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN'#13#10'      dbo.Data' +
      '0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'where da' +
      'ta0153.mfg_date >= :dtpk1 and data0153.mfg_date <= :dtpk2'#13#10
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 36892d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 40179d
      end>
    Left = 96
    Top = 72
    object ADS153MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS153MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS153ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      DisplayWidth = 33
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADS153CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS153ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS153PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      DisplayWidth = 25
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADS153MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      DisplayWidth = 18
      FieldName = 'MFG_DATE'
    end
    object ADS153delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      DisplayWidth = 10
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADS153EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#24211#21592#24037
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS153price: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'price'
      ReadOnly = True
    end
    object ADS153TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'%'
      DisplayWidth = 6
      FieldName = 'TAX_RATE'
      Precision = 5
      Size = 2
    end
    object ADS153CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 20
      FieldName = 'CURR_NAME'
    end
    object ADS153EXCH_RATE: TBCDField
      DisplayLabel = #27719#29575
      DisplayWidth = 13
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object ADS153REMARK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 16
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS153QUANTITY: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      DisplayWidth = 10
      FieldName = 'QUANTITY'
    end
    object ADS153QTY_ON_HAND: TIntegerField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 10
      FieldName = 'QTY_ON_HAND'
    end
    object ADS153rkey: TIntegerField
      DisplayWidth = 10
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS153CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADS153CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADS153CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object ADS153CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADS153CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS153SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADS153unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215'('#13217')'
      FieldName = 'unit_sq'
    end
    object ADS153inArea: TFloatField
      DisplayLabel = #20837#24211#38754#31215'('#13217')'
      FieldName = 'inArea'
      ReadOnly = True
    end
    object ADS153SHIP_PTR: TIntegerField
      DisplayLabel = #35760#24405#21495
      FieldName = 'SHIP_PTR'
    end
    object ADS153PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS153PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS153
    Left = 40
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    EnableBCD = False
    Parameters = <>
    Left = 136
    Top = 16
  end
end
