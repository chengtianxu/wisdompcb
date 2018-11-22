inherited find_RMA_Number_Form2: Tfind_RMA_Number_Form2
  Left = 225
  Top = 160
  Width = 397
  Height = 449
  Caption = 'find_RMA_Number_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 389
    Height = 340
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'RMA_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 368
      end>
  end
  inherited Panel1: TPanel
    Width = 389
    inherited Label1: TLabel
      Left = 16
      Caption = #36864#36135#21333#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited Panel2: TPanel
    Top = 381
    Width = 389
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx98;12'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1RMA_NUMBER: TStringField
      DisplayLabel = #36864#36135#21333#21495#30721
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
  end
end
