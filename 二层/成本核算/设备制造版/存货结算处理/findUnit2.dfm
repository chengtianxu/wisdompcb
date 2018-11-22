inherited findForm4: TfindForm4
  Left = 270
  Top = 165
  Width = 492
  Height = 429
  Caption = 'findForm4'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Top = 1
    Width = 484
    Height = 360
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cut_date'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 226
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CLOSED'
        Footers = <>
        Title.TitleButton = True
        Width = 126
      end>
  end
  inherited Panel1: TPanel
    Width = 484
    Height = 1
    inherited Label1: TLabel
      Caption = #25130#25968#26102#38388#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 361
    Width = 484
    inherited Button2: TButton
      Left = 272
    end
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzpr444;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 144
    Top = 128
    object ADOStoredProc1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOStoredProc1cut_date: TDateTimeField
      DisplayLabel = #25130#25968#26102#38388
      FieldName = 'cut_date'
    end
    object ADOStoredProc1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25130#25968#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOStoredProc1CLOSED: TStringField
      DisplayLabel = #26159#21542#21322#38381
      FieldName = 'CLOSED'
      FixedChar = True
      Size = 1
    end
  end
end
