inherited FindData0001Form2: TFindData0001Form2
  Left = 375
  Top = 109
  Width = 446
  Height = 481
  BorderIcons = []
  Caption = #26597#25214#36135#24065
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 438
    Height = 372
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 187
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 180
      end>
  end
  inherited Panel1: TPanel
    Width = 438
    inherited Label1: TLabel
      Left = 4
      Top = 14
      Caption = #36135#24065#20195#30721#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      Left = 237
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 413
    Width = 438
    inherited Button2: TButton
      Left = 256
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;18'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStoredProc1CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOStoredProc1CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ADOStoredProc1EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOStoredProc1QTE_EXCH_RATE: TFloatField
      FieldName = 'QTE_EXCH_RATE'
    end
  end
end
