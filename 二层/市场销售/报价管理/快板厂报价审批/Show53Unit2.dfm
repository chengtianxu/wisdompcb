inherited Show53Form2: TShow53Form2
  Left = 235
  Top = 100
  Width = 421
  Height = 450
  Caption = 'Show53Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 413
    Height = 382
    Columns = <
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 156
      end>
  end
  inherited Panel2: TPanel
    Top = 382
    Width = 413
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx56;10'
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
    object ADOStoredProc1QUANTITY: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOStoredProc1MFG_DATE: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ADOStoredProc1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
  end
end
