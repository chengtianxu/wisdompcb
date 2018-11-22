object DM: TDM
  OldCreateOrder = False
  Left = 572
  Top = 234
  Height = 386
  Width = 476
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADO160: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'location_ptr220'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0219.grn_number,data0219.create_date,data0160.locatio' +
        'n_code,data0160.location_name,'
      'data0017.INV_PART_NUMBER, data0017.inv_part_description,'
      
        '(data0220.quan_on_hand-data0220.quan_alloc)  Quan_valid,data0160' +
        '.oh_degree,'
      ''
      
        ' data0017.RKEY rkey17, data0160.rkey rkey160,data0220.rkey rkey2' +
        '20,data0160.type,data0220.supplier_ptr,'
      'case data0160.type when 1 then '#39#24211#25151#39' '
      '                                when 2 then '#39#24453#30740#30952#20179#39'    '
      '                               when 3 then '#39#26426#22120#39' '
      '                                when 4 then '#39#30740#30952#21830#39' '
      '                              when 5 then '#39#25253#24223#20179#39'  end  Type_c,'
      'data0220.remark'
      
        'from data0160 inner join data0220 on data0160.rkey=data0220.loca' +
        'tion_ptr inner join data0017 on data0220.inventory_ptr=data0017.' +
        'rkey'
      'inner join data0219 on data0220.grn_ptr=data0219.rkey'
      
        'where data0160.rkey=:location_ptr220 and data0220.quan_on_hand-d' +
        'ata0220.quan_alloc>0'
      
        'dbo.data0160.oh_degree,dbo.data0219.create_date,data0220.quan_on' +
        '_hand')
    Left = 40
    Top = 88
    object ADO160location_code: TStringField
      DisplayLabel = #20301#32622#20195#30721
      FieldName = 'location_code'
      Size = 10
    end
    object ADO160location_name: TStringField
      DisplayLabel = #20301#32622#21517#31216
      FieldName = 'location_name'
      Size = 50
    end
    object ADO160INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#22068#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO160inv_part_description: TStringField
      DisplayLabel = #38075#22068#21517#31216
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADO160Quan_valid: TIntegerField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'Quan_valid'
    end
    object ADO160oh_degree: TWordField
      DisplayLabel = #30740#30952#27425#25968
      FieldName = 'oh_degree'
    end
    object ADO160rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object ADO160rkey160: TAutoIncField
      FieldName = 'rkey160'
      ReadOnly = True
    end
    object ADO160rkey220: TAutoIncField
      FieldName = 'rkey220'
      ReadOnly = True
    end
    object ADO160type: TWordField
      FieldName = 'type'
    end
    object ADO160supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object ADO160grn_number: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'grn_number'
      Size = 10
    end
    object ADO160create_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'create_date'
    end
    object ADO160Type_c: TStringField
      DisplayLabel = #20179#24211#31867#22411
      FieldName = 'Type_c'
      ReadOnly = True
      Size = 8
    end
    object ADO160remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
  end
  object ADO219: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0219 where rkey is null')
    Left = 40
    Top = 144
    object ADO219RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO219GRN_NUMBER: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO219CREATE_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO219SYSTEM_DATE: TDateTimeField
      FieldName = 'SYSTEM_DATE'
    end
    object ADO219TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO219location_fromptr: TIntegerField
      FieldName = 'location_fromptr'
    end
    object ADO219location_endptr: TIntegerField
      FieldName = 'location_endptr'
    end
    object ADO219CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO219handle_name: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'handle_name'
      Size = 50
    end
    object ADO219REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
  end
  object ADO220: TADOQuery
    Connection = ADOCon
    Parameters = <>
    SQL.Strings = (
      'select * from data0220 where rkey is null')
    Left = 40
    Top = 208
  end
  object ADO270: TADOQuery
    Connection = ADOCon
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0270 where rkey is null')
    Left = 40
    Top = 264
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 328
    Top = 40
  end
  object DS219: TDataSource
    DataSet = ADO219
    Left = 96
    Top = 144
  end
  object DS160: TDataSource
    DataSet = CDS160
    Left = 200
    Top = 88
  end
  object PR160: TDataSetProvider
    DataSet = ADO160
    Left = 88
    Top = 88
  end
  object CDS160: TClientDataSet
    Aggregates = <>
    Filter = 'Quan_valid>0'
    Filtered = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 88
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 376
    Top = 40
  end
  object ADO219_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO219_1AfterScroll
    AfterScroll = ADO219_1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select data0219.*,(case data0219.ttype when 1 then '#39#24211#25151#21040#38075#26426#39
      '                    when 2 then '#39#38075#26426#21040#24211#25151#39
      '                    when 3 then '#39#24453#30952#21040#30740#30952#21830#39
      '                    when 4 then '#39#30740#30952#21830#21040#24211#25151#39' end) ttype_c,'
      
        '               (select top 1 location_code  from data0160 where ' +
        'rkey='
      
        '       (case when data0219.location_fromptr is null then data021' +
        '9.location_endptr else data0219.location_fromptr end)) location_' +
        'code,'
      'data0005.employee_name'
      
        ' from data0219 inner join data0005 on data0219.create_by=data000' +
        '5.rkey')
    Left = 144
    Top = 216
    object ADO219_1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO219_1GRN_NUMBER: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO219_1CREATE_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO219_1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO219_1location_fromptr: TIntegerField
      FieldName = 'location_fromptr'
    end
    object ADO219_1location_endptr: TIntegerField
      FieldName = 'location_endptr'
    end
    object ADO219_1CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO219_1handle_name: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'handle_name'
      Size = 50
    end
    object ADO219_1REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO219_1ttype_c: TStringField
      DisplayLabel = #25910#21457#31867#21035
      FieldName = 'ttype_c'
      ReadOnly = True
      Size = 12
    end
    object ADO219_1location_code: TStringField
      DisplayLabel = #38075#26426'/'#30740#30952#21830#20195#30721
      FieldName = 'location_code'
      ReadOnly = True
      OnGetText = ADO219_1location_codeGetText
      Size = 10
    end
    object ADO219_1employee_name: TStringField
      DisplayLabel = #24314#31435#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object ADO220_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'grn_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select sum(data0220.QUANTITY) QUANTITY ,data0220.OH_degree,data0' +
        '220.REMARK,data0017.inv_part_number,data0023.abbr_name,data0160.' +
        'location_code '
      
        'from data0220 inner join data0017 on data0220.inventory_ptr=data' +
        '0017.rkey'
      
        'left join data0023 on data0220.supplier_ptr=data0023.rkey inner ' +
        'join data0160 on'
      
        'data0220.location_ptr=data0160.rkey where data0220.grn_ptr=:grn_' +
        'ptr'
      
        'group by data0017.inv_part_number,data0023.abbr_name,data0160.lo' +
        'cation_code ,data0220.OH_degree,data0220.REMARK'
      'order by data0017.inv_part_number'
      '')
    Left = 224
    Top = 216
    object ADO220_1inv_part_number: TStringField
      DisplayLabel = #38075#22068#32534#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO220_1OH_degree: TWordField
      DisplayLabel = #30740#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ADO220_1QUANTITY: TIntegerField
      DisplayLabel = #25910#21457#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO220_1REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO220_1abbr_name: TStringField
      DisplayLabel = #38144#21806#20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO220_1location_code: TStringField
      DisplayLabel = #20179#20301#20195#30721
      FieldName = 'location_code'
      OnGetText = ADO220_1location_codeGetText
      Size = 10
    end
  end
  object DS219_1: TDataSource
    DataSet = ADO219_1
    Left = 144
    Top = 272
  end
  object DS220_1: TDataSource
    DataSet = ADO220_1
    Left = 224
    Top = 272
  end
  object ADO219_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    AfterOpen = ADO219_2AfterScroll
    AfterScroll = ADO219_2AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select distinct data0219.*,(case data0219.ttype when 1 then '#39#24211#25151#21040 +
        #38075#26426#39' when 2 then '#39#38075#26426#21040#24211#25151#39'  when 3 then '#39#24453#30952#21040#30740#30952#21830#39
      
        'when 4 then '#39#30740#30952#21830#21040#24211#25151#39' end) ttype_c, (select top 1 location_code  ' +
        'from data0160 where rkey='
      
        '(case when data0219.location_fromptr is null then data0219.locat' +
        'ion_endptr else data0219.location_fromptr end)) location_code,'
      'data0005.employee_name '
      
        'from data0219 inner join data0005 on data0219.create_by=data0005' +
        '.rkey'
      'inner join data0220 on data0219.rkey=data0220.GRN_PTR'
      'inner join data0160 on data0220.location_ptr=data0160.rkey')
    Left = 328
    Top = 112
    object ADO219_2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO219_2GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO219_2CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO219_2SYSTEM_DATE: TDateTimeField
      FieldName = 'SYSTEM_DATE'
    end
    object ADO219_2TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO219_2location_fromptr: TIntegerField
      FieldName = 'location_fromptr'
    end
    object ADO219_2location_endptr: TIntegerField
      FieldName = 'location_endptr'
    end
    object ADO219_2CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO219_2handle_name: TStringField
      FieldName = 'handle_name'
      Size = 50
    end
    object ADO219_2REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO219_2ttype_c: TStringField
      FieldName = 'ttype_c'
      ReadOnly = True
      Size = 12
    end
    object ADO219_2location_code: TStringField
      FieldName = 'location_code'
      ReadOnly = True
      Size = 10
    end
    object ADO219_2employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object ADO220_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'grn_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select sum(data0220.QUANTITY) QUANTITY ,data0220.OH_degree,data0' +
        '220.REMARK,data0017.inv_part_number,data0023.abbr_name,data0160.' +
        'location_Name '
      
        'from data0220 inner join data0017 on data0220.inventory_ptr=data' +
        '0017.rkey'
      
        'left join data0023 on data0220.supplier_ptr=data0023.rkey inner ' +
        'join data0160 on'
      
        'data0220.location_ptr=data0160.rkey where data0220.grn_ptr=:grn_' +
        'ptr'
      
        'group by data0017.inv_part_number,data0023.abbr_name,data0160.lo' +
        'cation_Name ,data0220.OH_degree,data0220.REMARK'
      'order by data0017.inv_part_number')
    Left = 392
    Top = 112
    object ADO220_2QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADO220_2OH_degree: TWordField
      FieldName = 'OH_degree'
    end
    object ADO220_2REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO220_2inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO220_2abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 16
    end
    object ADO220_2location_Name: TStringField
      FieldName = 'location_Name'
      Size = 50
    end
  end
  object DS219_2: TDataSource
    DataSet = ADO219_2
    Left = 328
    Top = 160
  end
  object DS220_2: TDataSource
    DataSet = ADO220_2
    Left = 392
    Top = 160
  end
  object dp160: TDataSetProvider
    DataSet = ADO160
    Left = 88
    Top = 40
  end
  object cds160a: TClientDataSet
    Aggregates = <>
    Filter = 'Quan_valid>0'
    Filtered = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 40
  end
end
