inherited Show58Form2: TShow58Form2
  Left = 187
  Top = 101
  Width = 697
  Height = 461
  Caption = 'Show58Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 689
    Height = 390
    Columns = <
      item
        EditButtons = <>
        FieldName = 'REJECT_DESCRIPTION'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'resp_dept_name'
        Footers = <>
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'QTY_REJECT'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PANELS'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'TDATETIME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  inherited Panel2: TPanel
    Top = 390
    Width = 689
    inherited Button1: TButton
      Left = 248
    end
  end
  inherited DataSource1: TDataSource
    Left = 48
    Top = 320
  end
  inherited ADOStoredProc1: TADOStoredProc
    Active = True
    CursorType = ctStatic
    ProcedureName = 'wzcx56;9'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@WO_PTR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 88
    Top = 280
    object ADOStoredProc1REJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#25551#36848
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOStoredProc1DEPT_NAME: TStringField
      DisplayLabel = #30003#35831#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOStoredProc1resp_dept_name: TStringField
      DisplayLabel = #36131#20219#37096#38376
      FieldName = 'resp_dept_name'
      Size = 30
    end
    object ADOStoredProc1TDATETIME: TDateTimeField
      DisplayLabel = #25253#24223#26085#26399
      FieldName = 'TDATETIME'
    end
    object ADOStoredProc1QTY_REJECT: TFloatField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QTY_REJECT'
    end
    object ADOStoredProc1PANELS: TIntegerField
      DisplayLabel = 'PNL'#25968#37327
      FieldName = 'PANELS'
    end
    object ADOStoredProc1EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
end
