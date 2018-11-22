object DM: TDM
  OldCreateOrder = False
  Left = 585
  Top = 204
  Height = 210
  Width = 260
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object wzcx98_1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'wzcx98;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@wher1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@wher2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@wher8'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@ISSUE_DATE1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 23
        Value = '2004-12-01 '
      end
      item
        Name = '@ISSUE_DATE2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 23
        Value = '2004-12-01 '
      end
      item
        Name = '@finished'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@so_tp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vrkey278'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 164
    Top = 72
    object wzcx98_1RMA_NUMBER: TStringField
      DisplayLabel = #36864#36135#21333#21495#30721
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object wzcx98_1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object wzcx98_1abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object wzcx98_1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object wzcx98_1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object wzcx98_1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#21035
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object wzcx98_1SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#21495#30721
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object wzcx98_1QTY_AUTH: TIntegerField
      DisplayLabel = #35745#21010#36864#22238#25968
      FieldName = 'QTY_AUTH'
    end
    object wzcx98_1QTY_RECD: TIntegerField
      DisplayLabel = #24050#25509#25910#25968
      FieldName = 'QTY_RECD'
    end
    object wzcx98_1to_be_ship: TFloatField
      DisplayLabel = #27424#36135#25968'(PCS)'
      FieldName = 'to_be_ship'
      ReadOnly = True
    end
    object wzcx98_1qty_ship: TIntegerField
      FieldName = 'qty_ship'
      ReadOnly = True
    end
    object wzcx98_1EMPLOYEE_NAME: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzcx98_1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object wzcx98_1ABBR_NAME1: TStringField
      DisplayLabel = #22806#21457#21378
      FieldName = 'ABBR_NAME1'
      Size = 10
    end
    object wzcx98_1price: TFloatField
      DisplayLabel = #21333#20215'('#26412#20301#24065')'
      FieldName = 'price'
      ReadOnly = True
    end
    object wzcx98_1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object wzcx98_1value: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'value'
      ReadOnly = True
    end
    object wzcx98_1ca: TFloatField
      DisplayLabel = #24635#38754#31215
      FieldName = 'ca'
      ReadOnly = True
    end
    object wzcx98_1MyRMA_STATUS: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MyRMA_STATUS'
      ReadOnly = True
      Size = 6
    end
    object wzcx98_1part_price: TFloatField
      DisplayLabel = #21333#20215'('#21407#24065')'
      FieldName = 'part_price'
    end
    object wzcx98_1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object wzcx98_1cw: TBCDField
      DisplayLabel = #24635#37325#37327'('#20844#26020')'
      FieldName = 'cw'
      ReadOnly = True
      Precision = 20
    end
    object wzcx98_1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 50
    end
    object wzcx98_1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object wzcx98_1ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object wzcx98_1ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
      Size = 50
    end
    object wzcx98_1ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 50
    end
    object wzcx98_1rma_type: TStringField
      DisplayLabel = #36864#36135#31867#22411
      FieldName = 'rma_type'
      ReadOnly = True
      Size = 8
    end
    object wzcx98_1RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object wzcx98_1MEMO_NUMBER: TStringField
      FieldName = 'MEMO_NUMBER'
      Size = 10
    end
    object wzcx98_1rma_amount: TFloatField
      FieldName = 'rma_amount'
      ReadOnly = True
    end
    object wzcx98_1remark: TWideStringField
      FieldName = 'remark'
      Size = 500
    end
  end
  object DataSource1: TDataSource
    DataSet = wzcx98_1
    Left = 80
    Top = 72
  end
end
