inherited Find_WareHouse_Code_Form2: TFind_WareHouse_Code_Form2
  Height = 428
  Caption = 'Find_WareHouse_Code_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Height = 319
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#21378#20195#30721
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#21378#31616#31216
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_NAME'
        Footers = <>
        Title.Caption = #24037#21378#21517#31216
      end>
  end
  inherited Panel1: TPanel
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited Panel2: TPanel
    Top = 360
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx98;13'
    Left = 124
    Top = 128
    object ADOStoredProc1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStoredProc1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOStoredProc1WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADOStoredProc1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
