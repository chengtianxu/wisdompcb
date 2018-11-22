inherited Show48Form2: TShow48Form2
  Left = 228
  Top = 95
  Width = 561
  Height = 445
  Caption = 'Show48Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 553
    Height = 377
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dptname'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'INTIME'
        Footers = <>
        Title.TitleButton = True
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'OUTTIME'
        Footers = <>
        Title.TitleButton = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'QTY_PROD'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'QTY_REJECT'
        Footers = <>
        Title.TitleButton = True
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 52
      end>
  end
  inherited Panel2: TPanel
    Top = 377
    Width = 553
    inherited Button1: TButton
      Left = 248
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx56;11'
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
    object ADOStoredProc1dptname: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'dptname'
      Size = 30
    end
    object ADOStoredProc1DEPT_NAME: TStringField
      DisplayLabel = #24037#20316#20013#24515
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOStoredProc1INTIME: TDateTimeField
      DisplayLabel = #25910#26495#26102#38388
      FieldName = 'INTIME'
    end
    object ADOStoredProc1OUTTIME: TDateTimeField
      DisplayLabel = #36865#26495#26102#38388
      FieldName = 'OUTTIME'
    end
    object ADOStoredProc1QTY_PROD: TIntegerField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'QTY_PROD'
    end
    object ADOStoredProc1QTY_REJECT: TFloatField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QTY_REJECT'
      ReadOnly = True
    end
    object ADOStoredProc1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25509#25910#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
end
