inherited find_SALES_ORDER_Form2: Tfind_SALES_ORDER_Form2
  Left = 203
  Top = 165
  Width = 385
  Height = 472
  Caption = 'find_SALES_ORDER_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 377
    Height = 363
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.Alignment = taCenter
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 357
      end>
  end
  inherited Panel1: TPanel
    Width = 377
    inherited Label1: TLabel
      Left = 1
      Width = 72
      Caption = '  '#35746#21333#21495#30721#65306'  '
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 404
    Width = 377
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx98;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#21495#30721
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
  end
end
