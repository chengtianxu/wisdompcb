object fm_unit: Tfm_unit
  Left = 391
  Top = 99
  Width = 496
  Height = 525
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21333#20301#20195#30721#23450#20041
  Color = clBtnFace
  Constraints.MaxHeight = 525
  Constraints.MaxWidth = 496
  Constraints.MinHeight = 525
  Constraints.MinWidth = 496
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lb_top: TLabel
    Left = 0
    Top = 0
    Width = 488
    Height = 29
    Align = alTop
    AutoSize = False
  end
  object lb_search: TLabel
    Left = 98
    Top = 42
    Width = 114
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24555#36895#25628#32034#20869#23481
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btn_exit: TBitBtn
    Left = 6
    Top = 3
    Width = 54
    Height = 25
    Hint = #36864#20986#31243#24207
    Caption = #36864#20986
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btn_exitClick
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
  object dg_grid: TDBGrid
    Left = -1
    Top = 72
    Width = 488
    Height = 400
    DataSource = fm_demo.ds_source
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pp_menu
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = dg_gridTitleClick
  end
  object ed_search: TEdit
    Left = 219
    Top = 39
    Width = 120
    Height = 23
    TabOrder = 2
    OnChange = ed_searchChange
  end
  object btn_export: TBitBtn
    Left = 62
    Top = 3
    Width = 54
    Height = 25
    Hint = #23548#20986#25152#26377#25968#25454#33267'Excel'
    Caption = #23548#20986
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btn_exportClick
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
  object sb_bottom: TStatusBar
    Left = 0
    Top = 472
    Width = 488
    Height = 19
    Panels = <>
  end
  object pp_menu: TPopupMenu
    Left = 363
    Top = 3
    object pp_add: TMenuItem
      Caption = #26032#22686
      OnClick = pp_addClick
    end
    object pp_del: TMenuItem
      Caption = #21024#38500
      OnClick = pp_delClick
    end
    object pp_mod: TMenuItem
      Caption = #20462#25913
      OnClick = pp_modClick
    end
  end
end
