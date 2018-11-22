inherited findForm4: TfindForm4
  Left = 247
  Top = 202
  Width = 453
  Caption = 'findForm4'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 445
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_DESCRIPTION'
        Footers = <>
        Title.TitleButton = True
        Width = 294
      end>
  end
  inherited Panel1: TPanel
    Width = 445
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Width = 445
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx00;9'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOStoredProc1INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
