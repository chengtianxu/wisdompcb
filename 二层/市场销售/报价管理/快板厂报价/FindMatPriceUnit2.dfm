inherited FindMatPriceForm2: TFindMatPriceForm2
  Left = 253
  Top = 146
  Width = 818
  Height = 496
  Caption = #26597#25214#26448#26009#20215#26684
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 810
    Height = 384
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Width = 139
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'price2'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'QTE_BASE_TO_OTHER'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Width = 51
      end>
  end
  inherited Panel1: TPanel
    Width = 810
    inherited Label1: TLabel
      Left = 227
      Top = 15
      Width = 78
      Caption = #20379#24212#21830#20195#30721#65306
    end
    inherited Edit1: TEdit
      Left = 306
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      Left = 453
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 425
    Width = 810
    inherited Button1: TButton
      Left = 152
    end
    inherited Button2: TButton
      Left = 496
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;32'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADOStoredProc1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOStoredProc1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOStoredProc1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOStoredProc1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOStoredProc1QTE_PRICE1: TFloatField
      FieldName = 'QTE_PRICE1'
    end
    object ADOStoredProc1price1: TFloatField
      FieldName = 'price1'
      ReadOnly = True
    end
    object ADOStoredProc1price2: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'price2'
      ReadOnly = True
    end
    object ADOStoredProc1TDATE: TDateTimeField
      DisplayLabel = #20462#25913#26085#26399
      FieldName = 'TDATE'
    end
    object ADOStoredProc1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStoredProc1d0017_rkey: TIntegerField
      FieldName = 'd0017_rkey'
      ReadOnly = True
    end
    object ADOStoredProc1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOStoredProc1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOStoredProc1QTE_BASE_TO_OTHER: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'QTE_BASE_TO_OTHER'
    end
    object ADOStoredProc1qte_price2: TFloatField
      FieldName = 'qte_price2'
    end
  end
end
