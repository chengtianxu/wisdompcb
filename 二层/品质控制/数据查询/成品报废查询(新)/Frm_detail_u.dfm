object Frm_detail: TFrm_detail
  Left = 646
  Top = 209
  Width = 909
  Height = 589
  Caption = #25104#21697#25253#24223#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 74
      Top = 3
      Width = 63
      Height = 26
      Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 9
      Top = 3
      Width = 63
      Height = 26
      Hint = #36864#20986
      Caption = #20851#38381
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkClose
    end
  end
  object Eh1: TDBGridEh
    Left = 0
    Top = 31
    Width = 893
    Height = 520
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = Frm_main.PopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Eh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footer.FieldName = 'MANU_PART_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26412#21378#32534#21495
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#22411#21495
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'TDATETIME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25253#24223#26085#26399
        Width = 128
      end
      item
        EditButtons = <>
        FieldName = 'QTY_REJECT'
        Footer.FieldName = 'QTY_REJECT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25253#24223#25968#37327
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25805#20316#21592
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'REJECT_DESCRIPTION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32570#38519#21407#22240
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#21517#31216
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ttype2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #31867#21035
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20316#19994#21333#21495
        Width = 105
      end
      item
        EditButtons = <>
        FieldName = 'unit_sq'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21333#21482#38754#31215
      end
      item
        EditButtons = <>
        FieldName = 'MJ'
        Footer.FieldName = 'MJ'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24635#25253#24223#38754#31215
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #20179#24211#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Title.Caption = #20179#24211#21517#31216
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_CODE'
        Footers = <>
        Title.Caption = #24037#21378#20195#30721
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Title.Caption = #23436#24037#26085#26399
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 57
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO58
    Left = 164
    Top = 135
  end
  object ADO58: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    Left = 205
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 360
    Top = 136
    object N1: TMenuItem
      Caption = #21462#28040#35813#25209#27425#25104#21697#25253#24223
      OnClick = N1Click
    end
  end
end
