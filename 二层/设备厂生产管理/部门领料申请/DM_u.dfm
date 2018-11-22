object DM: TDM
  OldCreateOrder = False
  Left = 526
  Top = 282
  Height = 375
  Width = 336
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
        'bo.DATA0268.TTYPE,data0268.user_name,data0005_2.EMPL_CODE as uco' +
        'de,data0005_2.EMPLOYEE_NAME as uname'
      'FROM         dbo.DATA0268 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY and data0268.ttype=0 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.DATA0268' +
        '.auth_emplptr = Data0005_1.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_2 ON dbo.DATA0268' +
        '.user_name = Data0005_2.rkey INNER JOIN'
      
        '                      dbo.Data0094 ON dbo.DATA0268.auth_ptr = db' +
        'o.Data0094.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY ')
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
      Size = 15
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
    object ADO268rkey94: TAutoIncField
      FieldName = 'rkey94'
      ReadOnly = True
    end
    object ADO268user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object ADO268ucode: TStringField
      FieldName = 'ucode'
      Size = 10
    end
    object ADO268uname: TStringField
      FieldName = 'uname'
      Size = 16
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
      Size = 60
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
        'Prted, TTYPE,user_name'
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
      
        'SELECT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data' +
        '0017.INV_PART_DESCRIPTION,'
      '(Data0017.QUAN_ON_HAND - Data0017.QUAN_ASSIGN) as yx, '
      
        'SUM(dbo.Data0022.QUAN_ON_HAND-dbo.Data0022.QUAN_TO_BE_STOCKED) A' +
        'S Qty, '
      
        'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCA' +
        'TION,max(case when 1=1 then dbo.Data0022.spec_place end) as sp_p' +
        'lace '
      'FROM dbo.Data0017 INNER JOIN '
      
        'dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR I' +
        'NNER JOIN '
      
        'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY ' +
        'INNER JOIN  '
      
        'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER J' +
        'OIN'
      
        'dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY IN' +
        'NER JOIN'
      'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '
      'where (dbo.Data0022.QUAN_ON_HAND > 0)'
      
        'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Da' +
        'ta0017.INV_PART_DESCRIPTION,'
      'Data0017.QUAN_ON_HAND,Data0017.QUAN_ASSIGN, '
      
        'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCA' +
        'TION '
      'ORDER BY  dbo.Data0017.INV_PART_NUMBER')
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
    object ADO17sp_place: TStringField
      FieldName = 'sp_place'
      ReadOnly = True
    end
    object ADO17yx: TBCDField
      FieldName = 'yx'
      ReadOnly = True
      Precision = 20
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
      
        'SELECT     dbo.data0492.rkey, CASE dbo.data0492.TTYPE WHEN 0 THE' +
        'N '#39#35746#21333#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN 4 THEN '#39#25353#20135#21697#25237#20135#39' END AS TTYPE, '
      
        '                      dbo.data0492.CUT_NO, dbo.Data0008.PROD_COD' +
        'E, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Dat' +
        'a0007.PR_GRP_CODE, '
      
        '                      dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0' +
        '034.DEPT_NAME, dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date' +
        ', '
      
        '                      dbo.data0492.ISSUED_QTY, dbo.data0492.ISSU' +
        'E_DATE, dbo.Data0005.EMPLOYEE_NAME, dbo.data0492.TSTATUS'
      'FROM         dbo.Data0007 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0007.RKEY = dbo.Da' +
        'ta0008.PR_GRP_POINTER INNER JOIN'
      '                      dbo.data0492 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo' +
        '.Data0034.RKEY ON dbo.Data0008.RKEY = dbo.data0492.BOM_PTR INNER' +
        ' JOIN'
      
        '                      dbo.WZCP0070 ON dbo.data0492.SO_NO = dbo.W' +
        'ZCP0070.sales_order INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0492.CREATED_BY_PT' +
        'R = dbo.Data0005.RKEY'
      'where data0492.TSTATUS in (0,2)')
    Left = 160
    Top = 224
    object ADO492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO492TTYPE: TStringField
      FieldName = 'TTYPE'
      ReadOnly = True
      Size = 10
    end
    object ADO492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO492PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADO492PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO492PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADO492PR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADO492PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADO492DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO492sales_order: TStringField
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO492sales_date: TDateTimeField
      FieldName = 'sales_date'
    end
    object ADO492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO492ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADO492EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO492TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
  end
  object DS4: TDataSource
    DataSet = ADO492
    Left = 112
    Top = 224
  end
  object ADOVMI: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#39046#26009#21333#21495', dbo.D' +
        'ata0005.EMPLOYEE_NAME AS '#30003#39046#20154#21592', dbo.Data0034.DEPT_NAME AS '#37096#38376', '
      
        '                      dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.' +
        'Data0017.INV_NAME AS '#26448#26009#21517#31216', dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684',' +
        ' '
      
        '                      dbo.Data0468.VENDOR AS '#20379#24212#21830', dbo.Data0002.U' +
        'NIT_NAME AS '#21333#20301', dbo.Data0468.QUAN_BOM AS '#30003#39046#25968#37327', dbo.Data0468.QUAN' +
        '_ISSUED AS '#24050#21457#25918#25968#37327', '
      
        '                      dbo.DATA0268.DATE AS '#30003#39046#26085#26399', dbo.DATA0268.re' +
        'ference AS '#22791#27880', dbo.Data0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', dbo.Data0015' +
        '.ABBR_NAME AS '#24037#21378#31616#31216', '
      
        '                      dbo.DATA0268.CUT_NO AS '#29983#20135#21333#21495', dbo.data0492.' +
        'SO_NO AS '#38144#21806#35746#21333', dbo.Data0008.PROD_CODE AS '#20135#21697#32534#30721', dbo.Data0008.PROD' +
        'UCT_NAME AS '#20135#21697#21517#31216', '
      '                      dbo.Data0008.PRODUCT_DESC AS '#20135#21697#35268#26684', '
      
        '                      CASE data0268.status WHEN 0 THEN '#39#24453#25552#20132#39' WHE' +
        'N 1 THEN '#39#24453#23457#26680#39' WHEN 2 THEN '#39#24050#23457#26680#39' WHEN 3 THEN '#39#34987#36864#22238#39' WHEN 4 THEN '#39 +
        #24050#21457#25918#39' END AS '#39046#26009#21333#29366#24577', '
      
        '                      CASE data0468.status WHEN 0 THEN '#39#26377#25928#39' WHEN' +
        ' 1 THEN '#39#20851#38381#39' END AS '#39046#26009#26126#32454#29366#24577
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo' +
        '.DATA0268.rkey INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY left JOIN'
      
        '                      dbo.data0492 ON dbo.DATA0268.CUT_NO = dbo.' +
        'data0492.CUT_NO  left  JOIN'
      
        '                      dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0008.RKEY'
      'WHERE     (dbo.DATA0268.TTYPE = 0) and'
      '(dbo.DATA0268.DATE >= :dtpk1) AND (dbo.DATA0268.DATE <= :dtpk2)'
      '')
    Left = 152
    Top = 32
    object ADOVMIDSDesigner: TStringField
      FieldName = #39046#26009#21333#21495
      Size = 10
    end
    object ADOVMIDSDesigner2: TStringField
      FieldName = #30003#39046#20154#21592
      Size = 16
    end
    object ADOVMIDSDesigner3: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object ADOVMIDSDesigner4: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADOVMIDSDesigner5: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object ADOVMIDSDesigner6: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object ADOVMIDSDesigner7: TStringField
      FieldName = #20379#24212#21830
      Size = 15
    end
    object ADOVMIDSDesigner8: TStringField
      FieldName = #21333#20301
    end
    object ADOVMIDSDesigner9: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object ADOVMIDSDesigner10: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object ADOVMIDSDesigner11: TDateTimeField
      FieldName = #30003#39046#26085#26399
    end
    object ADOVMIDSDesigner12: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ADOVMIrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOVMIDSDesigner13: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ADOVMIDSDesigner14: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 70
    end
    object ADOVMIDSDesigner15: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADOVMIDSDesigner16: TStringField
      FieldName = #38144#21806#35746#21333
      Size = 12
    end
    object ADOVMIDSDesigner17: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 25
    end
    object ADOVMIDSDesigner18: TStringField
      DisplayWidth = 20
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object ADOVMIDSDesigner19: TStringField
      DisplayWidth = 20
      FieldName = #20135#21697#35268#26684
      Size = 200
    end
    object ADOVMIDSDesigner20: TStringField
      FieldName = #39046#26009#21333#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOVMIDSDesigner21: TStringField
      FieldName = #39046#26009#26126#32454#29366#24577
      ReadOnly = True
      Size = 4
    end
  end
  object DS5: TDataSource
    DataSet = ADOVMI
    Left = 200
    Top = 32
  end
end
