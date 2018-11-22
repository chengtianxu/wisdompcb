inherited find_CUSTOMER_PART_NUMBER_Form2: Tfind_CUSTOMER_PART_NUMBER_Form2
  Left = 271
  Top = 167
  Width = 371
  Height = 430
  Caption = 'find_CUSTOMER_PART_NUMBER_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 363
    Height = 321
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 321
      end>
  end
  inherited Panel1: TPanel
    Width = 363
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited Panel2: TPanel
    Top = 362
    Width = 363
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx98;6'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Top = 200
    object ADOStoredProc1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
  end
end
