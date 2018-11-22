inherited FindDATA0050Form2: TFindDATA0050Form2
  Left = 203
  Top = 90
  Width = 582
  Height = 479
  BorderIcons = []
  Caption = #26597#25214#25253#20215#20135#21697#22411#21495
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Top = 55
    Width = 574
    Height = 353
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  inherited Panel1: TPanel
    Width = 574
    Height = 55
    inherited Label1: TLabel
      Caption = #26412#21378#32534#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      Left = 237
      OnClick = BitBtn1Click
    end
    object RadioGroup1: TRadioGroup
      Left = 280
      Top = 1
      Width = 217
      Height = 52
      Caption = #31867#21035
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25209#37327#22411#21495
        #26679#26495#22411#21495
        #25253#20215#22411#21495)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  inherited Panel2: TPanel
    Top = 408
    Width = 574
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;14'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@TTYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end>
    object ADOStoredProc1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOStoredProc1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOStoredProc1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOStoredProc1MANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
end
