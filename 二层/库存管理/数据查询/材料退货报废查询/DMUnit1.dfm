object DM: TDM
  OldCreateOrder = False
  Left = 537
  Top = 134
  Height = 252
  Width = 283
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object wzcx96_1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'wzcx96;1'
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
        Value = '2006-1-1'
      end
      item
        Name = '@ISSUE_DATE2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = '2006-1-1'
      end
      item
        Name = '@if1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@if2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 136
    Top = 72
    object wzcx96_1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object wzcx96_1INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object wzcx96_1REJECT_DESCRIPTION: TStringField
      DisplayLabel = #21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object wzcx96_1TDATE: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'TDATE'
    end
    object wzcx96_1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzcx96_1QUAN_REJD: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_REJD'
    end
    object wzcx96_1ttype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'ttype'
      Size = 4
    end
    object wzcx96_1PRICE: TBCDField
      FieldName = 'PRICE'
      ReadOnly = True
      Precision = 15
      Size = 6
    end
    object wzcx96_1FLAG: TIntegerField
      FieldName = 'FLAG'
      ReadOnly = True
    end
    object wzcx96_1abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 16
    end
    object wzcx96_1exch_rate: TBCDField
      FieldName = 'exch_rate'
      ReadOnly = True
      Precision = 12
      Size = 8
    end
    object wzcx96_1curr_name: TStringField
      FieldName = 'curr_name'
      ReadOnly = True
    end
    object wzcx96_1GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object wzcx96_1CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
      ReadOnly = True
    end
    object wzcx96_1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = wzcx96_1
    Left = 80
    Top = 72
  end
end
