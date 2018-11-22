inherited find_CUSTOMER_PART_DESC_Form2: Tfind_CUSTOMER_PART_DESC_Form2
  Left = 277
  Top = 172
  Width = 368
  Height = 413
  Caption = 'find_CUSTOMER_PART_DESC_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 360
    Height = 304
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 341
      end>
  end
  inherited Panel1: TPanel
    Width = 360
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited Panel2: TPanel
    Top = 345
    Width = 360
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx98;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
end
