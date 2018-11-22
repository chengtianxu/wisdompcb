object DM: TDM
  OldCreateOrder = False
  Left = 820
  Top = 284
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
    Left = 216
    Top = 240
  end
  object DS1: TDataSource
    DataSet = ADO468
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO475
    Left = 8
    Top = 155
  end
  object ADO468: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO468AfterScroll
    AfterScroll = ADO468AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, dbo.data0492.CUT_NO, dbo.data0492.' +
        'ISSUE_DATE, '
      
        '                      dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.Q' +
        'UAN_ASSIGN AS ValQty, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_' +
        'NAME, dbo.Data0468.QUAN_BOM, '
      
        '                      dbo.Data0468.QUAN_ISSUED, dbo.Data0468.qua' +
        'n_alloc, dbo.Data0468.VENDOR, dbo.Data0005.EMPLOYEE_NAME, dbo.da' +
        'ta0492.con_date, dbo.Data0468.RKEY, '
      
        '                      dbo.Data0017.RKEY AS rkey17, dbo.Data0002.' +
        'UNIT_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART' +
        '_DESC, '
      
        '                      dbo.Data0015.ABBR_NAME,isnull(d23.ABBR_NAM' +
        'E,'#39#39') as SUPPLIER_NAME, isnull(d23.rkey,0) as rk23'
      'FROM         dbo.Data0005 INNER JOIN'
      '                      dbo.Data0034 INNER JOIN'
      '                      dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY ON dbo.Data0034.RKEY = dbo.Data0468.DEPT_P' +
        'TR INNER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0468.CUT_NO = dbo.' +
        'data0492.CUT_NO ON dbo.Data0005.RKEY = dbo.data0492.CREATED_BY_P' +
        'TR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0492.WHOUSE_PTR = ' +
        'dbo.Data0015.RKEY'
      
        '                      left join data0023  d23  on data0468.suppl' +
        'ier_ptr=d23.rkey ')
    Left = 56
    Top = 88
    object ADO468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO468INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO468INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO468unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADO468DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO468DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO468QUAN_BOM: TFloatField
      DisplayLabel = #37197#39069#25968
      DisplayWidth = 16
      FieldName = 'QUAN_BOM'
    end
    object ADO468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25968
      FieldName = 'QUAN_ISSUED'
    end
    object ADO468ValQty: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValQty'
      ReadOnly = True
      Precision = 20
    end
    object ADO468quan_alloc: TBCDField
      DisplayLabel = #20998#37197#25968
      FieldName = 'quan_alloc'
      Precision = 9
    end
    object ADO468VENDOR: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'VENDOR'
      Size = 15
    end
    object ADO468EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO468rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO468rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object ADO468con_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'con_date'
    end
    object ADO468MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO468MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO468CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO468ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ADO468ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO468rk23: TIntegerField
      FieldName = 'rk23'
      ReadOnly = True
    end
    object ADO468SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      ReadOnly = True
      Size = 16
    end
  end
  object ADO475: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey468'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, '
      
        '                     dbo.Data0456.CREATE_DATE, dbo.Data0456.GRN_' +
        'NUMBER, '
      '                      dbo.Data0022.INVENTORY_PTR, dbo.DATA0475.*'
      
        ', data0005.employee_name as  empname,data0022.EXPIRE_DATE,data00' +
        '23.abbr_name'
      'FROM         dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0475 ON dbo.Data0022.RKEY = dbo.DA' +
        'TA0475.rkey22 inner JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY inner join data0005'
      'on data0475.alloc_userptr=data0005.rkey inner join data0023 on '
      'data0456.SUPP_PTR=data0023.rkey'
      'where data0475.rkey468 =:rkey468')
    Left = 56
    Top = 152
    object ADO475rkey468: TIntegerField
      FieldName = 'rkey468'
    end
    object ADO475rkey22: TIntegerField
      FieldName = 'rkey22'
    end
    object ADO475quan_alloc: TBCDField
      DisplayLabel = #20998#37197#25968
      FieldName = 'quan_alloc'
      Precision = 10
      Size = 2
    end
    object ADO475INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO475INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO475INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO475INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO475CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO475GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO475alloc_userptr: TIntegerField
      FieldName = 'alloc_userptr'
    end
    object ADO475alloc_datetime: TDateTimeField
      FieldName = 'alloc_datetime'
    end
    object ADO475empname: TStringField
      FieldName = 'empname'
      ReadOnly = True
      Size = 16
    end
    object ADO475EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADO475abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 16
    end
  end
  object ADO22: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnFilterRecord = ADO22FilterRecord
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0022.INVENTORY_PTR, dbo.Dat' +
        'a0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_D' +
        'ESCRIPTION, '
      
        '                      dbo.Data0022.QUAN_ON_HAND, dbo.Data0022.QU' +
        'AN_TO_BE_STOCKED, dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_' +
        'TO_BE_STOCKED AS ValQty, '
      
        '                      dbo.Data0022.RKEY, dbo.Data0456.CREATE_DAT' +
        'E, dbo.Data0456.GRN_NUMBER, dbo.Data0023.SUPPLIER_NAME, dbo.Data' +
        '0016.LOCATION, '
      
        '                      dbo.Data0002.UNIT_CODE, dbo.Data0022.EXPIR' +
        'E_DATE,data0022.SUPPLIER2,data0456.supp_ptr'
      
        '                       , (case when (d391.status=2) or (d391.sta' +
        'tus is null )  then '#39#26159#39'  else '#39#21542#39'  end )  as  '#39#26159#21542#26816#39564'OK'#39' '
      'FROM         dbo.Data0016 INNER JOIN'
      '                      dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY ON dbo.Data0016.RKEY = dbo.Data0022.LOCATIO' +
        'N_PTR INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY'
      
        '                      left join data0391  d391  on data0022.rkey' +
        '391=d391.rkey'
      
        'WHERE     (dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_S' +
        'TOCKED > 0) AND (dbo.Data0022.INVENTORY_PTR =:rkey17 )  '
      'ORDER BY dbo.Data0022.EXPIRE_DATE')
    Left = 136
    Top = 88
    object ADO22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22QUAN_on_hand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_on_hand'
      Precision = 9
      Size = 3
    end
    object ADO22QUAN_TO_BE_STOCKED: TBCDField
      DisplayLabel = #24050#20998#37197#25968
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 9
      Size = 2
    end
    object ADO22ValQty: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValQty'
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object ADO22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO22GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO22SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 20
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO22LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADO22SUPPLIER2: TStringField
      DisplayLabel = #21407#20379#24212#21830#25110#25209#21495
      DisplayWidth = 10
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO22supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object ADO22OK: TStringField
      FieldName = #26159#21542#26816#39564'OK'
      ReadOnly = True
      Size = 2
    end
  end
  object DS3: TDataSource
    DataSet = ADO22
    Left = 192
    Top = 88
  end
  object ADO475_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, '
      
        '                     dbo.Data0456.CREATE_DATE, dbo.Data0456.GRN_' +
        'NUMBER, '
      '                      dbo.Data0022.INVENTORY_PTR, dbo.DATA0475.*'
      ','
      
        '   (select employee_name from data0005 where rkey=data0475.alloc' +
        '_userptr) empname'
      'FROM         dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0475 ON dbo.Data0022.RKEY = dbo.DA' +
        'TA0475.rkey22 LEFT OUTER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY'
      'where data0475.rkey468 =null')
    Left = 136
    Top = 152
    object ADO475_1rkey468: TIntegerField
      FieldName = 'rkey468'
    end
    object ADO475_1rkey22: TIntegerField
      FieldName = 'rkey22'
    end
    object ADO475_1quan_alloc: TBCDField
      DisplayLabel = #20998#37197#25968
      FieldName = 'quan_alloc'
      Precision = 10
      Size = 2
    end
    object IntegerField3: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object StringField1: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object StringField2: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO475_1CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO475_1GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO475_1alloc_userptr: TIntegerField
      FieldName = 'alloc_userptr'
    end
    object ADO475_1alloc_datetime: TDateTimeField
      FieldName = 'alloc_datetime'
    end
    object ADO475_1empname: TStringField
      FieldName = 'empname'
      ReadOnly = True
      Size = 16
    end
  end
  object DS4: TDataSource
    DataSet = ADO475_1
    Left = 192
    Top = 152
  end
end
