object dm: Tdm
  OldCreateOrder = False
  Left = 572
  Top = 270
  Height = 358
  Width = 387
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADO0456: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    BeforeInsert = ADOnowBeforeInsert
    BeforeEdit = ADOnowBeforeEdit
    BeforeDelete = ADOnowBeforeDelete
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0015.WAREHOUSE_NAME, dbo.Data0023.SUPPLIER_NAME,d' +
        'bo.Data0023.abbr_name,dbo.Data0023.TAX_ID_NUMBER as '#20184#27454#26041#24335','
      
        '      dbo.Data0070.PO_NUMBER, dbo.Data0235.goods_type, dbo.Data0' +
        '235.goods_guige,'
      
        '      dbo.Data0235.goods_name, dbo.Data0235.rohs, dbo.Data0235.u' +
        'nit_price,'
      
        '      dbo.Data0456.ship_DATE, dbo.Data0235.QUAN_RECD,dbo.Data023' +
        '5.state_tax,'
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0456.GRN_NUMBER,'
      
        '      round(dbo.Data0235.unit_price/(1+dbo.Data0235.state_tax*0.' +
        '01),4) as '#19981#21547#31246#20215','
      '      dbo.Data0235.unit_price*dbo.Data0235.QUAN_RECD as '#21547#31246#37329#39069','
      
        '      round(dbo.Data0235.unit_price*dbo.Data0235.QUAN_RECD/(1+db' +
        'o.Data0235.state_tax*0.01),4) as '#19981#21547#31246#37329#39069','
      
        '      dbo.Data0456.DELIVER_NUMBER ,dbo.Data0023.CODE,dbo.Data001' +
        '5.WAREHOUSE_CODE,'
      
        '      dbo.Data0005.EMPL_CODE,dbo.Data0456.EXCH_RATE,data0001.CUR' +
        'R_CODE as '#36135#24065',d05_1.employee_name as '#37319#36141#20154#21592','
      
        '      data0002.UNIT_NAME as '#21333#20301',data0235.DATE_RECD, dbo.Data0235.' +
        'cust_decl, dbo.Data0235.REF_NUMBER  '
      
        'FROM  Data0235 inner join Data0456 ON dbo.Data0456.RKEY = dbo.Da' +
        'ta0235.GRN_PTR '
      
        '      inner join data0015 on dbo.Data0015.RKEY = dbo.Data0456.wa' +
        'rehouse_ptr'
      
        '      inner join Data0023 on dbo.Data0023.RKEY = dbo.Data0456.SU' +
        'PP_PTR '
      
        '      inner join Data0005 on dbo.Data0005.RKEY = dbo.Data0456.CR' +
        'EATE_BY'
      '      inner join data0001 on data0001.rkey=data0456.currency_ptr'
      '      inner join data0002 on data0002.rkey=data0235.unit_ptr'
      
        '      LEFT outer join Data0070 on dbo.Data0456.PO_PTR = dbo.Data' +
        '0070.RKEY'
      
        '      left join data0005 d05_1 on data0070.EMPLOYEE_POINTER=d05_' +
        '1.rkey'
      'where (data0456.ttype in (2,6)) ')
    Left = 176
    Top = 16
    object ADO0456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      DisplayWidth = 13
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object ADO0456DELIVER_NUMBER: TStringField
      DisplayLabel = #20379#24212#21830#36865#36135#21333#21495
      DisplayWidth = 17
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADO0456WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      DisplayWidth = 24
      FieldName = 'WAREHOUSE_NAME'
      ReadOnly = True
      Size = 70
    end
    object ADO0456QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#24211#23384#25968
      DisplayWidth = 11
      FieldName = 'QUAN_RECD'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADO0456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25509#21463#20154#21592
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADO0456SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 21
      FieldName = 'SUPPLIER_NAME'
      ReadOnly = True
      Size = 100
    end
    object ADO0456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 15
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADO0456goods_type: TStringField
      DisplayLabel = #29289#21697#31867#21035
      DisplayWidth = 20
      FieldName = 'goods_type'
      ReadOnly = True
    end
    object ADO0456goods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 28
      FieldName = 'goods_guige'
      ReadOnly = True
      Size = 200
    end
    object ADO0456unit_price: TBCDField
      DisplayLabel = #21547#31246#20215#26684
      DisplayWidth = 11
      FieldName = 'unit_price'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADO0456goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 24
      FieldName = 'goods_name'
      ReadOnly = True
      Size = 60
    end
    object ADO0456CODE: TStringField
      FieldName = 'CODE'
      ReadOnly = True
      Size = 10
    end
    object ADO0456rohs: TStringField
      DisplayLabel = 'ROHS'#26631#35782
      DisplayWidth = 10
      FieldName = 'rohs'
      ReadOnly = True
      Size = 10
    end
    object ADO0456WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADO0456EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADO0456EXCH_RATE: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
      ReadOnly = True
      Precision = 12
      Size = 8
    end
    object ADO0456abbr_name: TStringField
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADO0456state_tax: TBCDField
      FieldName = 'state_tax'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADO0456DSDesigner: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 18
      Size = 9
    end
    object ADO0456ship_DATE: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      FieldName = 'ship_DATE'
      ReadOnly = True
    end
    object ADO0456DSDesigner2: TStringField
      FieldName = #36135#24065
      ReadOnly = True
      Size = 5
    end
    object ADO0456DSDesigner3: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object ADO0456DSDesigner4: TStringField
      FieldName = #20184#27454#26041#24335
      ReadOnly = True
    end
    object ADO0456DSDesigner5: TBCDField
      FieldName = #21547#31246#37329#39069
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object ADO0456DSDesigner6: TBCDField
      FieldName = #19981#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 15
    end
    object ADO0456DSDesigner7: TStringField
      FieldName = #37319#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADO0456DATE_RECD: TDateTimeField
      FieldName = 'DATE_RECD'
    end
    object ADO0456cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADO0456REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO0456
    Left = 112
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = ADO0457
    Left = 112
    Top = 72
  end
  object DataSource3: TDataSource
    DataSet = ADOnow
    Left = 113
    Top = 128
  end
  object ADO0457: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0005.EMPLOYEE_NAME, Data0235.goods_name,'
      
        '      Data0235.goods_type, Data0235.goods_guige,   DATA0208.QUAN' +
        'TITY,'
      
        '      DATA0208.RTN_QUANTITY, Data0235.rohs,Data0235.QUAN_ON_HAND' +
        ','
      '      Data0457.GON_NUMBER, Data0015.WAREHOUSE_NAME,'
      
        '      Data0034.DEPT_NAME, Data0457.CREATE_DATE ,data0235.unit_pr' +
        'ice,'
      
        '      Data0005.EMPL_CODE,Data0015.WAREHOUSE_CODE,Data0034.DEPT_C' +
        'ODE,'
      
        '      Data0456.exch_rate,data0001.CURR_CODE as '#36135#24065',data0002.unit_' +
        'name as '#21333#20301','
      '      data0235.state_tax as '#31246#29575',D05_2.employee_name as '#21457#26009#20154#21592','
      
        '      round(Data0235.unit_price/(1+Data0235.state_tax*0.01),3) a' +
        's '#19981#21547#31246#20215','
      '      round((DATA0208.QUANTITY*data0235.unit_price) ,3) as '#21547#31246#37329#39069','
      
        '       round((DATA0208.QUANTITY*Data0235.unit_price/(Data0235.st' +
        'ate_tax*0.01+1)),3)  as  '#19981#21547#31246#37329#39069','
      
        'data0457.ref_number, dbo.Data0457.Cut_NO,data0457.cut_no492 as '#29983 +
        #20135#21333#21495',d05_1.employee_name as '#37319#36141#20154#21592
      'FROM Data0005 INNER JOIN'
      '      Data0235 inner join'
      '      Data0002'
      '      ON Data0235.unit_ptr = Data0002.RKEY INNER JOIN'
      '      Data0034 INNER JOIN'
      '      DATA0208 INNER JOIN'
      '      Data0457 INNER JOIN'
      '      Data0015 ON Data0457.warehouse_ptr = Data0015.RKEY ON'#9
      '      DATA0208.GON_PTR = Data0457.RKEY ON'
      '      Data0034.RKEY = Data0457.dept_ptr ON'
      '      Data0235.RKEY = DATA0208.SOURCE_PTR ON'
      '      Data0005.RKEY = Data0457.RECD_BY  '
      '      INNER JOIN    Data0456 ON Data0235.GRN_PTR = Data0456.RKEY'
      
        '      inner join data0001    on data0456.currency_ptr=data0001.r' +
        'key'
      
        '      left outer join dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY '
      
        '      left outer join data0005 d05_1 on data0070.EMPLOYEE_POINTE' +
        'R=d05_1.rkey'
      '      inner join data0005 D05_2 on data0457.CREATE_BY=d05_2.rkey'
      'WHERE (Data0457.TTYPE = 5 ) and (DATA0208.QUANTITY<>0) ')
    Left = 176
    Top = 72
    object ADO0457GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ADO0457goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object ADO0457goods_type: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'goods_type'
    end
    object ADO0457goods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADO0457QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADO0457RTN_QUANTITY: TBCDField
      DisplayLabel = #36864#22238#25968#37327
      FieldName = 'RTN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADO0457EMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO0457WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO0457unit_price: TBCDField
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object ADO0457QUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object ADO0457DEPT_NAME: TStringField
      DisplayLabel = #39046#29992#37096#38376
      DisplayWidth = 15
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO0457CREATE_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO0457rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO0457EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO0457WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO0457DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO0457exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADO0457DSDesigner: TStringField
      FieldName = #36135#24065
      Size = 5
    end
    object ADO0457DSDesigner2: TStringField
      FieldName = #21333#20301
    end
    object ADO0457DSDesigner3: TBCDField
      FieldName = #31246#29575
      Precision = 4
      Size = 2
    end
    object ADO0457DSDesigner4: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 18
      Size = 9
    end
    object ADO0457DSDesigner5: TBCDField
      FieldName = #21547#31246#37329#39069
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object ADO0457DSDesigner6: TBCDField
      FieldName = #19981#21547#31246#37329#39069
      ReadOnly = True
      Precision = 29
      Size = 12
    end
    object ADO0457ref_number: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'ref_number'
      Size = 15
    end
    object ADO0457Cut_NO: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Cut_NO'
      Size = 40
    end
    object ADO0457DSDesigner7: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object ADO0457DSDesigner8: TStringField
      FieldName = #37319#36141#20154#21592
      Size = 16
    end
    object ADO0457DSDesigner9: TStringField
      FieldName = #21457#26009#20154#21592
      Size = 16
    end
  end
  object ADOnow: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    BeforeInsert = ADOnowBeforeInsert
    BeforeEdit = ADOnowBeforeEdit
    BeforeDelete = ADOnowBeforeDelete
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, db' +
        'o.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0016.LOCA' +
        'TION AS '#20179#24211#20301#32622', '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'WAREHOUSE_NAME, dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.CODE, '
      
        '                      dbo.Data0023.ABBR_NAME AS '#20379#24212#21830#31616#31216', dbo.Data0' +
        '235.unit_price AS '#21547#31246#20215', dbo.Data0456.exch_rate AS '#27719#29575', dbo.Data000' +
        '1.CURR_CODE AS '#36135#24065', '
      
        '                      dbo.Data0235.state_tax, ROUND(dbo.Data0235' +
        '.unit_price / (1 + dbo.Data0235.state_tax * 0.01), 3) AS '#19981#21547#31246#20215', d' +
        'bo.Data0456.ship_DATE, '
      
        '                      dbo.Data0235.QUAN_ON_HAND AS '#24403#21069#24211#23384#25968#37327', ROUND' +
        '(dbo.Data0235.QUAN_ON_HAND * dbo.Data0235.unit_price, 3) AS '#24635#37329#39069',' +
        ' dbo.Data0235.REF_NUMBER, '
      
        '                      dbo.Data0070.PO_NUMBER,data0235.DATE_RECD,' +
        ' dbo.Data0235.cust_decl ,data0235.rkey as rkey235'
      'FROM         dbo.Data0002 INNER JOIN'
      
        '                      dbo.Data0235 ON dbo.Data0002.RKEY = dbo.Da' +
        'ta0235.unit_ptr INNER JOIN  '
      
        '                      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Da' +
        'ta0456.currency_ptr INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0235.location_ptr ' +
        '= dbo.Data0016.RKEY left JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY'
      'WHERE     (dbo.Data0235.QUAN_ON_HAND > 0)')
    Left = 176
    Top = 128
    object ADOnowgoods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object ADOnowgoods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADOnowgoods_type: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'goods_type'
    end
    object ADOnowDSDesigner: TBCDField
      FieldName = #24403#21069#24211#23384#25968#37327
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADOnowUNIT_NAME: TStringField
      DisplayLabel = #29289#21697#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOnowDSDesigner2: TBCDField
      DisplayLabel = #21547#31246#37329#39069
      FieldName = #24635#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object ADOnowWAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#32534#21495
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOnowCODE: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'CODE'
      ReadOnly = True
      Size = 10
    end
    object ADOnowDSDesigner3: TBCDField
      FieldName = #21547#31246#20215
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADOnowDSDesigner4: TBCDField
      FieldName = #27719#29575
      ReadOnly = True
      Precision = 12
      Size = 8
    end
    object ADOnowSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      ReadOnly = True
      Size = 100
    end
    object ADOnowWAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      ReadOnly = True
      Size = 70
    end
    object ADOnowDSDesigner5: TStringField
      FieldName = #36135#24065
      ReadOnly = True
      Size = 5
    end
    object ADOnowstate_tax: TBCDField
      DisplayLabel = #31246#29575'(%)'
      FieldName = 'state_tax'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADOnowDSDesigner6: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 23
      Size = 12
    end
    object ADOnowDSDesigner7: TStringField
      FieldName = #20179#24211#20301#32622
      ReadOnly = True
    end
    object ADOnowDSDesigner8: TStringField
      FieldName = #20379#24212#21830#31616#31216
      ReadOnly = True
      Size = 16
    end
    object ADOnowship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
      ReadOnly = True
    end
    object ADOnowREF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object ADOnowPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOnowDATE_RECD: TDateTimeField
      FieldName = 'DATE_RECD'
    end
    object ADOnowcust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADOnowrkey235: TAutoIncField
      FieldName = 'rkey235'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 176
    Top = 192
  end
  object AdoCutoff: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.Data0235.RKey,dbo.Data0235.QUAN_ON_HAND AS '#24403#21069#24211#23384#25968#37327
      'FROM         dbo.Data0002 INNER JOIN'
      
        '                      dbo.Data0235 ON dbo.Data0002.RKEY = dbo.Da' +
        'ta0235.unit_ptr INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Da' +
        'ta0456.currency_ptr INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0235.location_ptr ' +
        '= dbo.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY'
      'WHERE     (dbo.Data0235.QUAN_ON_HAND > 0)')
    Left = 104
    Top = 192
  end
  object Ado255: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.data0255')
    Left = 40
    Top = 88
    object Ado255CutoffDate: TDateTimeField
      FieldName = 'CutoffDate'
    end
    object Ado255Operator05: TIntegerField
      FieldName = 'Operator05'
    end
    object Ado255OperatorDate: TDateTimeField
      FieldName = 'OperatorDate'
    end
    object Ado255Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
  end
  object Ado256: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.data0256')
    Left = 40
    Top = 144
    object Ado256CutoffDate: TDateTimeField
      FieldName = 'CutoffDate'
    end
    object Ado256Rkey235: TIntegerField
      FieldName = 'Rkey235'
    end
    object Ado256Stock: TFloatField
      FieldName = 'Stock'
    end
  end
  object AdoQry255: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'CutoffDate1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'CutoffDate2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0255.CutoffDate, Data0255.Operator05, Data0255.Operat' +
        'orDate, Data0255.Remark,data0005.EMPLOYEE_NAME'
      
        'FROM Data0255 inner join dbo.data0005 on dbo.data0255.Operator05' +
        '=dbo.data0005.RKey '
      'where CutoffDate>=:CutoffDate1 and CutoffDate<=:CutoffDate2')
    Left = 288
    Top = 24
    object AdoQry255CutoffDate: TDateTimeField
      FieldName = 'CutoffDate'
    end
    object AdoQry255Operator05: TIntegerField
      FieldName = 'Operator05'
    end
    object AdoQry255OperatorDate: TDateTimeField
      FieldName = 'OperatorDate'
    end
    object AdoQry255Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object AdoQry255EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object AdoQry256: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'CutoffDate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, db' +
        'o.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0016.LOCA' +
        'TION AS '#20179#24211#20301#32622', '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'ABBR_NAME, dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.CODE, '
      
        '                      dbo.Data0023.ABBR_NAME AS '#20379#24212#21830#31616#31216', dbo.Data0' +
        '235.unit_price AS '#21547#31246#20215', dbo.Data0456.exch_rate AS '#27719#29575', dbo.Data000' +
        '1.CURR_CODE AS '#36135#24065', '
      
        '                      dbo.Data0235.state_tax, ROUND(dbo.Data0235' +
        '.unit_price / (1 + dbo.Data0235.state_tax * 0.01), 3) AS '#19981#21547#31246#20215', d' +
        'bo.Data0456.ship_DATE, '
      
        '                      dbo.Data0235.QUAN_ON_HAND AS '#24403#21069#24211#23384#25968#37327', ROUND' +
        '(dbo.Data0235.QUAN_ON_HAND * dbo.Data0235.unit_price, 3) AS '#24635#37329#39069',' +
        ' dbo.Data0235.REF_NUMBER, '
      
        '                      dbo.Data0070.PO_NUMBER,dbo.Data0256.Cutoff' +
        'Date,dbo.Data0256.Stock,ROUND(dbo.Data0256.Stock * dbo.Data0235.' +
        'unit_price, 3) AS '#25130#25968#37329#39069','
      
        '                      ROUND((dbo.Data0256.Stock * dbo.Data0235.u' +
        'nit_price) / (1 + dbo.Data0235.state_tax * 0.01), 3) AS '#25130#25968#19981#21547#31246#37329#39069
      'FROM         dbo.Data0256 INNER JOIN'
      
        '                      dbo.Data0235 ON dbo.Data0256.Rkey235 = dbo' +
        '.Data0235.Rkey INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Da' +
        'ta0456.currency_ptr INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0235.location_ptr ' +
        '= dbo.Data0016.RKEY LEFT JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY INNER JOIN'
      
        '                      dbo.data0002 on dbo.data0235.unit_ptr=dbo.' +
        'data0002.Rkey'
      'WHERE  dbo.Data0256.CutoffDate =:CutoffDate')
    Left = 288
    Top = 88
    object AdoQry256goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object AdoQry256goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object AdoQry256goods_type: TStringField
      FieldName = 'goods_type'
    end
    object AdoQry256UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object AdoQry256DSDesigner: TStringField
      FieldName = #20179#24211#20301#32622
    end
    object AdoQry256WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AdoQry256SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AdoQry256CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object AdoQry256DSDesigner2: TStringField
      FieldName = #20379#24212#21830#31616#31216
      Size = 16
    end
    object AdoQry256DSDesigner3: TBCDField
      FieldName = #21547#31246#20215
      Precision = 10
      Size = 3
    end
    object AdoQry256DSDesigner4: TBCDField
      FieldName = #27719#29575
      Precision = 12
      Size = 8
    end
    object AdoQry256DSDesigner5: TStringField
      FieldName = #36135#24065
      Size = 5
    end
    object AdoQry256state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object AdoQry256DSDesigner6: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 23
      Size = 12
    end
    object AdoQry256ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object AdoQry256DSDesigner7: TBCDField
      FieldName = #24403#21069#24211#23384#25968#37327
      Precision = 10
      Size = 3
    end
    object AdoQry256DSDesigner8: TBCDField
      FieldName = #24635#37329#39069
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object AdoQry256REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object AdoQry256PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AdoQry256CutoffDate: TDateTimeField
      FieldName = 'CutoffDate'
    end
    object AdoQry256Stock: TFloatField
      FieldName = 'Stock'
    end
    object AdoQry256DSDesigner9: TFloatField
      FieldName = #25130#25968#37329#39069
      ReadOnly = True
    end
    object AdoQry256ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AdoQry256DSDesigner10: TFloatField
      FieldName = #25130#25968#19981#21547#31246#37329#39069
      ReadOnly = True
    end
  end
end
