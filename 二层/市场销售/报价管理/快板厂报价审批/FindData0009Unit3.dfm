inherited FindData0009Form3: TFindData0009Form3
  Left = 345
  Top = 55
  Width = 410
  Height = 502
  BorderIcons = []
  Caption = #26597#25214#38144#21806#20195#34920
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Top = 35
    Width = 402
    Height = 399
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'REP_CODE'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 192
      end
      item
        EditButtons = <>
        FieldName = 'SALES_REP_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 171
      end>
  end
  inherited Panel1: TPanel
    Width = 402
    Height = 35
    inherited Label1: TLabel
      Left = 48
      Top = 12
      Width = 91
      Caption = #38144#21806#20195#34920#20195#30721#65306
    end
    inherited Edit1: TEdit
      Left = 155
      Top = 7
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      Left = 278
      Top = 6
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 434
    Width = 402
    inherited Button2: TButton
      Left = 248
      Top = 9
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;19'
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
    object ADOStoredProc1REP_CODE: TStringField
      DisplayLabel = #38144#21806#20195#34920#20195#30721
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADOStoredProc1SALES_REP_NAME: TStringField
      DisplayLabel = #38144#21806#20195#34920#21517#31216
      FieldName = 'SALES_REP_NAME'
    end
    object ADOStoredProc1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
