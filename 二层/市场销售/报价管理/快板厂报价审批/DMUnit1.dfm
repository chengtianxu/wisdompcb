object DM: TDM
  OldCreateOrder = False
  Left = 299
  Top = 202
  Height = 482
  Width = 706
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
  end
  object qwzpr85_1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = qwzpr85_1CalcFields
    ProcedureName = 'Qwzpr85;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 39083d
      end
      item
        Name = '@vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 39083d
      end
      item
        Name = '@CUST_PART_NO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = '%'
      end
      item
        Name = '@tnumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = '%'
      end
      item
        Name = '@CUST_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = '%'
      end
      item
        Name = '@CUSTOMER_PART_NUMBER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '%'
      end
      item
        Name = '@EMPLOYEE_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 16
        Value = '%'
      end>
    Left = 216
    object qwzpr85_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_1TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qwzpr85_1TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      Size = 10
    end
    object qwzpr85_1CUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object qwzpr85_1CUST_ADD1: TStringField
      DisplayLabel = #23458#25143#22320#22336
      FieldName = 'CUST_ADD1'
      Size = 100
    end
    object qwzpr85_1CUST_STATE: TStringField
      FieldName = 'CUST_STATE'
      FixedChar = True
      Size = 10
    end
    object qwzpr85_1CUST_ZIP: TStringField
      DisplayLabel = #23458#25143#37038#25919#32534#30721
      FieldName = 'CUST_ZIP'
      FixedChar = True
      Size = 10
    end
    object qwzpr85_1CUST_PHONE: TStringField
      DisplayLabel = #23458#25143#30005#35805#21495#30721
      FieldName = 'CUST_PHONE'
      FixedChar = True
      Size = 14
    end
    object qwzpr85_1CUST_FAX: TStringField
      DisplayLabel = #23458#25143#20256#30495
      FieldName = 'CUST_FAX'
      FixedChar = True
      Size = 14
    end
    object qwzpr85_1CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
      FixedChar = True
    end
    object qwzpr85_1CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      FixedChar = True
      Size = 14
    end
    object qwzpr85_1CUST_RFQ: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'CUST_RFQ'
      FixedChar = True
      Size = 10
    end
    object qwzpr85_1CUST_PTR: TIntegerField
      DisplayLabel = #23458#25143#25351#38024
      FieldName = 'CUST_PTR'
    end
    object qwzpr85_1CUST_QTE_FACTOR: TFloatField
      FieldName = 'CUST_QTE_FACTOR'
    end
    object qwzpr85_1CURR_PTR: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'CURR_PTR'
    end
    object qwzpr85_1SREP_PTR: TIntegerField
      FieldName = 'SREP_PTR'
    end
    object qwzpr85_1QBY_EMPL_PTR: TIntegerField
      DisplayLabel = #25253#20215#20154#21592
      FieldName = 'QBY_EMPL_PTR'
    end
    object qwzpr85_1PROMISE_SAMP_DATE: TDateTimeField
      FieldName = 'PROMISE_SAMP_DATE'
    end
    object qwzpr85_1PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object qwzpr85_1CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object qwzpr85_1CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object qwzpr85_1CUST_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      FieldName = 'CUST_PART_DESC'
      FixedChar = True
      Size = 200
    end
    object qwzpr85_1REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'REF_PART_NO'
    end
    object qwzpr85_1MATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object qwzpr85_1MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object qwzpr85_1CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object qwzpr85_1ENGR_ROUTE_PTR: TIntegerField
      DisplayLabel = 'DATA0346RKEY'
      FieldName = 'ENGR_ROUTE_PTR'
    end
    object qwzpr85_1PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object qwzpr85_1PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object qwzpr85_1SHIPPING_CHARGE: TFloatField
      FieldName = 'SHIPPING_CHARGE'
    end
    object qwzpr85_1QUOTE_TYPE: TSmallintField
      FieldName = 'QUOTE_TYPE'
    end
    object qwzpr85_1SALES_ORDERS_ENTERED: TSmallintField
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object qwzpr85_1EMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 128
    end
    object qwzpr85_1APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object qwzpr85_1AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object qwzpr85_1NOTE_INFO: TStringField
      FieldName = 'NOTE_INFO'
      FixedChar = True
      Size = 200
    end
    object qwzpr85_1UPANEL: TIntegerField
      FieldName = 'UPANEL'
    end
    object qwzpr85_1USHEET: TBCDField
      FieldName = 'USHEET'
      Precision = 8
      Size = 2
    end
    object qwzpr85_1QTE_USHEET: TBCDField
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object qwzpr85_1QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object qwzpr85_1QTE_UNITS: TFloatField
      FieldName = 'QTE_UNITS'
    end
    object qwzpr85_1PAYMENT: TStringField
      FieldName = 'PAYMENT'
      FixedChar = True
    end
    object qwzpr85_1SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object qwzpr85_1appd_by: TIntegerField
      FieldName = 'appd_by'
    end
    object qwzpr85_1UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object qwzpr85_1UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object qwzpr85_1TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object qwzpr85_1TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object qwzpr85_1BASE_PRICE: TFloatField
      FieldName = 'BASE_PRICE'
    end
    object qwzpr85_1QTE_CONTROL5: TStringField
      FieldName = 'QTE_CONTROL5'
      FixedChar = True
      Size = 1
    end
    object qwzpr85_1ttype2: TWordField
      FieldName = 'ttype2'
    end
    object qwzpr85_1ovhd_cost: TFloatField
      FieldName = 'ovhd_cost'
    end
    object qwzpr85_1base_pcscost: TFloatField
      FieldName = 'base_pcscost'
    end
    object qwzpr85_1total_cost: TFloatField
      FieldName = 'total_cost'
    end
    object qwzpr85_1comm_cost: TFloatField
      FieldName = 'comm_cost'
    end
    object qwzpr85_1vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object qwzpr85_1quote_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'quote_price'
    end
    object qwzpr85_1quote_taxprice: TFloatField
      DisplayLabel = #20215#26684'('#21547#31246')'
      FieldName = 'quote_taxprice'
    end
    object qwzpr85_1rej_info: TMemoField
      FieldName = 'rej_info'
      BlobType = ftMemo
    end
    object qwzpr85_1ENTER_DATE: TDateTimeField
      DisplayLabel = #20462#35746#26085#26399
      FieldName = 'ENTER_DATE'
    end
    object qwzpr85_1QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object qwzpr85_1EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object qwzpr85_1APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object qwzpr85_1CRP_EST_QUANTITY: TBCDField
      FieldName = 'CRP_EST_QUANTITY'
      Precision = 12
      Size = 6
    end
    object qwzpr85_1QuoteType: TIntegerField
      FieldName = 'QuoteType'
    end
    object qwzpr85_1MyCURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyCURR_CODE'
      LookupDataSet = qwzpr85_2
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'CURR_PTR'
      Size = 5
      Lookup = True
    end
    object qwzpr85_1MyCURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyCURR_NAME'
      LookupDataSet = qwzpr85_2
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_NAME'
      KeyFields = 'CURR_PTR'
      Lookup = True
    end
    object qwzpr85_1MyQteEMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      FieldKind = fkLookup
      FieldName = 'MyQteEMPLOYEE_NAME'
      LookupDataSet = qwzpr85_3
      LookupKeyFields = 'RKEY'
      LookupResultField = 'EMPLOYEE_NAME'
      KeyFields = 'QBY_EMPL_PTR'
      Size = 16
      Lookup = True
    end
    object qwzpr85_1MyPROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyPROD_CODE'
      LookupDataSet = qwzpr85_4
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PROD_CODE'
      KeyFields = 'PROD_CODE_PTR'
      Size = 10
      Lookup = True
    end
    object qwzpr85_1MyPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#21035#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyPRODUCT_NAME'
      LookupDataSet = qwzpr85_4
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PRODUCT_NAME'
      KeyFields = 'PROD_CODE_PTR'
      Size = 30
      Lookup = True
    end
    object qwzpr85_1MySALES_REP_NAME: TStringField
      DisplayLabel = #38144#21806#20195#34920
      FieldKind = fkLookup
      FieldName = 'MySALES_REP_NAME'
      LookupDataSet = qwzpr85_5
      LookupKeyFields = 'RKEY'
      LookupResultField = 'SALES_REP_NAME'
      KeyFields = 'SREP_PTR'
      Lookup = True
    end
    object qwzpr85_1MyCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyCUST_CODE'
      LookupDataSet = qwzpr85_6
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CUST_CODE'
      KeyFields = 'CUST_PTR'
      Size = 10
      Lookup = True
    end
    object qwzpr85_1MyCUSTOMER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'MyCUSTOMER_NAME'
      LookupDataSet = qwzpr85_6
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CUSTOMER_NAME'
      KeyFields = 'CUST_PTR'
      Size = 100
      Lookup = True
    end
    object qwzpr85_1MyType_2: TStringField
      DisplayLabel = #25253#20215#31867#22411
      FieldKind = fkCalculated
      FieldName = 'MyType_2'
      Size = 10
      Calculated = True
    end
    object qwzpr85_1MyAUDITED_STATUS: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'MyAUDITED_STATUS'
      Size = 10
      Calculated = True
    end
    object qwzpr85_1BasePricePtr: TIntegerField
      FieldName = 'BasePricePtr'
    end
  end
  object DataSource1: TDataSource
    DataSet = qwzpr85_1
    Left = 152
  end
  object qwzpr85_2: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 22
    Top = 48
    object qwzpr85_2RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_2CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object qwzpr85_2CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
  end
  object qwzpr85_3: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 100
    Top = 47
    object qwzpr85_3RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_3EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object qwzpr85_4: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 176
    Top = 45
    object qwzpr85_4RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_4PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object qwzpr85_4PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object qwzpr85_5: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;5'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 21
    Top = 94
    object qwzpr85_5RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_5REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object qwzpr85_5SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object qwzpr85_5ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object qwzpr85_6: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;6'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 101
    Top = 92
    object qwzpr85_6RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_6CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object qwzpr85_6CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object qwzpr85_6ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object qwzpr85_7: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 175
    Top = 91
    object qwzpr85_7RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_7TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qwzpr85_7MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object qwzpr85_7MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object qwzpr85_8: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforePost = qwzpr85_8BeforePost
    ProcedureName = 'Qwzpr85;8'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@RKEY346'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 117
    Top = 140
    object qwzpr85_8ROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object qwzpr85_8ADDER_NAME: TStringField
      DisplayLabel = #24037#33402#21517#31216
      FieldName = 'ADDER_NAME'
      FixedChar = True
    end
    object qwzpr85_8DEFT_SELECTED: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'DEFT_SELECTED'
    end
    object qwzpr85_8MyAmount: TFloatField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'MyAmount'
      Calculated = True
    end
    object qwzpr85_8D0348_PTR: TIntegerField
      FieldName = 'D0348_PTR'
    end
    object qwzpr85_8seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object qwzpr85_8D0346_PTR: TIntegerField
      FieldName = 'D0346_PTR'
    end
  end
  object DataSource85_8: TDataSource
    DataSet = qwzpr85_8
    Left = 30
    Top = 140
  end
  object qwzpr85_11: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;11'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 23
    Top = 241
    object qwzpr85_11RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_11PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object qwzpr85_11PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object qwzpr85_11DATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object qwzpr85_11UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
  end
  object qwzpr85_12: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;12'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 119
    Top = 241
    object qwzpr85_12RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_12TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qwzpr85_12ADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
      FixedChar = True
    end
    object qwzpr85_12SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object qwzpr85_12PCENTS: TWordField
      FieldName = 'PCENTS'
    end
    object qwzpr85_12DFT_SELECTED: TWordField
      FieldName = 'DFT_SELECTED'
    end
    object qwzpr85_12SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
    object qwzpr85_12selectit: TBooleanField
      FieldName = 'selectit'
    end
    object qwzpr85_12FORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object qwzpr85_12MIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object qwzpr85_12MAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select max(tnumber) as tnumber'
      ' from data0085')
    Left = 362
    Top = 2
    object ADOQuery3tnumber: TStringField
      FieldName = 'tnumber'
      FixedChar = True
      Size = 10
    end
  end
  object ADODate: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select vdt=current_timestamp')
    Left = 303
    Top = 4
    object ADODatevdt: TDateTimeField
      FieldName = 'vdt'
      ReadOnly = True
    end
  end
  object ADOQuery7: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0004 where rkey=32')
    Left = 304
    Top = 56
    object ADOQuery7RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery7CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOQuery7SEED_MEAN: TStringField
      FieldName = 'SEED_MEAN'
    end
    object ADOQuery7BIG5_SEED_MEAN: TStringField
      FieldName = 'BIG5_SEED_MEAN'
    end
    object ADOQuery7SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOQuery7SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
    object ADOQuery7table_name: TStringField
      FieldName = 'table_name'
      Size = 8
    end
  end
  object qwzpr85_21: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    ProcedureName = 'Qwzpr85;21'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey085'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 304
    Top = 186
    object qwzpr85_21RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_21TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qwzpr85_21ADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
    end
    object qwzpr85_21FORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object qwzpr85_21SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object qwzpr85_21PCENTS: TWordField
      FieldName = 'PCENTS'
    end
    object qwzpr85_21MIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object qwzpr85_21MAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
    object qwzpr85_21DFT_SELECTED: TWordField
      FieldName = 'DFT_SELECTED'
    end
    object qwzpr85_21SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      Size = 1
    end
    object qwzpr85_21selectit: TBooleanField
      FieldName = 'selectit'
    end
  end
  object qwzpr85_22: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;22'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 375
    Top = 185
    object qwzpr85_22RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_22ROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object qwzpr85_22ROW_VALUE: TFloatField
      FieldName = 'ROW_VALUE'
    end
  end
  object qwzpr85_23: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = qwzpr85_23CalcFields
    ProcedureName = 'Qwzpr85;23'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey085'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 295
    Top = 249
    object qwzpr85_23RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_23QTE_PTR: TIntegerField
      FieldName = 'QTE_PTR'
    end
    object qwzpr85_23SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object qwzpr85_23AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object qwzpr85_23ADDL_CAT_PTR: TIntegerField
      FieldName = 'ADDL_CAT_PTR'
    end
    object qwzpr85_23FREE_AMOUNT: TFloatField
      FieldName = 'FREE_AMOUNT'
    end
    object qwzpr85_23TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object qwzpr85_23TypeMark: TIntegerField
      FieldName = 'TypeMark'
    end
    object qwzpr85_23MyADDER_NAME: TStringField
      DisplayLabel = #24037#33402#21517#31216
      FieldKind = fkCalculated
      FieldName = 'MyADDER_NAME'
      Calculated = True
    end
  end
  object qwzpr85_24: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'Qwzpr85;24'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 295
    Top = 297
    object qwzpr85_24RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_24DATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object qwzpr85_24PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object qwzpr85_24PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object qwzpr85_24SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
  end
  object qwzpr85_25: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'Qwzpr85;25'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 383
    Top = 297
    object qwzpr85_25RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_25ENG_TABLE_NAME: TStringField
      FieldName = 'ENG_TABLE_NAME'
      Size = 10
    end
    object qwzpr85_25DATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
    end
  end
  object qwzpr85_autocal85: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'autocal85;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vcol0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ' '
      end
      item
        Name = '@vrow0'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ' '
      end
      item
        Name = '@vcol'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end
      item
        Name = '@vrow'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = 0.000000000000000000
      end>
    Left = 279
    Top = 345
    object qwzpr85_autocal85tvalue: TStringField
      FieldName = 'tvalue'
      Size = 50
    end
  end
  object qwzpr85_26: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;26'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@parameter_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 39
    Top = 321
    object qwzpr85_26rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qwzpr85_26PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object qwzpr85_26SEQUENCE_NO: TSmallintField
      FieldName = 'SEQUENCE_NO'
    end
    object qwzpr85_26TVALUE: TStringField
      FieldName = 'TVALUE'
      FixedChar = True
    end
  end
  object qwzpr85_29: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;29'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 151
    Top = 321
    object qwzpr85_29RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_29TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qwzpr85_29ADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
    end
    object qwzpr85_29FORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object qwzpr85_29SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object qwzpr85_29PCENTS: TWordField
      FieldName = 'PCENTS'
    end
    object qwzpr85_29MIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object qwzpr85_29MAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
    object qwzpr85_29DFT_SELECTED: TWordField
      FieldName = 'DFT_SELECTED'
    end
    object qwzpr85_29SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      Size = 1
    end
    object qwzpr85_29selectit: TBooleanField
      FieldName = 'selectit'
    end
  end
  object TDATA0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 104
    Top = 192
    object TDATA0493Company_Name: TStringField
      DisplayLabel = #20844#21496#21517#31216
      FieldName = 'Company_Name'
      Size = 50
    end
    object TDATA0493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object TDATA0493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object TDATA0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object TDATA0493Company_Icon: TBlobField
      DisplayLabel = #20844#21496#22270#26631
      FieldName = 'Company_Icon'
    end
    object TDATA0493SITE_INFO_ADD_1: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object TDATA0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object TDATA0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object TDATA0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource0493: TDataSource
    DataSet = TDATA0493
    Left = 32
    Top = 192
  end
  object DataSource23: TDataSource
    DataSet = qwzpr85_23
    Left = 216
    Top = 248
  end
  object ADOQPrint1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'QTE_PTR1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'QTE_PTR2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'QTE_PTR3'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'QTE_PTR4'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT TOP 1 TYPENAME='#39#24037#31243#36153#39',* FROM DATA0432'
      'WHERE TYPEMARK=1 AND QTE_PTR=:QTE_PTR1'
      'UNION SELECT TOP 1 TYPENAME='#39#21046#26495#36153#39',* FROM DATA0432'
      'WHERE TYPEMARK=2 AND QTE_PTR=:QTE_PTR2'
      'UNION SELECT TOP 1 TYPENAME='#39#33778#26519#36153#39',* FROM DATA0432'
      'WHERE TYPEMARK=3 AND QTE_PTR=:QTE_PTR3'
      'UNION SELECT TOP 1 TYPENAME='#39#27979#35797#36153#39',* FROM DATA0432'
      'WHERE TYPEMARK=4 AND QTE_PTR=:QTE_PTR4')
    Left = 40
    Top = 392
  end
  object DSADOQPrint1: TDataSource
    DataSet = ADOQPrint1
    Left = 112
    Top = 392
  end
  object ADOQPrint2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'QTE_PTR1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0348.ADDER_NAME, Data0432.*'
      'FROM Data0348 INNER JOIN'
      '      Data0432 ON Data0348.RKEY = Data0432.SOURCE_PTR'
      'WHERE TYPEMARK is null AND QTE_PTR = :QTE_PTR1')
    Left = 200
    Top = 400
  end
  object DSADOQPrint2: TDataSource
    DataSet = ADOQPrint2
    Left = 272
    Top = 400
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0004 where rkey=32')
    Left = 320
    Top = 136
    object ado04RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
    object ado04table_name: TStringField
      FieldName = 'table_name'
      Size = 8
    end
    object ado04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ado04SEED_MEAN: TStringField
      FieldName = 'SEED_MEAN'
    end
    object ado04BIG5_SEED_MEAN: TStringField
      FieldName = 'BIG5_SEED_MEAN'
    end
  end
  object DS85: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = DS85CalcFields
    CommandText = 
      'SELECT Data0085.*, Data0274.auth_flag, Data0274.auth_date,'#13#10'    ' +
      '  Data0274.ranking,'#13#10'      Data0005_1.EMPLOYEE_NAME, '#13#10#13#10'     A.' +
      'EMPLOYEE_NAME AS BackEMP'#13#10#13#10'FROM Data0085 INNER JOIN'#13#10'      Data' +
      '0274 ON Data0085.RKEY = Data0274.qte_ptr INNER JOIN'#13#10'      Data0' +
      '005 Data0005_1 ON '#13#10'      Data0085.QBY_EMPL_PTR = Data0005_1.RKE' +
      'Y LEFT OUTER JOIN'#13#10'      Data0005 A ON Data0085.APPRV_BY_PTR = A' +
      '.RKEY'#13#10'where data0085.ttype in (2,3) and (data0274.user_ptr = :r' +
      'key73 )'
    Parameters = <
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 504
    Top = 160
    object DS85RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object DS85TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object DS85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      Size = 10
    end
    object DS85CUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object DS85CUST_ADD1: TStringField
      DisplayLabel = #23458#25143#22320#22336
      FieldName = 'CUST_ADD1'
      Size = 100
    end
    object DS85cust_add2: TStringField
      FieldName = 'cust_add2'
      Size = 100
    end
    object DS85CUST_STATE: TStringField
      FieldName = 'CUST_STATE'
      Size = 10
    end
    object DS85CUST_ZIP: TStringField
      DisplayLabel = #23458#25143#37038#25919#32534#30721
      FieldName = 'CUST_ZIP'
      Size = 10
    end
    object DS85CUST_PHONE: TStringField
      DisplayLabel = #23458#25143#30005#35805#21495#30721
      FieldName = 'CUST_PHONE'
      Size = 14
    end
    object DS85CUST_FAX: TStringField
      DisplayLabel = #23458#25143#20256#30495
      FieldName = 'CUST_FAX'
      Size = 14
    end
    object DS85CUST_CONTACT: TStringField
      FieldName = 'CUST_CONTACT'
    end
    object DS85CUST_CONTACT_PHONE: TStringField
      FieldName = 'CUST_CONTACT_PHONE'
      Size = 14
    end
    object DS85CUST_RFQ: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'CUST_RFQ'
      Size = 10
    end
    object DS85CUST_PTR: TIntegerField
      DisplayLabel = #23458#25143#25351#38024
      FieldName = 'CUST_PTR'
    end
    object DS85CUST_QTE_FACTOR: TFloatField
      FieldName = 'CUST_QTE_FACTOR'
    end
    object DS85CURR_PTR: TIntegerField
      DisplayLabel = #36135#24065#25351#38024
      FieldName = 'CURR_PTR'
    end
    object DS85SREP_PTR: TIntegerField
      FieldName = 'SREP_PTR'
    end
    object DS85QBY_EMPL_PTR: TIntegerField
      DisplayLabel = #25253#20215#20154#21592
      FieldName = 'QBY_EMPL_PTR'
    end
    object DS85PROMISE_SAMP_DATE: TDateTimeField
      FieldName = 'PROMISE_SAMP_DATE'
    end
    object DS85ENTER_DATE: TDateTimeField
      DisplayLabel = #20462#35746#26085#26399
      FieldName = 'ENTER_DATE'
    end
    object DS85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object DS85PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object DS85CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object DS85CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object DS85REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'REF_PART_NO'
    end
    object DS85CUST_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      FieldName = 'CUST_PART_DESC'
      Size = 200
    end
    object DS85MATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object DS85MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object DS85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object DS85ENGR_ROUTE_PTR: TIntegerField
      FieldName = 'ENGR_ROUTE_PTR'
    end
    object DS85PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object DS85PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object DS85SHIPPING_CHARGE: TBCDField
      FieldName = 'SHIPPING_CHARGE'
      Precision = 12
      Size = 6
    end
    object DS85QUOTE_TYPE: TSmallintField
      FieldName = 'QUOTE_TYPE'
    end
    object DS85SALES_ORDERS_ENTERED: TSmallintField
      FieldName = 'SALES_ORDERS_ENTERED'
    end
    object DS85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object DS85CRP_EST_QUANTITY: TBCDField
      FieldName = 'CRP_EST_QUANTITY'
      Precision = 12
      Size = 6
    end
    object DS85EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 128
    end
    object DS85APPRV_BY_PTR: TIntegerField
      FieldName = 'APPRV_BY_PTR'
    end
    object DS85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object DS85AUDITED_STATUS: TWordField
      FieldName = 'AUDITED_STATUS'
    end
    object DS85NOTE_INFO: TStringField
      FieldName = 'NOTE_INFO'
      Size = 200
    end
    object DS85rej_info: TMemoField
      FieldName = 'rej_info'
      BlobType = ftMemo
    end
    object DS85UPANEL: TIntegerField
      FieldName = 'UPANEL'
    end
    object DS85USHEET: TBCDField
      FieldName = 'USHEET'
      Precision = 8
      Size = 2
    end
    object DS85QTE_USHEET: TBCDField
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object DS85QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object DS85QTE_UNITS: TFloatField
      FieldName = 'QTE_UNITS'
    end
    object DS85PAYMENT: TStringField
      FieldName = 'PAYMENT'
    end
    object DS85SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object DS85appd_by: TIntegerField
      FieldName = 'appd_by'
    end
    object DS85UNIT_LEN: TFloatField
      FieldName = 'UNIT_LEN'
    end
    object DS85UNIT_WTH: TFloatField
      FieldName = 'UNIT_WTH'
    end
    object DS85TUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 19
    end
    object DS85TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object DS85BASE_PRICE: TFloatField
      FieldName = 'BASE_PRICE'
    end
    object DS85QTE_CONTROL5: TStringField
      FieldName = 'QTE_CONTROL5'
      FixedChar = True
      Size = 1
    end
    object DS85ttype2: TWordField
      FieldName = 'ttype2'
    end
    object DS85ovhd_cost: TFloatField
      FieldName = 'ovhd_cost'
    end
    object DS85base_pcscost: TFloatField
      FieldName = 'base_pcscost'
    end
    object DS85total_cost: TFloatField
      FieldName = 'total_cost'
    end
    object DS85comm_cost: TFloatField
      FieldName = 'comm_cost'
    end
    object DS85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object DS85quote_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'quote_price'
    end
    object DS85quote_taxprice: TFloatField
      DisplayLabel = #20215#26684'('#21547#31246')'
      FieldName = 'quote_taxprice'
    end
    object DS85QuoteType: TIntegerField
      FieldName = 'QuoteType'
    end
    object DS85auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object DS85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object DS85BackEMP: TStringField
      DisplayLabel = #36864#22238#20154#21592
      FieldName = 'BackEMP'
      Size = 16
    end
    object DS85MyCURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyCURR_CODE'
      LookupDataSet = qwzpr85_2
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'CURR_PTR'
      Size = 5
      Lookup = True
    end
    object DS85MyCURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyCURR_NAME'
      LookupDataSet = qwzpr85_2
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_NAME'
      KeyFields = 'CURR_PTR'
      Lookup = True
    end
    object DS85MyType_2: TStringField
      DisplayLabel = #25253#20215#31867#22411
      FieldKind = fkCalculated
      FieldName = 'MyType_2'
      Size = 10
      Calculated = True
    end
    object DS85MyAUDITED_STATUS: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'MyAUDITED_STATUS'
      Size = 10
      Calculated = True
    end
    object DS85auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object DS85ranking: TWordField
      FieldName = 'ranking'
    end
  end
  object ads274: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey85'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0274.*'
      'FROM dbo.Data0274'
      'WHERE (qte_ptr =:rkey85)'
      'ORDER BY ranking')
    Left = 504
    Top = 208
    object ads274rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads274qte_ptr: TIntegerField
      FieldName = 'qte_ptr'
    end
    object ads274user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ads274auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ads274auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ads274ranking: TWordField
      FieldName = 'ranking'
    end
  end
  object Qery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 256
  end
  object DataSource2: TDataSource
    DataSet = DS85
    Left = 448
    Top = 160
  end
  object Qwzpr85_31: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'Qwzpr85;31'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 224
    Top = 168
    object Qwzpr85_31RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Qwzpr85_31UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object Qwzpr85_31UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object Qwzpr85_31myunit: TStringField
      FieldName = 'myunit'
      ReadOnly = True
      Size = 27
    end
  end
  object qwzpr85_33: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = qwzpr85_33CalcFields
    ProcedureName = 'Qwzpr85;33'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey0085'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 496
    Top = 320
    object qwzpr85_33RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qwzpr85_33QUOTE_PTR: TIntegerField
      FieldName = 'QUOTE_PTR'
    end
    object qwzpr85_33STD_INVENT_PTR: TIntegerField
      FieldName = 'STD_INVENT_PTR'
    end
    object qwzpr85_33QTY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QTY'
    end
    object qwzpr85_33price: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'price'
    end
    object qwzpr85_33D0028_PTR: TIntegerField
      FieldName = 'D0028_PTR'
    end
    object qwzpr85_33D0028_PRICE: TFloatField
      FieldName = 'D0028_PRICE'
    end
    object qwzpr85_33MyINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldKind = fkCalculated
      FieldName = 'MyINV_PART_NUMBER'
      Size = 25
      Calculated = True
    end
    object qwzpr85_33MyINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldKind = fkCalculated
      FieldName = 'MyINV_PART_DESCRIPTION'
      Size = 100
      Calculated = True
    end
  end
  object qwzpr85_34: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'qwzpr85;34'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey0017'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 520
    Top = 48
    object qwzpr85_34INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qwzpr85_34INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
