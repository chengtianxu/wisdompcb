inherited FindData0008Form2: TFindData0008Form2
  Left = 276
  Top = 127
  Width = 390
  Height = 469
  BorderIcons = []
  Caption = #26597#25214#20135#21697#31867#21035
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 382
    Height = 357
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'prod_code'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 152
      end
      item
        EditButtons = <>
        FieldName = 'product_name'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  inherited Panel1: TPanel
    Width = 382
    inherited Label1: TLabel
      Left = 5
      Width = 91
      Caption = #20135#21697#31867#22411#20195#30721#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 398
    Width = 382
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;20'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOStoredProc1prod_code: TStringField
      DisplayLabel = #20851#21697#31867#22411#20195#30721
      FieldName = 'prod_code'
      Size = 10
    end
    object ADOStoredProc1product_name: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'product_name'
      Size = 30
    end
  end
end
