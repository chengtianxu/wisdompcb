object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 264
    Top = 88
  end
  object DS1: TDataSource
    DataSet = ADO221
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO222
    Left = 8
    Top = 155
  end
  object ADO221: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO221AfterScroll
    AfterScroll = ADO221AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select  data0221.*, d5_1.employee_name InMan,d5_2.employee_name ' +
        'auMan,  '
      'case data0221.type when 1 then '#39#24211#25151#20986#20179#39
      '              when    2 then '#39#24453#30952#20179#20986#20179#39
      '              when   3 then '#39#38075#26426#20986#20179#39
      '              when    5 then '#39#25253#24223#20179#20986#20179#39'  end type_C,'
      'case data0221.status when 0 then '#39#24453#25552#20132#39
      '              when    1 then '#39#24453#23457#26680#39
      '               when   2 then '#39#24050#23457#26680#39
      '                when  3 then '#39#34987#36864#22238#39'  end status_C'
      'from data0221'
      'inner join data0005 d5_1 on  data0221.empl_ptr=d5_1.rkey'
      'left join data0005 d5_2 on  data0221.auth_empl_ptr=d5_2.rkey')
    Left = 56
    Top = 88
    object ADO221rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO221number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 10
    end
    object ADO221type: TWordField
      FieldName = 'type'
    end
    object ADO221status: TWordField
      FieldName = 'status'
    end
    object ADO221empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO221sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object ADO221quantity: TIntegerField
      DisplayLabel = #20986#20179#24635#25968
      FieldName = 'quantity'
    end
    object ADO221auth_empl_ptr: TIntegerField
      FieldName = 'auth_empl_ptr'
    end
    object ADO221auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADO221reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
    object ADO221InMan: TStringField
      DisplayLabel = #20986#20179#21592
      FieldName = 'InMan'
      Size = 16
    end
    object ADO221auMan: TStringField
      DisplayLabel = #23457#26680#21592
      FieldName = 'auMan'
      Size = 16
    end
    object ADO221type_C: TStringField
      DisplayLabel = #31867#21035
      DisplayWidth = 10
      FieldName = 'type_C'
      ReadOnly = True
      Size = 12
    end
    object ADO221status_C: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_C'
      ReadOnly = True
      Size = 6
    end
  end
  object ADO222: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey221'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0222.head_ptr, dbo.DATA0222.bach_ptr, dbo.DAT' +
        'A0222.quantity, dbo.DATA0222.reference, dbo.DATA0220.INVENTORY_P' +
        'TR, '
      
        '                      dbo.DATA0220.SUPPLIER_PTR, dbo.DATA0220.LO' +
        'CATION_PTR, dbo.DATA0220.OH_degree, dbo.DATA0220.QUAN_ALLOC, dbo' +
        '.DATA0220.REMARK, '
      
        '                      dbo.DATA0160.LOCATION_CODE, dbo.DATA0160.L' +
        'OCATION_NAME, dbo.DATA0160.TYPE, dbo.Data0017.INV_PART_NUMBER, '
      
        '                      dbo.Data0017.INV_PART_DESCRIPTION,dbo.DATA' +
        '0220.quan_on_hand'
      'FROM         dbo.DATA0222 INNER JOIN'
      
        '                      dbo.DATA0220 ON dbo.DATA0222.bach_ptr = db' +
        'o.DATA0220.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0220.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR ' +
        '= dbo.DATA0160.RKEY'
      'where dbo.DATA0222.head_ptr=:rkey221')
    Left = 56
    Top = 152
    object ADO222head_ptr: TIntegerField
      FieldName = 'head_ptr'
    end
    object ADO222bach_ptr: TIntegerField
      FieldName = 'bach_ptr'
    end
    object ADO222quantity: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
    end
    object ADO222reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object ADO222INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO222SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO222LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO222OH_degree: TWordField
      DisplayLabel = #30740#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ADO222QUAN_ALLOC: TIntegerField
      FieldName = 'QUAN_ALLOC'
    end
    object ADO222REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO222LOCATION_CODE: TStringField
      DisplayLabel = #20179#20301#20195#30721
      FieldName = 'LOCATION_CODE'
      Size = 10
    end
    object ADO222LOCATION_NAME: TStringField
      DisplayLabel = #20179#20301#21517#31216
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ADO222TYPE: TWordField
      FieldName = 'TYPE'
    end
    object ADO222INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#22068#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO222INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #38075#22068#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO222quan_on_hand: TIntegerField
      FieldName = 'quan_on_hand'
    end
  end
  object ADO221_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADO221AfterScroll
    AfterScroll = ADO221AfterScroll
    Parameters = <
      item
        Name = 'rkey221'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0221 where rkey=:rkey221'
      ''
      '')
    Left = 128
    Top = 88
  end
  object ADO222_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey221'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0222 where head_ptr=:rkey221')
    Left = 128
    Top = 152
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
      '                              when 5 then '#39#25253#24223#20179#39'  end  Type_c'
      
        'from data0160 inner join data0220 on data0160.rkey=data0220.loca' +
        'tion_ptr inner join data0017 on data0220.inventory_ptr=data0017.' +
        'rkey'
      'inner join data0219 on data0220.grn_ptr=data0219.rkey'
      
        'where data0160.rkey=:location_ptr220 and data0220.quan_on_hand-d' +
        'ata0220.quan_alloc>0')
    Left = 16
    Top = 232
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
      DisplayLabel = #20179#24211#31867#21035
      FieldName = 'Type_c'
      ReadOnly = True
      Size = 8
    end
  end
end
