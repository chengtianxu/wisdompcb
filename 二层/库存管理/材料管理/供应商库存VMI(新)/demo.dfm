object dm: Tdm
  OldCreateOrder = False
  Left = 526
  Top = 276
  Height = 485
  Width = 723
  object tmpt: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 24
  end
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 31
  end
  object ADS70: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS70AfterScroll
    CommandText = 
      'SELECT Data0070.RKEY,Data0070.PO_TYPE,Data0070.PO_NUMBER,'#13#10'     ' +
      ' Data0070.CONFIRMATION_NUMBER, Data0070.PO_DATE,'#13#10'      Data0023' +
      '.CODE, Data0023.SUPPLIER_NAME,Data0023.ABBR_NAME AS abbr_suppnam' +
      'e,'#13#10'      Data0015.ABBR_NAME AS abbr_warename,Data0070.WAREHOUSE' +
      '_POINTER,'#13#10'      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME' +
      ','#13#10'      Data0070.CURRENCY_PTR,Data0001.CURR_CODE, Data0001.CURR' +
      '_NAME,'#13#10'      Data0070.EXCHANGE_RATE, Data0034.DEPT_NAME,'#13#10'     ' +
      ' Data0070.SHIPTO_ADDRESS,Data0070.SUPPLIER_POINTER'#13#10#13#10'FROM dbo.D' +
      'ata0070 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'      dbo.Data0070.S' +
      'UPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data00' +
      '15 ON '#13#10'      dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY' +
      ' INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0070.CURRENCY' +
      '_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0034 ON ' +
      'dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE'#13#10'WHERE (dbo.Data' +
      '0070.STATUS = 5)  and  Data0070.PO_TYPE='#39'S'#39'  and '#13#10'  Data0070.ST' +
      'ATE_INVT_TAX_FLAG='#39'Y'#39#13#10#13#10#13#10
    IndexFieldNames = 'PO_NUMBER'
    Parameters = <>
    Left = 144
    Top = 120
    object ADS70RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS70PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object ADS70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADS70CONFIRMATION_NUMBER: TStringField
      DisplayLabel = #26368#21518#23457#26680#20154
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADS70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADS70CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADS70SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADS70abbr_suppname: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'abbr_suppname'
      Size = 10
    end
    object ADS70abbr_warename: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_warename'
      Size = 10
    end
    object ADS70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object ADS70WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADS70CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADS70CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS70CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS70EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADS70DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS70SHIPTO_ADDRESS: TStringField
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object ADS70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
  end
  object ADO71: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT dbo.Data0071.RKEY, dbo.Data0017.INV_NAME, dbo.Data0017.IN' +
        'V_DESCRIPTION, '
      
        '      dbo.Data0071.QUAN_ORD, Data0071.QUAN_RECD, dbo.Data0071.RE' +
        'Q_DATE, '
      
        '      dbo.Data0071.extra_req, dbo.Data0002.UNIT_NAME, dbo.Data00' +
        '71.WO_PTR, '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR, dbo.Data0071.TAX_2, data00' +
        '17.STOCK_BASE,'
      
        '      dbo.Data0071.CONVERSION_FACTOR, dbo.Data0071.INVT_PTR, dat' +
        'a0017.CRITICAL_MATL_FLAG,'
      
        '      dbo.Data0017.SHELF_LIFE, Data0002_1.UNIT_NAME AS pr_unitna' +
        'me, data0071.QUAN_IN_INSP,'
      
        '      Data0017.INV_PART_NUMBER, Data0071.tax_price, data0071.avl' +
        '_flag,'
      
        '      dbo.Data0071.rohs,Data0071.QUAN_ORD-Data0071.QUAN_RECD as ' +
        #27424#36135#25968#37327',data0071.ORIG_ABBRNAME'
      'FROM dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR ' +
        'INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_' +
        '1.RKEY'
      'where data0071.PO_ptr=:rkey')
    Left = 105
    Top = 263
    object ADO71RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO71INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO71INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO71QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADO71QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
    end
    object ADO71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO71extra_req: TStringField
      FieldName = 'extra_req'
    end
    object ADO71UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO71WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO71PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO71TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO71STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object ADO71CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADO71INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO71CRITICAL_MATL_FLAG: TWordField
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object ADO71SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object ADO71pr_unitname: TStringField
      FieldName = 'pr_unitname'
    end
    object ADO71QUAN_IN_INSP: TFloatField
      FieldName = 'QUAN_IN_INSP'
    end
    object ADO71INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO71tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO71avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADO71rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO71DSDesigner: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADO71ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object ADO134: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <
      item
        Name = 'rkey133'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0134 where grn_ptr=:rkey133')
    Left = 152
    Top = 264
    object ADO134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO134GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object ADO134INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO134SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO134LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO134UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ADO134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO134QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADO134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADO134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO134MANU_DATE: TDateTimeField
      FieldName = 'MANU_DATE'
    end
    object ADO134cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADO134SUPPLIER3: TStringField
      FieldName = 'SUPPLIER3'
      Size = 30
    end
    object ADO134rkey391: TIntegerField
      FieldName = 'rkey391'
    end
    object ADO134tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO134PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO134ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object ADO134_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    EnableBCD = False
    Parameters = <
      item
        Name = 'rkey133'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0134.*, dbo.Data0002.UNIT_NAME, dbo.Data0017.' +
        'INV_PART_NUMBER, dbo.Data0017.INV_name,inv_DESCRIPTION, '
      '                      dbo.Data0016.LOCATION'
      'FROM         dbo.DATA0134 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = db' +
        'o.Data0002.RKEY'
      ' where data0134.grn_ptr=:rkey133')
    Left = 64
    Top = 184
    object ADO134_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO134_1GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object ADO134_1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO134_1SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO134_1LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO134_1UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADO134_1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ADO134_1QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO134_1QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADO134_1PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADO134_1TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO134_1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO134_1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO134_1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADO134_1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO134_1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO134_1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO134_1INV_name: TStringField
      FieldName = 'INV_name'
      Size = 30
    end
    object ADO134_1inv_DESCRIPTION: TStringField
      FieldName = 'inv_DESCRIPTION'
      Size = 70
    end
    object ADO134_1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADO134_1MANU_DATE: TDateTimeField
      FieldName = 'MANU_DATE'
    end
    object ADO134_1cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADO134_1SUPPLIER3: TStringField
      FieldName = 'SUPPLIER3'
      Size = 30
    end
    object ADO134_1tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADO134_1rkey391: TIntegerField
      FieldName = 'rkey391'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 24
  end
  object ADO148: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rkey,GON_NUMBER, warehouse_ptr,TTYPE, CREATE_DATE, CREATE' +
        '_BY, '
      '      RECD_BY, REF_NUMBER,supplier_ptr,status'
      'FROM dbo.data0724'
      'where rkey is null')
    Left = 512
    Top = 128
    object ADO148rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO148GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ADO148warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO148TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO148CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO148CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO148RECD_BY: TIntegerField
      FieldName = 'RECD_BY'
    end
    object ADO148REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 50
    end
    object ADO148supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object ADO148status: TWordField
      FieldName = 'status'
    end
  end
  object ADO149: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT INVENTORY_PTR, GON_PTR, D0134_PTR, QUANTITY, RTN_QUANTITY' +
        ', '
      ' tax_price,TAX_2     '
      'FROM Data0149'
      'where rkey is null')
    Left = 584
    Top = 136
    object ADO149INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO149GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
    object ADO149D0134_PTR: TIntegerField
      FieldName = 'D0134_PTR'
    end
    object ADO149QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 14
    end
    object ADO149RTN_QUANTITY: TBCDField
      FieldName = 'RTN_QUANTITY'
      Precision = 14
    end
    object ADO149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO149TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
  end
  object ADOtemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 392
    Top = 80
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'table_name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where table_name=:table_name')
    Left = 325
    Top = 76
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 240
    Top = 176
  end
  object DSQry: TDataSource
    DataSet = ADOQry
    Left = 600
    Top = 48
  end
  object ADOQry: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0134.*, dbo.Data0017.INV_PART_NUMBER,  dbo.Da' +
        'ta0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT' +
        '_CODE, dbo.Data0016.LOCATION, '
      
        '                      dbo.Data0070.PO_NUMBER, dbo.Data0015.WAREH' +
        'OUSE_CODE, dbo.Data0023.CODE'
      
        '                    ,dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.AB' +
        'BR_NAME, '
      
        '                      dbo.Data0001.CURR_CODE, dbo.Data0005.EMPLO' +
        'YEE_NAME, dbo.DATA0133.*'
      'FROM         dbo.DATA0134 INNER JOIN'
      
        '                      dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo' +
        '.DATA0133.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = db' +
        'o.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0133.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.DATA0133.currency_ptr ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0133.CREATE_BY = d' +
        'bo.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0070 ON dbo.DATA0133.PO_PTR = dbo.' +
        'Data0070.RKEY')
    Left = 504
    Top = 49
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object IntegerField2: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object IntegerField3: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object IntegerField5: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object BCDField1: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object BCDField2: TBCDField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object BCDField3: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object BCDField4: TBCDField
      DisplayLabel = #20215#26684'('#21547#31246')'
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object BCDField5: TBCDField
      DisplayLabel = #20215#26684'('#19981#21547#31246')'
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object BCDField6: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object StringField1: TStringField
      DisplayLabel = #22791'  '#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = #20379#24212#21830#29289#26009#25209#27425
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object StringField3: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object StringField4: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQryINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQryINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object StringField6: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object StringField7: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object StringField8: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object StringField9: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object StringField10: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object StringField11: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object StringField12: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object StringField13: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'RKEY_1'
      ReadOnly = True
    end
    object StringField14: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object StringField15: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object IntegerField6: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object IntegerField7: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object IntegerField8: TIntegerField
      FieldName = 'currency_ptr'
    end
    object BCDField7: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object IntegerField9: TIntegerField
      FieldName = 'PO_PTR'
    end
    object SmallintField1: TSmallintField
      FieldName = 'TTYPE'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object IntegerField10: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object StringField16: TStringField
      DisplayLabel = #36865#36135#20154#21592
      FieldName = 'ship_BY'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object StringField17: TStringField
      DisplayLabel = #20837#24211#22791#27880
      FieldName = 'REF_NUMBER'
      Size = 100
    end
  end
  object ADS133: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'select data0133.*,data0015.warehouse_code,data0015.warehouse_nam' +
        'e,data0023.code,data0023.supplier_name,data0023.abbr_name,'
      
        'data0001.curr_code,data0001.curr_name,data0005.employee_name,dat' +
        'a0070.po_number,'
      'case'
      'when data0133.ttype=1 then '#39#25353'PO'#20837#24211#39
      'when data0133.ttype=3 then '#39#30452#25509#20837#24211#39'  end as stype,'
      
        'case data0133.tstatus when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#23457#26680#39' when 2' +
        ' then '#39#24050#23457#26680#39' end as strstatus'
      'from data0133 inner join '
      'data0023 on data0133.supp_ptr=data0023.rkey inner join'
      'data0015 on data0133.warehouse_ptr=data0015.rkey inner join'
      'data0001 on data0133.currency_ptr=data0001.rkey inner join'
      'data0005 on data0133.create_by=data0005.rkey left outer join'
      'data0070 on data0133.po_ptr=data0070.rkey'
      'where'
      'data0133.create_date>=:dtpk1 and data0133.create_date<=:dtpk2')
    Left = 448
    Top = 376
    object ADS133RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS133GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADS133DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADS133warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADS133SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADS133currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADS133exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADS133PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object ADS133TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADS133CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADS133CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADS133ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADS133ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object ADS133REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object ADS133warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS133warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object ADS133code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADS133supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object ADS133curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADS133curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ADS133employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS133po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object ADS133stype: TStringField
      FieldName = 'stype'
      ReadOnly = True
      Size = 8
    end
    object ADS133abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 16
    end
    object ADS133PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object ADS133TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ADS133strstatus: TStringField
      FieldName = 'strstatus'
      ReadOnly = True
      Size = 6
    end
  end
  object ADS134: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DS133
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
      
        'select data0134.*,data0017.inv_part_number,data0017.inv_name,dat' +
        'a0017.inv_part_description,'
      
        'data0016.location,data0002.unit_name,data0071.quan_ord,data0071.' +
        'quan_recd'
      'from data0134'
      'inner join'
      'data0017 on data0134.inventory_ptr=data0017.rkey'
      'inner join'
      'data0016 on data0134.location_ptr=data0016.rkey'
      'inner join'
      'data0002 on data0134.unit_ptr=data0002.rkey'
      'left outer join'
      'data0071 on data0134.source_ptr=data0071.rkey'
      'where'
      'data0134.grn_ptr=:rkey')
    Left = 384
    Top = 376
    object ADS134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS134GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object ADS134INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADS134SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS134LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADS134UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADS134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ADS134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADS134QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADS134tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADS134PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADS134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADS134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADS134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADS134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADS134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADS134inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADS134inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object ADS134inv_part_description: TStringField
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADS134location: TStringField
      FieldName = 'location'
    end
    object ADS134unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADS134quan_ord: TFloatField
      FieldName = 'quan_ord'
    end
    object ADS134quan_recd: TFloatField
      FieldName = 'quan_recd'
    end
    object ADS134MANU_DATE: TDateTimeField
      FieldName = 'MANU_DATE'
    end
    object ADS134cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADS134SUPPLIER3: TStringField
      FieldName = 'SUPPLIER3'
      Size = 30
    end
    object ADS134rkey391: TIntegerField
      FieldName = 'rkey391'
    end
  end
  object aq16: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,LOCATION '
      'from data0016'
      'where LOCATION_TYPE=0 '
      'order by rkey')
    Left = 251
    Top = 116
    object aq16rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq16LOCATION: TStringField
      FieldName = 'LOCATION'
    end
  end
  object Aq134: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DS133
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'po_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0071.RKEY, dbo.Data0071.QUAN_ORD, dbo.Data0071.QU' +
        'AN_RECD,'
      
        '      dbo.Data0071.tax_PRICE, dbo.Data0071.WO_PTR, dbo.Data0071.' +
        'PURCHASE_UNIT_PTR, '
      
        '      dbo.Data0071.TAX_2, dbo.Data0071.CONVERSION_FACTOR, dbo.Da' +
        'ta0071.INVT_PTR, '
      
        '      dbo.Data0134.QUANTITY, dbo.Data0134.BARCODE_ID, dbo.Data01' +
        '34.EXPIRE_DATE,dbo.Data0134.manu_date,'
      
        '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, data0' +
        '017.STOCK_BASE,'
      '      dbo.Data0017.SHELF_LIFE, dbo.Data0017.INV_DESCRIPTION,'
      
        '      dbo.Data0002.UNIT_NAME, Data0002_1.UNIT_NAME AS pr_unitnam' +
        'e,'
      '      dbo.Data0016.LOCATION, dbo.Data0134.LOCATION_PTR, '
      
        '      dbo.Data0134.UNIT_PTR, dbo.Data0134.rohs,dbo.Data0134.SUPP' +
        'LIER3,'
      
        '      Data0134.SUPPLIER2,data0071.avl_flag,data0071.QUAN_IN_INSP' +
        ',data0134.RKEY391,data0134.ORIG_ABBRNAME'
      'FROM dbo.Data0016 INNER JOIN'
      '      dbo.Data0134 ON '
      
        '      dbo.Data0016.RKEY = dbo.Data0134.LOCATION_PTR RIGHT OUTER ' +
        'JOIN'
      '      dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR ' +
        'INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_' +
        '1.RKEY ON '
      '      dbo.Data0134.SOURCE_PTR = dbo.Data0071.RKEY AND '
      '      dbo.Data0134.GRN_PTR = :rkey'
      'WHERE (dbo.Data0071.PO_PTR = :po_ptr)')
    Left = 208
    Top = 250
    object Aq134RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aq134QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object Aq134QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
    end
    object Aq134tax_PRICE: TFloatField
      FieldName = 'tax_PRICE'
    end
    object Aq134WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object Aq134PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object Aq134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aq134CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object Aq134INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object Aq134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object Aq134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aq134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object Aq134INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aq134INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aq134STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object Aq134SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object Aq134INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aq134UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object Aq134pr_unitname: TStringField
      FieldName = 'pr_unitname'
    end
    object Aq134LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object Aq134LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object Aq134UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object Aq134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aq134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object Aq134avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object Aq134manu_date: TDateTimeField
      FieldName = 'manu_date'
    end
    object Aq134SUPPLIER3: TStringField
      FieldName = 'SUPPLIER3'
      Size = 30
    end
    object Aq134QUAN_IN_INSP: TBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 13
    end
    object Aq134RKEY391: TIntegerField
      FieldName = 'RKEY391'
    end
    object Aq134ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object ADO133: TADOQuery
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
      'select * from data0133 where rkey=:rkey')
    Left = 336
    Top = 240
    object ADO133RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO133GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO133DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADO133warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO133SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO133currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO133exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADO133PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object ADO133TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO133CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO133CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO133ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO133ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object ADO133REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object ADO133PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object ADO133TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
  end
  object DS133: TDataSource
    DataSet = ADS133
    Left = 592
    Top = 376
  end
  object DS134: TDataSource
    DataSet = ADS134
    Left = 512
    Top = 368
  end
  object ADO171: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO171CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39052d
      end
      item
        Name = 'v1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = '9'
      end
      item
        Name = 'v2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = '9'
      end>
    SQL.Strings = (
      'select data0171.*,data0005.employee_name'
      'from   data0171 inner join data0005'
      '         on data0171.user_ptr=data0005.rkey'
      'where data0171.cut_date >= :dtpk1 and'
      '      data0171.cut_date <= :dtpk2 and'
      '      data0171.STATUS <> :v1 and'
      '      data0171.STATUS <> :v2      '
      'order by rkey'
      ' ')
    Left = 61
    Top = 382
    object ADO171rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO171cut_date: TDateTimeField
      FieldName = 'cut_date'
    end
    object ADO171user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO171status: TWordField
      FieldName = 'status'
    end
    object ADO171employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO171v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Calculated = True
    end
  end
  object DS171: TDataSource
    DataSet = ADO171
    Left = 136
    Top = 384
  end
  object AQ171: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0171')
    Left = 32
    Top = 328
    object AQ171rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ171cut_date: TDateTimeField
      FieldName = 'cut_date'
    end
    object AQ171user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object AQ171status: TWordField
      FieldName = 'status'
    end
  end
  object AQ172: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0172')
    Left = 96
    Top = 328
  end
  object ADO172: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey171'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      
        '      Data0017.INV_DESCRIPTION, Data0496.GROUP_NAME, data0019.in' +
        'v_group_name,'
      
        '      Data0023.ABBR_NAME AS code23,Data0023.CODE, Data0172.QUAN_' +
        'ON_HAND, '
      
        '      Data0001.CURR_CODE, Data0134.tax_price, Data0016.LOCATION,' +
        ' '
      
        '      Data0002.UNIT_NAME, Data0134.EXPIRE_DATE, Data0134.BARCODE' +
        '_ID, '
      
        '      ROUND(dbo.Data0134.PRICE * dbo.Data0133.exch_rate, 4) AS L' +
        '_no_taxprice, dbo.Data0134.tax_price * dbo.Data0133.exch_rate AS' +
        ' L_tax_price,'
      
        '      ROUND(dbo.Data0134.PRICE * dbo.Data0133.exch_rate * dbo.Da' +
        'ta0172.QUAN_ON_HAND, 4) AS amount_notax,'
      
        '      Data0134.TAX_2, Data0133.GRN_NUMBER, dbo.Data0134.tax_pric' +
        'e * dbo.Data0133.exch_rate * dbo.Data0172.QUAN_ON_HAND AS amount' +
        '_tax,'
      
        '      Data0015.WAREHOUSE_CODE, Data0133.ship_DATE, Data0134.rohs' +
        ', '
      
        '      Data0134.SUPPLIER2, Data0133.exch_rate,data0070.po_number,' +
        'data0171.rkey as rkey171,data0134.rkey as rkey134'
      'FROM Data0172 INNER JOIN'
      'data0171 on data0172.header_ptr=data0171.rkey inner join'
      'data0134 on data0172.d0134_ptr=data0134.rkey inner join'
      'Data0017 ON Data0134.INVENTORY_PTR = Data0017.RKEY INNER JOIN'
      'Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'
      'data0133 ON Data0133.RKEY = Data0134.GRN_PTR INNER JOIN'
      'Data0002 ON Data0134.UNIT_PTR = Data0002.RKEY INNER JOIN '
      'data0023 ON Data0023.RKEY = Data0133.SUPP_PTR INNER JOIN'
      'Data0016 ON Data0134.LOCATION_PTR = Data0016.RKEY INNER JOIN '
      'Data0015 ON Data0015.RKEY = Data0133.warehouse_ptr INNER JOIN'
      'Data0001 ON Data0133.currency_ptr = Data0001.RKEY inner join '
      'data0019 on data0496.group_ptr=data0019.rkey left outer join '
      'data0070 on data0133.po_ptr=data0070.rkey'
      'where data0171.rkey=:rkey171'
      'ORDER BY Data0017.INV_PART_NUMBER ')
    Left = 400
    Top = 296
    object ADO172INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO172INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO172INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO172GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO172inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADO172code23: TStringField
      FieldName = 'code23'
      Size = 16
    end
    object ADO172QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO172CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO172tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO172LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADO172UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO172EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADO172BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO172L_no_taxprice: TBCDField
      FieldName = 'L_no_taxprice'
      ReadOnly = True
      Precision = 28
      Size = 14
    end
    object ADO172L_tax_price: TBCDField
      FieldName = 'L_tax_price'
      ReadOnly = True
      Precision = 25
      Size = 11
    end
    object ADO172amount_notax: TBCDField
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO172TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO172GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO172amount_tax: TBCDField
      FieldName = 'amount_tax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO172WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO172ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO172rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO172SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO172exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADO172po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object ADO172rkey171: TIntegerField
      FieldName = 'rkey171'
      ReadOnly = True
    end
    object ADO172rkey134: TIntegerField
      FieldName = 'rkey134'
      ReadOnly = True
    end
    object ADO172CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
  end
  object ADO172Sum: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey171'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      SUM(Data0172.QUAN_ON_HAND) AS quan_total,'
      
        'ROUND(avg(Data0134.tax_PRICE * Data0133.exch_rate), 4) AS avl_pr' +
        'ice,'
      
        'ROUND(SUM(Data0172.QUAN_ON_HAND * Data0134.tax_PRICE * Data0133.' +
        'exch_rate),4) AS amount,'
      
        'ROUND(SUM(Data0172.QUAN_ON_HAND * Data0134.PRICE * Data0133.exch' +
        '_rate),4) AS amount_notax,'
      'Data0002.UNIT_CODE,'
      
        'Data0023.ABBR_NAME AS ABBR_NAME23,Data0023.code,Data0019.inv_gro' +
        'up_name'
      'FROM dbo.Data0172 INNER JOIN'
      
        'dbo.Data0134 ON dbo.Data0172.d0134_ptr=dbo.Data0134.rkey INNER J' +
        'OIN'
      
        'dbo.Data0171 ON dbo.Data0172.header_ptr=dbo.Data0171.rkey INNER ' +
        'JOIN   '
      
        'dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.RKEY I' +
        'NNER JOIN'
      
        'dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER' +
        ' JOIN'
      
        'dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey INNER' +
        ' JOIN'
      'dbo.Data0002 ON'
      'dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        'dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Data0133.RKEY INNER J' +
        'OIN'
      
        'dbo.Data0023 ON dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY INNER ' +
        'JOIN'
      
        'dbo.Data0016 ON dbo.Data0134.LOCATION_PTR = dbo.Data0016.RKEY IN' +
        'NER JOIN'
      'dbo.Data0015 ON dbo.Data0133.warehouse_ptr = dbo.Data0015.RKEY'
      'where data0171.rkey=:rkey171'
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      
        '      dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,Data0023.co' +
        'de,'
      '      dbo.Data0019.inv_group_name, '
      '      dbo.Data0017.STOCK_SELL,'
      '      data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 320
    Top = 296
    object ADO172SumINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO172SumINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO172SumINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO172SumGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO172Sumquan_total: TBCDField
      FieldName = 'quan_total'
      ReadOnly = True
      Precision = 32
    end
    object ADO172Sumavl_price: TBCDField
      FieldName = 'avl_price'
      ReadOnly = True
      Precision = 32
      Size = 11
    end
    object ADO172Sumamount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO172Sumamount_notax: TBCDField
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO172SumUNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO172SumABBR_NAME23: TStringField
      FieldName = 'ABBR_NAME23'
      Size = 16
    end
    object ADO172Suminv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADO172Sumcode: TStringField
      FieldName = 'code'
      Size = 10
    end
  end
end
