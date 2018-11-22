object DM: TDM
  OldCreateOrder = False
  Left = 456
  Top = 211
  Height = 453
  Width = 434
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADO97: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADO97CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 37591d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 37849d
      end
      item
        Name = 'rkey34_1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 353
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0097.PO_NUMBER, dbo.Data0060.PURCHASE_ORDER_P' +
        'TR AS rkey97, dbo.data0090.auth_date, dbo.data0090.user_ptr, dbo' +
        '.Data0005.EMPLOYEE_NAME, dbo.data0090.IF_PUTHDATE, '
      
        '                      dbo.data0090.PUTH_INFO, dbo.Data0060.SALES' +
        '_ORDER, dbo.Data0060.RKEY AS rkey60, dbo.Data0025.barcode_flag, ' +
        'dbo.Data0060.CUST_PART_PTR, dbo.Data0060.PARTS_ORDERED, '
      
        '                      dbo.Data0060.PART_PRICE, dbo.Data0060.QUOT' +
        'E_PRICE, dbo.Data0060.RMA_PTR, dbo.Data0060.MFG_ORDER_DATE, dbo.' +
        'Data0097.PO_DATE, dbo.Data0060.RUSH_CHARGE_PCT_USED, '
      
        '                      dbo.Data0060.DUE_DATE, dbo.Data0060.SCH_DA' +
        'TE, dbo.Data0010.CUSTOMER_NAME, dbo.Data0010.CUST_CODE, dbo.Data' +
        '0010.ABBR_NAME, dbo.Data0010.CONSUME_FORECASTS, '
      
        '                      dbo.Data0060.ORIG_REQUEST_DATE, dbo.Data00' +
        '60.ORIG_SCHED_SHIP_DATE, dbo.Data0060.so_oldnew, dbo.Data0060.se' +
        't_ordered, dbo.Data0060.ENT_DATE, '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
        '5.MANU_PART_DESC, dbo.Data0060.ORIG_CUSTOMER, dbo.Data0025.ALLOW' +
        '_EDIT_FLAG, dbo.Data0025.ONHOLD_SALES_FLAG, '
      
        '                      dbo.Data0025.SAMPLE_NR, dbo.Data0025.ONHOL' +
        'D_RELEASE_FLAG, dbo.Data0025.ONHOLD_PLANNING_FLAG, dbo.Data0025.' +
        'CUSTPART_ENT_DATE, '
      
        '                      ROUND(dbo.Data0060.PARTS_ORDERED * dbo.Dat' +
        'a0025.unit_sq, 4) AS parts_mianji, dbo.Data0060.REFERENCE_NUMBER' +
        ', dbo.Data0060.ENTERED_BY_EMPL_PTR, dbo.Data0015.date_area, '
      
        '                      dbo.Data0015.date_quantity, dbo.Data0060.S' +
        'HIP_REG_TAX_ID, dbo.BOMPrice06.jinglilv_add'
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.data0090 ON dbo.Data0060.RKEY = dbo.da' +
        'ta0090.pact_ptr INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY LEFT OUTER JOIN'
      
        '                      dbo.BOMPrice06 ON dbo.Data0060.BP06_ptr = ' +
        'dbo.BOMPrice06.IDKey LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0090.user_ptr = db' +
        'o.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_' +
        'ID = dbo.Data0015.RKEY'
      'WHERE'
      
        '    (data0060.ent_date >= :dtpk1) and (data0060.ent_date <= :dtp' +
        'k2)'
      
        '     and (data0060.status=1)  and (data0090.dept_ptr = :rkey34_1' +
        ')'
      
        '     and (data0060.quote_price=0) and (data0090.auth_date is nul' +
        'l)'
      ''
      ''
      '')
    Left = 105
    Top = 80
    object ADO97PO_NUMBER: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO97ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO97auth_date: TDateTimeField
      DisplayLabel = #35780#23457#26085#26399
      FieldName = 'auth_date'
    end
    object ADO97EMPLOYEE_NAME: TStringField
      DisplayLabel = #35780#23457#20154#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO97user_ptr: TIntegerField
      DisplayLabel = #35780#23457#20154#25351#38024
      FieldName = 'user_ptr'
    end
    object ADO97SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO97PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADO97PART_PRICE: TFloatField
      DisplayLabel = #35746#21333#20215#26684
      FieldName = 'PART_PRICE'
    end
    object ADO97DUE_DATE: TDateTimeField
      DisplayLabel = #22238#22797#21040#36135#26085#26399
      FieldName = 'DUE_DATE'
    end
    object ADO97sch_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_date'
    end
    object ADO97ORIG_REQUEST_DATE: TDateTimeField
      DisplayLabel = #23458#25143#20132#26399
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO97ORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO97RMA_PTR: TIntegerField
      DisplayLabel = #36864#22238#20154#21592#25351#38024
      FieldName = 'RMA_PTR'
    end
    object ADO97MFG_ORDER_DATE: TDateTimeField
      DisplayLabel = #36864#22238#26085#26399
      FieldName = 'MFG_ORDER_DATE'
    end
    object ADO97auth_flag: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
    object ADO97rkey97: TAutoIncField
      FieldName = 'rkey97'
      ReadOnly = True
    end
    object ADO97cust_part_ptr: TIntegerField
      FieldName = 'cust_part_ptr'
    end
    object ADO97rkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADO97quote_price: TWordField
      DisplayLabel = #35746#21333#35780#23457'0/1'
      FieldName = 'quote_price'
    end
    object ADO97cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO97customer_name: TStringField
      FieldName = 'customer_name'
      Size = 30
    end
    object ADO97po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ADO97if_puthdate: TWordField
      FieldName = 'if_puthdate'
    end
    object ADO97puth_info: TStringField
      FieldName = 'puth_info'
      Size = 50
    end
    object ADO97rush_charge_pct_used: TIntegerField
      FieldName = 'rush_charge_pct_used'
    end
    object ADO97ALLOW_EDIT_FLAG: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO97ONHOLD_SALES_FLAG: TSmallintField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object ADO97ONHOLD_RELEASE_FLAG: TSmallintField
      FieldName = 'ONHOLD_RELEASE_FLAG'
    end
    object ADO97ONHOLD_PLANNING_FLAG: TSmallintField
      FieldName = 'ONHOLD_PLANNING_FLAG'
    end
    object ADO97parts_mianji: TFloatField
      FieldName = 'parts_mianji'
      ReadOnly = True
    end
    object ADO97set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADO97so_oldnew: TStringField
      FieldName = 'so_oldnew'
      FixedChar = True
      Size = 10
    end
    object ADO97MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO97MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO97ent_date: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'ent_date'
    end
    object ADO97reference_number: TStringField
      FieldName = 'reference_number'
      Size = 30
    end
    object ADO97CONSUME_FORECASTS: TWordField
      FieldName = 'CONSUME_FORECASTS'
    end
    object ADO97SAMPLE_NR: TStringField
      DisplayLabel = #27979#35797#25104#22411#22791#27880
      DisplayWidth = 10
      FieldName = 'SAMPLE_NR'
      Size = 30
    end
    object ADO97ORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
    object ADO97CUSTPART_ENT_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ADO97ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object ADO97barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object ADO97date_area: TBCDField
      FieldName = 'date_area'
      Precision = 10
      Size = 2
    end
    object ADO97date_quantity: TIntegerField
      FieldName = 'date_quantity'
    end
    object ADO97SHIP_REG_TAX_ID: TIntegerField
      FieldName = 'SHIP_REG_TAX_ID'
    end
    object ADO97jinglilv_add: TBCDField
      FieldName = 'jinglilv_add'
      Precision = 18
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO97
    Left = 36
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 128
    Top = 15
  end
  object ado89: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'cust_part_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,'
      '       Data0002.UNIT_NAME, dbo.data0089.tvalue,'
      '       Data0277.CATEGORY_DESC'
      'FROM   data0089 INNER JOIN'
      '       Data0278 ON'
      '       data0089.parameter_ptr = dbo.Data0278.RKEY INNER JOIN'
      
        '       Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY INN' +
        'ER JOIN'
      '       Data0277 ON dbo.Data0278.CATEGORY_PTR = dbo.Data0277.RKEY'
      'where'
      '    data0089.cust_part_ptr=:cust_part_ptr'
      'order by data0089.rkey')
    Left = 104
    Top = 133
    object ado89parameter_name: TStringField
      DisplayLabel = #21442#25968#21517#31216
      DisplayWidth = 38
      FieldName = 'parameter_name'
      FixedChar = True
      Size = 10
    end
    object ado89parameter_desc: TStringField
      DisplayLabel = #29305#21035#35201#27714#39033#30446
      DisplayWidth = 40
      FieldName = 'parameter_desc'
    end
    object ado89unit_name: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 24
      FieldName = 'unit_name'
    end
    object ado89tvalue: TStringField
      DisplayLabel = #20869#23481
      DisplayWidth = 35
      FieldName = 'tvalue'
    end
    object ado89CATEGORY_DESC: TStringField
      DisplayLabel = #21442#25968#31867#21035
      FieldName = 'CATEGORY_DESC'
      Size = 25
    end
  end
  object DataSource2: TDataSource
    DataSet = ado89
    Left = 36
    Top = 132
  end
  object ado60: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey97'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cust_part_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0050.CUSTOMER_PART_NUMB' +
        'ER, '
      '      dbo.Data0050.CUSTOMER_PART_DESC, dbo.Data0050.CP_REV, '
      '      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.PART_PRICE, '
      
        '      dbo.Data0060.TOTAL_ADD_L_PRICE, dbo.Data0060.ORIG_SCHED_SH' +
        'IP_DATE, '
      
        '      dbo.Data0060.EXCH_RATE, dbo.Data0001.CURR_NAME,data0060.sc' +
        'h_date, '
      
        '      dbo.Data0001.CURR_CODE,data0060.ent_date,data0060.SHIPPING' +
        '_METHOD'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY'
      'where'
      
        ' data0060.purchase_order_ptr = :rkey97 and data0060.cust_part_pt' +
        'r = :cust_part_ptr'
      '')
    Left = 104
    Top = 284
    object ado60SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ado60CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#26495#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ado60CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ado60CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ado60PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ado60PART_PRICE: TFloatField
      DisplayLabel = #35746#21333#20215#26684
      FieldName = 'PART_PRICE'
    end
    object ado60TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ado60sch_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_DATE'
    end
    object ado60ORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #35745#21010#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ado60EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ado60CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ado60CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ado60SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ado60
    Left = 36
    Top = 284
  end
  object ADO90: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO90CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0034.DEPT_NAME,Data0005.EMPLOYEE_NAME,'
      '      data0090.auth_date,data0090.rkey,data0090.dept_ptr'
      'FROM Data0034 INNER JOIN'
      
        '     data0090 ON Data0034.RKEY = data0090.dept_ptr LEFT OUTER JO' +
        'IN'
      '     Data0005 ON data0090.user_ptr = Data0005.RKEY'
      'where data0090.pact_ptr=:rkey60')
    Left = 102
    Top = 182
    object ADO90DEPT_NAME: TStringField
      DisplayLabel = #35780#23457#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO90EMPLOYEE_NAME: TStringField
      DisplayLabel = #35780#23457#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO90auth_date: TDateTimeField
      DisplayLabel = #35780#23457#26085#26399
      FieldName = 'auth_date'
    end
    object ADO90rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO90auth_flag: TStringField
      DisplayLabel = #35780#23457#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
    object ADO90dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO90
    Left = 36
    Top = 181
  end
  object AQ0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 164
    Top = 183
    object AQ0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object AQ0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object AQ0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object AQ0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object AQ9711: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'select * from data0011'
      'where source_type = 1060 and '
      '      file_pointer = :rkey')
    Left = 166
    Top = 81
    object AQ9711RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ9711FILE_POINTER: TIntegerField
      FieldName = 'FILE_POINTER'
    end
    object AQ9711SOURCE_TYPE: TSmallintField
      FieldName = 'SOURCE_TYPE'
    end
    object AQ9711NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object AQ9711NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object AQ9711NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object AQ9711NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object AQ9711memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object ADO9060: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey43'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0090.auth_date,data0090.user_ptr,'
      '       Data0060.RMA_PTR,Data0060.MFG_ORDER_DATE,'
      '       Data0060.QUOTE_PRICE'
      'FROM   Data0060 INNER JOIN'
      '       data0090 ON Data0060.RKEY = data0090.pact_ptr'
      'where data0090.pact_ptr=:rkey60 and data0090.dept_ptr =:rkey43')
    Left = 224
    Top = 81
    object ADO9060auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO9060user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO9060RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO9060MFG_ORDER_DATE: TDateTimeField
      FieldName = 'MFG_ORDER_DATE'
    end
    object ADO9060QUOTE_PRICE: TWordField
      FieldName = 'QUOTE_PRICE'
    end
  end
  object ADO6090: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey50'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey97'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0060.QUOTE_PRICE,data0090.user_ptr,data0060.sales_ord' +
        'er,'
      '       data0090.auth_date,data0060.rkey as rkey60,'
      
        '       data0060.due_date,data0060.sch_date,data0060.rush_charge_' +
        'pct_used,'
      '       data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE'
      'FROM   Data0060 INNER JOIN'
      '       data0090 ON Data0060.RKEY = data0090.pact_ptr'
      'where data0060.status=1 and'
      '      data0060.quote_price=0 and'
      '      data0090.dept_ptr=:rkey34 and'
      '      data0060.cust_part_ptr=:rkey50 and'
      '      data0060.purchase_order_ptr=:rkey97 and'
      '      data0090.auth_date is null')
    Left = 224
    Top = 131
    object ADO6090QUOTE_PRICE: TWordField
      FieldName = 'QUOTE_PRICE'
    end
    object ADO6090user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO6090auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO6090rkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADO6090due_date: TDateTimeField
      FieldName = 'due_date'
    end
    object ADO6090sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object ADO6090sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADO6090ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO6090ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO6090rush_charge_pct_used: TIntegerField
      FieldName = 'rush_charge_pct_used'
    end
  end
  object Aq6090: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey from data0090'
      'where data0090.auth_date is null and'
      '      data0090.pact_ptr =:rkey60')
    Left = 280
    Top = 132
  end
  object ado60_cancel: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkey34_1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0097.PO_NUMBER, dbo.Data0010.ABBR_NAME, dbo.data0' +
        '090.auth_date, '
      '      dbo.Data0060.RKEY AS rkey60, dbo.data0090.user_ptr, '
      '      dbo.Data0060.SALES_ORDER, dbo.Data0060.QUOTE_PRICE, '
      '      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.SCH_DATE, '
      '      dbo.data0090.IF_PUTHDATE, dbo.Data0097.PO_DATE, '
      
        '      dbo.Data0060.ORIG_SCHED_SHIP_DATE, dbo.Data0060.CUST_PART_' +
        'PTR, '
      '      dbo.Data0060.PURCHASE_ORDER_PTR AS rkey97, '
      
        '     ROUND(dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq, 4)' +
        '  AS parts_mianji, '
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ', '
      
        '      dbo.Data0025.ALLOW_EDIT_FLAG, dbo.Data0025.ONHOLD_SALES_FL' +
        'AG, '
      '      dbo.Data0025.ONHOLD_RELEASE_FLAG, '
      '      dbo.Data0025.ONHOLD_PLANNING_FLAG,data0010.CUST_CODE'
      'FROM dbo.Data0060 INNER JOIN'
      '      dbo.Data0097 ON '
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.data0090 ON dbo.Data0060.RKEY = dbo.data0090.pact_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY'
      'WHERE'
      '    data0060.PROD_REL='#39'1'#39
      '    and data0090.dept_ptr = :rkey34_1'
      '    and data0090.auth_date is not null'
      ''
      'ORDER BY Data0060.SALES_ORDER')
    Left = 270
    Top = 291
    object ado60_cancelPO_NUMBER: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ado60_cancelABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ado60_cancelauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ado60_canceluser_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ado60_cancelSALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ado60_cancelPARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ado60_cancelquote_price: TWordField
      FieldName = 'quote_price'
    end
    object ado60_cancelsch_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_date'
    end
    object ado60_cancelpo_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ado60_cancelORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #35745#21010#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ado60_cancelCUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ado60_cancelrkey97: TIntegerField
      FieldName = 'rkey97'
    end
    object ado60_cancelALLOW_EDIT_FLAG: TStringField
      FieldName = 'ALLOW_EDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object ado60_cancelONHOLD_SALES_FLAG: TSmallintField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object ado60_cancelONHOLD_RELEASE_FLAG: TSmallintField
      FieldName = 'ONHOLD_RELEASE_FLAG'
    end
    object ado60_cancelONHOLD_PLANNING_FLAG: TSmallintField
      FieldName = 'ONHOLD_PLANNING_FLAG'
    end
    object ado60_cancelparts_mianji: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'parts_mianji'
      ReadOnly = True
    end
    object ado60_cancelrkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ado60_cancelif_puthdate: TWordField
      FieldName = 'if_puthdate'
    end
    object ado60_cancelMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ado60_cancelMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495' '
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ado60_cancelCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
  end
  object DataSource5: TDataSource
    DataSet = ado60_cancel
    Left = 200
    Top = 291
  end
  object ADO62: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey60'
        DataType = ftInteger
        Size = 1
        Value = 1
      end>
    SQL.Strings = (
      'SELECT Data0061.CATEGORY,'
      '       Data0062.AMOUNT,'
      '       data0062.free_amount,costfree_amount'
      'FROM dbo.Data0062 INNER JOIN'
      
        '      dbo.Data0061 ON dbo.Data0062.ADDL_CAT_PTR = dbo.Data0061.R' +
        'KEY'
      'WHERE (dbo.Data0062.SO_PTR = :rkey60)')
    Left = 104
    Top = 230
    object ADO62CATEGORY: TStringField
      DisplayLabel = #24037#20855#36153#29992#31867#21035
      FieldName = 'CATEGORY'
    end
    object ADO62AMOUNT: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
    end
    object ADO62free_amount: TFloatField
      DisplayLabel = #25346#36134#37329#39069
      FieldName = 'free_amount'
    end
    object ADO62costfree_amount: TFloatField
      DisplayLabel = #20813#25910#37329#39069
      FieldName = 'costfree_amount'
    end
  end
  object DataSource6: TDataSource
    DataSet = ADO62
    Left = 36
    Top = 230
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, '
      
        '      ROUND(dbo.Data0026.QTY_BOM * dbo.Data0060.PARTS_ORDERED, 6' +
        ') '
      
        '      AS stand_qty, dbo.Data0002.UNIT_NAME, dbo.Data0017.QUAN_ON' +
        '_HAND'
      'FROM dbo.Data0025 INNER JOIN'
      '      dbo.Data0026 ON '
      '      dbo.Data0025.RKEY = dbo.Data0026.MANU_BOM_PTR INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0026.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      '      dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0025.RKEY = dbo.Data0060.CUST_PART' +
        '_PTR'
      'WHERE   (Data0060.rkey = :rkey60)')
    Left = 104
    Top = 344
    object ADOQuery2INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery2INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery2INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery2stand_qty: TFloatField
      DisplayLabel = #35746#21333#29992#37327
      FieldName = 'stand_qty'
      ReadOnly = True
    end
    object ADOQuery2UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery2QUAN_ON_HAND: TFloatField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
    end
  end
  object DataSource7: TDataSource
    DataSet = ADOQuery2
    Left = 36
    Top = 344
  end
  object ADO38: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'cust_part_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT' +
        '_NAME, '
      '      dbo.Data0038.STEP_NUMBER'
      'FROM dbo.Data0034 INNER JOIN'
      
        '      dbo.Data0038 ON dbo.Data0034.RKEY = dbo.Data0038.DEPT_PTR ' +
        'INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0038.SOURCE_PTR = dbo.Data0025.RKE' +
        'Y'
      'WHERE (dbo.Data0025.rkey = :cust_part_ptr)'
      'ORDER BY dbo.Data0038.STEP_NUMBER')
    Left = 272
    Top = 343
    object ADO38DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO38DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO38STEP_NUMBER: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'STEP_NUMBER'
    end
  end
  object DataSource8: TDataSource
    DataSet = ADO38
    Left = 200
    Top = 344
  end
  object ADO360: TADOQuery
    Connection = ADOConnection1
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
      'select rkey,so_ptr,quantity,sch_date'
      'from data0360'
      'where so_ptr=:rkey')
    Left = 268
    Top = 237
    object ADO360rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO360so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO360quantity: TIntegerField
      DisplayLabel = #23436#24037#25968#37327
      FieldName = 'quantity'
    end
    object ADO360sch_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'sch_date'
    end
  end
  object DataSource9: TDataSource
    DataSet = ADO360
    Left = 198
    Top = 236
  end
  object aq_total360: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'sys_data1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'sys_data2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0360.*, da360.number,case data0360.ttype when 0 then ' +
        #39#37327#20135#39' when 1 then '#39#26679#26495#39' end as ttypetext from'
      '('
      'SELECT data0360.sch_date,'
      '       SUM(data0360.quantity * Data0025.unit_sq) AS qty_mianji,'
      '       SUM(data0360.quantity) AS qty_total,'
      
        '       Data0015.ABBR_NAME,Data0025.ttype,Data0008.difficulty_gra' +
        'de'
      'FROM   Data0060 INNER JOIN'
      '       data0360 ON Data0060.RKEY = data0360.so_ptr INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN'
      
        '       Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY INNER ' +
        'JOIN'
      '       Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY'
      'WHERE  (data0360.sch_date >= :sys_data1) and Data0060.STATUS=1'
      
        'GROUP BY data0360.sch_date,Data0015.ABBR_NAME,Data0025.ttype,Dat' +
        'a0008.difficulty_grade'
      ') as data0360 inner join'
      ''
      
        '( select d360.sch_date,d360.ABBR_NAME,d360.ttype,d360.difficulty' +
        '_grade,count(*) as number'
      ' from'
      '('
      
        'SELECT data0360.sch_date,Data0015.ABBR_NAME,Data0025.ttype,Data0' +
        '008.difficulty_grade,Data0025.MANU_PART_NUMBER'
      'FROM   data0360 INNER JOIN'
      '       Data0060 ON data0360.so_ptr = Data0060.RKEY INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN'
      
        '       Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY INNER ' +
        'JOIN'
      '       Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY'
      'WHERE  (data0360.sch_date >= :sys_data2) and Data0060.STATUS=1'
      
        'GROUP BY data0360.sch_date,Data0015.ABBR_NAME,Data0025.ttype,Dat' +
        'a0008.difficulty_grade,Data0025.MANU_PART_NUMBER'
      ') as d360'
      
        'group by d360.sch_date,d360.ABBR_NAME,d360.ttype,d360.difficulty' +
        '_grade)'
      'as da360 on da360.sch_date=data0360.sch_date and'
      '            da360.ABBR_NAME=data0360.ABBR_NAME and'
      '            da360.ttype=data0360.ttype and'
      '            da360.difficulty_grade=data0360.difficulty_grade'
      'ORDER BY data0360.sch_date')
    Left = 272
    Top = 16
    object aq_total360sch_date: TDateTimeField
      DisplayLabel = #35745#21010#20837#24211#26085#26399
      DisplayWidth = 18
      FieldName = 'sch_date'
    end
    object aq_total360qty_mianji: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      DisplayWidth = 16
      FieldName = 'qty_mianji'
      DisplayFormat = '0.0000'
    end
    object aq_total360qty_total: TIntegerField
      DisplayLabel = #20837#24211#25968#37327'pcs'
      DisplayWidth = 15
      FieldName = 'qty_total'
    end
    object aq_total360number: TIntegerField
      DisplayLabel = #20132#36135#27454#25968
      FieldName = 'number'
      ReadOnly = True
    end
    object aq_total360ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq_total360ttype: TWordField
      FieldName = 'ttype'
    end
    object aq_total360ttypetext: TStringField
      FieldName = 'ttypetext'
      ReadOnly = True
      Visible = False
      Size = 4
    end
    object aq_total360difficulty_grade: TIntegerField
      FieldName = 'difficulty_grade'
    end
  end
  object DataSource10: TDataSource
    DataSet = aq_total360
    Left = 208
    Top = 16
  end
  object TIMEqry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 88
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 184
  end
  object Adoarea: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'data1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0360.sch_date,'
      '       SUM(data0360.quantity * Data0025.unit_sq) AS qty_mianji,'
      '       Data0015.ABBR_NAME'
      'FROM   Data0060 INNER JOIN'
      '       data0360 ON Data0060.RKEY = data0360.so_ptr INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN'
      '       Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY'
      
        'WHERE  (data0360.sch_date >=:data1) and Data0060.STATUS=1 and Da' +
        'ta0015.RKEY=:rkey15 and data0015.date_area<>0 '
      'GROUP BY data0360.sch_date,Data0015.ABBR_NAME,Data0015.date_area'
      
        'having SUM(data0360.quantity * Data0025.unit_sq)>Data0015.date_a' +
        'rea')
    Left = 352
    Top = 24
  end
  object Adoquantity: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'data1'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey15'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select d36.sch_date,D36.ABBR_NAME,COUNT(D36.MANU_PART_NUMBER) as' +
        ' kk '
      'from ('
      
        'SELECT data0360.sch_date,Data0025.MANU_PART_NUMBER,Data0015.ABBR' +
        '_NAME,Data0015.date_quantity'
      'FROM   Data0060 INNER JOIN'
      '       data0360 ON Data0060.RKEY = data0360.so_ptr INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN'
      '       Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY'
      
        'WHERE  (data0360.sch_date >=:data1) and Data0060.STATUS=1 and Da' +
        'ta0015.RKEY=:rkey15 and Data0015.date_quantity<>0  '
      
        'GROUP BY data0360.sch_date,Data0015.ABBR_NAME,Data0025.MANU_PART' +
        '_NUMBER,Data0015.date_quantity) as d36'
      'group by d36.sch_date,D36.ABBR_NAME,d36.date_quantity'
      'having COUNT(D36.MANU_PART_NUMBER)>d36.date_quantity')
    Left = 352
    Top = 88
  end
end
