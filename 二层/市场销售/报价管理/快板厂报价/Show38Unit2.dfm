inherited Show38Form2: TShow38Form2
  Left = 190
  Top = 82
  Width = 502
  Height = 496
  Caption = 'Show38Form2'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 270
    Width = 494
    Height = 2
    Cursor = crVSplit
    Align = alBottom
  end
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 494
    Height = 270
    Columns = <
      item
        EditButtons = <>
        FieldName = 'STEP_NUMBER'
        Footers = <>
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Width = 159
      end
      item
        EditButtons = <>
        FieldName = 'dptname'
        Footers = <>
        Width = 195
      end
      item
        EditButtons = <>
        FieldName = 'tooling_rev'
        Footers = <>
      end>
  end
  inherited Panel2: TPanel
    Top = 440
    Width = 494
    Height = 29
    inherited Button1: TButton
      Left = 200
      Top = 4
    end
  end
  object DBGridEh1: TDBGridEh [3]
    Left = 0
    Top = 272
    Width = 494
    Height = 168
    Align = alBottom
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = Temp_DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PARAMETER_NAME'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_DESC'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_VALUE'
        Footers = <>
        Width = 129
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_CODE'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 67
      end>
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 104
    Top = 192
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx56;12'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@FLOW_NO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@bom_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1STEP_NUMBER: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'STEP_NUMBER'
    end
    object ADOStoredProc1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOStoredProc1dptname: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'dptname'
      Size = 30
    end
    object ADOStoredProc1tooling_rev: TStringField
      DisplayLabel = #24037#20855#29256#26412
      FieldName = 'tooling_rev'
      FixedChar = True
      Size = 10
    end
    object ADOStoredProc1rkey38: TIntegerField
      FieldName = 'rkey38'
      ReadOnly = True
    end
  end
  object ADOStoredProc2: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx56;13'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@STEP_NUMBER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey38'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 104
    Top = 328
    object ADOStoredProc2STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADOStoredProc2DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOStoredProc2DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOStoredProc2PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ADOStoredProc2PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ADOStoredProc2PARAMETER_VALUE: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'PARAMETER_VALUE'
      ReadOnly = True
      Size = 30
    end
    object ADOStoredProc2UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOStoredProc2UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
    end
    object ADOStoredProc2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOStoredProc2
    Left = 72
    Top = 328
  end
end
