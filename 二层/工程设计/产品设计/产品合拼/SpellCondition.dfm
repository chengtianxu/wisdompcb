object frmSpellCondition: TfrmSpellCondition
  Left = 328
  Top = 173
  Width = 754
  Height = 560
  Caption = #21512#25340#21442#25968#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnRefresh: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 29
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object btnAppend: TBitBtn
      Left = 78
      Top = 2
      Width = 75
      Height = 29
      Caption = #26032#22686
      TabOrder = 1
      OnClick = btnAppendClick
    end
    object btnEdit: TBitBtn
      Left = 152
      Top = 2
      Width = 75
      Height = 29
      Caption = #32534#36753
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 226
      Top = 2
      Width = 75
      Height = 29
      Caption = #21024#38500
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 300
      Top = 2
      Width = 75
      Height = 29
      Caption = #20445#23384
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 374
      Top = 2
      Width = 75
      Height = 29
      Caption = #21462#28040
      TabOrder = 5
      OnClick = btnCancelClick
    end
    object btnExit: TBitBtn
      Left = 448
      Top = 2
      Width = 75
      Height = 29
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object pgcBase: TPageControl
    Left = 0
    Top = 33
    Width = 738
    Height = 489
    ActivePage = ts1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #21512#25340#21442#25968
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 730
        Height = 458
        Align = alClient
        DataSource = dm.dsSpellCondition
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'LevelMore'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Alignment = taCenter
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'PARAMETER_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21442#25968#20195#30721
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'Param_Name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 109
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IsDifferent'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Alignment = taCenter
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #21442#25968#20844#24335
      ImageIndex = 1
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 730
        Height = 458
        Align = alClient
        DataSource = dm.dsSpellDifferentCondition
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Param_Code'
            Footers = <>
            Title.Alignment = taCenter
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'Param_Name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'Formula'
            Footers = <>
            Title.Alignment = taCenter
            Width = 322
          end
          item
            EditButtons = <>
            FieldName = 'Operator'
            Footers = <>
            Title.Alignment = taCenter
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'FormulaValue'
            Footers = <>
            Title.Alignment = taCenter
            Width = 34
          end>
      end
    end
  end
end
