object DM: TDM
  OldCreateOrder = False
  Left = 564
  Top = 220
  Height = 399
  Width = 346
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security In' +
      'fo=True;User ID=wzsp;Initial Catalog=SJ_V20_LIVE;Data Source=172' +
      '.17.0.111'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 127
    Top = 17
  end
  object DataSource1: TDataSource
    DataSet = ADO22
    Left = 24
    Top = 47
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 192
  end
  object ADO95: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0095'
      'where rkey is null')
    Left = 154
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
    Filtered = True
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
    Left = 24
    Top = 92
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
    object ADO22BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      Size = 30
    end
    object ADO22BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      Size = 30
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
    Left = 144
    Top = 248
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
    Left = 32
    Top = 176
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
        DataType = ftDateTime
        Value = 39448d
      end
      item
        Name = '@end_date'
        DataType = ftDateTime
        Value = 39813d
      end>
    Left = 32
    Top = 226
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
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOStoredProc1PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
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
    object ADOStoredProc1p_price: TFloatField
      FieldName = 'p_price'
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
    object ADOStoredProc1TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOStoredProc1EXCHANGE_RATE: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
  end
end
