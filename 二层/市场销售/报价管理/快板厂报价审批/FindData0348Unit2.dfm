inherited FindData0348Form2: TFindData0348Form2
  Left = 486
  Top = 195
  Height = 444
  Caption = #26597#25214#24037#33402#21517#31216
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Height = 332
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ADDER_NAME'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 317
      end>
  end
  inherited Panel1: TPanel
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 373
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;35'
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
    object ADOStoredProc1TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOStoredProc1ADDER_NAME: TStringField
      DisplayLabel = #29305#21035#24037#33402#21517#31216
      FieldName = 'ADDER_NAME'
    end
    object ADOStoredProc1FORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object ADOStoredProc1SELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object ADOStoredProc1PCENTS: TWordField
      FieldName = 'PCENTS'
    end
    object ADOStoredProc1MIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object ADOStoredProc1MAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
    object ADOStoredProc1DFT_SELECTED: TWordField
      FieldName = 'DFT_SELECTED'
    end
    object ADOStoredProc1SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
    object ADOStoredProc1selectit: TBooleanField
      FieldName = 'selectit'
    end
  end
end
