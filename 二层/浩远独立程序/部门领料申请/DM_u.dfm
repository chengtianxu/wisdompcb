object DM: TDM
  OldCreateOrder = False
  Left = 420
  Top = 179
  Height = 449
  Width = 367
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 264
    Top = 96
  end
  object DS1: TDataSource
    DataSet = ADO268
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO468
    Left = 8
    Top = 155
  end
  object ADO268: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO268AfterScroll
    AfterScroll = ADO268AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.' +
        'dept_ptr, dbo.DATA0268.DATE, dbo.DATA0268.EMPL_PTR, dbo.DATA0268' +
        '.status, '
      
        '                      dbo.DATA0268.auth_emplptr, dbo.DATA0268.au' +
        'th_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Dat' +
        'a0034.DEPT_NAME, '
      
        '                      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLO' +
        'YEE_NAME AS abbr_name, Data0005_1.EMPL_CODE AS Auditcode, '
      '                      Data0005_1.EMPLOYEE_NAME AS Auditname, '
      
        '                      CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' W' +
        'HEN data0268.status = 1 THEN '#39#24453#23457#26680#39' WHEN data0268.status = 2 THEN' +
        ' '#39#24050#23457#26680#39' WHEN data0268.status'
      
        '                       = 3 THEN '#39#34987#36864#22238#39' WHEN data0268.status = 4 T' +
        'HEN '#39#24050#21457#26009#39' END AS status_c, dbo.DATA0268.auth_ptr, dbo.Data0094.R' +
        'KEY AS rkey94, '
      
        '                      dbo.Data0094.CODE, dbo.Data0094.PURCHASE_A' +
        'PPROV_DESC, dbo.Data0015.ABBR_NAME AS fac_name, dbo.DATA0268.war' +
        'ehouse_ptr, '
      
        '                      dbo.DATA0268.Prted, dbo.DATA0268.CUT_NO, d' +
        'bo.DATA0268.TTYPE'
      'FROM         dbo.DATA0268 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY and data0268.ttype=0 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.DATA0268' +
        '.auth_emplptr = Data0005_1.RKEY INNER JOIN'
      
        '                      dbo.Data0094 ON dbo.DATA0268.auth_ptr = db' +
        'o.Data0094.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY')
    Left = 56
    Top = 88
    object ADO268rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO268number: TStringField
      DisplayLabel = #30003#39046#21333#21495
      FieldName = 'number'
      Size = 50
    end
    object ADO268dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO268DATE: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'DATE'
    end
    object ADO268EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO268status: TWordField
      FieldName = 'status'
    end
    object ADO268auth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object ADO268auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADO268reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
    object ADO268DEPT_CODE: TStringField
      DisplayLabel = #30003#39046#37096#38376
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO268DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO268EMPL_CODE: TStringField
      DisplayLabel = #30003#39046#21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO268ABBR_NAME: TStringField
      DisplayLabel = #30003#39046#21592#24037#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO268Auditcode: TStringField
      DisplayLabel = #23457#26680#21592#24037#20195#30721
      FieldName = 'Auditcode'
      Size = 10
    end
    object ADO268Auditname: TStringField
      DisplayLabel = #30003#39046#21592#24037#21517#31216
      FieldName = 'Auditname'
      Size = 10
    end
    object ADO268status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO268auth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object ADO268code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADO268PURCHASE_APPROV_DESC: TStringField
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object ADO268fac_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'fac_name'
      Size = 10
    end
    object ADO268warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO268Prted: TBooleanField
      DisplayLabel = #25171#21360#21542
      FieldName = 'Prted'
    end
    object ADO268CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO268TTYPE: TWordField
      FieldName = 'TTYPE'
    end
  end
  object ADO468: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468.' +
        'SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, dbo.Data0468.DEP' +
        'T_PTR, '
      
        '                      dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN' +
        '_BOM, dbo.Data0468.QUAN_ISSUED, dbo.Data0468.STATUS, dbo.Data046' +
        '8.PRINTIT, '
      
        '                      dbo.Data0468.VENDOR, dbo.Data0468.Invent_o' +
        'r, dbo.Data0468.quan_alloc, dbo.Data0017.INV_PART_NUMBER, '
      
        '                      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Dat' +
        'a0002.UNIT_NAME, dbo.Data0017.QUAN_ON_HAND'
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY'
      'where dbo.DATA0468.flow_no=:rkey268')
    Left = 56
    Top = 152
    object ADO468RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO468FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADO468STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADO468DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO468INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ADO468QUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object ADO468VENDOR: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'VENDOR'
      Size = 15
    end
    object ADO468Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object ADO468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO468INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216'/'#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO468unit_name: TStringField
      DisplayLabel = #24211#23384#21333#20301
      FieldName = 'unit_name'
    end
    object ADO468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
    object ADO468CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO468PRINTIT: TStringField
      FieldName = 'PRINTIT'
      FixedChar = True
      Size = 1
    end
    object ADO468quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ADO468QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
  end
  object ADO268_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, number, CUT_NO, dept_ptr, DATE, EMPL_PTR, statu' +
        's, auth_emplptr, auth_date, auth_ptr, reference, warehouse_ptr, ' +
        'Prted, TTYPE'
      'FROM         dbo.DATA0268'
      'where rkey=:rkey268'
      ''
      '')
    Left = 128
    Top = 88
  end
  object ADO468_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     RKEY, CUT_NO, SO_NO, FLOW_NO, STEP, DEPT_PTR, INVENT_' +
        'PTR, QUAN_BOM, QUAN_ISSUED, STATUS, PRINTIT, VENDOR, invent_or, ' +
        'quan_alloc'
      ' from data0468 where flow_no=:rkey268')
    Left = 128
    Top = 152
  end
  object ADO17: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        ' SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo' +
        '.Data0017.INV_PART_DESCRIPTION, SUM(dbo.Data0022.QUAN_ON_HAND-db' +
        'o.Data0022.QUAN_TO_BE_STOCKED) AS Qty, '
      
        '                       dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR' +
        '_NAME,dbo.data0016.LOCATION '
      '                       FROM         dbo.Data0017 INNER JOIN '
      
        '                       dbo.Data0022 ON dbo.Data0017.RKEY = dbo.D' +
        'ata0022.INVENTORY_PTR INNER JOIN '
      
        '                       dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_P' +
        'TR = dbo.Data0002.RKEY INNER JOIN  '
      
        '                       dbo.Data0456 ON dbo.Data0022.GRN_PTR = db' +
        'o.Data0456.RKEY INNER JOIN'
      
        '                       dbo.data0016 ON dbo.data0022.LOCATION_PTR' +
        ' = dbo.data0016.RKEY INNER JOIN'
      
        '                       dbo.Data0023 ON dbo.Data0456.SUPP_PTR = d' +
        'bo.Data0023.RKEY '
      '                        '
      
        '                       GROUP BY dbo.Data0017.RKEY, dbo.Data0017.' +
        'INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002' +
        '.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION '
      '                       ORDER BY  dbo.Data0017.INV_PART_NUMBER')
    Left = 16
    Top = 224
    object ADO17RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO17INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO17INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO17UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO17ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADO17Qty: TBCDField
      FieldName = 'Qty'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADO17LOCATION: TStringField
      FieldName = 'LOCATION'
    end
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 264
    Top = 176
  end
  object ADO368: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,' +
        'data0368.user_ptr,'
      
        '                      data0368.auth_date,data0368.ranking,data03' +
        '68.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '
      
        '                     ON dbo.Data0073.RKEY = dbo.data0368.user_pt' +
        'r '
      '                     WHERE dbo.data0368.apply_ptr=:rkey268'
      '                      order by dbo.data0368.ranking')
    Left = 72
    Top = 288
    object ADO368USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO368USER_ID: TStringField
      FieldName = 'USER_ID'
      Size = 15
    end
    object ADO368user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO368auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO368ranking: TWordField
      FieldName = 'ranking'
    end
    object ADO368auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
  end
  object DS3: TDataSource
    DataSet = ADO368
    Left = 24
    Top = 288
  end
  object ADO492: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT      dbo.data0492.CUT_NO AS '#37197#26009#21333#21495', dbo.data0492.ISSUED_QTY' +
        ' as '#26412#27425#25237#20135#25968',dbo.Data0025.MANU_PART_NUMBER AS '#26412#21378#32534#21495', dbo.Data0025.MA' +
        'NU_PART_DESC AS '#23458#25143#22411#21495', '
      
        '                      dbo.Data0060.SALES_ORDER AS '#38144#21806#35746#21333#21495', dbo.Dat' +
        'a0097.PO_NUMBER AS '#23458#25143#35746#21333#21495', dbo.Data0010.CUST_CODE AS '#23458#25143#20195#30721', '
      
        '                      dbo.Data0010.ABBR_NAME AS '#23458#25143#31616#31216', dbo.Data00' +
        '60.PARTS_ORDERED AS '#35746#21333#25968#37327', dbo.Data0060.ISSUED_QTY AS '#24050#25237#20135#25968#37327', '
      
        '                      dbo.Data0060.ENT_DATE AS '#35746#21333#26085#26399',  dbo.data04' +
        '92.CUT_NO, dbo.Data0025.MANU_PART_NUMBER , dbo.Data0025.MANU_PAR' +
        'T_DESC, '
      
        '                      dbo.Data0060.SALES_ORDER , dbo.Data0097.PO' +
        '_NUMBER , dbo.Data0010.CUST_CODE , '
      
        '                      dbo.Data0010.ABBR_NAME , dbo.Data0060.PART' +
        'S_ORDERED, dbo.Data0060.ISSUED_QTY , '
      '                      dbo.Data0060.ENT_DATE '
      'FROM         dbo.data0492 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.data0492.SO_NO = dbo.D' +
        'ata0060.SALES_ORDER INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY'
      'WHERE     (dbo.Data0060.STATUS = 1)')
    Left = 160
    Top = 224
    object ADO492DSDesigner: TStringField
      FieldName = #37197#26009#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADO492DSDesigner2: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADO492DSDesigner3: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object ADO492DSDesigner4: TStringField
      FieldName = #38144#21806#35746#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADO492DSDesigner5: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object ADO492DSDesigner6: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADO492DSDesigner7: TStringField
      FieldName = #23458#25143#31616#31216
      Size = 10
    end
    object ADO492DSDesigner8: TFloatField
      FieldName = #35746#21333#25968#37327
    end
    object ADO492DSDesigner9: TIntegerField
      FieldName = #24050#25237#20135#25968#37327
    end
    object ADO492DSDesigner10: TDateTimeField
      FieldName = #35746#21333#26085#26399
    end
    object ADO492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO492MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO492MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO492SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO492PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO492CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO492ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO492PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO492ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO492DSDesigner11: TIntegerField
      FieldName = #26412#27425#25237#20135#25968
    end
  end
  object DS4: TDataSource
    DataSet = ADO492
    Left = 112
    Top = 224
  end
end
