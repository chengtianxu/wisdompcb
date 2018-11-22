object dm: Tdm
  OldCreateOrder = False
  Left = 236
  Top = 171
  Height = 330
  Width = 333
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SJ_V20_LIVE;Data Source=192.168.68.18'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = Aqwz456
    Left = 48
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = Aqwz22
    Left = 48
    Top = 127
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 152
    Top = 16
  end
  object Aqwz456: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = Aqwz456CalcFields
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
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
        Value = 3
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
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38666d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38686d
      end>
    SQL.Strings = (
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '
      '      dbo.Data0456.DELIVER_NUMBER, dbo.Data0023.CODE, '
      '      dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '
      
        '      dbo.Data0456.ship_DATE, dbo.Data0456.STATUS, dbo.Data0456.' +
        'TTYPE, '
      
        '      dbo.Data0456.REF_NUMBER, dbo.Data0070.PO_NUMBER, dbo.Data0' +
        '456.PO_PTR, '
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE, '
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, '
      
        '      dbo.Data0456.ship_BY, dbo.Data0001.CURR_CODE, dbo.Data0001' +
        '.CURR_NAME, '
      '      dbo.Data0070.EXCHANGE_RATE, dbo.Data0456.warehouse_ptr, '
      '      dbo.Data0034.DEPT_NAME, dbo.Data0070.CURRENCY_PTR,'
      '      Data0456.SUPP_PTR,Data0456.PRINTED'
      'FROM dbo.Data0001 INNER JOIN'
      '      dbo.Data0070 ON '
      
        '      dbo.Data0001.RKEY = dbo.Data0070.CURRENCY_PTR RIGHT OUTER ' +
        'JOIN'
      '      dbo.Data0456 INNER JOIN'
      '      Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY ON '
      '      dbo.Data0070.RKEY = dbo.Data0456.PO_PTR LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT' +
        '_CODE'
      'where'
      '      Data0456.status <> :v1 and'
      '      Data0456.status <> :v2 and'
      '      Data0456.status <> :v3 and'
      '      Data0456.status <> :v4 and'
      '      Data0456.status <> :v5 and'
      '      Data0456.status <> :v6 and'
      '      Data0456.SHIP_DATE >= :dtpk1 and'
      '      Data0456.SHIP_DATE <= :dtpk2'
      'order by Data0456.GRN_NUMBER')
    Left = 112
    Top = 71
    object Aqwz456rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object Aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 10
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz456CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz456SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz456ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object Aqwz456STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object Aqwz456TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object Aqwz456REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object Aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object Aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz456EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz456v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object Aqwz456PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object Aqwz456WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz456WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aqwz456ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object Aqwz456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz456CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz456EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aqwz456CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Aqwz456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object Aqwz456PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
  end
  object Aqwz22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
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
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '
      '      dbo.Data0022.QUANTITY, dbo.Data0022.LOCATION_PTR_FROM, '
      '      dbo.Data0002.UNIT_NAME, dbo.Data0022.LOCATION_PTR, '
      '      dbo.Data0022.BARCODE_ID, dbo.Data0022.EXPIRE_DATE, '
      
        '      dbo.Data0022.INVENTORY_PTR, dbo.Data0022.PRICE, dbo.Data00' +
        '22.TAX_2, '
      '      dbo.Data0022.EXCHANGE_RATE, dbo.Data0022.CURRENCY_PTR, '
      
        '      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME,data0017.SH' +
        'ELF_LIFE'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0001 ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where Data0022.grn_ptr=:rkey')
    Left = 112
    Top = 127
    object Aqwz22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aqwz22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aqwz22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aqwz22LOCATION: TStringField
      DisplayLabel = #23384#20179#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz22QUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object Aqwz22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz22BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aqwz22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object Aqwz22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object Aqwz22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object Aqwz22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object Aqwz22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object Aqwz22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aqwz22EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object Aqwz22CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Aqwz22CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz22CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz22SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
  end
  object ADO456: TADOQuery
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
      'select * from data0456'
      'where rkey=:rkey')
    Left = 174
    Top = 70
    object ADO456RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO456GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO456DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADO456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO456PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object ADO456TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO456STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO456CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO456CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO456ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO456ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object ADO456AUDITED_BY: TIntegerField
      FieldName = 'AUDITED_BY'
    end
    object ADO456AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADO456REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object ADO456PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object ADO456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO456exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADO456currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
  end
  object ADO22: TADOQuery
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
      'select * from data0022'
      'where grn_PTR=:rkey')
    Left = 228
    Top = 71
    object ADO22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object ADO22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO22SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO22QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object ADO22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object ADO22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO22CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO22EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object ADO22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 9
      Size = 3
    end
    object ADO22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object ADO22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO22EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 224
    Top = 16
  end
  object Aq22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
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
    SQL.Strings = (
      
        'SELECT dbo.Data0071.RKEY, dbo.Data0071.QUAN_ORD, dbo.Data0071.QU' +
        'AN_RECD, '
      
        '      dbo.Data0071.PRICE, dbo.Data0071.WO_PTR, dbo.Data0071.PURC' +
        'HASE_UNIT_PTR, '
      
        '      dbo.Data0071.TAX_2, dbo.Data0071.CONVERSION_FACTOR, dbo.Da' +
        'ta0071.INVT_PTR, '
      
        '      dbo.Data0022.QUANTITY, dbo.Data0022.BARCODE_ID, dbo.Data00' +
        '22.EXPIRE_DATE, '
      
        '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,data00' +
        '17.SHELF_LIFE, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '
      
        '      Data0002_1.UNIT_NAME AS pr_unitname, dbo.Data0016.LOCATION' +
        ','
      '      dbo.Data0022.LOCATION_PTR,Data0022.LOCATION_PTR_FROM'
      'FROM dbo.Data0016 INNER JOIN'
      '      dbo.Data0022 ON '
      
        '      dbo.Data0016.RKEY = dbo.Data0022.LOCATION_PTR RIGHT OUTER ' +
        'JOIN'
      '      dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR ' +
        'INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_' +
        '1.RKEY ON '
      '      dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY AND '
      '      dbo.Data0022.GRN_PTR = :rkey'
      'WHERE (dbo.Data0071.PO_PTR = :po_ptr)')
    Left = 112
    Top = 178
    object Aq22RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aq22QUAN_ORD: TBCDField
      FieldName = 'QUAN_ORD'
      Precision = 9
      Size = 3
    end
    object Aq22QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 9
      Size = 3
    end
    object Aq22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object Aq22WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object Aq22PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object Aq22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aq22CONVERSION_FACTOR: TBCDField
      FieldName = 'CONVERSION_FACTOR'
      Precision = 7
      Size = 2
    end
    object Aq22INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object Aq22QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object Aq22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aq22EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object Aq22INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aq22INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aq22INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aq22UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object Aq22pr_unitname: TStringField
      FieldName = 'pr_unitname'
    end
    object Aq22LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aq22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object Aq22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object Aq22SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=57')
    Left = 173
    Top = 128
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object aq16: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,LOCATION '
      'from data0016'
      'where whouse_ptr=:rkey15'
      'order by rkey')
    Left = 171
    Top = 180
    object aq16rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq16LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
  end
end
