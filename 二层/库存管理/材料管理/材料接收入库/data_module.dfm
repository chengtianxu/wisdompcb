object dm: Tdm
  OldCreateOrder = False
  Left = 626
  Top = 203
  Height = 393
  Width = 594
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = Aqwz456
    OnDataChange = DataSource1DataChange
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
  object Aqwz22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.' +
        'Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, dbo.Data0022.QU' +
        'ANTITY,'
      
        '      dbo.Data0022.LOCATION_PTR_FROM, dbo.Data0002.UNIT_NAME, db' +
        'o.Data0022.LOCATION_PTR, dbo.Data0022.spec_place, '
      
        '      dbo.Data0022.BARCODE_ID, dbo.Data0022.EXPIRE_DATE, dbo.Dat' +
        'a0022.INVENTORY_PTR, dbo.Data0022.tax_price AS price, dbo.Data00' +
        '22.TAX_2, '
      
        '      dbo.Data0022.STOCK_BASE, dbo.Data0022.cust_decl, dbo.Data0' +
        '022.QUAN_RTNED_FM_FACT, dbo.Data0017.SHELF_LIFE, dbo.Data0022.ro' +
        'hs, '
      
        '      dbo.Data0022.SUPPLIER2, dbo.Data0022.TDATE, dbo.Data0005.E' +
        'MPLOYEE_NAME, dbo.Data0034.DEPT_NAME, dbo.Data0005.EMPL_CODE, Da' +
        'ta0022.ORIG_ABBRNAME,'
      
        '      dbo.Data0034.DEPT_CODE,dbo.Data0022.source_ptr,dbo.Data002' +
        '2.rkey,data0022.rkey391,data0022.d0134_ptr,data0071.CONVERSION_F' +
        'ACTOR ,data0391.status as status391'
      'FROM  dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0' +
        '002.RKEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY LEFT OUTER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKE' +
        'Y LEFT OUTER JOIN'
      '      dbo.Data0068 LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data003' +
        '4.DEPT_CODE LEFT OUTER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RI' +
        'GHT OUTER JOIN'
      
        '      dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ' +
        '_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY  LEFT OUTER JOIN'
      '      dbo.data0391 on dbo.data0022.rkey391 = data0391.rkey'
      'where Data0022.grn_ptr=:rkey'
      'order by data0022.rkey'
      ' '
      ' ')
    Left = 160
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
      DisplayWidth = 8
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
    object Aqwz22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aqwz22SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object Aqwz22rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz22SUPPLIER2: TStringField
      DisplayLabel = #21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object Aqwz22STOCK_BASE: TBCDField
      DisplayLabel = #21333#20301#37325#37327
      FieldName = 'STOCK_BASE'
      Precision = 8
    end
    object Aqwz22cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object Aqwz22spec_place: TStringField
      DisplayLabel = #35814#32454#20301#32622
      FieldName = 'spec_place'
    end
    object Aqwz22Tdate: TDateTimeField
      FieldName = 'Tdate'
    end
    object Aqwz22price: TBCDField
      FieldName = 'price'
      Precision = 13
    end
    object Aqwz22QUAN_RTNED_FM_FACT: TFloatField
      FieldName = 'QUAN_RTNED_FM_FACT'
    end
    object Aqwz22EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz22DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz22EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz22DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz22source_ptr: TIntegerField
      FieldName = 'source_ptr'
      ReadOnly = True
    end
    object Aqwz22rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz22rkey391: TIntegerField
      FieldName = 'rkey391'
    end
    object Aqwz22d0134_ptr: TIntegerField
      FieldName = 'd0134_ptr'
    end
    object Aqwz22CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object Aqwz22status391: TIntegerField
      FieldName = 'status391'
    end
    object Aqwz22ORIG_ABBRNAME: TStringField
      DisplayLabel = #21697#29260#20379#24212#21830
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object ADO456: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
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
    object ADO456currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO456dealiv_ptr: TIntegerField
      FieldName = 'dealiv_ptr'
    end
    object ADO456po_type: TStringField
      FieldName = 'po_type'
      FixedChar = True
      Size = 1
    end
    object ADO456VMIOUT_PTR: TIntegerField
      FieldName = 'VMIOUT_PTR'
    end
    object ADO456exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
  end
  object ADO22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
    SQL.Strings = (
      'select * from data0022'
      'where grn_PTR=:rkey')
    Left = 180
    Top = 183
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
    object ADO22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
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
    object ADO22SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO22rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO22TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO22TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO22STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object ADO22STOCK_BASE: TBCDField
      FieldName = 'STOCK_BASE'
      Precision = 7
      Size = 2
    end
    object ADO22spec_place: TStringField
      DisplayLabel = #35814#32454#20301#32622
      FieldName = 'spec_place'
    end
    object ADO22PACKING_SLIP_FLAG: TStringField
      DisplayLabel = #32784'CAF'
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 2
    end
    object ADO22cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADO22tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 13
    end
    object ADO22QUAN_RTNED_FM_FACT: TFloatField
      FieldName = 'QUAN_RTNED_FM_FACT'
    end
    object ADO22D0134_PTR: TIntegerField
      FieldName = 'D0134_PTR'
    end
    object ADO22SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO22DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object ADO22QUAN_IN_INSP: TBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_TO_BE_SHIPPED: TBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_TO_BE_STOCKED: TBCDField
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_SCRAPPED: TBCDField
      FieldName = 'QUAN_SCRAPPED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_STOCKED: TFloatField
      FieldName = 'QUAN_STOCKED'
    end
    object ADO22QUAN_ISSUED_TO_FACT: TFloatField
      FieldName = 'QUAN_ISSUED_TO_FACT'
    end
    object ADO22GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO22GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADO22rkey391: TIntegerField
      FieldName = 'rkey391'
    end
    object ADO22IF_SEND: TBooleanField
      FieldName = 'IF_SEND'
    end
    object ADO22PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO22ORIG_ABBRNAME: TStringField
      DisplayLabel = #21697#29260#20379#24212#21830
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
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
        Value = 0
      end
      item
        Name = 'po_ptr'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0071.RKEY,Data0071.QUAN_ORD,Data0071.QUAN_RECD,'
      
        '       Data0071.tax_PRICE,Data0071.WO_PTR,Data0071.PURCHASE_UNIT' +
        '_PTR, '
      
        '       Data0071.TAX_2,Data0071.CONVERSION_FACTOR,Data0071.INVT_P' +
        'TR, '
      
        '       Data0022.QUANTITY,Data0022.BARCODE_ID,Data0022.EXPIRE_DAT' +
        'E,'
      
        '       Data0017.INV_PART_NUMBER,Data0017.INV_NAME,data0017.STOCK' +
        '_BASE,'
      
        '       Data0017.SHELF_LIFE,Data0017.INV_DESCRIPTION,data0022.roh' +
        's as rohs22,'
      
        '       Data0002.UNIT_NAME,Data0002_1.UNIT_NAME AS pr_unitname,da' +
        'ta0022.PACKING_SLIP_FLAG,'
      
        '       Data0016.LOCATION,Data0022.LOCATION_PTR,data0022.spec_pla' +
        'ce,'
      
        '       Data0022.LOCATION_PTR_FROM,Data0071.rohs,data0071.if_caf,' +
        'Data0022.QUAN_RTNED_FM_FACT,Data0022.ORIG_ABBRNAME,'
      
        '       Data0022.SUPPLIER2,data0071.avl_flag,Data0022.Tdate,data0' +
        '071.QUAN_IN_INSP,data0022.rkey391,data0022.d0134_ptr'
      'FROM   Data0016 INNER JOIN'
      '       Data0022 ON '
      '       Data0016.RKEY = Data0022.LOCATION_PTR RIGHT OUTER JOIN'
      '       Data0017 INNER JOIN'
      '       Data0071 ON Data0017.RKEY = Data0071.INVT_PTR INNER JOIN'
      '       Data0002 ON '
      '       Data0071.PURCHASE_UNIT_PTR = Data0002.RKEY INNER JOIN'
      
        '       Data0002 Data0002_1 ON Data0071.WO_PTR = Data0002_1.RKEY ' +
        'ON '
      '       Data0022.SOURCE_PTR = Data0071.RKEY AND '
      '       Data0022.GRN_PTR = :rkey'
      'WHERE (dbo.Data0071.PO_PTR = :po_ptr)')
    Left = 88
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
    object Aq22rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aq22SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object Aq22tax_PRICE: TFloatField
      FieldName = 'tax_PRICE'
    end
    object Aq22avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object Aq22STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object Aq22spec_place: TStringField
      FieldName = 'spec_place'
    end
    object Aq22Tdate: TDateTimeField
      FieldName = 'Tdate'
    end
    object Aq22if_caf: TWideStringField
      FieldName = 'if_caf'
      FixedChar = True
      Size = 2
    end
    object Aq22rohs22: TStringField
      FieldName = 'rohs22'
      Size = 10
    end
    object Aq22PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 2
    end
    object Aq22QUAN_RTNED_FM_FACT: TFloatField
      FieldName = 'QUAN_RTNED_FM_FACT'
    end
    object Aq22QUAN_IN_INSP: TBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 13
    end
    object Aq22rkey391: TIntegerField
      FieldName = 'rkey391'
    end
    object Aq22d0134_ptr: TIntegerField
      FieldName = 'd0134_ptr'
    end
    object Aq22ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=57')
    Left = 469
    Top = 68
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
    Parameters = <>
    SQL.Strings = (
      'select rkey,LOCATION '
      'from data0016'
      'where LOCATION_TYPE=0 '
      'order by rkey')
    Left = 267
    Top = 76
    object aq16rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq16LOCATION: TStringField
      FieldName = 'LOCATION'
    end
  end
  object Aqwz456: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = Aqwz456CalcFields
    CommandText = 
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '#13#10'      dbo.D' +
      'ata0456.DELIVER_NUMBER, dbo.Data0023.CODE, '#13#10'      dbo.Data0023.' +
      'SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '#13#10'      dbo.Data0456.ship' +
      '_DATE, dbo.Data0456.STATUS, dbo.Data0456.TTYPE, '#13#10'      dbo.Data' +
      '0456.REF_NUMBER, dbo.Data0070.PO_NUMBER, dbo.Data0456.PO_PTR, '#13#10 +
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE, '#13#10'    ' +
      '  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, '#13#10'  ' +
      '    dbo.Data0456.ship_BY, dbo.Data0001.CURR_CODE, dbo.Data0001.C' +
      'URR_NAME, '#13#10'      dbo.Data0456.warehouse_ptr, dbo.Data0034.DEPT_' +
      'NAME, dbo.Data0456.SUPP_PTR,dbo.Data0456.create_date, '#13#10'      db' +
      'o.Data0456.PRINTED, dbo.Data0456.currency_ptr, dbo.Data0456.exch' +
      '_rate,data0724.gon_number,data0724.rkey as rkey148,'#13#10'case data04' +
      '56.ttype'#13#10'when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39#13#10'when 3 then '#39#30452 +
      #25509#20837#24211#39' when  5 then '#39'VMI'#20837#24211#39'  when 6 then '#39#26434#39033#30452#20837#39' end as v_type,data' +
      '0015.abbr_name FacNm,Data0005_1.EMPLOYEE_NAME as EMPLOYEE_NAME_1' +
      #13#10'FROM dbo.Data0456 INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data04' +
      '56.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0005 O' +
      'N dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'      d' +
      'bo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY IN' +
      'NER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0456.currency_pt' +
      'r = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0070 ON dbo' +
      '.Data0456.PO_PTR = dbo.Data0070.RKEY LEFT OUTER JOIN'#13#10'      dbo.' +
      'Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE left' +
      ' outer join'#13#10'      dbo.data0724  ON  dbo.data0456.VMIOUT_PTR=dbo' +
      '.data0724.rkey  left  JOIN'#13#10'      dbo.Data0005  Data0005_1  on d' +
      'bo.Data0456.AUDITED_BY =      Data0005_1.RKEY'#13#10'where '#13#10'      Dat' +
      'a0456.status <> :v1 and'#13#10'      Data0456.status <> :v2 and'#13#10'     ' +
      ' Data0456.status <> :v3 and'#13#10'      Data0456.status <> :v4 and'#13#10' ' +
      '     Data0456.status <> :v5 and'#13#10'      Data0456.status <> :v6 an' +
      'd'#13#10'      Data0456.SHIP_DATE >= :dtpk1 and'#13#10'      Data0456.SHIP_D' +
      'ATE <= :dtpk2 and'#13#10'      data0456.ttype<>4'
    EnableBCD = False
    FieldDefs = <
      item
        Name = 'RKEY'
        Attributes = [faReadonly, faFixed]
        DataType = ftInteger
      end
      item
        Name = 'GRN_NUMBER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DELIVER_NUMBER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SUPPLIER_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ship_DATE'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftSmallint
      end
      item
        Name = 'TTYPE'
        Attributes = [faFixed]
        DataType = ftSmallint
      end
      item
        Name = 'REF_NUMBER'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PO_NUMBER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PO_PTR'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'EMPLOYEE_NAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'EMPL_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'WAREHOUSE_CODE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'WAREHOUSE_NAME'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ship_BY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CURR_CODE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CURR_NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'warehouse_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'DEPT_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SUPP_PTR'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'create_date'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'PRINTED'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 1
      end
      item
        Name = 'currency_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'exch_rate'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'gon_number'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'rkey148'
        Attributes = [faReadonly, faFixed]
        DataType = ftInteger
      end
      item
        Name = 'v_type'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FacNm'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EMPLOYEE_NAME_1'
        DataType = ftString
        Size = 16
      end>
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <
      item
        Name = 'v1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 3
      end
      item
        Name = 'v4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 4
      end
      item
        Name = 'v5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 5
      end
      item
        Name = 'v6'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 6
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 37987d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39083d
      end>
    Prepared = True
    StoreDefs = True
    Left = 120
    Top = 72
    object Aqwz456RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object Aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
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
    object Aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object Aqwz456STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object Aqwz456TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object Aqwz456REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object Aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object Aqwz456PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
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
    object Aqwz456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object Aqwz456PRINTED: TStringField
      DisplayLabel = #21015#21360#26631#35782
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object Aqwz456currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
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
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object Aqwz456FacNm: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'FacNm'
      Size = 10
    end
    object Aqwz456gon_number: TStringField
      FieldName = 'gon_number'
      Size = 10
    end
    object Aqwz456rkey148: TIntegerField
      FieldName = 'rkey148'
      ReadOnly = True
    end
    object Aqwz456create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object Aqwz456ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object Aqwz456EMPLOYEE_NAME_1: TStringField
      FieldName = 'EMPLOYEE_NAME_1'
      Size = 16
    end
    object Aqwz456exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
  end
  object ADO235: TADOQuery
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
      'select * from data0235'
      'where GRN_PTR=:rkey')
    Left = 168
    Top = 250
    object ADO235RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO235GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object ADO235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object ADO235EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO235DATE_RECD: TDateTimeField
      FieldName = 'DATE_RECD'
    end
    object ADO235QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object ADO235REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADO235QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object ADO235quan_to_ship: TFloatField
      FieldName = 'quan_to_ship'
    end
    object ADO235quan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object ADO235unit_price: TBCDField
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object ADO235state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADO235rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO235unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO235location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADO235goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object ADO235goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADO235goods_type: TStringField
      FieldName = 'goods_type'
    end
    object ADO235GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO235GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADO235cust_decl: TStringField
      FieldName = 'cust_decl'
    end
    object ADO235avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADO235IQC_FLAG: TBooleanField
      FieldName = 'IQC_FLAG'
    end
  end
  object DataSource3: TDataSource
    DataSet = Aqwz235
    Left = 48
    Top = 226
  end
  object Aqwz235: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0235.rkey,dbo.Data0235.goods_name, dbo.Data0235.g' +
        'oods_guige, dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo' +
        '.Data0235.QUAN_RECD,'
      
        '      dbo.Data0016.LOCATION, dbo.Data0235.REF_NUMBER, dbo.Data02' +
        '35.rohs, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '
      
        '      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,Data007' +
        '2.DESCRIPTION,data0235.avl_flag,'
      '      Data0072.GUI_GE,Data0072.DESCRIPTION2,Data0235.cust_decl'
      'FROM  dbo.Data0235  INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY LEFT OUTER JOIN'
      
        '      dbo.Data0072 ON dbo.Data0235.D0072_ptr=dbo.Data0072.rkey  ' +
        'LEFT OUTER JOIN'
      '      dbo.Data0068 LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data003' +
        '4.DEPT_CODE LEFT OUTER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RI' +
        'GHT OUTER JOIN'
      
        '      dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_' +
        'REQ_PTR ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY'
      'where data0235.grn_ptr=:rkey'
      ' ')
    Left = 111
    Top = 226
    object Aqwz235DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object Aqwz235GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object Aqwz235DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object Aqwz235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz235QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object Aqwz235LOCATION: TStringField
      DisplayLabel = #23384#36135#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz235REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object Aqwz235rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz235DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz235DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz235EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz235EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz235goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object Aqwz235goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object Aqwz235goods_type: TStringField
      FieldName = 'goods_type'
    end
    object Aqwz235cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object Aqwz235avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object Aqwz235rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object aq235: TADOQuery
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0072.UNIT_PTR, dbo.Data0072.DESCRIPTION, dbo.Data' +
        '0072.GUI_GE, '
      
        '      dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_ORD, dbo' +
        '.Data0235.rohs, '
      
        '      dbo.Data0235.REF_NUMBER, dbo.Data0235.QUAN_RECD, dbo.Data0' +
        '235.location_ptr, '
      
        '      dbo.Data0072.RKEY, dbo.Data0072.tax_price, dbo.Data0072.ST' +
        'ATE_TAX, '
      
        '      Data0016.LOCATION, Data0002.UNIT_NAME,Data0072.DESCRIPTION' +
        '2,data0235.avl_flag '
      'FROM dbo.Data0016 INNER JOIN'
      '      dbo.Data0235 ON '
      
        '      dbo.Data0016.RKEY = dbo.Data0235.location_ptr RIGHT OUTER ' +
        'JOIN'
      '      dbo.Data0072 INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY ' +
        'ON '
      '      dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY and'
      '           data0235.grn_ptr=:rkey'
      'where data0072.poptr=:po_ptr')
    Left = 112
    Top = 274
    object aq235UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object aq235DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object aq235GUI_GE: TStringField
      FieldName = 'GUI_GE'
      Size = 200
    end
    object aq235QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object aq235QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object aq235rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object aq235REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aq235QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object aq235location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object aq235RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq235tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object aq235STATE_TAX: TBCDField
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
    object aq235LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object aq235UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object aq235DESCRIPTION2: TStringField
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object aq235avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 308
    Top = 179
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 313
    Top = 220
  end
  object ActionList1: TActionList
    Left = 256
    Top = 136
  end
  object ADOtemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 32
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
    Left = 408
    Top = 120
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
      'where rkey is null'
      'order by inventory_ptr')
    Left = 400
    Top = 224
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
  object Aqwz149: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey148'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'select data0149.rkey,data0149.quantity,data0149.tax_price,data01' +
        '49.tax_2,'
      
        'data0134.quan_on_hand from data0149 inner join data0134 on data0' +
        '149.d0134_ptr=data0134.rkey'
      'where data0149.gon_ptr=:rkey148')
    Left = 464
    Top = 151
    object Aqwz149rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz149quantity: TBCDField
      FieldName = 'quantity'
      Precision = 14
    end
    object Aqwz149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object Aqwz149tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object Aqwz149quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
  end
  object aq134: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey149'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0134.* from data0134 inner join data0149 on data0149.' +
        'd0134_ptr=data0134.rkey where data0149.rkey=:rkey149')
    Left = 456
    Top = 224
    object aq134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq134GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object aq134INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object aq134SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object aq134LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object aq134UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object aq134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object aq134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object aq134QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object aq134tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object aq134PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object aq134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object aq134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object aq134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object aq134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
  end
  object ADO04_724: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where table_name='#39'data0724'#39)
    Left = 413
    Top = 20
    object ADO04_724SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04_724SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ds176: TDataSource
    DataSet = at176
    Left = 360
    Top = 296
  end
  object aq176: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey16'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from Data0176'
      'where rkey_16 = :rkey16')
    Left = 312
    Top = 120
    object aq176rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq176location: TWideStringField
      FieldName = 'location'
    end
    object aq176rkey_16: TIntegerField
      FieldName = 'rkey_16'
    end
  end
  object at176: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    TableName = 'Data0176'
    Left = 400
    Top = 296
    object at176rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object at176location: TWideStringField
      DisplayWidth = 45
      FieldName = 'location'
    end
    object at176rkey_16: TIntegerField
      FieldName = 'rkey_16'
    end
    object at176code: TStringField
      FieldKind = fkLookup
      FieldName = 'code'
      LookupDataSet = aq16_15
      LookupKeyFields = 'rkey'
      LookupResultField = 'code'
      KeyFields = 'rkey_16'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object at176MainLocation: TStringField
      FieldKind = fkLookup
      FieldName = 'MainLocation'
      LookupDataSet = aq16_15
      LookupKeyFields = 'rkey'
      LookupResultField = 'location'
      KeyFields = 'rkey_16'
      LookupCache = True
      Lookup = True
    end
    object at176abbr_name: TStringField
      FieldKind = fkLookup
      FieldName = 'abbr_name'
      LookupDataSet = aq16_15
      LookupKeyFields = 'rkey'
      LookupResultField = 'abbr_name'
      KeyFields = 'rkey_16'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object at176type: TStringField
      FieldKind = fkLookup
      FieldName = 'type'
      LookupDataSet = aq16_15
      LookupKeyFields = 'rkey'
      LookupResultField = 'type'
      KeyFields = 'rkey_16'
      LookupCache = True
      Size = 10
      Lookup = True
    end
  end
  object aq16_15: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select dbo.data0016.rkey,dbo.data0016.code,dbo.data0016.location' +
        ','
      'dbo.data0016.location_type,dbo.data0016.whouse_ptr,'
      
        'dbo.data0015.warehouse_code,dbo.data0015.warehouse_name,dbo.data' +
        '0015.abbr_name,'
      
        'case dbo.data0016.location_type when 0 then '#39#26448#26009#20179#39' when 1 then '#39#25104 +
        #21697#20179#39' end as type'
      'from dbo.data0016,dbo.data0015'
      'where dbo.data0016.whouse_ptr=dbo.data0015.rkey')
    Left = 456
    Top = 296
    object aq16_15rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq16_15code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object aq16_15location: TStringField
      FieldName = 'location'
    end
    object aq16_15location_type: TWordField
      FieldName = 'location_type'
    end
    object aq16_15whouse_ptr: TIntegerField
      FieldName = 'whouse_ptr'
    end
    object aq16_15warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aq16_15warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object aq16_15abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq16_15type: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 6
    end
  end
  object Aqwz235_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0235.goods_name, dbo.Data0235.goods_guige, dbo.Da' +
        'ta0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0235.QUAN_REC' +
        'D, '
      
        '      dbo.Data0016.LOCATION, dbo.Data0235.REF_NUMBER, dbo.Data02' +
        '35.rohs,dbo.Data0235.unit_price,'
      
        '      dbo.Data0235.state_tax,dbo.Data0235.DATE_RECD,dbo.Data0235' +
        '.unit_ptr,dbo.Data0235.location_ptr,dbo.Data0235.EMPL_PTR'
      'FROM  dbo.Data0235 INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY '
      'where data0235.grn_ptr=:rkey')
    Left = 231
    Top = 226
    object Aqwz235_1goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object Aqwz235_1goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object Aqwz235_1goods_type: TStringField
      FieldName = 'goods_type'
    end
    object Aqwz235_1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object Aqwz235_1QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object Aqwz235_1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object Aqwz235_1REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object Aqwz235_1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz235_1unit_price: TBCDField
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object Aqwz235_1state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object Aqwz235_1DATE_RECD: TDateTimeField
      FieldName = 'DATE_RECD'
    end
    object Aqwz235_1unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object Aqwz235_1location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object Aqwz235_1EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
  end
  object aq75: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,DESCRIPTION'
      'from data0075'
      'order by rkey')
    Left = 371
    Top = 76
    object aq75rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq75DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
    end
  end
  object aq75ADOQuery: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,LOCATION '
      'from data0016'
      'where LOCATION_TYPE=0 '
      'order by rkey')
    Left = 267
    Top = 76
    object aq75IntegerField: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq75StringField: TStringField
      FieldName = 'LOCATION'
    end
  end
end
