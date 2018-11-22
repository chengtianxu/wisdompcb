object DM: TDM
  OldCreateOrder = False
  Left = 547
  Top = 220
  Height = 399
  Width = 363
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 39
    Top = 9
  end
  object DS1: TDataSource
    DataSet = ADO22
    OnDataChange = DS1DataChange
    Left = 24
    Top = 77
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 200
  end
  object ADO95: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0095'
      'where rkey is null')
    Left = 152
    Top = 83
  end
  object ADO210: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0210 where rkey is null')
    Left = 224
    Top = 83
    object ADO210RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO210INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO210PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADO210D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ADO210D0235_PTR: TIntegerField
      FieldName = 'D0235_PTR'
    end
    object ADO210QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO210TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO210DEBIT_MEMO_PTR: TIntegerField
      FieldName = 'DEBIT_MEMO_PTR'
    end
    object ADO210empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO210type: TWordField
      FieldName = 'type'
    end
  end
  object aq0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 152
    Top = 136
    object aq0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq0493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object aq0493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object aq0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ADO22: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'ep029;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 80
    Top = 76
    object ADO22rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO22source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ADO22inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object ADO22inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO22inv_part_description: TStringField
      DisplayLabel = #26448#26009#21517#31216#35268#26684
      FieldName = 'inv_part_description'
      Size = 100
    end
    object ADO22code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADO22supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 40
    end
    object ADO22CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADO22BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADO22warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO22warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 30
    end
    object ADO22quan_to_be_shipped: TFloatField
      FieldName = 'quan_to_be_shipped'
    end
    object ADO22quan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object ADO22quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADO22price: TFloatField
      FieldName = 'price'
    end
    object ADO22ship_date: TDateTimeField
      FieldName = 'ship_date'
    end
    object ADO22ttype: TWordField
      FieldName = 'ttype'
    end
    object ADO22barcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 50
    end
    object ADO22unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADO22rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO22SUPPLIER2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object ADO22quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
  end
  object ADO2211: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 22
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 208
    object ADO2211NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO2211NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO2211NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO2211NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOStoredProc1
    Left = 25
    Top = 138
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'ep029;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@star_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@end_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 28
    Top = 188
    object ADOStoredProc1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADOStoredProc1SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADOStoredProc1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOStoredProc1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object ADOStoredProc1EMPLOYEE_NAME: TStringField
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOStoredProc1PRICE: TFloatField
      DisplayLabel = #21547#31246#20215'('#21407#24065')'
      FieldName = 'PRICE'
    end
    object ADOStoredProc1tran_date: TDateTimeField
      FieldName = 'tran_date'
    end
    object ADOStoredProc1REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADOStoredProc1rece_quan: TFloatField
      FieldName = 'rece_quan'
    end
    object ADOStoredProc1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADOStoredProc1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOStoredProc1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOStoredProc1BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADOStoredProc1QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADOStoredProc1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object ADOStoredProc1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ADOStoredProc1conversion_factor: TFloatField
      FieldName = 'conversion_factor'
    end
    object ADOStoredProc1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOStoredProc1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOStoredProc1TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOStoredProc1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOStoredProc1code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADOStoredProc1rkey95: TIntegerField
      FieldName = 'rkey95'
      ReadOnly = True
    end
    object ADOStoredProc1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOStoredProc1exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADOStoredProc1tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADOStoredProc1no_tax_price: TBCDField
      FieldName = 'no_tax_price'
      Precision = 15
      Size = 6
    end
    object ADOStoredProc1tax_amount: TFloatField
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object ADOStoredProc1no_tax_amount: TFloatField
      FieldName = 'no_tax_amount'
      ReadOnly = True
    end
  end
  object DS2: TDataSource
    DataSet = ADO96
    Left = 24
    Top = 272
  end
  object ADO96: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select d96.*,d76.reject_description,d73.employee_name as user_fu' +
        'll_name from data0096 d96 left join data0076 d76 '
      'on d96.rej_ptr=d76.rkey left join data0005 d73 on '
      'd96.EMPL_PTR=d73.rkey'
      
        ' where inv_tran_ptr=:rkey and isnull(d96.status,0)=0 and  d96.fl' +
        'ag=2')
    Left = 80
    Top = 272
    object ADO96RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO96INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO96REJ_PTR: TIntegerField
      FieldName = 'REJ_PTR'
    end
    object ADO96INV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADO96EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO96USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO96TDATE: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'TDATE'
    end
    object ADO96QUAN_REJD: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUAN_REJD'
    end
    object ADO96FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO96REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO96status: TWordField
      FieldName = 'status'
    end
    object ADO96reject_description: TStringField
      DisplayLabel = #36864#36135#21407#22240
      FieldName = 'reject_description'
      Size = 30
    end
    object ADO96user_full_name: TStringField
      DisplayLabel = #25351#27966#20154
      FieldName = 'user_full_name'
      Size = 30
    end
  end
end
