object Frm_main: TFrm_main
  Left = 192
  Top = 160
  Width = 979
  Height = 582
  Caption = #36131#20219#23567#32452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 303
    Width = 971
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Color = clAqua
    ParentColor = False
  end
  object panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 463
      Top = 16
      Width = 52
      Height = 13
      Caption = #36131#20219#23567#32452
    end
    object BitQuit: TBitBtn
      Left = 8
      Top = 4
      Width = 70
      Height = 35
      Hint = #36864#20986
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitQuitClick
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
    object BitRefresh: TBitBtn
      Left = 80
      Top = 4
      Width = 70
      Height = 35
      Hint = #21047#26032
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BitRefreshClick
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
    object BtnExportToExcel: TBitBtn
      Left = 152
      Top = 4
      Width = 70
      Height = 35
      Hint = #23548#20986
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BtnExportToExcelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 522
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 262
    Align = alClient
    DataSource = DM.DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 185
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 262
      end
      item
        EditButtons = <>
        FieldName = 'vOutdPrep'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'vactive'
        Footers = <>
        Width = 115
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 312
    Width = 971
    Height = 217
    Align = alBottom
    DataSource = DM.DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh2KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'EMPL_CODE'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'type'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'EntrDate'
        Footers = <>
        Width = 175
      end
      item
        EditButtons = <>
        FieldName = 'DepaDate'
        Footers = <>
        Width = 183
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 529
    Width = 971
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 208
    Top = 136
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26597#30475
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 416
    Top = 416
    object N5: TMenuItem
      Caption = #26032#24314
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #32534#36753
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #26597#30475
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #21024#38500
      OnClick = N8Click
    end
  end
end
