object DM: TDM
  OldCreateOrder = False
  Left = 434
  Top = 138
  Height = 241
  Width = 283
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=192.1' +
      '68.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object wzcx0006_1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = wzcx0006_1BeforeOpen
    AfterClose = wzcx0006_1AfterClose
    OnCalcFields = wzcx0006_1CalcFields
    ProcedureName = 'wzcx0006;1'
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
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher4'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher5'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher6'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@wher7'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = ' '
      end
      item
        Name = '@ISSUE_DATE1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '2007-1-1'
      end
      item
        Name = '@ISSUE_DATE2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '2007-1-1'
      end
      item
        Name = '@if1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 176
    Top = 72
    object wzcx0006_1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object wzcx0006_1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object wzcx0006_1WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object wzcx0006_1EMPLOYEE_NAME: TStringField
      DisplayLabel = #26356#25913#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzcx0006_1TDATE: TDateTimeField
      DisplayLabel = #26356#25913#26085#26399
      FieldName = 'TDATE'
    end
    object wzcx0006_1SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object wzcx0006_1NOTE_PAD_LINE: TStringField
      DisplayLabel = #26356#25913#20869#23481
      FieldKind = fkCalculated
      FieldName = 'NOTE_PAD_LINE'
      Size = 280
      Calculated = True
    end
    object wzcx0006_1ACTION: TSmallintField
      FieldName = 'ACTION'
    end
    object wzcx0006_1MyACTION: TStringField
      DisplayLabel = #21464#26356#31867#22411
      FieldKind = fkCalculated
      FieldName = 'MyACTION'
      Size = 15
      Calculated = True
    end
    object wzcx0006_1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object wzcx0006_1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object wzcx0006_1CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object wzcx0006_1remark: TStringField
      FieldName = 'remark'
      Size = 150
    end
  end
  object DataSource1: TDataSource
    DataSet = wzcx0006_1
    Left = 56
    Top = 72
  end
end
